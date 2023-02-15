import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/edit_ad/presentation/bloc/map/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class PostingAdMapControllerButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;

  const PostingAdMapControllerButtons({
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
            color: white,
            borderRadius: 8,
            border: Border.all(
              color: dividerColor,
            ),
            padding: const EdgeInsets.all(10),
            shadow: [
              BoxShadow(
                  offset:const  Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: profileContainers.withOpacity(.08))
            ],
            child: SvgPicture.asset(
              AppIcons.plus,
              height: 14,
              color: greyText,
            ),
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: onMinusTap,
            height: 36,
            width: 36,
            color: white,
            borderRadius: 8,
            border: Border.all(
              color: dividerColor,
            ),
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AppIcons.minus,
              color: greyText,
              height: 14,
            ),
          ),
          // const SizedBox(height: 28),
          // CurrentLocationButton(onCurrentLocationTap: onCurrentLocationTap)
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
  Widget build(BuildContext context) => BlocBuilder<MapBloc, MapState>(
        builder: (context, state) => WScaleAnimation(
          isDisabled: state.getCurrentLocationStatus.isSubmissionInProgress,
          onTap: onCurrentLocationTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: state.getCurrentLocationStatus.isSubmissionInProgress
                  ? white.withOpacity(0.7)
                  : white,
              border: Border.all(
                color: dividerColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: state.getCurrentLocationStatus.isSubmissionInProgress
                  ? const AnimatedLocationIcon()
                  : SvgPicture.asset(AppIcons.currentLocation),
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
          SvgPicture.asset(AppIcons.currentLocation),
        ],
      );
}
