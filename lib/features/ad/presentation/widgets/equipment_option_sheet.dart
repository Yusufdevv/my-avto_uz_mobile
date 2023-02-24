import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_category_entity.dart';
import 'package:auto/features/ad/presentation/widgets/pos_radio_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EquipmentOptionSheet extends StatefulWidget {
  final int? selected;
  final List<EquipmentCategoryEntity> items;
  final String name;

  const EquipmentOptionSheet({
    required this.selected,
    required this.items,
    required this.name,
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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
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
              height: (widget.items.length + 1) * 70,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => PostingRadioItem(
                  onTap: () {
                    setState(() {
                      selected = index == 0 ? -1 : widget.items[index - 1].id;
                    });
                  },
                  title: index == 0
                      ? LocaleKeys.not_necessary.tr()
                      : widget.items[index - 1].name,
                  selected: index == 0
                      ? widget.selected == -1
                      : widget.selected == widget.items[index - 1].id,
                  image: '',
                ),
                itemCount: widget.items.length + 1,
              ),
            ),
            WButton(
              onTap: () => Navigator.of(context).pop(selected),
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
      );
}
