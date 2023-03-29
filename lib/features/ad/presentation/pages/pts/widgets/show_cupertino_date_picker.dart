import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/bloc/theme_switcher_bloc/theme_switcher_bloc.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showCupertinoDatePicker(BuildContext context,
    Function(DateTime) datePicked, DateTime? minDateTime) {
  DateTime? date;
  FocusScope.of(context).unfocus();
  showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
            height: 270,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              color: Theme.of(context).extension<ThemedColors>()!.whiteToBlack,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    WScaleAnimation(
                        child: Text(
                          LocaleKeys.cancel.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: disabledButton,
                                  fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        }),
                    const Spacer(),
                    WScaleAnimation(
                        child: Text(
                          LocaleKeys.apply.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: blue),
                        ),
                        onTap: () {
                          datePicked(date ?? minDateTime!);
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 216,
                  child: SafeArea(
                    top: false,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness:
                            context.read<ThemeSwitcherBloc>().state.themeMode ==
                                    ThemeMode.dark
                                ? Brightness.dark
                                : Brightness.light,
                      ),
                      child: CupertinoDatePicker(
                        initialDateTime: minDateTime,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumDate: minDateTime,
                        minimumYear: minDateTime?.year ?? 1,
                        onDateTimeChanged: (newDate) {
                          date = newDate;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));

  // showModalBottomSheet(
  //   useRootNavigator: true,
  //   elevation: 0,
  //   backgroundColor: Colors.transparent,
  //   isScrollControlled: false,
  //   context: context,
  //   builder: (_) => Container(
  //     height: 350,
  //     decoration:const BoxDecoration(
  //       color: white,
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(12))
  //     ),
  //     child: Column(
  //       children: [
  //       Row(
  //         children: [
  //           const  Text('data'),
  //         ],
  //       ),
  //         Expanded(
  //           child: CupertinoDatePicker(
  //             onDateTimeChanged: (value) {
  //               datePicked(value);
  //             },
  //             mode: CupertinoDatePickerMode.date,
  //             maximumDate: DateTime.now(),
  //             maximumYear: DateTime.now().year,
  //             minimumDate: minDateTime,
  //             minimumYear: minDateTime?.year ?? 1,
  //             initialDateTime: minDateTime,
  //             backgroundColor: Colors.white,
  //           ),
  //         ),
  //       ],
  //     ),
  //   )
  // );
}
