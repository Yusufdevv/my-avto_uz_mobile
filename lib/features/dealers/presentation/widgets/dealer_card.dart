import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/pages/seller.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DealerCard extends StatefulWidget {
  final String dealerType;
  final String dealerName;
  final String dealerImageUrl;
  final int quantityOfCars;
  final String workingHours;
  final String contractCode;
  final String contractNumber;
  const DealerCard(
      {required this.dealerType,
      required this.dealerName,
      required this.dealerImageUrl,
      required this.quantityOfCars,
      required this.workingHours,
      required this.contractCode,
      required this.contractNumber,
      Key? key})
      : super(key: key);

  @override
  State<DealerCard> createState() => _DealerCardState();
}

class _DealerCardState extends State<DealerCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              fade(
                page: Seller(
                  dealerType: widget.dealerType,
                  dealerName: widget.dealerName,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).extension<ThemedColors>()!.whiteToNero,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Theme.of(context)
                        .extension<ThemedColors>()!
                        .solitude2ToNightRider)),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: dividerColor)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: SvgPicture.asset(widget.dealerImageUrl)),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.dealerName.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.dealerType,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: purple),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.vehicleCar),
                    const SizedBox(width: 8),
                    Text('${widget.quantityOfCars} автомобиля',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.clock),
                    const SizedBox(width: 8),
                    Text('Каждый день, ${widget.workingHours}',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400))
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Контакты:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: warmerGrey),
                    )),
                    Text(
                      widget.contractCode,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 9),
                    WScaleAnimation(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Показать контакт',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
