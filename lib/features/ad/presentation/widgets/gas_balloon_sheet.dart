import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marka_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectGasBalloonTypeSheet extends StatefulWidget {
  final String? selected;
  const SelectGasBalloonTypeSheet({required this.selected, super.key});

  @override
  State<SelectGasBalloonTypeSheet> createState() =>
      _SelectGasBalloonTypeSheetState();
}

class _SelectGasBalloonTypeSheetState extends State<SelectGasBalloonTypeSheet> {
  String? selected;
  final List<String> values = ['Metan', 'Propan'];

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Газобаллонное оборудование',
                  style: Theme.of(context).textTheme.headline1,
                ),
                GestureDetector(
                      behavior: HitTestBehavior.opaque,
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
            color: white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                      behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selected = values[0]),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, right: 20, left: 18),
                    decoration: BoxDecoration(
                      color: selected == values[0] ? snow : null,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          values[0],
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const Spacer(),
                        if (values[0] == selected) ...{const MarkaChecked()}
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1),
                GestureDetector(
                      behavior: HitTestBehavior.opaque,
                  onTap: () {
                    selected = values[1];
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, right: 20, left: 18),
                    decoration: BoxDecoration(
                      color: selected == values[1] ? snow : null,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(
                          values[1],
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const Spacer(),
                        if (values[1] == selected) ...{const MarkaChecked()}
                      ],
                    ),
                  ),
                ),
                WButton(
                  onTap: () {
                    Navigator.of(context).pop(selected);
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
