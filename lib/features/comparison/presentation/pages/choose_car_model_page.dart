import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
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

class ChooseCarModelPage extends StatefulWidget {
  final BuildContext parentContext;
  final int? selectedModelId;
  final MakeEntity? selectedMake;

  const ChooseCarModelPage(
      {required this.parentContext,
      this.selectedModelId,
      this.selectedMake,
      Key? key})
      : super(key: key);

  @override
  State<ChooseCarModelPage> createState() => _ChooseCarModelComparison();
}

class _ChooseCarModelComparison extends State<ChooseCarModelPage> {
  late TextEditingController _searchController;
  late GetCarModelBloc _getCarModelBloc;
  late int id;

  @override
  void initState() {
    id = widget.selectedMake?.id ?? -1;
    _getCarModelBloc = GetCarModelBloc(
        useCase:
            GetCarModelUseCase(repository: serviceLocator<AdRepositoryImpl>()))
      ..add(GetCarModelEvent.selectedModelItem(
        selectedId: widget.selectedModelId ?? -1,
        model: const MakeEntity(),
      ))
      ..add(GetCarModelEvent.getCarModel(id));
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _getCarModelBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: BlocProvider(
          create: (context) => _getCarModelBloc,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocBuilder<GetCarModelBloc, GetCarModelState>(
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
                            ///  x button
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: InkWell(
                                onTap: () {
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
                              controller: _searchController,
                              onChanged: () {
                                _getCarModelBloc
                                  ..add(
                                    GetCarModelEvent.getSerched(
                                        _searchController.text),
                                  )
                                  ..add(GetCarModelEvent.getCarModel(id));
                              },
                              onClear: () {
                                _getCarModelBloc
                                  ..add(GetCarModelEvent.getSerched(
                                      _searchController.text))
                                  ..add(GetCarModelEvent.getCarModel(id));
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
                                  _getCarModelBloc.add(
                                    GetCarModelEvent.selectedModelItem(
                                      selectedId: state.model.results[index].id,
                                      model: state.model.results[index],
                                    ),
                                  );
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
                          if (state.selectedId != -1) {
                            if (state.selectedModel.id == -1) {
                              final item = state.model.results.firstWhere(
                                  (element) => element.id == state.selectedId);
                              Navigator.pop(context);
                              Navigator.of(widget.parentContext).pop({
                                'makeId': widget.selectedMake?.id,
                                'modelId': item.id,
                                'modelName': item.name,
                                'makeName': widget.selectedMake?.name,
                                'makeLogo': widget.selectedMake?.logo,
                              });
                            } else {
                              Navigator.pop(context);
                              Navigator.of(widget.parentContext).pop({
                                'makeId': widget.selectedMake?.id,
                                'modelId': state.selectedModel.id,
                                'modelName': state.selectedModel.name,
                                'makeName': widget.selectedMake?.name,
                                'makeLogo': widget.selectedMake?.logo,
                              });
                            }
                          }
                        },
                        text: LocaleKeys.further.tr(),
                        isDisabled: state.selectedId == -1,
                        disabledColor: darkGray,
                        shadow: state.selectedId != -1
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
        ),
      );
}
