import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EquipmentOptionSheet extends StatefulWidget {
  final int? selected;
  final Map<int, String> options;
  final String innerOption;

  const EquipmentOptionSheet({
    required this.selected,
    required this.options,
    required this.innerOption,
    super.key,
  });

  @override
  State<EquipmentOptionSheet> createState() => _EquipmentOptionSheetState();
}

class _EquipmentOptionSheetState extends State<EquipmentOptionSheet> {
  int? selected;

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
                  widget.innerOption,
                  style: Theme.of(context).textTheme.displayLarge,
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
          SizedBox(
            height: (widget.options.length + 1) * 54,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PostingRadioItem(
                onTap: () {
                  setState(() {
                    selected = index == 0
                        ? -1
                        : widget.options.keys.toList()[index - 1];
                  });
                },
                title: index == 0
                    ? LocaleKeys.not_necessary.tr()
                    : widget.options.values.toList()[index - 1],
                selected: index == 0
                    ? widget.selected == -1
                    : widget.selected ==
                        widget.options.keys.toList()[index - 1],
                image: '',
              ),
              itemCount: widget.options.length + 1,
            ),
          ),
          WButton(
            onTap: () => Navigator.of(context).pop(selected),
            color: orange,
            text: LocaleKeys.apply.tr(),
            textStyle:
                Theme.of(context).textTheme.titleMedium!.copyWith(color: white),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 20,
              top: 20,
              left: 16,
              right: 16,
            ),
          ),
        ],
      );
}
