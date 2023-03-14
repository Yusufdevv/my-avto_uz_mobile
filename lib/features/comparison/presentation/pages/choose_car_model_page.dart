import 'dart:developer';
import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/ads/presentation/widgets/no_data_widget.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/comparison/presentation/widgets/comparison_search_bar.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
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
  State<ChooseCarModelPage> createState() => _ChooseCarModelPageState();
}

class _ChooseCarModelPageState extends State<ChooseCarModelPage> {
  late TextEditingController _searchController;
  late CarModelsBloc _getCarModelBloc;
  late int id;

  @override
  void initState() {
    _searchController = TextEditingController();
    _getCarModelBloc =
        CarModelsBloc(initialSelectedId: widget.selectedModelId ?? -1)
          ..add(CarModelsGetEvent(
            getId: widget.selectedMake?.id ?? -1,
            search: _searchController.text,
          ))
          ..add(CarModelsGetAnnouncementsEvent(
            makeId: widget.selectedMake?.id ?? -1,
            modelId: widget.selectedModelId ?? -1,
          ));
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
            body: BlocBuilder<CarModelsBloc, CarModelsState>(
                builder: (context, state) => Stack(
                      children: [
                        NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) =>
                              [
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
                                      Navigator.of(context).pop('');
                                      Navigator.of(widget.parentContext)
                                          .pop('');
                                    },
                                    child: SvgPicture.asset(AppIcons.close),
                                  ),
                                ),
                              ],
                            ),
                            SliverPersistentHeader(
                              delegate: ComparisonSearchBar(
                                controller: _searchController,
                                onChanged: () {
                                  _getCarModelBloc.add(CarModelsGetEvent(
                                    getId: id,
                                    search: _searchController.text,
                                  ));
                                },
                                onClear: () {
                                  _getCarModelBloc.add(CarModelsGetEvent(
                                    getId: id,
                                    search: _searchController.text,
                                  ));
                                },
                              ),
                              pinned: true,
                            ),
                          ],
                          body: Builder(builder: (context) {
                            if (state.status.isSubmissionInProgress) {
                              return const Center(
                                  child: CupertinoActivityIndicator());
                            }
                            if (state.status.isSubmissionSuccess) {
                              return state.models.isNotEmpty
                                  ? ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 60),
                                      itemBuilder: (context, index) =>
                                          Container(
                                        color: Theme.of(context)
                                            .extension<ThemedColors>()!
                                            .whiteToDark,
                                        child: ModelItems(
                                          title: state.models[index].name,
                                          isSelected: state.model.id ==
                                              state.models[index].id,
                                          text: _searchController.text,
                                          onTap: () {
                                            _getCarModelBloc
                                              ..add(
                                                CarModelsChooseEvent(
                                                  model: state.models[index],
                                                ),
                                              )
                                              ..add(
                                                  CarModelsGetAnnouncementsEvent(
                                                      makeId:
                                                          widget.selectedMake
                                                                  ?.id ??
                                                              -1,
                                                      modelId: state
                                                          .models[index].id));
                                          },
                                        ),
                                      ),
                                      itemCount: state.models.length,
                                    )
                                  : const NoDataWidget();
                            }
                            return const SizedBox();
                          }),
                        ),
                        Positioned(
                          bottom: Platform.isAndroid ? 20 : 50,
                          right: 16,
                          left: 16,
                          child: WButton(
                            onTap: () {
                              if (state.model.id != -1) {
                                if (state.model.id == -1) {
                                  final item = state.models.firstWhere(
                                      (element) =>
                                          element.id == state.model.id);
                                  Navigator.pop(context);
                                  Navigator.of(widget.parentContext).pop({
                                    'modelId': item.id,
                                    'modelName': item.name,
                                    'make': widget.selectedMake,
                                    'count': state.announcementCount,
                                  });
                                } else {
                                  Navigator.pop(context);
                                  Navigator.of(widget.parentContext).pop({
                                    'make': widget.selectedMake,
                                    'modelId': state.model.id,
                                    'modelName': state.model.name,
                                    'count': state.announcementCount,
                                  });
                                }
                              }
                            },
                            text: state.model.id == -1
                                ? LocaleKeys.choose_model.tr()
                                : state.announcementCount > 0
                                    ? LocaleKeys.show_offers.tr(args: [
                                        MyFunctions.getThousandsSeparatedPrice(
                                            '${state.announcementCount}')
                                      ], namedArgs: {
                                        'apendix': MyFunctions.getAppendix(
                                            state.announcementCount)
                                      })
                                    : LocaleKeys.no_offers.tr(),
                            isLoading: state
                                .getAnnouncementStatus.isSubmissionInProgress,
                            isDisabled: state.announcementCount == 0 ||
                                state.model.id == -1,
                            disabledColor: disabledButton,
                            shadow: state.announcementCount != 0 &&
                                    state.model.id != -1
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
                    )),
          ),
        ),
      );
}
