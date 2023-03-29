import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortBottomSheet extends StatefulWidget {
  final String title;
  final ValueChanged<SortStatus> onChanged;
  final List<SortSearchResultsModel> values;
  final SortStatus? defaultValue;

  const SortBottomSheet(
      {required this.title,
      required this.values,
      required this.onChanged,
      required this.defaultValue,
      super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  SortStatus? groupValue;

  @override
  void initState() {
    groupValue = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color:
                Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      AppIcons.close,
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).extension<ThemedColors>()!.divider,
            thickness: 1,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.only(top: 16),
            color:
                Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    widget.values.length,
                    (index) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => setState(
                              () => groupValue = widget.values[index].status),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 10, right: 16),
                            decoration: BoxDecoration(
                              color: widget.values[index].status == groupValue
                                  ? purple.withOpacity(.1)
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.values[index].title.tr(),
                                  style: widget.values[index].status ==
                                          groupValue
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 16)
                                      : Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: LightThemeColors.smoky),
                                ),
                                const Spacer(),
                                Transform.scale(
                                  scale: 1.3,
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Radio<SortStatus>(
                                      activeColor: purple,
                                      focusColor: red,
                                      visualDensity: const VisualDensity(
                                        horizontal:
                                            VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: widget.values[index].status,
                                      groupValue: groupValue,
                                      onChanged: (val) =>
                                          setState(() => groupValue = val),
                                      splashRadius: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                WButton(
                  onTap: () {
                    if (groupValue != null) {
                      widget.onChanged(groupValue!);
                    }
                    Navigator.pop(context);
                  },
                  color: orange,
                  text: LocaleKeys.apply.tr(),
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: white),
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 20,
                    top: 20,
                    left: 16,
                    right: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
