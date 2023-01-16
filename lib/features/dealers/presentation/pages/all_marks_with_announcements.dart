import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/marks_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/marks_in_dealer_bloc/marks_in_dealers_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/single_mark_announcements.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/marks_in_dealer_datasource.dart';

class AllMarksWithAnnouncements extends StatefulWidget {
  final String slug;

  const AllMarksWithAnnouncements({
    Key? key,
    required this.slug,
  }) : super(key: key);

  @override
  State<AllMarksWithAnnouncements> createState() =>
      _AllMarksWithAnnouncementsState();
}

class _AllMarksWithAnnouncementsState extends State<AllMarksWithAnnouncements> {
  late MarksInDealersBloc marksBloc;

  @override
  void initState() {
    marksBloc = MarksInDealersBloc(
        marksInDealerUseCase: MarksInDealerUseCase(
            marks: MarksInDealerRepositoryImpl(
                dataSource: MarksInDealerDataSource(DioSettings().dio))))
      ..add(MarksInDealersEvent.getResults(slug: widget.slug));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: marksBloc,
        child: BlocBuilder<MarksInDealersBloc, MarksInDealersState>(
          builder: (context, state) => Scaffold(
            appBar: WAppBar(
              extraActions: [
                Text(LocaleKeys.all_brands_with_ads.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                const Spacer(
                  flex: 120,
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 15,
                runSpacing: 16,
                children: List.generate(
                  state.marks.length,
                  (index) => Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            fade(
                              page: SingleMarkAnnouncements(
                                carMark: state.marks[index].make.name,
                              ),
                            ),
                          );
                        },
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
                              imageUrl: state.marks[index].make.logo,
                              fit: BoxFit.cover,
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
                                state.marks[index].make.name,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: white.withOpacity(0.75)),
                              ),
                              Text(
                                '(${state.marks[index].carsCount.toString()})',
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
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
