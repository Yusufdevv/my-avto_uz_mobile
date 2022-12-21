import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/common/domain/model/auto_model.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/pagination/presentation/paginator.dart';
import 'package:auto/features/reviews/data/datasources/reviews_datasource.dart';
import 'package:auto/features/reviews/data/models/reviews_model.dart';
import 'package:auto/features/reviews/data/repositories/reviews_repository_impl.dart';
import 'package:auto/features/reviews/domain/usecases/reviews_usecase.dart';
import 'package:auto/features/reviews/presentation/blocs/reviews_bloc/reviews_bloc.dart';
import 'package:auto/features/reviews/presentation/pages/add_review_screen.dart';
import 'package:auto/features/reviews/presentation/pages/plus_minus_screen.dart';
import 'package:auto/features/reviews/presentation/pages/reviews_body_screen.dart';
import 'package:auto/features/reviews/presentation/parts/tab_views_part.dart';
import 'package:auto/features/reviews/presentation/widgets/review_bottom_sheet_item.dart';
import 'package:auto/features/reviews/presentation/widgets/review_tab_bar.dart';
import 'package:auto/features/search/presentation/widgets/sort_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ReviewsBloc reviewsBloc;
  late List<AutoModel> cars;
  late List<AutoModel> commmercials;
  late List<AutoModel> motos;

  @override
  void initState() {
    reviewsBloc = ReviewsBloc(
      useCase: ReviewsUseCase(
        repository: ReviewsRepositoryImpl(
            dataSource: ReviewsDatasourceImpl(DioSettings().dio)),
      ),
    )..add(ReviewsEvent.getReviews(const ReviewsModel()));
    cars = [];
    commmercials = [];
    motos = [];
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    reviewsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => reviewsBloc,
        child: KeyboardDismisser(
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor:
                  Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(108),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WAppBar(title: 'Отзывы'),
                    ReviewTabBar(
                      tabController: tabController,
                      tabLabels: const ['Легковые', 'Коммерческие', 'Мото'],
                    ),
                  ],
                ),
              ),
              body: BlocBuilder<ReviewsBloc, ReviewsState>(
                builder: (context, state) {
                  state.entity.map((e) {
                    if (e.make.name == 'car') {
                      if (!cars.contains(e)) {
                        cars.insert(cars.length, e);
                      }
                    } else if (e.make.name == 'moto') {
                      if (!motos.contains(e)) {
                        motos.insert(cars.length, e);
                      } else {
                        if (!commmercials.contains(e)) {
                          commmercials.insert(cars.length, e);
                        }
                      }
                    }
                  });
                  return TabBarView(
                    controller: tabController,
                    children: [
                      TabViewsPart(
                        entity: cars,
                        status: state.status,
                        count: cars.length,
                        fetchMore: state.fetchMore,
                      ),
                      TabViewsPart(
                        entity: commmercials,
                        status: state.status,
                        count: commmercials.length,
                        fetchMore: state.fetchMore,
                      ),
                      TabViewsPart(
                        entity: motos,
                        status: state.status,
                        count: motos.length,
                        fetchMore: state.fetchMore,
                      ),
                    ],
                  );
                },
              ),
              floatingActionButton: WButton(
                margin: const EdgeInsets.only(bottom: 25),
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useRootNavigator: true,
                  backgroundColor: white,
                  builder: (context) => SortBottomSheet(
                    height: MediaQuery.of(context).size.height * 0.3,
                    hasDivider: false,
                    title: 'Категория',
                    children: [
                      ReviewBottomSheetItem(
                        icon: AppIcons.lightweightCar,
                        title: 'Легковые',
                        onTap: () => Navigator.push(
                          context,
                          fade(
                            page: const PlusMinusScreen(
                              titles: [
                                'Вместительность салона',
                                'Обзорность',
                                'Дизайн',
                                'Шумоизоляция',
                                'Безопасность',
                                'Качество сборки',
                                'Коробка передач',
                              ],
                              negativesCount: [
                                0,
                                2,
                                2,
                                12,
                                6,
                                5,
                                8,
                              ],
                              positivesCount: [
                                7,
                                5,
                                5,
                                10,
                                5,
                                0,
                                1,
                              ],
                            ),
                          ),
                        ),
                        // Navigator.push(
                        //   context,
                        //   fade(
                        //     page: const AddReviewScreen(category: 'Легковые'),
                        //   ),
                        // ),
                      ),
                      ReviewBottomSheetItem(
                        icon: AppIcons.truck,
                        title: 'Коммерческие',
                        onTap: () => Navigator.push(
                          context,
                          fade(
                              page: const AddReviewScreen(
                                  category: 'Коммерческие')),
                        ),
                      ),
                      ReviewBottomSheetItem(
                        icon: AppIcons.motorcycle,
                        title: 'Мото',
                        hasDivider: false,
                        onTap: () => Navigator.push(
                          context,
                          fade(page: const AddReviewScreen(category: 'Мото')),
                        ),
                      ),
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                ),
                height: 64,
                width: 64,
                borderRadius: 200,
                shadow: [
                  BoxShadow(
                    color: orange.withOpacity(0.6),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  )
                ],
                child: SvgPicture.asset(
                  AppIcons.plus,
                  color: white,
                  height: 16,
                  width: 16,
                  fit: BoxFit.cover,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          ),
        ),
      );
}
