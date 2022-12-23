import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/domain/usecases/additional_services_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/additional_services/additional_services_bloc.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/additional_services_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/details_item.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/requirement_item.dart';
import 'package:auto/features/rent/presentation/pages/registration_lease/presentation/pages/registration_lease.dart';
import 'package:auto/features/rent/presentation/pages/rent_single/widgets/car_single_preview.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationScreen extends StatefulWidget {
  final RegisterLeaseEntity lease;
  final RentListEntity rentListEntity;
  final String fromDate;
  final String toDate;
  final String receivingAddress;
  final String returningAddress;
  const ConfirmationScreen({
    required this.lease,
    required this.receivingAddress,
    required this.returningAddress,
    required this.fromDate,
    required this.toDate,
    required this.rentListEntity,
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  late AdditionalServicesBloc additionalServicesBloc;
  @override
  void initState() {
    additionalServicesBloc =
        AdditionalServicesBloc(useCase: AdditionalServiceUseCase())
          ..add(GetAdditionalServicesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: additionalServicesBloc,
        child: BlocBuilder<AdditionalServicesBloc, AdditionalServicesState>(
          builder: (context, state) => Scaffold(
            appBar: WAppBar(
              title: LocaleKeys.confirmation.tr(),
              centerTitle: false,
            ),
            body: SingleChildScrollView(
              physics:const  BouncingScrollPhysics(),
              child: Column(
                children: [
                  CarSinglePreview(
                    rentEntity: widget.rentListEntity,
                    hasCarInfo: false,
                  ),
                  RequirementItem(
                    age: widget.rentListEntity.minAge.toString(),
                    experience:
                        widget.rentListEntity.minDrivingExperience.toString(),
                  ),
                  DetailsItem(
                    fromDate: widget.fromDate,
                    toDate: widget.toDate,
                    receiptingAddress: widget.receivingAddress,
                    returnigAddress: widget.receivingAddress,
                  ),
                  // const MileagePriceItem(),
                  // const PlaceItem(),
                  AdditionalServicesItem(
                      additionalServicesBloc: additionalServicesBloc)
                ],
              ),
            ),
            bottomNavigationBar: WButton(
              height: 44,
              onTap: () {
                List<int> additionalServiceIds = <int>[];
                for (var i = 0; i < state.services.length; i++) {
                  if (state.services[i].isSelected) {
                    additionalServiceIds.add(state.services[i].id);
                  }
                }
                Navigator.push(
                    context,
                    fade(
                        page: RegistrationLeaseScreen(
                            lease: widget.lease.copyWith(
                                additionalServices: additionalServiceIds))));
              },
              margin: EdgeInsets.fromLTRB(
                  16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
              text: LocaleKeys.form_order.tr(),
              shadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    color: orange.withOpacity(0.2)),
              ],
            ),
          ),
        ),
      );
}
