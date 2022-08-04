import 'package:auto/assets/colors/color.dart';
import 'package:auto/features/main/presentation/widgets/build_container.dart';
import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentIndex;

  const AnimatedBar(
      {required this.animationController,
      required this.currentIndex,
      required this.position,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.5),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                BuildContainer(
                    color: position < currentIndex
                        ?white
                        :white.withOpacity(.3),
                    width: double.infinity),
                if (position == currentIndex)
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) => BuildContainer(
                      width: constraints.maxWidth * animationController.value,
                      color: white
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}
