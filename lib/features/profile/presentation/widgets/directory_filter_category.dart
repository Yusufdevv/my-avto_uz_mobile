import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/utils/size_config.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class DirectoryFilterCategory extends StatefulWidget {
   const DirectoryFilterCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<DirectoryFilterCategory> createState() => _DirectoryFilterCategoryState();
}

class _DirectoryFilterCategoryState extends State<DirectoryFilterCategory> {
  final Set<int> _selectedIndexes = {};

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Категории',
            style: TextStyle(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .greySuitToWhite,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        SizedBox(height: SizeConfig.v(12)),
        Wrap(
          spacing: SizeConfig.v(16),
          runSpacing: SizeConfig.h(12),
          children: List.generate(
            10,
            (index) => WButton(
              width: (MediaQuery.of(context).size.width / 2) -
                  SizeConfig.h(24),
              borderRadius: 8,
              border: Border.all(color: _selectedIndexes.contains(index) ? purple.withOpacity(0.6) : dividerColor),
              shadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 16,
                    color: _selectedIndexes.contains(index) ? purple.withOpacity(0.12) : darkBlack.withOpacity(0.05))
              ],
              onTap: () {
                setState(() {
                  _selectedIndexes.add(index);
                });
              },
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.h(12),
              ),
              color: white,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text('Автострахование',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    height: 1.3,
                                    color: nero)),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.v(21),
                          width: SizeConfig.h(24),
                          decoration: BoxDecoration(
                              gradient:
                                  LinearGradient(colors: [
                            white.withOpacity(0),
                            white,
                          ])),
                        ),
                        Container(
                          color: white,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: SizeConfig.h(10)),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.h(4),
                                    vertical:
                                        SizeConfig.v(4)),
                                decoration: BoxDecoration(
                                    color: _selectedIndexes.contains(index) ? lavender2 : seashell,
                                    borderRadius:
                                        BorderRadius.circular(
                                            SizeConfig.h(4))),
                                child: Text(
                                  '24',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          color:_selectedIndexes.contains(index) ? purple : orange),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
}
