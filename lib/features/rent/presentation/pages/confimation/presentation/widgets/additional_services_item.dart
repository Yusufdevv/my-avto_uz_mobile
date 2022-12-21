import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/rent/domain/usecases/additional_services_usecase.dart';
import 'package:auto/features/rent/presentation/pages/commercials/bloc/additional_services/additional_services_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

class AdditionalServicesItem extends StatefulWidget {
  const AdditionalServicesItem({Key? key}) : super(key: key);

  @override
  State<AdditionalServicesItem> createState() => _AdditionalServicesItemState();
}

class _AdditionalServicesItemState extends State<AdditionalServicesItem> {
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
            builder: (context, state) {
          print('additional_services_item ${state.services.toString()}');
          if (state.services.isEmpty) {
            return const SizedBox();
          } else {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                border: Border.all(
                    width: 1,
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitudeToDarkRider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Дополнительные услуги',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700, color: dark),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.services.length,
                      itemBuilder: (context, index) => Row(
                            children: [
                              Text(
                                state.services[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: greyText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${state.services[index].price}/сутки',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const Spacer(),
                              Container(
                                height: 20,
                                width: 20,
                                padding:const  EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: purple),
                                    borderRadius: BorderRadius.circular(4)),
                                child: SvgPicture.asset(Theme.of(context)
                                    .extension<ThemedIcons>()!
                                    .check,fit: BoxFit.contain,color: purple,),
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                            color: Theme.of(context).dividerColor,
                          )),
                ],
              ),
            );
          }
        }),
      );
}
