import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/comparison/presentation/comparison_page.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChooseGenerationComparison extends StatefulWidget {
  final VoidCallback onTap;
  const ChooseGenerationComparison({Key? key, required this.onTap})
      : super(key: key);

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
                    title: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      behavior: HitTestBehavior.opaque,
                      child: SizedBox(
                        width: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, bottom: 16, right: 4),
                              child: SvgPicture.asset(AppIcons.chevronLeft),
                            ),
                            Text(
                              'Модель автомобиля',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset(AppIcons.close),
                        ),
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 16),
                      child: Text(
                        'Выберите поколение',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: dark,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: WTextField(
                      disabledColor: white,
                      focusColor: white,
                      margin: const EdgeInsets.all(16),
                      onChanged: (value) {},
                      borderRadius: 12,
                      hasSearch: true,
                      hintText: 'Поиск',
                      height: 40,
                      hasClearButton: true,
                    ),
                  ),
                ],
                body: Container(),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: WButton(
                  onTap: widget.onTap,
                  text: 'Далее',
                  shadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: orange.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
