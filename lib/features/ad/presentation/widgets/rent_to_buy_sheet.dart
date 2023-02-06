import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/formatters.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/presentation/bloc/rent_to_buy/rent_to_buy_bloc.dart';
import 'package:auto/features/car_single/presentation/widgets/orange_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class RentToBuySheet extends StatefulWidget {
  final int price;
  const RentToBuySheet({required this.price, super.key});

  @override
  State<RentToBuySheet> createState() => _RentToBuySheetState();
}

class _RentToBuySheetState extends State<RentToBuySheet> {
  late RentToBuyBloc rentToBuyBloc;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    rentToBuyBloc = RentToBuyBloc();
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
                      bottom: MediaQuery.of(context).padding.bottom + 42,
                    ),
                    margin: MediaQuery.of(context).viewInsets,
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
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
                                    .headline5!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                state.title,
                                style: Theme.of(context).textTheme.headline1,
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
                                      if (value > widget.price) {
                                        return 'Could not be > ${widget.price}';
                                      }
                                    }
                                    break;
                                  case 2:
                                    {
                                      if (vv?.isEmpty ?? true) {
                                        return 'Must filled';
                                      }
                                    }
                                    break;
                                  case 3:
                                    {
                                      if (!(value >= state.minimumSumma!)) {
                                        return 'Must be >= ${state.minimumSumma}';
                                      }
                                    }
                                    break;
                                }

                                return null;
                              },
                              autofocus: true,
                              focusNode: state.focusNode,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter()
                              ],
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              cursorColor: white,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                              controller: state.controller,
                              decoration: InputDecoration(
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
                                      text: 'Минимальная сумма должна быть',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                            fontSize: 13,
                                          )),
                                  TextSpan(
                                      text: '  ≥ ${state.minimumSumma}',
                                      style:
                                          Theme.of(context).textTheme.headline5)
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
                                          title: '',
                                              // '${LocaleKeys.rent_period.tr()} (${LocaleKeys.for_month.tr()})',
                                          step: state.step + 1,
                                          controller: TextEditingController(),
                                          prepayment: state.controller.text
                                              .replaceAll(' ', '')));
                                      break;
                                    case 2:
                                      {
                                        final prePayment = int.tryParse(
                                                state.prepayment ?? '0') ??
                                            0;
                                        final rentalPeriod = int.tryParse(state
                                                .controller.text
                                                .replaceAll(' ', '')) ??
                                            0;
                                        print(
                                            '=> => => =>     prepayment: $prePayment    <= <= <= <=');
                                        print(
                                            '=> => => =>     rental Period: $rentalPeriod    <= <= <= <=');
                                        print(
                                            '=> => => =>     widget price: ${widget.price}    <= <= <= <=');
                                        final mini = widget.price > 0
                                            ? (widget.price - prePayment) ~/
                                                rentalPeriod
                                            : 0;
                                        print(
                                            '=> => => =>     MINI: ${mini}    <= <= <= <=');
                                        rentToBuyBloc.add(RentToBuyEvent(
                                            rentalPeriod: state.controller.text
                                                .replaceAll(' ', ''),
                                            controller: TextEditingController(),
                                            title: 'Ежемесячная оплата',
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
                                        monthlyPayment: state.controller.text
                                            .replaceAll(' ', ''),
                                        prepayment: state.prepayment!,
                                        rentalPeriod:
                                            int.tryParse(state.rentalPeriod!) ??
                                                -1),
                                  );
                                }
                              }
                            },
                            content: Text(
                              LocaleKeys.continuee,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
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
