import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyConditionBottomSheet extends StatefulWidget {
  final String title;
  final ValueChanged<BodyConditionResultStatus> onChanged;
  final List<BodyConditionResultsModel> values;
  final BodyConditionResultStatus? defaultValue;
  const BodyConditionBottomSheet(
      {required this.title,
      required this.values,
      required this.onChanged,
      required this.defaultValue,
      super.key});

  @override
  State<BodyConditionBottomSheet> createState() =>
      _BodyConditionBottomSheetState();
}

class _BodyConditionBottomSheetState extends State<BodyConditionBottomSheet> {
  BodyConditionResultStatus? bodyCondition;

  @override
  void initState() {
    bodyCondition = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
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
              children: [
                const Text('Правая передняя дверь'),
                ...List.generate(
                    widget.values.length,
                    (index) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => setState(() =>
                              bodyCondition = widget.values[index].status),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(
                                left: 16, bottom: 10, right: 16),
                            decoration: BoxDecoration(
                              color:
                                  widget.values[index].status == bodyCondition
                                      ? purple.withOpacity(.1)
                                      : null,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                if (bodyCondition ==
                                    BodyConditionResultStatus.blueWarning)
                                  SvgPicture.asset(AppIcons.warningBlue),
                                if (bodyCondition ==
                                    BodyConditionResultStatus.redWarning)
                                  SvgPicture.asset(AppIcons.warningRed),
                                if (bodyCondition ==
                                    BodyConditionResultStatus.greenWarning)
                                  SvgPicture.asset(AppIcons.warningGreen),
                                if (bodyCondition ==
                                    BodyConditionResultStatus.orangeWarning)
                                  SvgPicture.asset(AppIcons.warningOrang),
                                if (bodyCondition ==
                                    BodyConditionResultStatus.pupleWarning)
                                  SvgPicture.asset(AppIcons.warningPuple),
                                if (bodyCondition ==
                                    BodyConditionResultStatus.yellowWarning)
                                  SvgPicture.asset(AppIcons.warningYellow),
                                const SizedBox(width: 8),
                                Text(
                                  widget.values[index].title,
                                  style: widget.values[index].status ==
                                          bodyCondition
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
                                const Spacer(),
                                Transform.scale(
                                  scale: 1.3,
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Radio<BodyConditionResultStatus>(
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
                                      groupValue: bodyCondition,
                                      onChanged: (val) =>
                                          setState(() => bodyCondition = val),
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
                    if (bodyCondition != null) {
                      widget.onChanged(bodyCondition!);
                    }
                    Navigator.pop(context);
                  },
                  color: orange,
                  text: 'Сохранить',
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
