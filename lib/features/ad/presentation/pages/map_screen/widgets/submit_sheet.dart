import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/map/map_bloc.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/map_point_name.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/widgets/point_name_shimmer.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class PostingAdSubmitBox extends StatelessWidget {
  final VoidCallback onTab;
  final String? address;

  const PostingAdSubmitBox({
    required this.onTab,
    this.address,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -8),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.05)),
            BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 24,
                spreadRadius: 0,
                color: profileContainers.withOpacity(.08))
          ],
          color: white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MapPointName(
                isWaiting: context.watch<MapBloc>().state.status ==
                    FormzStatus.submissionInProgress,
                name: context.watch<MapBloc>().state.address),
            const SizedBox(height: 24),
            WButton(
              isDisabled: address?.isEmpty ?? true,
              onTap: (address?.isNotEmpty ?? false) ? onTab : () {},
              color: orange,
              text: LocaleKeys.confirm.tr(),
            ),
          ],
        ),
      );
}
