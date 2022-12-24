import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/themed_icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/rent/domain/entities/additional_services_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdditionalServices extends StatefulWidget {
  final List<AdditionalServiceEntity> services;
  final Function(int, bool) onChanged;
  const AdditionalServices({
    required this.onChanged,
    required this.services,
    Key? key,
  }) : super(key: key);

  @override
  State<AdditionalServices> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServices> {
  @override
  Widget build(BuildContext context) => Container(
        width: 375,
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
              itemCount: widget.services.length,
              itemBuilder: (context, index) => WScaleAnimation(
                onTap: () {
                  widget.onChanged(index, !widget.services[index].isSelected);
                },
                child: Row(
                  children: [
                    Text(
                      widget.services[index].name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: greyText,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${((double.tryParse(widget.services[index].price) ?? 0) / 1000).floor()} тыс./сутки',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const Spacer(),
                    Container(
                      height: 20,
                      width: 20,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: widget.services[index].isSelected
                                  ? purple
                                  : dividerColor),
                          borderRadius: BorderRadius.circular(4)),
                      child: SvgPicture.asset(
                        Theme.of(context).extension<ThemedIcons>()!.check,
                        fit: BoxFit.contain,
                        color: widget.services[index].isSelected
                            ? purple
                            : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ],
        ),
      );
}
