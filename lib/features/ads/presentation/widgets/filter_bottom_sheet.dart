import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> filterBottomSheet(
  BuildContext context, {
  required Function(SortStatus) onChanged,
  SortStatus? sortingValue,
}) =>
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: LightThemeColors.appBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) => SortBottomSheet(
        title: LocaleKeys.sorting.tr(),
        values: const [
          SortSearchResultsModel(
            title: LocaleKeys.newOnesFirst,
            status: SortStatus.newest,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.oldOnesFirst,
            status: SortStatus.oldest,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.descending,
            status: SortStatus.cheapest,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.ascending,
            status: SortStatus.expensive,
          ),
        ],
        onChanged: onChanged,
        defaultValue: sortingValue,
      ),
    );
