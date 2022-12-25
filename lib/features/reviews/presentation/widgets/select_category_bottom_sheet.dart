import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future<dynamic> selectCategoryBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: white,
      builder: (context) => SortBottomSheet(
        title: 'Категория',
        values: [],
        onChanged: (value) {  },
        defaultValue: null,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
