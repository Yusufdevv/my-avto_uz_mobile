import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_search_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelComparison extends StatefulWidget {
  final BuildContext parentContext;
  final MakeEntity? selectedModel;

  const ChooseCarModelComparison(
      {required this.parentContext, this.selectedModel, Key? key})
      : super(key: key);

  @override
  State<ChooseCarModelComparison> createState() => _ChooseCarModelComparison();
}

class _ChooseCarModelComparison extends State<ChooseCarModelComparison> {
  late TextEditingController searchController;
  late int id;

  @override
  void initState() {
    id = context.read<GetMakesBloc>().state.selectId;
    searchController = TextEditingController();
    context.read<GetCarModelBloc>().add(GetCarModelEvent.getSerched(''));
    context.read<GetCarModelBloc>().add(GetCarModelEvent.selectedModelItem(
          id: widget.selectedModel?.id ?? -1,
          name: widget.selectedModel?.name ?? '',
          model: widget.selectedModel ?? const MakeEntity(),
        ));
    context.read<GetCarModelBloc>().add(GetCarModelEvent.getCarModel(id));
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
              bloc: context.read<GetCarModelBloc>(),
              builder: (context, state) {
                if (state.status.isSubmissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state.status.isSubmissionSuccess) {
                  return Stack(
                    children: [
                      CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            elevation: 0,
                            pinned: true,
                            leadingWidth: 36,
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: SvgPicture.asset(AppIcons.chevronLeft),
                              ),
                            ),
                            titleSpacing: 4,
                            title: Text(
                              LocaleKeys.choose_model_auto.tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: dark,
                              ),
                            ),
                            actions: [
                              // ! x button
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<GetCarModelBloc>()
                                        .add(GetCarModelEvent.selectedModelItem(
                                          id: -1,
                                          name: '',
                                          model: const MakeEntity(),
                                        ));
                                    context
                                        .read<GetMakesBloc>()
                                        .add(GetMakesBlocEvent.selectedCarItems(
                                          id: -1,
                                          name: '',
                                          imageUrl: '',
                                          makeEntity: const MakeEntity(),
                                        ));
                                    context
                                        .read<GetMakesBloc>()
                                        .add(GetMakesBlocEvent.getIndex(''));
                                    Navigator.of(context).pop();
                                    Navigator.of(widget.parentContext).pop();
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
                              delegate: ComparisonSearchBar(
                                controller: searchController,
                                onChanged: () {
                                  context.read<GetCarModelBloc>().add(
                                        GetCarModelEvent.getSerched(
                                          searchController.text,
                                        ),
                                      );
                                  context
                                      .read<GetCarModelBloc>()
                                      .add(GetCarModelEvent.getCarModel(id));
                                },
                                onClear: () {
                                  context.read<GetCarModelBloc>().add(
                                        GetCarModelEvent.getSerched(
                                          searchController.text,
                                        ),
                                      );
                                  context
                                      .read<GetCarModelBloc>()
                                      .add(GetCarModelEvent.getCarModel(id));
                                },
                              ),
                              pinned: true,
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
                                  isSelected: state.selectedId ==
                                      state.model.results[index].id,
                                  text: state.search,
                                  onTap: () {
                                    context.read<GetCarModelBloc>().add(
                                          GetCarModelEvent.selectedModelItem(
                                            id: state.model.results[index].id,
                                            name:
                                                state.model.results[index].name,
                                            model: state.model.results[index],
                                          ),
                                        );
                                    setState(() {});
                                  },
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
                          onTap: () {
                            if (state.selectedModel.id != -1) {
                              Navigator.pop(context);
                              Navigator.of(widget.parentContext).pop([
                                context.read<GetMakesBloc>().state.selectedMake,
                                state.selectedModel
                              ]);
                              context
                                  .read<GetCarModelBloc>()
                                  .add(GetCarModelEvent.selectedModelItem(
                                    id: -1,
                                    name: '',
                                    model: const MakeEntity(),
                                  ));
                              context
                                  .read<GetMakesBloc>()
                                  .add(GetMakesBlocEvent.selectedCarItems(
                                    id: -1,
                                    name: '',
                                    imageUrl: '',
                                    makeEntity: const MakeEntity(),
                                  ));
                            }
                          },
                          text: LocaleKeys.further.tr(),
                          isDisabled: state.selectedModel.id == -1,
                          disabledColor: darkGray,
                          shadow: state.selectedModel.id != -1
                              ? [
                                  BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 20,
                                    color: orange.withOpacity(0.2),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              }),
        ),
      );
}
