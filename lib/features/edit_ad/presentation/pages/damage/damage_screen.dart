import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/cars_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/custom_tabbar.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_type_info_sheet.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_with_title.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/damage_type_sheet.dart';
import 'package:auto/features/edit_ad/presentation/bloc/edit_ad/edit_ad_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DamageScreen extends StatefulWidget {
  const DamageScreen({Key? key}) : super(key: key);

  @override
  State<DamageScreen> createState() => _DamageScreenState();
}

class _DamageScreenState extends State<DamageScreen>
    with TickerProviderStateMixin {
  late TabController doorController;
  late TabController bumperController;
  late TabController wingController;
  Map<DamagedPart, DamageType> damages = {};

  @override
  void initState() {
    doorController = TabController(length: 2, vsync: this);
    bumperController = TabController(length: 2, vsync: this);
    wingController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _showChoosDamageTypeSheet(DamagedPart part) {
    showModalBottomSheet<DamageType>(
      useRootNavigator: true,
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(.5),
      backgroundColor: Colors.transparent,
      builder: (c) => DamageTypeChooseSheet(
        title: MyFunctions.getDamagedPartName(part.value),
        initialType: null,
      ),
    ).then((value) {
      if (value != null) {
        context
            .read<EditAdBloc>()
            .add(EditAdDamageEvent(part: part, type: value));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: BaseWidget(
          extraAction: [
            const Spacer(),
            Container(
              height: 28,
              width: 28,
              margin: const EdgeInsets.only(right: 16),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: border),

              child: DamageButton(
                  damageType: DamageType.replaced,
                  onTap: () {
                    showModalBottomSheet<DamageType>(
                      useRootNavigator: true,
                      context: context,
                      isScrollControlled: true,
                      barrierColor: Colors.black.withOpacity(.5),
                      backgroundColor: Colors.transparent,
                      builder: (c) => DamageTypeInfoSheet(),
                    );
                  }),
            )
          ],
          headerText: LocaleKeys.body_state.tr(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 70),
            child: BlocBuilder<EditAdBloc, EditAdState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.mark_all_the_colored_and_damaged_parts.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .aluminumToDolphin),
                  ),
                  const SizedBox(height: 32),
                  DamageCarsItem(
                    onPressed: _showChoosDamageTypeSheet,
                    damagedParts: state.damagedParts,
                  ),
                  // DOOR
                  CustomTabBar(
                      title: LocaleKeys.door.tr(),
                      tabController: doorController,
                      firstTab: LocaleKeys.left.tr(),
                      secondTab: LocaleKeys.right.tr()),
                  SizedBox(
                    height: 150,
                    child: TabBarView(
                      controller: doorController,
                      children: [
                        Column(children: [
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedPart.leftFrontDoor);
                            },
                            position: LocaleKeys.left_front_door.tr(),
                            damageType:
                                state.damagedParts[DamagedPart.leftFrontDoor],
                          ),
                          SituationItem(
                              onTap: () {
                                _showChoosDamageTypeSheet(
                                    DamagedPart.leftRearDoor);
                              },
                              position: LocaleKeys.left_rear_door.tr(),
                              damageType: state
                                  .damagedParts[DamagedPart.leftRearDoor]),
                        ]),
                        Column(children: [
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedPart.rightFrontDoor);
                            },
                            position: LocaleKeys.right_front_door.tr(),
                            damageType:
                                state.damagedParts[DamagedPart.rightFrontDoor],
                          ),
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedPart.rightRearDoor);
                            },
                            position: LocaleKeys.right_rear_door.tr(),
                            damageType:
                                state.damagedParts[DamagedPart.rightRearDoor],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  // BUMPER
                  CustomTabBar(
                      title: LocaleKeys.bamper.tr(),
                      tabController: bumperController,
                      firstTab: LocaleKeys.back.tr(),
                      secondTab: LocaleKeys.front.tr()),
                  SizedBox(
                    height: 100,
                    child: TabBarView(
                      controller: bumperController,
                      children: [
                        SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedPart.rearBumper);
                            },
                            position: LocaleKeys.back_bumper.tr(),
                            damageType:
                                state.damagedParts[DamagedPart.rearBumper]),
                        SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedPart.frontBumper);
                            },
                            position: LocaleKeys.front_bumper.tr(),
                            damageType:
                                state.damagedParts[DamagedPart.frontBumper]),
                      ],
                    ),
                  ),

                  // FENDER
                  CustomTabBar(
                      title: LocaleKeys.fender.tr(),
                      tabController: wingController,
                      firstTab: LocaleKeys.back.tr(),
                      secondTab: LocaleKeys.front.tr()),
                  SizedBox(
                    height: 170,
                    child: TabBarView(
                      controller: wingController,
                      children: [
                        Column(
                          children: [
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedPart.rearLeftFender);
                                },
                                position: LocaleKeys.left_back_fender.tr(),
                                damageType: state
                                    .damagedParts[DamagedPart.rearLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedPart.rearRightFender);
                                },
                                position: LocaleKeys.right_back_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedPart.rearRightFender]),
                          ],
                        ),
                        Column(
                          children: [
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedPart.frontLeftFender);
                                },
                                position: LocaleKeys.left_front_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedPart.frontLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedPart.frontRightFender);
                                },
                                position: LocaleKeys.right_front_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedPart.frontRightFender]),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //  ROOF
                  SituationTitleItem(
                      onTap: () {
                        _showChoosDamageTypeSheet(DamagedPart.roof);
                      },
                      title: LocaleKeys.roof.tr(),
                      damageType: state.damagedParts[DamagedPart.roof]),

                  // HOOD
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedPart.hood);
                    },
                    title: LocaleKeys.hood.tr(),
                    damageType: state.damagedParts[DamagedPart.hood],
                  ),

                  // TRUNK
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedPart.trunk);
                    },
                    title: LocaleKeys.trunk.tr(),
                    damageType: state.damagedParts[DamagedPart.trunk],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
