import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ads/presentation/pages/ads_screen.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBrandItem extends StatelessWidget {
  final MakeEntity carBrandEntity;
  final bool hasShadow;

  const CarBrandItem(
      {required this.carBrandEntity, this.hasShadow = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () {
          context.read<AnnouncementListBloc>().add(
              AnnouncementListEvent.getFilter(
                  context.read<AnnouncementListBloc>().state.filter.copyWith(
                        make: carBrandEntity.id,
                      )));
          Navigator.of(context, rootNavigator: true)
              .push(fade(page: AdsScreen(isBack: false, onTap: () {})));
          context.read<GetMakesBloc>().add(
                GetMakesBlocEvent.selectedCarItems(
                  id: carBrandEntity.id,
                  name: carBrandEntity.name,
                  imageUrl: carBrandEntity.logo,
                ),
              );
        },
        child: Container(
          height: 100,
          width: 72,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            boxShadow: [
              if (hasShadow)
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 19,
                  color: dark.withOpacity(0.07),
                )
              else
                const BoxShadow()
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: carBrandEntity.logo.isEmpty
                    ? Image.asset(
                        AppImages.defaultPhoto,
                        height: 48,
                        width: 60,
                      )
                    : CachedNetworkImage(
                        imageUrl: carBrandEntity.logo,
                        height: 48,
                        width: 60,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImages.defaultPhoto,
                          height: 48,
                          width: 60,
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  carBrandEntity.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      );
}
