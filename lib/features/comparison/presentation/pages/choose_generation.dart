import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseGenerationComparison extends StatefulWidget {
  const ChooseGenerationComparison({Key? key}) : super(key: key);

  @override
  State<ChooseGenerationComparison> createState() =>
      _ChooseGenerationComparisonState();
}

class _ChooseGenerationComparisonState
    extends State<ChooseGenerationComparison> {
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 16, right: 8),
                            child: SvgPicture.asset(AppIcons.chevronLeft),
                          ),
                        ),
                        Text(
                          'Выберите поколение',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: white,
                      child: WTextField(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 16),
                        onChanged: (value) {},
                        borderRadius: 12,
                        hasSearch: true,
                        hintText: 'Поиск',
                        height: 40,
                        hasClearButton: true,
                      ),
                    ),
                  ),
                ],
                body: body,
              ),
              Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: BlocBuilder<CarSelectorBloc, SelectedCarItems>(
                    builder: (context, state) => WButton(
                      onTap: state.selectedId == -1 ? () {} : widget.onTap,
                      text: 'Далее',
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: orange.withOpacity(0.2)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
}
