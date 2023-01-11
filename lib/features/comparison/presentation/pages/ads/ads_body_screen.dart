import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/car_selector/car_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/car_type_selector_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/choose_model/model_selectro_bloc.dart';
import 'package:auto/features/commercial/presentation/widgets/commercial_car_model_item.dart';
import 'package:auto/features/commercial/presentation/widgets/info_container.dart';
import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
import 'package:auto/features/common/bloc/get_makes_bloc/get_makes_bloc_bloc.dart';
import 'package:auto/features/common/bloc/regions/regions_bloc.dart';
import 'package:auto/features/common/models/region.dart';
import 'package:auto/features/common/widgets/w_filter_button.dart';
import 'package:auto/features/comparison/presentation/bloc/filter_parameters_bloc/bloc/filter_parameters_bloc.dart';
import 'package:auto/features/comparison/presentation/pages/ads/ads.dart';
import 'package:auto/features/comparison/presentation/pages/ads/filter_parameters.dart';
import 'package:auto/features/comparison/presentation/pages/choose_car_brand.dart';
import 'package:auto/features/comparison/presentation/pages/choose_model.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/usecases/rent_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/rent_bloc/rent_bloc.dart';
import 'package:auto/features/rent/presentation/pages/filter/presentation/wigets/rent_choose_region_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsBodyScreen extends StatefulWidget {
  final CarSelectorBloc carSelectorBloc;
  final GetMakesBloc getMakesBloc;
  final GetCarModelBloc getCarModelBloc;
  final CarTypeSelectorBloc carTypeSelectorBloc;
  final ModelSelectorBloc modelSelectorBloc;
  final FilterParametersBloc filterParametersBloc;
  const AdsBodyScreen({
    super.key,
    required this.carSelectorBloc,
    required this.getMakesBloc,
    required this.getCarModelBloc,
    required this.carTypeSelectorBloc,
    required this.modelSelectorBloc,
    required this.filterParametersBloc,
  });

  @override
  State<AdsBodyScreen> createState() => _AdsBodyScreenState();
}

class _AdsBodyScreenState extends State<AdsBodyScreen> {
  late RentBloc rentBloc;
  final List<bool> hasDiscount = [true, false];

  final List<String> owner = ['Анвар Гулямов', 'ORIENT MOTORS'];

  final List<String> ownerType = ['Частное лицо', 'Автосалон'];

  final List<String> publishTime = ['Сегодня', '27 февраля'];

  final List<String> sellType = ['Продажа Автомобиля', 'Аренда c выкупом'];

  @override
  void initState() {
    // rentBloc = RentBloc(rentUseCase: RentUseCase(), id: 5)
    //   ..add(RentGetResultsEvent(isRefresh: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).extension<ThemedColors>()!;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 16),
        CommercialCarModelItem(
          title: widget.carSelectorBloc.state.name,
          subtitle: widget.modelSelectorBloc.state.name,
          imageUrl: widget.carSelectorBloc.state.imageUrl,
          onTap: () {
            Navigator.push(
              context,
              fade(
                page: ChooseCarBrandComparison(
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
                          Navigator.of(context).pushReplacement(
                            fade(
                              page: AdsScreen(
                                carSelectorBloc: widget.carSelectorBloc,
                                getMakesBloc: widget.getMakesBloc,
                                getCarModelBloc: widget.getCarModelBloc,
                                carTypeSelectorBloc: widget.carTypeSelectorBloc,
                                modelSelectorBloc: widget.modelSelectorBloc,
                              ),
                            ),
                          );
                        },
                        bloc: widget.getCarModelBloc,
                        carTypeSelectorBloc: widget.carTypeSelectorBloc,
                        modelBloc: widget.modelSelectorBloc,
                        carSelectorBloc: widget.carSelectorBloc,
                        getMakesBloc: widget.getMakesBloc,
                      ),
                    ),
                  ),
                  carSelectorBloc: widget.carSelectorBloc,
                  bloc: widget.getMakesBloc,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.filter,
                name: '',
                claerA: false,
                activeColor: orange,
                defaultTitle: 'Параметры',
                onTap: () {
                  Navigator.of(context).push(
                    fade(
                      page: FilterParameters(
                        filterParametersBloc: widget.filterParametersBloc,
                        rentBloc: rentBloc,
                      ),
                    ),
                  );
                },
                onTapClear: () {},
              ),
              WFilterButton(
                size: size,
                theme: theme,
                icon: AppIcons.location,
                name: 'г. Ташкент',
                claerA: true,
                activeColor: dark,
                defaultTitle: 'Все регионы',
                onTap: () async {
                  await showModalBottomSheet<List<Region>>(
                    isDismissible: false,
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (c) => RentChooseRegionBottomSheet(
                        list: context.read<RegionsBloc>().state.regions),
                  ).then((value) {
                    rentBloc.add(RentSetParamFromFilterEvent(regions: value));
                  });
                },
                onTapClear: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InfoContainer(
              avatarPicture: 'assets/images/car_single/car_single300kb.png',
              carModel: 'Mercedes-Benz Sprinter',
              hasDiscount: hasDiscount[index],
              location: 'г. Ташкент',
              owner: owner[index],
              ownerType: ownerType[index],
              publishTime: publishTime[index],
              subtitle:
                  '\n\nMercedes-Benz Sprinter — семейство малотоннажных\nавтомобилей компании Mercedes-Benz. Существует...',
              year: 2020,
              price: '227 000 000 UZS',
              discountPrice: '270 000 000 UZS',
              sellType: sellType[index],
              hasStatusInfo: hasDiscount[index],
              hasCallCard: hasDiscount[index],
              onTapComparsion: () {},
              onTapFavorites: () {},
            ),
          ),
        )
      ],
    );
  }
}
