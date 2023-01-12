import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/choose_car_brand/change_car_entity.dart';
import 'package:auto/features/ad/domain/entities/types/make.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistent_header_search.dart';
import 'package:auto/features/ad/presentation/widgets/sliver_header_text.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrand extends StatefulWidget {
  final PostingAdBloc bloc;
  const ChooseCarBrand({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  late ScrollController _scrollController;
  late TextEditingController searchController;
  late GetMakesBloc getMakesBloc;
  late TopBrandBloc topBrandBloc;

  double height = 140;
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    searchController = TextEditingController();
    getMakesBloc = GetMakesBloc(
        useCase: GetMakesUseCase(
          repository: serviceLocator<AdRepositoryImpl>(),
        ),
        selectedMakeId: -1)
      ..add(GetMakesBlocEvent.getMakes());
    super.initState();
  }

  void _scrollListener() {
    if (widget.bloc.state.hasAppBarShadow == _isShrink) {
      widget.bloc.add(PostingAdChangeAppBarShadowEvent(value: !_isShrink));
    }

    if (_scrollController.offset > 55) {
      setState(() {
        crossFadeState = CrossFadeState.showSecond;
      });
    } else {
      setState(() {
        crossFadeState = CrossFadeState.showFirst;
      });
    }
  }

  bool get _isShrink =>
      _scrollController.hasClients &&
      _scrollController.offset > (height - kToolbarHeight);

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<ChangeCarEntity> carList = [
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
    ChangeCarEntity(
        title: 'Volkswagen',
        icon:
            'https://seeklogo.com/images/V/Volkswagen-logo-FAE94F013E-seeklogo.com.png'),
  ];
  final List<MakeEntity> carBrandEntityy = List.generate(
      8,
      (index) => MakeEntity(
          id: index, logo: AppImages.chevrolet, name: 'Make $index'));

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (c) => getMakesBloc),
            BlocProvider(create: (c) => topBrandBloc),
          ],
          child: BlocBuilder<GetMakesBloc, GetMakesState>(
            builder: (context, getMakesState) =>
                BlocBuilder<TopBrandBloc, TopBrandState>(
              builder: (context, topBrandState) {
                final postingAdState = context.watch<PostingAdBloc>().state;

                if (postingAdState.isSortByLetter) {
                  getMakesBloc.add(
                      GetMakesBlocEvent.sortMakes(postingAdState.letter ?? ''));
                  topBrandBloc.add(
                      TopBrandEvent.sortBarands(postingAdState.letter ?? ''));
                }

                return Scaffold(
                  body: NestedScrollView(
                    controller: _scrollController,
                    floatHeaderSlivers: true,
                    physics: const BouncingScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      /// HEADER TEXT
                      const SliverHeaderText(text: 'Выберите марку автомобиля'),

                      /// SEARCH FIELD WITH PERSISTENT HEADER

                      SliverSafeArea(
                        top: false,
                        bottom: false,
                        sliver: SliverPersistentHeader(
                          delegate: PersistentHeaderSearch(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              color: _isShrink
                                  ? white
                                  : Theme.of(context).scaffoldBackgroundColor,
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 12),
                              child: WTextField(
                                fillColor: _isShrink ? whiteSmoke : white,
                                filled: true,
                                margin:
                                    const EdgeInsets.only(left: 16, right: 16),
                                onChanged: (value) => setState(() {}),
                                borderRadius: 12,
                                hasSearch: true,
                                hintText: 'Поиск',
                                height: 40,
                                controller: searchController,
                                hasClearButton: true,
                              ),
                            ),
                          ),
                          pinned: true,
                        ),
                      ),

                      /// TOP CAR BRANDS
                      SliverToBoxAdapter(
                        child: AnimatedCrossFade(
                          duration: const Duration(microseconds: 150),
                          crossFadeState: crossFadeState,
                          secondChild: const SizedBox(),
                          firstChild: SizedBox(
                            height: 100,
                            child: ListView.separated(
                                itemCount: topBrandState.brands.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {},
                                      child: CarBrandItem(
                                        carBrandEntity:
                                            topBrandState.brands[index],
                                      ),
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 12)),
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(
                        child: SizedBox(height: 20),
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
                                )),
                          ),
                        ),
                      ),

                      /// LETTER BUTTONS
                      SliverSafeArea(
                        top: false,
                        bottom: false,
                        sliver: SliverPersistentHeader(
                          delegate: Header(),
                          pinned: true,
                        ),
                      ),
                    ],
                    body: Container(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 50),
                        itemBuilder: (context, index) => ChangeCarItems(
                          onTap: () => context.read<PostingAdBloc>().add(
                              PostingAdChooseEvent(
                                  makeEntity: getMakesState.makes[index])),
                          selectedId: context
                                  .watch<PostingAdBloc>()
                                  .state
                                  .makeEntity
                                  ?.id ??
                              -1,
                          id: getMakesState.makes[index].id,
                          imageUrl: getMakesState.makes[index].logo,
                          name: getMakesState.makes[index].name,
                          text: searchController.text,
                        ),
                        itemCount: getMakesState.makes.length,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
}
