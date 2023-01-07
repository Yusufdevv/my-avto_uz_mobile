import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/widgets/search_bar.dart';
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
  late int id;
  @override
  void initState() {
    id = BlocProvider.of<GetMakesBloc>(context).state.selectedId;
    searchController = TextEditingController();
    BlocProvider.of<GetCarModelBloc>(context).add(
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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<GetCarModelBloc, GetCarModelState>(
            bloc: BlocProvider.of<GetCarModelBloc>(context),
            builder: (context, state) => Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      pinned: true,
                      leadingWidth: 36,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SvgPicture.asset(AppIcons.chevronLeft),
                        ),
                      ),
                      titleSpacing: 4,
                      title: const Text(
                        'Выберите модель автомобиля',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: dark,
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(AppIcons.close),
                          ),
                        ),
                      ],
                    ),
                    SliverSafeArea(
                      top: false,
                      bottom: true,
                      sliver: SliverPersistentHeader(
                        delegate: WSerachBar(
                          controller: searchController,
                          onChanged: () {
                            BlocProvider.of<GetCarModelBloc>(context).add(
                              GetCarModelEvent.getSerched(
                                searchController.text,
                              ),
                            );
                            BlocProvider.of<GetCarModelBloc>(context)
                                .add(GetCarModelEvent.getCarModel(id));
                          },
                        ),
                        pinned: true,
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    if (state.search.isEmpty)
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
                    if (state.search.isEmpty)
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
                          child: ModelItems(
                            entity: state.model.results[index].name,
                            selectedId: state.selectedId,
                            id: state.model.results[index].id,
                            text: state.search,
                          ),
                        ),
                        childCount: state.model.results.length,
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 60)),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: WButton(
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
              ],
            ),
          ),
        ),
      );
}
