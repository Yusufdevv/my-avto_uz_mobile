import 'package:auto/features/rent/domain/usecases/additional_services_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/additional_services/additional_services_bloc.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/widgets/additional_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AdditionalServicesItem extends StatefulWidget {
  final AdditionalServicesBloc additionalServicesBloc;
  const AdditionalServicesItem({required this.additionalServicesBloc, Key? key})
      : super(key: key);

  @override
  State<AdditionalServicesItem> createState() => _AdditionalServicesItemState();
}

class _AdditionalServicesItemState extends State<AdditionalServicesItem> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AdditionalServicesBloc, AdditionalServicesState>(
        builder: (context, state) {
          if (state.services.isEmpty ||
              state.status == FormzStatus.submissionFailure) {
            return const SizedBox();
          }
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return AdditionalServices(
            services: state.services,
            onChanged: (index, value) {
              widget.additionalServicesBloc
                  .add(CheckUncheckEvent(index: index, value: value));
            },
          );
        },
      );
}
