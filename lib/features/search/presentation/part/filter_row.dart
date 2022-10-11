import 'package:auto/features/search/presentation/widgets/filter_item.dart';
import 'package:flutter/cupertino.dart';

class FilterRow extends StatelessWidget {
   FilterRow({Key? key}) : super(key: key);

  List<String> filterItems = [
    'Объявления',
    'С пробегом',
    'г. Ташкент',
    'г. Ташкент',
    'г. Ташкент',
  ];

  @override
  Widget build(BuildContext context) =>ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ...List.generate(
          filterItems.length,
              (index) => FilterItem(
            title: filterItems[index],
          ),
        ),
      ]);
}
