import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/w_keyboard_dissmisser.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
        builder: (context, state) => Material(
          child: Stack(
            children: [
              Positioned.fill(child: WKeyboardDismisser(child: child)),
              AnimatedPositioned(
                top: state.showPopUp
                    ? MediaQuery.of(context).padding.top + 12
                    : -(MediaQuery.of(context).padding.top + 12 + 56),
                left: 16,
                right: 16,
                duration: const Duration(milliseconds: 150),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: red,
                    border: Border.all(color: border),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppIcons.lock),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          state.message,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline3!.copyWith(color: secondary),
                        ),
                      ),
                      WScaleAnimation(
                        onTap: () {
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(AppIcons.close),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
