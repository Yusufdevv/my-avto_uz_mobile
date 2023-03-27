import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/dealers/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MapControllerButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final VoidCallback onCurrentLocationTap;

  const MapControllerButtons({
    required this.onCurrentLocationTap,
    required this.onMinusTap,
    required this.onPlusTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          WButton(
            onTap: onPlusTap,
            height: 36,
            width: 36,
            borderRadius: 8,
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            border: Border.all(
              color: dividerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AppIcons.plus,
              color:
                  Theme.of(context).extension<ThemedColors>()!.dolphinToWhite,
            ),
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: onMinusTap,
            height: 36,
            width: 36,
            color: Theme.of(context).extension<ThemedColors>()!.whiteToDark,
            borderRadius: 8,
            border: Border.all(
              color: dividerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AppIcons.minus,
              color:
                  Theme.of(context).extension<ThemedColors>()!.dolphinToWhite,
            ),
          ),
          const SizedBox(height: 28),
          CurrentLocationButton(onCurrentLocationTap: onCurrentLocationTap)
        ],
      );
}

class CurrentLocationButton extends StatelessWidget {
  final VoidCallback onCurrentLocationTap;
  const CurrentLocationButton({
    required this.onCurrentLocationTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
        builder: (context, state) => WScaleAnimation(
          isDisabled: state.getCurrentLocationStatus.isSubmissionInProgress,
          onTap: onCurrentLocationTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(8),
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: state.getCurrentLocationStatus.isSubmissionInProgress
                  ? Theme.of(context).extension<ThemedColors>()!.whiteToDark
                  : Theme.of(context).extension<ThemedColors>()!.whiteToDark,
              border: Border.all(
                color: Theme.of(context)
                    .extension<ThemedColors>()!
                    .solitudeToNightRider,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: state.getCurrentLocationStatus.isSubmissionInProgress
                  ? const AnimatedLocationIcon()
                  : SvgPicture.asset(AppIcons.currentLocation,
                      color: Theme.of(context)
                          .extension<ThemedColors>()!
                          .dolphinToWhite),
            ),
          ),
        ),
      );
}

class AnimatedLocationIcon extends StatefulWidget {
  const AnimatedLocationIcon({Key? key}) : super(key: key);

  @override
  State<AnimatedLocationIcon> createState() => _AnimatedLocationIconState();
}

class _AnimatedLocationIconState extends State<AnimatedLocationIcon>
    with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    _iconAnimation =
        Tween<double>(begin: 1, end: 2.3).animate(_iconAnimationController);
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          ScaleTransition(
            scale: _iconAnimation,
            child: Container(
              height: 6,
              width: 6,
              decoration:
                  const BoxDecoration(color: green, shape: BoxShape.circle),
            ),
          ),
          SvgPicture.asset(AppIcons.currentLocation,
              color:
                  Theme.of(context).extension<ThemedColors>()!.dolphinToWhite),
        ],
      );
}
