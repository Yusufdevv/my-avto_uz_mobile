import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/domain/entities/equipment/gas_equipment_entity.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/marka_checkbox.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectGasBalloonTypeSheet extends StatefulWidget {
  final int? selected;
  final List<GasEquipmentEntity> gasEquipments;

  const SelectGasBalloonTypeSheet({
    required this.selected,
    required this.gasEquipments,
    super.key,
  });

  @override
  State<SelectGasBalloonTypeSheet> createState() =>
      _SelectGasBalloonTypeSheetState();
}

class _SelectGasBalloonTypeSheetState extends State<SelectGasBalloonTypeSheet> {
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
                  LocaleKeys.lpg_equipment.tr(),
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
          ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () =>
                  setState(() => selected = widget.gasEquipments[index].id),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, right: 20, left: 18),
                decoration: BoxDecoration(
                  color:
                      selected == widget.gasEquipments[index].id ? snow : null,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      widget.gasEquipments[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Spacer(),
                    if (widget.gasEquipments[index].id == selected) ...{
                      const MarkaChecked()
                    }
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemCount: widget.gasEquipments.length,
            shrinkWrap: true,
          ),
          WButton(
            onTap: () {
              Navigator.of(context).pop(selected);
            },
            color: orange,
            text: 'Применить',
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
