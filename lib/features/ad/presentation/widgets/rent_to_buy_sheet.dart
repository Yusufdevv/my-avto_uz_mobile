import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/formatters.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/presentation/bloc/rent_to_buy/rent_to_buy_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:auto/utils/my_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RentToBuySheet extends StatefulWidget {
  final int idForNewCondition;
  final int price;
  final RentWithPurchaseEntity? entityForEdit;

  const RentToBuySheet(
      {required this.price,
      required this.idForNewCondition,
      this.entityForEdit,
      super.key});

  @override
  State<RentToBuySheet> createState() => _RentToBuySheetState();
}

class _RentToBuySheetState extends State<RentToBuySheet> {
  late RentToBuyBloc rentToBuyBloc;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    rentToBuyBloc = RentToBuyBloc(widget.entityForEdit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: rentToBuyBloc,
        child: KeyboardDismisser(
          child: BlocBuilder<RentToBuyBloc, RentToBuyState>(
              builder: (context, state) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.only(
                      top: 20,
                      right: 16,
                      left: 16,
                      bottom: MediaQuery.of(context).padding.bottom + 20,
                    ),
                    margin: MediaQuery.of(context).viewInsets,
                    decoration:  BoxDecoration(
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .whiteToDark,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                '(${state.step}/3)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                state.title,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(null);
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Transform.scale(
                                  scale: .8,
                                  child: SvgPicture.asset(
                                    AppIcons.close,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 27),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 3 - 32),
                            child: TextFormField(
                              validator: (vv) {
                                final value = int.tryParse(
                                        vv?.replaceAll(' ', '') ?? '0') ??
                                    0;
                                switch (state.step) {
                                  case 1:
                                    {
                                      if (value >= widget.price) {
                                        return '${LocaleKeys.could_not_be.tr()}${widget.price}';
                                      }
                                    }
                                    break;
                                  case 2:
                                    {
                                      if (vv?.isEmpty ?? true) {
                                        return LocaleKeys.must_filled.tr();
                                      }
                                    }
                                    break;
                                  case 3:
                                    {
                                      if (!(value >= state.minimumSumma!)) {
                                        return '${LocaleKeys.must_be.tr()} >= ${state.minimumSumma}';
                                      }
                                    }
                                    break;
                                }
                                return null;
                              },
                              autofocus: true,
                              focusNode: state.focusNode,
                              maxLength: MyFunctions.getFormatCost(
                                          widget.price.toString())
                                      .length +
                                  1,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter()
                              ],
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              cursorColor: Theme.of(context)
                                  .extension<ThemedColors>()!
                                  .blackToWhite,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                              controller: state.controller,
                              decoration: InputDecoration(
                                counterText: '',
                                errorBorder: _border(),
                                enabledBorder: _border(),
                                focusedBorder: _border(),
                                disabledBorder: _border(),
                                focusedErrorBorder: _border(),
                              ),
                            ),
                          ),
                          if (state.step == 3) ...{
                            const SizedBox(height: 16),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: LocaleKeys
                                          .the_minimum_amount_must_be
                                          .tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 13,
                                          )),
                                  TextSpan(
                                      text:
                                          '  ≥ ${MyFunctions.getFormatCost('${state.minimumSumma}')}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)
                                ],
                              ),
                            ),
                          },
                          const SizedBox(height: 40),
                          OrangeButton(
                            shadowColor: orange.withOpacity(0.2),
                            color: orange,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (state.step < 3) {
                                  switch (state.step) {
                                    case 1:
                                      rentToBuyBloc.add(RentToBuyEvent(
                                          controller: TextEditingController(
                                              text: MyFunctions.getFormatCost(
                                                  '${(state.entityForEdit?.rentalPeriod ?? 0) > 0 ? (state.entityForEdit?.rentalPeriod ?? 0) : ''}')),
                                          title:
                                              '${LocaleKeys.rent_period.tr()} (${LocaleKeys.for_month.tr()})',
                                          step: state.step + 1,
                                          prepayment: int.tryParse(state
                                                  .controller.text
                                                  .replaceAll(' ', '')) ??
                                              0));
                                      break;
                                    case 2:
                                      {
                                        final prePayment =
                                            state.prepayment ?? 0;
                                        final rentalPeriod = int.tryParse(state
                                                .controller.text
                                                .replaceAll(' ', '')) ??
                                            0;
                                        final mini = widget.price > 0
                                            ? (widget.price - prePayment) ~/
                                                rentalPeriod
                                            : 0;
                                        rentToBuyBloc.add(RentToBuyEvent(
                                            controller: TextEditingController(
                                                text: MyFunctions.getFormatCost(
                                                    state.entityForEdit != null
                                                        ? '${state.entityForEdit!.monthlyPayment}'
                                                        : '')),
                                            rentalPeriod: int.tryParse(state
                                                    .controller.text
                                                    .replaceAll(' ', '')) ??
                                                0,
                                            title: LocaleKeys.monthly_pay.tr(),
                                            step: state.step + 1,
                                            minimumMonthlyPay: mini));
                                      }
                                      break;
                                    default:
                                  }
                                  return;
                                } else {
                                  Navigator.of(context).pop(
                                    RentWithPurchaseEntity(
                                        id: state.entityForEdit?.id ??
                                            widget.idForNewCondition,
                                        monthlyPayment: int.tryParse(state
                                                .controller.text
                                                .replaceAll(' ', '')) ??
                                            0,
                                        prepayment: state.prepayment!,
                                        rentalPeriod: state.rentalPeriod ?? 0),
                                  );
                                }
                              }
                            },
                            content: Text(
                              LocaleKeys.continuee.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      );

  UnderlineInputBorder _border() => UnderlineInputBorder(
      borderSide: BorderSide(
          color: Theme.of(context)
              .extension<ThemedColors>()!
              .mediumSlateBlueToWhite));
}
