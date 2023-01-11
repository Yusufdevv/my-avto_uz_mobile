import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/choose_model/car_type_entity.dart';
import 'package:auto/features/ad/domain/entities/choose_model/model_item_entity.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/car_type_item.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/model_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/widgets/persistant_header.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarModelScreen extends StatefulWidget {
  const ChooseCarModelScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCarModelScreen> createState() => _ChooseCarModelScreenState();
}

class _ChooseCarModelScreenState extends State<ChooseCarModelScreen> {
  late TextEditingController searchController;
  late CarTypeSelectorBloc carTypeSelectorBloc;

  @override
  void initState() {
    carTypeSelectorBloc = CarTypeSelectorBloc();
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
      (index) => CarTypeEntity(
          title: '${index + 1} серия Coupe', id: index, logo: ''));

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: carTypeSelectorBloc,
            ),
          ],
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                /// SEARCH FIELD
                SliverToBoxAdapter(
                  child: WTextField(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    onChanged: (value) => setState(() {}),
                    borderRadius: 12,
                    hasSearch: true,
                    hintText: 'Поиск',
                    height: 40,
                    controller: searchController,
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

                ///
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
                                    fontWeight: FontWeight.w600, color: purple),
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
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                      child: ModelItems(
                        onTap: () {
                          print('=>=>=>=> model item tap <=<=<=<=');
                        },
                        entity: 'entity $index',
                        selectedId: context
                                .watch<PostingAdBloc>()
                                .state
                                .selectedPopularTypeId ??
                            -1,
                        id: index,
                        text: 'text',
                      ),
                    ),
                    childCount: 4,
                  ),
                ),

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
                SliverSafeArea(
                  top: false,
                  bottom: false,
                  sliver: SliverPersistentHeader(
                    delegate: ModelHeader(),
                    pinned: true,
                  ),
                ),

                /// CAR TYPES
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              color: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .whiteToDark,
                              child: BlocBuilder<CarTypeSelectorBloc,
                                  CarTypeSelectorState>(
                                builder: (context, state) => CarTypeItem(
                                    entity: carTypes[index],
                                    selectedId: state.selectedId,
                                    id: carTypes[index].id),
                              ),
                            ),
                        childCount: carTypes.length)),
              ],
            ),
          ),
        ),
      );
}
