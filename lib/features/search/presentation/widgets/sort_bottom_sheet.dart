import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SortBottomSheet extends StatefulWidget {
  final String title;
  final ValueChanged<SortSearchResultStatus> onChanged;
  final List<SortSearchResultsModel> values;
  final SortSearchResultStatus? defaultValue;
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
  SortSearchResultStatus? groupValue;

  @override
  void initState() {
    groupValue = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
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
          const Divider(color: border, thickness: 1, height: 1),
          Container(
            padding: const EdgeInsets.only(top: 16),
            color: white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    widget.values.length,
                    (index) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () =>
                              setState(() => groupValue = widget.values[index].status),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 10, right: 16),
                            decoration: BoxDecoration(
                              color: widget.values[index].status == groupValue
                                  ? purple.withOpacity(.1)
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.3,
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Radio<SortSearchResultStatus>(
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
                                const SizedBox(width: 8),
                                Text(
                                  widget.values[index].title,
                                  style: widget.values[index].status == groupValue
                                      ? Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(fontSize: 16)
                                      : Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              color: LightThemeColors.smoky),
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
                  text: 'Применить',
                  textStyle: Theme.of(context)
                      .textTheme
                      .subtitle1!
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
