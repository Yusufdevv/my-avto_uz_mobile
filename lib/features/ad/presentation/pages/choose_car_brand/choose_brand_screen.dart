import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/images.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/service_locator.dart';
import 'package:auto/features/ad/data/repositories/ad_repository_impl.dart';
import 'package:auto/features/ad/domain/entities/choose_car_brand/change_car_entity.dart';
import 'package:auto/features/ad/domain/usecases/get_makes.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/car_items.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/widget/persistant_header.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/domain/entity/car_brand_entity.dart';
import 'package:auto/features/common/widgets/car_brand_item.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/main/domain/usecases/get_top_brand.dart';
import 'package:auto/features/main/presentation/bloc/top_brand/top_brand_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseCarBrand extends StatefulWidget {
  final VoidCallback onTap;

  const ChooseCarBrand({required this.onTap, Key? key}) : super(key: key);

  @override
  State<ChooseCarBrand> createState() => _ChooseCarBrandState();
}

class _ChooseCarBrandState extends State<ChooseCarBrand> {
  late TextEditingController searchController;
  late GetMakesBloc carSelectorBloc;
  late TopBrandBloc topBrandBloc;

  @override
  void initState() {
    topBrandBloc = TopBrandBloc(GetTopBrandUseCase())
      ..add(TopBrandEvent.getBrand());
    searchController = TextEditingController();
    carSelectorBloc = GetMakesBloc(
        useCase: GetMakesUseCase(
          repository: serviceLocator<AdRepositoryImpl>(),
        ),
        selectedMakeId: -1)
      ..add(GetMakesBlocEvent.getMakes());
    super.initState();
  }

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
  final List<CarBrandEntity> carBrandEntityy = [
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
    const CarBrandEntity(title: 'Chevrolet', icon: AppImages.chevrolet),
  ];

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (c) => carSelectorBloc),
            BlocProvider(create: (c) => topBrandBloc),
          ],
          child: BlocBuilder<GetMakesBloc, GetMakesState>(
            builder: (context, getMakesState) =>
                BlocBuilder<TopBrandBloc, TopBrandState>(
              builder: (context, topBrandState) {
                print(
                    '=>=>=>=> top brand state name ${topBrandState.status.name} <=<=<=<=');
                return Scaffold(
                  body: Stack(
                    children: [
                      NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                          SliverToBoxAdapter(
                            child: WTextField(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 29),
                              onChanged: (value) {},
                              borderRadius: 12,
                              hasSearch: true,
                              hintText: 'Поиск',
                              height: 40,
                              controller: searchController,
                              hasClearButton: true,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CarBrandItem(
                                carBrandEntity: topBrandState.brands[index],
                                hasShadow: true,
                              ),
                              itemCount: topBrandState.brands.length,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => CarBrandItem(
                                    carBrandEntity: carBrandEntityy[index]),
                                itemCount: carBrandEntityy.length,
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 20,
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
                            padding: const EdgeInsets.only(bottom: 50),
                            itemBuilder: (context, index) => ChangeCarItems(
                              selectedId: getMakesState.selectedId,
                              id: index,
                              imageUrl: getMakesState.makes.results[index].logo,
                              name: getMakesState.makes.results[index].name,
                              text: '',
                              bloc: carSelectorBloc,
                            ),
                            itemCount: getMakesState.makes.results.length,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: WButton(
                          onTap: widget.onTap,
                          text: 'Далее',
                          shadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 20,
                                color: orange.withOpacity(0.2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
}
