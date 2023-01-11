import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/cars_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/custom_tabbar.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_item.dart';
import 'package:auto/features/ad/presentation/pages/damage/widgets/situation_with_title.dart';
import 'package:auto/features/ad/presentation/widgets/base_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    doorController = TabController(length: 2, vsync: this);
    bumperController = TabController(length: 2, vsync: this);
    wingController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseWidget(
        headerText: 'Состояние кузова',
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Покупатели чаще звонят по объявлениям,  в которых указана комплектация',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .aluminumToDolphin),
              ),
              const SizedBox(
                height: 32,
              ),
              const DamageCarsItem(),
              const SizedBox(
                height: 32,
              ),
              CustomTabBar(
                  title: 'Дверь',
                  tabController: doorController,
                  firstTab: 'Левая',
                  secondTab: 'Правая'),
              SizedBox(
                height: 100,
                child: TabBarView(
                  controller: doorController,
                  children: const [
                    SituationItem(
                        position: 'Правая передняя дверь',
                        situation: 'Идеальное'),
                    SituationItem(
                        position: 'Правая задняя дверь',
                        situation: 'Идеальное'),
                  ],
                ),
              ),
              CustomTabBar(
                  title: 'Бамфер',
                  tabController: bumperController,
                  firstTab: 'Задний',
                  secondTab: 'Передний'),
              SizedBox(
                height: 100,
                child: TabBarView(
                  controller: bumperController,
                  children: const [
                    SituationItem(
                        position: 'Правая передняя дверь',
                        situation: 'Идеальное'),
                    SituationItem(
                        position: 'Правая задняя дверь',
                        situation: 'Идеальное'),
                  ],
                ),
              ),
              CustomTabBar(
                  title: 'Крыло',
                  tabController: wingController,
                  firstTab: 'Заднее',
                  secondTab: 'Переднее'),
              SizedBox(
                height: 100,
                child: TabBarView(
                  controller: wingController,
                  children: const [
                    SituationItem(
                        position: 'Правая передняя дверь',
                        situation: 'Идеальное'),
                    SituationItem(
                        position: 'Правая задняя дверь',
                        situation: 'Идеальное'),
                  ],
                ),
              ),
              const SituationTitleItem(
                title: 'Крыша',
                situation: 'Идеальное',
              ),
              const SizedBox(
                height: 24,
              ),
              const SituationTitleItem(
                title: 'Капот',
                situation: 'Идеальное',
              ),
              const SizedBox(
                height: 24,
              ),
              const SituationTitleItem(
                title: 'Багажник',
                situation: 'Идеальное.',
              ),
            ],
          ),
        ),
      ));
}
