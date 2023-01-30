import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/colors/light.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/core/singletons/storage.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: must_be_immutable
class PopularSearchesField extends StatefulWidget {
  PopularSearchesField({
    required this.title,
    required this.elements,
    required this.textController,
    required this.focusNode,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.hasClearButtonInTitle = false,
    this.hasClearTrailing = false,
    Key? key,
  }) : super(key: key);
  final bool hasClearButtonInTitle;
  final String title;
  FocusNode focusNode;
  final EdgeInsets titlePadding;
  final bool hasClearTrailing;
  List<String> elements;
  TextEditingController textController;
  @override
  State<PopularSearchesField> createState() => _PopularSearchesFieldState();
}

class _PopularSearchesFieldState extends State<PopularSearchesField> {
  @override
  Widget build(BuildContext context) => Visibility(
        visible: widget.elements.isNotEmpty,
        child: Column(
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
                          color: LightThemeColors.darkGreyToWhite
                        )
                  ),
                  if (widget.hasClearButtonInTitle)
                    WButton(
                      scaleValue: 0.95,
                      onTap: () {
                        setState(() {
                          widget.elements.clear();
                          StorageRepository.putList(
                              'last_searches', widget.elements);
                        });
                      },
                      height: 20,
                      width: 64,
                      color: transparentButton,
                      child: Text(
                        LocaleKeys.clear.tr(),
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 13,
                              color: blue
                            )
                      )
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
                  widget.textController.selection = TextSelection.fromPosition(
                      TextPosition(offset: widget.textController.text.length));
                  widget.focusNode.unfocus();
                  addSearchToStorage(widget.textController.text);
                  
                },
                color: white,
                borderRadius: 0,
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.elements[index],
                        style: Theme.of(context).textTheme.subtitle1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.hasClearTrailing)
                      GestureDetector(
                        onTap: () {
                          widget.elements.removeAt(index);
                          StorageRepository.putList(
                              'last_searches', widget.elements);
                          setState(() {});
                        }, behavior: HitTestBehavior.opaque,
                        child: SvgPicture.asset(AppIcons.close),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              ),
              separatorBuilder: (context, index) => const Divider(
                  color: transparentButton, height: 1, thickness: 1),
              itemCount: widget.elements.length,
            ),
          ],
        ),
      );
}
