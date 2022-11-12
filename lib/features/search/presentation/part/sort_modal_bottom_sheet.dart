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
                      SortFieldRadio(
                        groupValue: summ,
                        value: 0,
                        title: 'По убыванию',
                        onTap: () {
                          setState(() {
                            summ = 0;
                          });
                          Navigator.pop(context);
                          sortModalBottomSheet(context, summ, date);
                        },
                      ),
                      const SizedBox(height: 12),
                      SortFieldRadio(
                        groupValue: summ,
                        value: 1,
                        title: 'По возрастанию',
                        onTap: () {
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
                      SortFieldRadio(
                        onTap: () {
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
                      SortFieldRadio(
                        onTap: () {
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

class SortFieldRadio extends StatefulWidget {
  int groupValue;
  final int value;
  final String title;
  final Function() onTap;
  SortFieldRadio({
    required this.groupValue,
    required this.value,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<SortFieldRadio> createState() => _SortFieldRadioState();
}

class _SortFieldRadioState extends State<SortFieldRadio> {
  @override
  Widget build(BuildContext context) => RadioItem(
        onTap: (value) => widget.onTap(),
        title: widget.title,
        groupValue: widget.groupValue,
        value: widget.value,
      );
}








// class FilterScreen extends StatefulWidget {
//   const FilterScreen({Key? key}) : super(key: key);

//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: WAppBar(
//           boxShadow: [],
//           extraActions: [
//             Text(LocaleKeys.filter.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
//             const Spacer(flex: 100),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 LocaleKeys.clear.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle1!
//                     .copyWith(color: blue),
//               ),
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.fromLTRB(
//               16, 20, 16, MediaQuery.of(context).padding.bottom + 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 LocaleKeys.what_to_show.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline2!
//                     .copyWith(fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   WChips(
//                     title: LocaleKeys.ads.tr(),
//                   ),
//                   SizedBox(width: 12),
//                   WChips(
//                     title: LocaleKeys.marks.tr(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 LocaleKeys.car_dealers.tr(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline2!
//                     .copyWith(fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   WChips(
//                     title: LocaleKeys.news.tr(),
//                   ),
//                   SizedBox(width: 12),
//                   WChips(
//                     title: LocaleKeys.with_Mileage.tr(),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_region.tr(),
//                 title: LocaleKeys.region.tr(),
//                 hasArrowDown: true,
//               ),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_brand.tr(),
//                 title: LocaleKeys.marks.tr(),
//                 hasArrowDown: true,
//               ),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_body.tr(),
//                 title: LocaleKeys.body_type.tr(),
//               ),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_class.tr(),
//                 title: LocaleKeys.classs.tr(),
//               ),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_drive_type.tr(),
//                 title: LocaleKeys.drive_unit.tr(),
//               ),
//               SelectorItem(
//                 onTap: () {},
//                 hintText: LocaleKeys.choose_box_type.tr(),
//                 title: LocaleKeys.box.tr(),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               WRangeSlider(
//                 title: LocaleKeys.year_of_issue.tr(),
//                 endValue: 2022,
//                 startValue: 1960,
//                 sliderStatus: '',
//               ),
//               const SizedBox(height: 16),
//               WRangeSlider(
//                 title: LocaleKeys.price.tr(),
//                 endValue: 500000,
//                 startValue: 1000,
//                 sliderStatus: 'price',
//               ),
//               const SizedBox(height: 30),
//               WButton(
//                 onTap: () => Navigator.pop(context),
//                 text: LocaleKeys.apply.tr(),
//               ),
//             ],
//           ),
//         ),
//       );
// }
