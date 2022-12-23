import 'dart:ui';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/choose_model/car_type_entity.dart';
import 'package:auto/features/ad/domain/entities/choose_model/model_item_entity.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/model_selectro_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/car_type_item.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/persistant_header.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/comparison/presentation/comparison_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelComparison extends StatefulWidget {
  final VoidCallback onTap;

  const ChooseCarModelComparison({required this.onTap, Key? key})
      : super(key: key);

  @override
  State<ChooseCarModelComparison> createState() => _ChooseCarModelComparison();
}

class _ChooseCarModelComparison extends State<ChooseCarModelComparison> {
  late TextEditingController searchController;
  late ModelSelectorBloc modelBloc;
  late CarTypeSelectorBloc carTypeSelectorBloc;

  @override
  void initState() {
    carTypeSelectorBloc = CarTypeSelectorBloc();
    modelBloc = ModelSelectorBloc();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<ModelItemEntity> modelItems = [
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
    ModelItemEntity(title: 'm90'),
  ];

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: modelBloc,
            ),
            BlocProvider.value(
              value: carTypeSelectorBloc,
            ),
          ],
          child: Scaffold(
            appBar: WAppBar(
              title: 'Марка автомобиля',
              titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: grey,
              ),
              centerTitle: false,
              extraActions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(AppIcons.close),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 16,
                              bottom: 12,
                            ),
                            child: Text(
                              'Выберите модель',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                          WTextField(
                            fillColor: Theme.of(context)
                                .extension<ThemedColors>()!
                                .whiteToNightRider,
                            margin: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12,
                            ),
                            onChanged: (value) {},
                            borderRadius: 12,
                            hasSearch: true,
                            hintText: 'Поиск',
                            height: 40,
                            controller: searchController,
                            hasClearButton: true,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Transform.translate(
                        offset: const Offset(0, 1),
                        child: Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              )),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToDark,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Популярные',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: purple),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToDark,
                          child: BlocBuilder<ModelSelectorBloc,
                              ModelSelectorState>(
                            builder: (context, state) => ModelItems(
                              entity: modelItems[index],
                              selectedId: state.selectedId,
                              id: index,
                            ),
                          ),
                        ),
                        childCount: modelItems.length,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 60)),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: BlocBuilder<ModelSelectorBloc, ModelSelectorState>(
                    builder: (context, state) => WButton(
                      onTap: state.selectedId == -1 ? () {} : widget.onTap,
                      // onTap: widget.onTap,
                      text: 'Далее',
                      shadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          color: orange.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
