import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/car_selector/car_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/model_selectro_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/pages/ads/ads.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/widgets/search_bar_widget.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelComparison extends StatefulWidget {
  final VoidCallback onTap;
  final ModelSelectorBloc modelBloc;
  final CarTypeSelectorBloc carTypeSelectorBloc;
  final GetCarModelBloc bloc;
  final GetMakesBloc getMakesBloc;
  final CarSelectorBloc carSelectorBloc;
  const ChooseCarModelComparison({
    required this.onTap,
    Key? key,
    required this.modelBloc,
    required this.carTypeSelectorBloc,
    required this.bloc,
    required this.carSelectorBloc,
    required this.getMakesBloc,
  }) : super(key: key);

  @override
  State<ChooseCarModelComparison> createState() => _ChooseCarModelComparison();
}

class _ChooseCarModelComparison extends State<ChooseCarModelComparison> {
  late TextEditingController searchController;
  late int id;
  @override
  void initState() {
    id = widget.carSelectorBloc.state.selectedId;
    searchController = TextEditingController();
    widget.bloc.add(
      GetCarModelEvent.getCarModel(id),
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: widget.modelBloc,
            ),
            BlocProvider.value(
              value: widget.carTypeSelectorBloc,
            ),
            BlocProvider.value(
              value: widget.bloc,
            ),
          ],
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(AppIcons.close),
                  ),
                ),
              ],
              onTapBack: () {
                Navigator.of(context).pushReplacement(
                  fade(
                    page: ChooseCarBrandComparison(
                      carSelectorBloc: widget.carSelectorBloc,
                      bloc: widget.getMakesBloc,
                      onTap: () => Navigator.of(context).pushReplacement(
                        fade(
                          page: ChooseCarModelComparison(
                            onTap: () {
                              // Navigator.of(context).push(
                              //   fade(
                              //     page: ChooseGenerationComparison(
                              //       onTap: () {},
                              //       modelBloc: modelBloc,
                              //     ),
                              //   ),
                              // );
                              Navigator.of(context).push(
                                fade(
                                  page: AdsScreen(
                                    carSelectorBloc: widget.carSelectorBloc,
                                    getMakesBloc: widget.getMakesBloc,
                                    getCarModelBloc: widget.bloc,
                                    carTypeSelectorBloc:
                                        widget.carTypeSelectorBloc,
                                    modelSelectorBloc: widget.modelBloc,
                                  ),
                                ),
                              );
                            },
                            bloc: widget.bloc,
                            carTypeSelectorBloc: widget.carTypeSelectorBloc,
                            modelBloc: widget.modelBloc,
                            carSelectorBloc: widget.carSelectorBloc,
                            getMakesBloc: widget.getMakesBloc,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            body: BlocBuilder<GetCarModelBloc, GetCarModelState>(
              builder: (context, statemodel) => Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SearchBarWidget(
                          searchController: searchController,
                          title: 'Выберите модель',
                          onChanged: () {
                            widget.bloc.add(
                              GetCarModelEvent.getSerched(
                                searchController.text,
                              ),
                            );
                            widget.bloc.add(GetCarModelEvent.getCarModel(id));
                          },
                        ),
                      ),
                      if (statemodel.search.isEmpty)
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
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (statemodel.search.isEmpty)
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
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
                                entity: statemodel.model.results[index].name,
                                selectedId: state.selectedId,
                                id: statemodel.model.results[index].id,
                                text: statemodel.search,
                              ),
                            ),
                          ),
                          childCount: statemodel.model.results.length,
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
        ),
      );
}
