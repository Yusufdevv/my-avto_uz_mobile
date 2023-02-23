import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/const/constants.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/cars_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/custom_tabbar.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_pluc_button.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/damage_type_info_sheet.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_with_title.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:auto/features/ad/presentation/widgets/damage_type_sheet.dart';
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
  Map<DamagedParts, DamageType> damages = {};

  @override
  void initState() {
    doorController = TabController(length: 2, vsync: this);
    bumperController = TabController(length: 2, vsync: this);
    wingController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _showChoosDamageTypeSheet(DamagedParts part) {
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
            .read<PostingAdBloc>()
            .add(PostingAdDamageEvent(part: part, type: value));
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
              padding: const EdgeInsets.all(4),
              child: DamageButton(
                placedOnCar: false,
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
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
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
                                  DamagedParts.leftFrontDoor);
                            },
                            position: LocaleKeys.left_front_door.tr(),
                            damageType:
                                state.damagedParts[DamagedParts.leftFrontDoor],
                          ),
                          SituationItem(
                              onTap: () {
                                _showChoosDamageTypeSheet(
                                    DamagedParts.leftRearDoor);
                              },
                              position: LocaleKeys.left_rear_door.tr(),
                              damageType: state
                                  .damagedParts[DamagedParts.leftRearDoor]),
                        ]),
                        Column(children: [
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.rightFrontDoor);
                            },
                            position: LocaleKeys.right_front_door.tr(),
                            damageType:
                                state.damagedParts[DamagedParts.rightFrontDoor],
                          ),
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.rightRearDoor);
                            },
                            position: LocaleKeys.right_rear_door.tr(),
                            damageType:
                                state.damagedParts[DamagedParts.rightRearDoor],
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
                                  DamagedParts.rearBumper);
                            },
                            position: LocaleKeys.back_bumper.tr(),
                            damageType:
                                state.damagedParts[DamagedParts.rearBumper]),
                        SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.frontBumper);
                            },
                            position: LocaleKeys.front_bumper.tr(),
                            damageType:
                            state.damagedParts[DamagedParts.frontBumper]),
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
                                      DamagedParts.rearLeftFender);
                                },
                                position: LocaleKeys.left_back_fender.tr(),
                                damageType: state
                                    .damagedParts[DamagedParts.rearLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedParts.rearRightFender);
                                },
                                position: LocaleKeys.right_back_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedParts.rearRightFender]),
                          ],
                        ),
                        Column(
                          children: [
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedParts.frontLeftFender);
                                },
                                position: LocaleKeys.left_front_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedParts.frontLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedParts.frontRightFender);
                                },
                                position: LocaleKeys.right_front_fender.tr(),
                                damageType: state.damagedParts[
                                    DamagedParts.frontRightFender]),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //  ROOF
                  SituationTitleItem(
                      onTap: () {
                        _showChoosDamageTypeSheet(DamagedParts.roof);
                      },
                      title: LocaleKeys.roof.tr(),
                      damageType: state.damagedParts[DamagedParts.roof]),

                  // HOOD
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedParts.hood);
                    },
                    title: LocaleKeys.hood.tr(),
                    damageType: state.damagedParts[DamagedParts.hood],
                  ),

                  // TRUNK
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedParts.trunk);
                    },
                    title: LocaleKeys.trunk.tr(),
                    damageType: state.damagedParts[DamagedParts.trunk],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
