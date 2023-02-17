import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/choose_model/car_type_entity.dart';
import 'package:auto/features/ad/domain/usecases/get_car_model.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/car_type_item.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/persistant_header.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SelectModelScreen extends StatefulWidget {
  final VoidCallback onTap;

  const SelectModelScreen({required this.onTap, Key? key}) : super(key: key);

  @override
  State<SelectModelScreen> createState() => _SelectModelScreenState();
}

class _SelectModelScreenState extends State<SelectModelScreen> {
  late TextEditingController searchController;
  late CarModelSelectorBloc carTypeSelectorBloc;

  @override
  void initState() {
    carTypeSelectorBloc =
        CarModelSelectorBloc(makeId: -1, useCase: GetCarModelUseCase());
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<CarTypeEntity> carTypes = List.generate(
      12,
      (index) =>
          CarTypeEntity(title: '${index + 1} cartype', id: index, logo: ''));

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            // BlocProvider.value(
            //   value: modelBloc,
            // ),
            BlocProvider.value(
              value: carTypeSelectorBloc,
            ),
          ],
          child: Scaffold(
            body: Stack(
              children: [
                NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverAppBar(
                            pinned: true,
                            elevation: 0,
                            automaticallyImplyLeading: false,
                            title: Row(
                              children: [
                                WScaleAnimation(
                                    child:
                                        SvgPicture.asset(AppIcons.chevronLeft),
                                    onTap: () => Navigator.pop(context)),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  LocaleKeys.choose_model.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Spacer(),
                                WScaleAnimation(
                                    child: SvgPicture.asset(AppIcons.close),
                                    onTap: () => Navigator.pop(context)),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: WTextField(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              onChanged: (value) {},
                              borderRadius: 12,
                              hasSearch: true,
                              hintText: LocaleKeys.search.tr(),
                              height: 40,
                              controller: searchController,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      LocaleKeys.popular.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: purple),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SliverList(
                          //     delegate: SliverChildBuilderDelegate(
                          //         (context, index) => Container(
                          //               color: Theme.of(context)
                          //                   .extension<ThemedColors>()!
                          //                   .whiteToDark,
                          //               child: BlocBuilder<ModelSelectorBloc,
                          //                   ModelSelectorState>(
                          //                 builder: (context, state) =>
                          //                     ModelItems(
                          //                       bloc: modelBloc,
                          //                   entity: modelItems[index].title,
                          //                   selectedId: state.selectedId,
                          //                   id: index, text: '',
                          //                 ),
                          //               ),
                          //             ),
                          //         childCount: modelItems.length)),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 10,
                              width: double.infinity,
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                            ),
                          ),
                          SliverSafeArea(
                            top: false,
                            bottom: false,
                            sliver: SliverPersistentHeader(
                              delegate: ModelHeader(),
                              pinned: true,
                            ),
                          ),
                        ],
                    body: Container(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                      child: BlocBuilder<CarModelSelectorBloc,
                          CarModelSelectorState>(
                        builder: (context, state) => ListView.builder(
                          padding: const EdgeInsets.only(bottom: 50),
                          itemBuilder: (context, index) => CarTypeItem(
                            onTap: () => context
                                .read<CarModelSelectorBloc>()
                                .add(SelectedCarTypeEvent(
                                    id: carTypes[index].id)),
                            title: carTypes[index].title,
                            isSelected: context
                                    .watch<CarModelSelectorBloc>()
                                    .state
                                    .selectedModelId ==
                                carTypes[index].id,
                          ),
                          itemCount: carTypes.length,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child:
                      BlocBuilder<CarModelSelectorBloc, CarModelSelectorState>(
                    builder: (context, state) => WButton(
                      onTap: state.selectedModelId == -1 ? () {} : widget.onTap,
                      text: LocaleKeys.popular.tr(),
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: orange.withOpacity(0.2)),
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
