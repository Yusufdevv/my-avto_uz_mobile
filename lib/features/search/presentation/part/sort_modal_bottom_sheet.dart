import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_radio_tile.dart';
import 'package:auto/features/search/presentation/widgets/selector_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future<dynamic> sortModalBottomSheet(
        BuildContext context, int summ, int date) =>
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: LightThemeColors.appBarColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      builder: (context) => SortBottomSheet(
        title: 'Сортировка',
        children: [
          const SizedBox(height: 16),
          SelectorItem(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => SortBottomSheet(
                    horizontalPadding: 0,
                    title: 'Цена',
                    hasBackbutton: true,
                    children: [
                      const SizedBox(height: 16),
                      RadioItem(
                        groupValue: summ,
                        value: 0,
                        title: 'По убыванию',
                        onTap: (v) {
                          setState(() {
                            summ = 0;
                          });
                          Navigator.pop(context);
                          sortModalBottomSheet(context, summ, date);
                        },
                      ),
                      const SizedBox(height: 12),
                      RadioItem(
                        groupValue: summ,
                        value: 1,
                        title: 'По возрастанию',
                        onTap: (v) {
                          setState(() {
                            summ = 1;
                          });
                          Navigator.pop(context);
                          sortModalBottomSheet(context, summ, date);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            hintText: summ == 0 ? 'По убыванию' : 'По возрастанию',
            title: 'Цена',
          ),
          const SizedBox(height: 20),
          SelectorItem(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => SortBottomSheet(
                    horizontalPadding: 0,
                    title: 'Дата',
                    hasBackbutton: true,
                    children: [
                      const SizedBox(height: 16),
                      RadioItem(
                        onTap: (v) {
                          setState(() {
                            date = 0;
                          });

                          Navigator.pop(context);
                          sortModalBottomSheet(context, summ, date);
                        },
                        groupValue: date,
                        value: 0,
                        title: 'По убыванию',
                      ),
                      const SizedBox(height: 12),
                      RadioItem(
                        onTap: (v) {
                          setState(() {
                            date = 1;
                          });

                          Navigator.pop(context);
                          sortModalBottomSheet(context, summ, date);
                        },
                        groupValue: date,
                        value: 1,
                        title: 'По возрастанию',
                      ),
                    ],
                  ),
                ),
              );
            },
            hintText: date == 0 ? 'По убыванию' : 'По возрастанию',
            title: 'Дата',
          ),
          const SizedBox(height: 52),
          WButton(
            onTap: () {},
            text: 'Применить',
            textStyle:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
          )
        ],
      ),
    );
