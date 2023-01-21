import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/common/bloc/announcement_bloc/bloc/announcement_list_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBrandItem extends StatelessWidget {
  final MakeEntity carBrandEntity;
  final bool hasShadow;
  final Function() onTap;

  const CarBrandItem(
      {required this.onTap,
      required this.carBrandEntity,
      this.hasShadow = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        onTap: () {
          context.read<AnnouncementListBloc>().add(
              AnnouncementListEvent.getFilter(
                  context.read<AnnouncementListBloc>().state.filter.copyWith(
                        make: carBrandEntity.id,
                      )));
          context.read<GetMakesBloc>().add(
                GetMakesBlocEvent.selectedCarItems(
                  id: carBrandEntity.id,
                  name: carBrandEntity.name,
                  imageUrl: carBrandEntity.logo,
                ),
              );
          context
              .read<AnnouncementListBloc>()
              .add(AnnouncementListEvent.getAnnouncementList());
          onTap();
        },
        child: Container(
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
              const SizedBox(height: 16),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: carBrandEntity.logo,
                      errorWidget: (context, url, error) =>
                          Image.asset(AppImages.defaultPhoto),
                    )),
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
