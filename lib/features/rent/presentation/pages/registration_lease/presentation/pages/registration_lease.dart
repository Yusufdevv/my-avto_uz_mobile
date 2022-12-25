import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/rent/domain/entities/register_lease_entity.dart';
import 'package:auto/features/rent/domain/usecases/register_lease_usecase.dart';
import 'package:auto/features/rent/presentation/bloc/registr_lease/register_lease_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrationLeaseScreen extends StatefulWidget {
  final RegisterLeaseEntity lease;
  const RegistrationLeaseScreen({required this.lease, Key? key})
      : super(key: key);

  @override
  State<RegistrationLeaseScreen> createState() =>
      _RegistrationLeaseScreenState();
}

class _RegistrationLeaseScreenState extends State<RegistrationLeaseScreen> {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  late RegisterLeaseBloc registerLeaseBloc;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  @override
  void initState() {
    phoneController = TextEditingController();
    nameController = TextEditingController();

    registerLeaseBloc = RegisterLeaseBloc(useCase: RegisterLeaseUseCase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScreen(
        child: Scaffold(
          appBar: WAppBar(title: LocaleKeys.rent_form.tr(), centerTitle: false),
          body: BlocProvider.value(
            value: registerLeaseBloc,
            child: BlocConsumer<RegisterLeaseBloc, RegisterLeaseState>(
              listener: (context, state) {
                if (state.status == FormzStatus.submissionSuccess) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
                if (state.status == FormzStatus.submissionFailure) {
                  context
                      .read<ShowPopUpBloc>()
                      .add(ShowPopUp(message: state.errorMessage, isSucces: false));
                }
              },
              builder: (context, state) {
                if (state.status == FormzStatus.submissionInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      WTextField(
                        controller: nameController,
                        onChanged: (value) {},
                        title: LocaleKeys.name.tr(),
                        hintText: LocaleKeys.add_name.tr(),
                        borderRadius: 8,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      WTextField(
                        keyBoardType: TextInputType.phone,
                        controller: phoneController,
                        onChanged: (value) {},
                        title: LocaleKeys.tel_number.tr(),
                        prefix: Padding(
                          padding: const EdgeInsets.only(top: 13, left: 10),
                          child: Text(
                            '+998',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        hintText: ' _ _  _ _ _  _ _  _ _',
                        borderRadius: 8,
                        textInputFormatters: [phoneFormatter],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: WButton(
            height: 44,
            onTap: () => registerLeaseBloc.add(RegisterLeaseEvent(
                lease: widget.lease.copyWith(
                    userName: nameController.text,
                    phoneNumber: phoneController.text))),
            margin: EdgeInsets.fromLTRB(
                16, 0, 16, MediaQuery.of(context).padding.bottom + 16),
            text: LocaleKeys.submit_applic.tr(),
            shadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  color: orange.withOpacity(0.2)),
            ],
          ),
        ),
      );
}
