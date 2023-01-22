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
        title: 'Pravaya perdnaya dver',
        initialType: null,
        onSubmitted: (v) {
          print('=> => => =>     $v    <= <= <= <=');
        },
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
          extraAction: Container(
            height: 28,
            width: 28,
            margin: const EdgeInsets.only(right: 16),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: border),
            padding: const EdgeInsets.all(4),
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
          ),
          headerText: 'Состояние кузова',
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
            child: BlocBuilder<PostingAdBloc, PostingAdState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Покупатели чаще звонят по объявлениям, в которых указана комплектация',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .aluminumToDolphin),
                  ),
                  const SizedBox(height: 32),
                  DamageCarsItem(
                    onPressed: _showChoosDamageTypeSheet,
                  ),
                  const SizedBox(height: 32),
                  // DOOR
                  CustomTabBar(
                      title: 'Дверь',
                      tabController: doorController,
                      firstTab: 'Левая',
                      secondTab: 'Правая'),
                  SizedBox(
                    height: 180,
                    child: TabBarView(
                      controller: doorController,
                      children: [
                        Column(children: [
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.leftFrontDoor);
                            },
                            position: 'Левая передняя дверь',
                            damageType:
                                state.damagedParts[DamagedParts.leftFrontDoor],
                          ),
                          SituationItem(
                              onTap: () {
                                _showChoosDamageTypeSheet(
                                    DamagedParts.leftRearDoor);
                              },
                              position: 'Левая задняя дверь',
                              damageType: state
                                  .damagedParts[DamagedParts.leftRearDoor]),
                        ]),
                        Column(children: [
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.rightFrontDoor);
                            },
                            position: 'Правая передняя дверь',
                            damageType:
                                state.damagedParts[DamagedParts.rightFrontDoor],
                          ),
                          SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.rightRearDoor);
                            },
                            position: 'Правая задняя дверь',
                            damageType:
                                state.damagedParts[DamagedParts.rightRearDoor],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  // BUMPER
                  CustomTabBar(
                      title: 'Бамфер',
                      tabController: bumperController,
                      firstTab: 'Задний',
                      secondTab: 'Передний'),
                  SizedBox(
                    height: 100,
                    child: TabBarView(
                      controller: bumperController,
                      children: [
                        SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.frontBumper);
                            },
                            position: 'Передний бамфер',
                            damageType:
                                state.damagedParts[DamagedParts.frontBumper]),
                        SituationItem(
                            onTap: () {
                              _showChoosDamageTypeSheet(
                                  DamagedParts.rearBumper);
                            },
                            position: 'Задняя бамфер',
                            damageType:
                                state.damagedParts[DamagedParts.rearBumper]),
                      ],
                    ),
                  ),

                  // FENDER
                  CustomTabBar(
                      title: 'Крыло',
                      tabController: wingController,
                      firstTab: 'Заднее',
                      secondTab: 'Переднее'),
                  SizedBox(
                    height: 180,
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
                                position: 'Задняя левое крыло',
                                damageType: state
                                    .damagedParts[DamagedParts.rearLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedParts.rearRightFender);
                                },
                                position: 'Задняя правое крыло',
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
                                position: 'Переднее левое крыло',
                                damageType: state.damagedParts[
                                    DamagedParts.frontLeftFender]),
                            SituationItem(
                                onTap: () {
                                  _showChoosDamageTypeSheet(
                                      DamagedParts.frontRightFender);
                                },
                                position: 'Переднее правое крыло',
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
                      title: 'Крыша',
                      damageType: state.damagedParts[DamagedParts.roof]),
                  const SizedBox(height: 24),
                  // HOOD
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedParts.hood);
                    },
                    title: 'Капот',
                    damageType: state.damagedParts[DamagedParts.hood],
                  ),
                  const SizedBox(height: 24),
                  // TRUNK
                  SituationTitleItem(
                    onTap: () {
                      _showChoosDamageTypeSheet(DamagedParts.trunk);
                    },
                    title: 'Багажник',
                    damageType: state.damagedParts[DamagedParts.trunk],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
