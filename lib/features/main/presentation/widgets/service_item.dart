
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/main/domain/entities/service_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceItem extends StatelessWidget {
  final ServiceEntity serviceEntity;
  const ServiceItem({required this.serviceEntity,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WButton(
    onTap: serviceEntity.onTap,
    margin: const EdgeInsets.only(left: 16),
      color: Theme.of(context).extension<ThemedColors>()!.whiteLilacToWhiteLilac10,
      border: Border.all(
          width: 1,
          color: Theme.of(context).extension<ThemedColors>()!.solitudeBorderToSolitudeBorder10
      ),
      borderRadius: 12,
    padding: const EdgeInsets.all(12),
    child: Row(
      children: [
        SvgPicture.asset(serviceEntity.icon),
        const SizedBox(width: 8,),
        Text(serviceEntity.title, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12, fontWeight: FontWeight.w600),),
      ],
    ),
  );
}

