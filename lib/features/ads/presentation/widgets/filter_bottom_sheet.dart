import 'package:auto/assets/colors/light.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> filterBottomSheet(
  BuildContext context, {
  SortSearchResultStatus? sortingValue,
  required Function(SortSearchResultStatus) onChanged,
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
            title: LocaleKeys.descending,
            status: SortSearchResultStatus.cheapest,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.ascending,
            status: SortSearchResultStatus.expensive,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.oldOnesFirst,
            status: SortSearchResultStatus.oldest,
          ),
          SortSearchResultsModel(
            title: LocaleKeys.newOnesFirst,
            status: SortSearchResultStatus.newest,
          ),
        ],
        onChanged: onChanged,
        defaultValue: sortingValue,
      ),
    );
