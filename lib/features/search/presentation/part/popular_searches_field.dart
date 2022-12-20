import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PopularSearchesField extends StatefulWidget {
  PopularSearchesField({
    required this.title,
    required this.elements,
    required this.textController,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.hasClearButtonInTitle = false,
    this.hasClearTrailing = false,
    Key? key,
  }) : super(key: key);
  final bool hasClearButtonInTitle;
  final String title;
  final EdgeInsets titlePadding;
  final bool hasClearTrailing;
  List<String> elements;
  TextEditingController textController;
  @override
  State<PopularSearchesField> createState() => _PopularSearchesFieldState();
}

class _PopularSearchesFieldState extends State<PopularSearchesField> {
  @override
  Widget build(BuildContext context) => widget.elements.isEmpty
      ? const SizedBox()
      : Column(
          children: [
            const SizedBox(height: 13),
            Padding(
              padding: widget.titlePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13,
                          color: LightThemeColors.darkGreyToWhite,
                        ),
                  ),
                  if (widget.hasClearButtonInTitle)
                    WButton(
                      onTap: () {
                        setState(() {
                          widget.elements.clear();
                        });
                      },
                      height: 17,
                      color: transparentButton,
                      child: Text(
                        'Очистить',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 13,
                              color: blue,
                            ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => WButton(
                onTap: () {
                  widget.textController.text = widget.elements[index];
                  setState(() {});
                },
                color: white,
                borderRadius: 0,
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.elements[index],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    if (widget.hasClearTrailing)
                      GestureDetector(
                        onTap: () {
                          widget.elements.removeAt(index);
                          setState(() {});
                        },
                        child: SvgPicture.asset(AppIcons.close),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
              separatorBuilder: (context, index) =>
                  const Divider(color: transparentButton, height: 1),
              itemCount: widget.elements.length,
            ),
          ],
        );
}
