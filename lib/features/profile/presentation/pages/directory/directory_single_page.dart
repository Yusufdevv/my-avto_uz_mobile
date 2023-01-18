import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/dio_settings.dart';
import 'package:auto/features/dealers/data/datasource/cars_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/datasource/dealer_single_datasource.dart';
import 'package:auto/features/dealers/data/datasource/marks_in_dealer_datasource.dart';
import 'package:auto/features/dealers/data/repositories/cars_in_dealers_repository.dart';
import 'package:auto/features/dealers/data/repositories/dealer_single_repository.dart';
import 'package:auto/features/dealers/data/repositories/marks_in_dealer_repository.dart';
import 'package:auto/features/dealers/domain/usecases/cars_in_dealers_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/dealer_single_usecase.dart';
import 'package:auto/features/dealers/domain/usecases/marks_usecase.dart';
import 'package:auto/features/dealers/presentation/blocs/cars_in_dealer_bloc/cars_in_dealer_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/dealer_single_bloc/dealer_single_bloc.dart';
import 'package:auto/features/dealers/presentation/blocs/marks_in_dealer_bloc/marks_in_dealers_bloc.dart';
import 'package:auto/features/dealers/presentation/pages/all_cars_in_dealer_screen.dart';
import 'package:auto/features/dealers/presentation/pages/all_marks_with_announcements.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info.dart';
import 'package:auto/features/dealers/presentation/widgets/dealer_info_sliver_delegate.dart';
import 'package:auto/features/dealers/presentation/widgets/mark_with_announcement.dart';
import 'package:auto/features/main/presentation/widgets/ads_item.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DirectorySinglePage extends StatefulWidget {
  final String slug;

   const DirectorySinglePage({
    required this.slug,
  });

  @override
  State<DirectorySinglePage> createState() => _DirectorySinglePageState();
}

class _DirectorySinglePageState extends State<DirectorySinglePage> {
  late DealerSingleBloc dealerSingleBloc;

  @override
  void initState() {
    dealerSingleBloc = DealerSingleBloc(
      dealerSingleUseCase: DealerSingleUseCase(
        dealerSingle: DealerSingleRepositoryImpl(
          dataSource: DealerSingleDataSource(DioSettings().dio),
        ),
      ),
    )..add(DealerSingleEvent.getResults(slug: widget.slug));
   
    super.initState();
  }

  @override
  void dispose() {
    dealerSingleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: dealerSingleBloc),
        ],
        child: Scaffold(
          body: BlocBuilder<DealerSingleBloc, DealerSingleState>(
            builder: (context, dealerSingleState) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SellerSliverDelegate(
                      gallery: dealerSingleState.dealerSingleEntity.gallery,
                      avatarImage: dealerSingleState.dealerSingleEntity.avatar,
                      dealerName: dealerSingleState.dealerSingleEntity.name,
                      minHeight: MediaQuery.of(context).size.height * 0.11,
                      showroomOrPerson: 'Avtasalon'),
                ),
              ],
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SellerInfo(
                      dealerName: dealerSingleState.dealerSingleEntity.name,
                      quantityOfCars:
                          dealerSingleState.dealerSingleEntity.carCount,
                      contactFrom:
                          dealerSingleState.dealerSingleEntity.contactFrom,
                      contactTo: dealerSingleState.dealerSingleEntity.contactTo,
                      contact: dealerSingleState.dealerSingleEntity.phoneNumber,
                      additionalInfo:
                          dealerSingleState.dealerSingleEntity.description,
                      longitude: dealerSingleState.dealerSingleEntity.longitude,
                      latitude: dealerSingleState.dealerSingleEntity.latitude,
                    ),
                     ],
                ),
              ),
            ),
          ),
        ),
      );
}
