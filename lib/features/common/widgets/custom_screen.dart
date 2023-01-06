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
  Widget build(BuildContext context) =>
      BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
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
                    color: state.isSucces
                        ? const Color(0xFFECF8F3)
                        : const Color(0xffFAEEEE),
                    border: Border.all(color: state.isSucces ? green : red),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: state.isSucces ? green : red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppIcons.cancel),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          state.message,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: secondary),
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: dark.withOpacity(0.24),
                        ),
                      ),
                      const SizedBox(width: 8),
                      WScaleAnimation(
                        onTap: () {
                          context.read<ShowPopUpBloc>().add(HidePopUp());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            AppIcons.close,
                            color: black,
                          ),
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
