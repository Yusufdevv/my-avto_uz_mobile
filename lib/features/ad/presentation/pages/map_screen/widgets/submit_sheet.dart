// ignore_for_file: unused_import

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
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

  const PostingAdSubmitBox({
    required this.onTab,
    super.key,
  }) : super();

  @override
  Widget build(BuildContext context) => BlocBuilder<MapBloc, MapState>(
        builder: (context, state) => Container(
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
            color: Theme.of(context).extension<ThemedColors>()!.scaffoldBackground,
            // color: Colors.teal,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MapPointName(
                  isWaiting: state.getPointNameStatus.isSubmissionInProgress,
                  name: state.address),
              const SizedBox(height: 24),
              WButton(
                isLoading:
                    state.getCurrentLocationStatus.isSubmissionInProgress ||
                        state.getPointNameStatus.isSubmissionInProgress,
                isDisabled: state.address?.isEmpty ?? true,
                onTap: (state.address?.isNotEmpty ?? false)
                    ? onTab
                    : () {
                        Navigator.of(context).pop();
                      },
                color: orange,
                disabledColor: disabledButton,
                text: LocaleKeys.confirm.tr(),
              ),
            ],
          ),
        ),
      );
}
