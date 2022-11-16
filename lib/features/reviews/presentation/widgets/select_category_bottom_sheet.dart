import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future<dynamic> selectCategoryBottomSheet(BuildContext context) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: white,
      builder: (context) => SortBottomSheet(
        height: MediaQuery.of(context).size.height * 0.3,
        hasDivider: false,
        title: 'Категория',
        children: [
          ReviewBottomSheetItem(
            icon: AppIcons.lightweightCar,
            title: 'Легковые',
            onTap: () => Navigator.push(
              context,
              fade(page: const AddReviewScreen(category: 'Легковые')),
            ),
          ),
          ReviewBottomSheetItem(
            icon: AppIcons.truck,
            title: 'Коммерческие',
            onTap: () => Navigator.push(
              context,
              fade(page: const AddReviewScreen(category: 'Коммерческие')),
            ),
          ),
          ReviewBottomSheetItem(
            icon: AppIcons.motorcycle,
            title: 'Мото',
            hasDivider: false,
            onTap: () => Navigator.push(
              context,
              fade(page: const AddReviewScreen(category: 'Мото')),
            ),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
