import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/favorites/domain/entities/favourite_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteItem extends StatelessWidget {
  final FavouriteItemEntity favouriteItemEntity;

  const FavouriteItem({required this.favouriteItemEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
        child: Column(
          children: [
            SizedBox(
              height: 213,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, top: 12),
                scrollDirection: Axis.horizontal,
                itemCount: favouriteItemEntity.images.length,
                itemBuilder: (context, index) => Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8),
                    ),
                  ),
                  child: favouriteItemEntity.hasMileage && index == 0 ? Stack(
                    children: [
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 16,
                                color: black.withOpacity(.16),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.antivirus),
                              const SizedBox(width: 4,),
                              Text('С пробегом', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: green),)
                            ],
                          ),
                        ),
                      ),
                      Image.network(favouriteItemEntity.images[index]),
                    ],
                  ) : Image.network(favouriteItemEntity.images[index]),
                ),
              ),
            ),
            const SizedBox(height: 8,),

          ],
        ),
      );
}
