import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/car_single/domain/entities/equipment_entity.dart';
import 'package:auto/features/car_single/presentation/widgets/equipment_tile.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class EquipmentCard extends StatefulWidget {
  final String complectation;
  final String complectationItem;

  const EquipmentCard(
      {required this.complectation, required this.complectationItem,Key? key,})
      : super(key: key);

  @override
  State<EquipmentCard> createState() => _EquipmentCardState();
}

class _EquipmentCardState extends State<EquipmentCard>
    with TickerProviderStateMixin {
  bool showContent = false;
  late AnimationController animationController;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _containerColorAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 200));
    _colorAnimation =
        ColorTween(begin: grey, end: white).animate(animationController);
    _containerColorAnimation =
        ColorTween(begin: orange, end: grey).animate(animationController);
    _containerColorAnimation.addListener(() => setState(() {}));
    _colorAnimation.addListener(() => setState(() {}));
    super.initState();
  }

  final List<EquipmentEntity> entity = [
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
    const EquipmentEntity(title: 'Подушки безопасности боковые'),
  ];

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context)
                  .extension<ThemedColors>()!
                  .solitudeToDarkRider,
            ),
            color: Theme.of(context).extension<ThemedColors>()!.whiteToNero),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.complectation,
              style:
                  Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 12,
            ),
            ...List.generate(
              entity.length,
              (index) => Padding(
                padding:const EdgeInsets.only(left: 8),
                child: EquipmentTile(title: widget.complectationItem),
              ),
            ),
            if (entity.length >= 6)
              GestureDetector(
                onTap: () {
                  setState(() {
                    showContent = !showContent;
                    if (showContent) {
                      animationController.forward();
                    } else {
                      animationController.reverse();
                    }
                  });
                },    behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      AnimatedCrossFade(
                          firstChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EquipmentTile(title: widget.complectationItem),
                              EquipmentTile(title: widget.complectationItem),
                              EquipmentTile(title: widget.complectationItem),
                              EquipmentTile(title: widget.complectationItem),
                              EquipmentTile(title: widget.complectationItem),
                              EquipmentTile(title: widget.complectationItem),
                            ],
                          ),
                          secondChild: const SizedBox(),
                          crossFadeState: showContent
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 200)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.show_all_dealers.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 4
                          ),
                          AnimatedRotation(
                            turns: showContent ? 1 / 2 : 1,
                            duration: const Duration(milliseconds: 200),
                            child: SvgPicture.asset(
                              AppIcons.chevronDown,
                              color: purple
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      );
}
