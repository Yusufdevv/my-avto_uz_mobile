import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/add_image_instructions/add_image_instructions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepBoxOfPhotoInstruction extends StatelessWidget {
  const StepBoxOfPhotoInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<PhotoInstructionBloc, PhotoInstructionState>(
        listener: (context, state) {
          state.scrollController.animateTo(
            state.step * 32,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        builder: (context, state) => AnimatedContainer(
          height: 64,
          width: MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 300),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 160),
            controller: state.scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final selected = index == state.step;
              return GestureDetector(
                onTap: () => context
                    .read<PhotoInstructionBloc>()
                    .add(PhotoInstructionChangeStepEvent(step: index)),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 28,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${index + 1}',
                        style: selected
                            ? Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                )
                            : Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: Theme.of(context)
                                      .extension<ThemedColors>()!
                                      .ghostToGreySuit,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: 4),
                      if (selected) ...{
                        Container(
                            height: 2,
                            decoration: const BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.elliptical(3, 2))))
                      }
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 4),
            itemCount: state.instructions.length,
          ),
        ),
      );
}
