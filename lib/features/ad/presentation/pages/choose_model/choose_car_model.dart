import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/ad/presentation/widgets/sliver_header_text.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelScreen extends StatefulWidget {
  final int makeId;
  const ChooseCarModelScreen({required this.makeId, Key? key})
      : super(key: key);

  @override
  State<ChooseCarModelScreen> createState() => _ChooseCarModelScreenState();
}

class _ChooseCarModelScreenState extends State<ChooseCarModelScreen> {
  late TextEditingController searchController;
  late CarModelSelectorBloc carTypeSelectorBloc;

  @override
  void initState() {
    carTypeSelectorBloc = CarModelSelectorBloc(
        makeId: widget.makeId,
        useCase:
            GetCarModelUseCase(repository: serviceLocator<AdRepositoryImpl>()))
      ..add(CarModelSelectorGetEvent(searchPattern: null));
    searchController = TextEditingController();
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
              value: carTypeSelectorBloc,
            ),
          ],
          child: Scaffold(
            body: BlocBuilder<CarModelSelectorBloc, CarModelSelectorState>(
              builder: (context, state) => CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  /// HEADER TEXT
                  const SliverHeaderText(text: 'Выберите модель'),

                  /// SEARCH FIELD
                  SliverToBoxAdapter(
                    child: WTextField(
                      fillColor: white,
                      filled: true,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      onChanged: (value) => carTypeSelectorBloc.add(
                          CarModelSelectorGetEvent(
                              searchPattern: searchController.text)),
                      borderRadius: 12,
                      hasSearch: true,
                      hintText: LocaleKeys.search.tr(),
                      height: 40,
                      controller: searchController,
                      textStyle: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w400,fontSize: 16) ,
                    ),
                  ),

                  /// SIZED BOX
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

                  /// POPULAR HEADER
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          const SizedBox(height: 10),
                          Divider(
                            thickness: 1,
                            color: Theme.of(context).dividerColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// POPULAR TYPES
                  if (state.status == FormzStatus.submissionInProgress) ...{
                    const SliverToBoxAdapter(
                        child: Center(child: CupertinoActivityIndicator()))
                  } else ...{
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteToDark,
                          child: ModelItems(
                            hasBorder: index != state.models.length - 1,
                            onTap: () => context.read<PostingAdBloc>().add(
                                PostingAdChooseEvent(
                                    modelId: state.models[index].id)),
                            entity: state.models[index].name,
                            isSelected:
                                context.watch<PostingAdBloc>().state.modelId ==
                                    state.models[index].id,
                            text: searchController.text,
                          ),
                        ),
                        childCount: state.models.length,
                      ),
                    ),
                  },

                  /// JUST CONTAINER
                  SliverToBoxAdapter(
                    child: Container(
                      height: 10,
                      width: double.infinity,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                    ),
                  ),

                  /// NUMBER BOX
                  // SliverSafeArea(
                  //   top: false,
                  //   bottom: false,
                  //   sliver: SliverPersistentHeader(
                  //     delegate: ModelHeader(),
                  //     pinned: true,
                  //   ),
                  // ),

                  /// CAR TYPES
                  // if (state.status == FormzStatus.submissionInProgress) ...{
                  //   const SliverToBoxAdapter(
                  //       child: Center(child: CupertinoActivityIndicator()))
                  // } else ...{
                  //   SliverList(
                  //     delegate: SliverChildBuilderDelegate(
                  //       (context, index) => Container(
                  //         color: Theme.of(context)
                  //             .extension<ThemedColors>()!
                  //             .whiteToDark,
                  //         child: CarTypeItem(
                  //           onTap: () => context.read<PostingAdBloc>().add(
                  //               PostingAdChooseEvent(
                  //                   carTypeEntity: CarTypeEntity(
                  //                       title: state.models[index].name,
                  //                       id: state.models[index].id))),
                  //           title: state.models[index].name,
                  //           isSelected: (context
                  //                       .watch<PostingAdBloc>()
                  //                       .state
                  //                       .carTypeEntity
                  //                       ?.id ??
                  //                   -1) ==
                  //               state.models[index].id,
                  //         ),
                  //       ),
                  //       childCount: state.models.length,
                  //     ),
                  //   ),
                  // }
                ],
              ),
            ),
          ),
        ),
      );
}
