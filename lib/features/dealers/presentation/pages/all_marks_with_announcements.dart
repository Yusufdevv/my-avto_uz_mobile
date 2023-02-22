import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/presentation/blocs/marks_in_dealer_bloc/marks_in_dealers_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/single_mark_announcements.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllMarksWithAnnouncements extends StatelessWidget {
  final String slug;

  const AllMarksWithAnnouncements({
    required this.slug,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: WAppBar(
        textWithButton: LocaleKeys.all_brands_with_ads.tr(),
      ),
      body: BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state.status.isSubmissionSuccess) {
            return GridView.builder(
              itemCount: state.marks.length + 1,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 2.3,
              ),
              itemBuilder: (context, index) {
                if (index == state.marks.length) {
                  if (state.next != null) {
                    context
                        .read<MarksInDealersBloc>()
                        .add(MarksInDealersEvent.getMoreResults(slug: slug));
                    return const Center(child: CupertinoActivityIndicator());
                  } else {
                    return const SizedBox();
                  }
                }
                final item = state.marks[index];
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          fade(
                            page: SingleMarkAnnouncements(
                              dealerSlug: slug,
                              markSlug: item.make.slug,
                              carMark: item.make.name,
                            ),
                          ),
                        );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        height: 91,
                        width: MediaQuery.of(context).size.width * 0.44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .solitude2ToNightRider),
                        ),
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: item.make.logo,
                            errorWidget: (context, url, error) =>
                                Image.asset(AppImages.autoUz),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: dimGray.withOpacity(0.2),
                        ),
                        child: Row(
                          children: [
                            Text(
                              item.make.name,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: white.withOpacity(0.75)),
                            ),
                            Text(
                              '(${item.carsCount.toString()})',
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ));
}
