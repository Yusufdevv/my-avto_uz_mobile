import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/car_selector/car_selector_bloc.dart';
import 'package:auto/features/common/widgets/hight_light.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChangeCarItems extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int id;
  final int selectedId;
  final String text;
  const ChangeCarItems({
    required this.selectedId,
    required this.id,
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          context.read<CarSelectorBloc>().add(
                SelectedCarItemEvent(id: id, name: name, imageUrl: imageUrl),
              );
        },
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          color: id == selectedId
              ? Theme.of(context).extension<ThemedColors>()!.snowToNightRider
              : Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(right: 16, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: imageUrl.isEmpty
                            ? SvgPicture.asset(
                                AppImages.carImage,
                                height: 40,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: imageUrl,
                                height: 36,
                                width: 36,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      HighlightedText(
                        allText: name,
                        highlightedText: '',
                        terms: text.split(' '),
                        highlightColor:
                            LightThemeColors.tangerineYellowToMediumSlateBlue,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                        textStyleHighlight:
                            Theme.of(context).textTheme.headline1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                  if (id == selectedId)
                    SvgPicture.asset(
                      AppIcons.check,
                      color: orange,
                      height: 14,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
