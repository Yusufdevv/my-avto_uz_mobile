import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/assets/themes/theme_extensions/w_textfield_style.dart';
import 'package:auto/features/common/widgets/stroke_paint.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class WTextField extends StatefulWidget {
  final bool? hasSearch;
  final bool? hasBorderColor;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validate;
  final Function(String)? onFieldSubmitted;
  final bool? hasClearButton;
  final String title;
  final Color? disabledBorderColor;
  final double borderRadius;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? prefixStyle;
  final bool? filled;
  final TextStyle? hintTextStyle;
  final String prefixText;
  final bool? hideCounterText;
  final Widget? prefix;
  final EdgeInsets? prefixPadding;
  final double? width;
  final double? height;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final bool? isObscure;
  final Widget? suffix;
  final String? suffixIcon;
  final EdgeInsets? suffixPadding;
  final TextCapitalization textCapitalization;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final EdgeInsets? contentPadding;
  final bool hasError;
  final double sizeBetweenFieldTitle;
  final Color? errorColor;
  final Color? fillColor;
  final Color? cursorColor;
  final EdgeInsets? margin;
  final VoidCallback? onEyeTap;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function? onObscure;
  final Function? onTapSuffix;
  final Function()? onEditCompleted;
  final Function()? onTap;
  final Function()? onClear;
  final bool autoFocus;
  final Color? disabledColor;
  final double? suffixRightPosition;
  final double? suffixSize;
  final int? maxLines;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusColor;
  final BorderRadius? detailedBorderRadius;
  final bool readOnly;
  final Widget? suffixTitleWidget;
  final String hintNextToTitle;
  final BoxConstraints? prefixConstraints;

  const WTextField(
      {required this.onChanged,
      this.controller,
      this.hasBorderColor,
      this.readOnly = false,
      this.disabledColor,
      this.validate,
      this.autoValidateMode,
      this.hideCounterText,
      this.autoFocus = false,
      this.borderRadius = 0,
      this.prefixStyle,
      this.prefixConstraints,
      this.disabledBorderColor,
      this.hasClearButton,
      this.textAlign = TextAlign.start,
      this.width,
      this.fillColor,
      this.title = '',
      this.titleTextStyle,
      this.textStyle,
      this.hintText,
      this.hintTextStyle,
      this.filled = true,
      this.contentPadding = const EdgeInsets.all(12),
      this.prefixText = '',
      this.prefix,
      this.prefixPadding = const EdgeInsets.all(2),
      this.suffix,
      this.suffixIcon,
      this.suffixPadding = const EdgeInsets.all(8),
      this.isObscure,
      this.onEyeTap,
      this.margin,
      this.sizeBetweenFieldTitle = 8,
      this.errorColor,
      this.hasError = false,
      this.textInputFormatters,
      this.textCapitalization = TextCapitalization.none,
      this.keyBoardType,
      this.maxLength,
      this.focusNode,
      this.textInputAction = TextInputAction.done,
      this.height,
      this.onObscure,
      this.onTapSuffix,
      Key? key,
      this.onEditCompleted,
      this.onTap,
      this.onClear,
      this.suffixRightPosition,
      this.suffixSize,
      this.maxLines = 1,
      this.borderColor,
      this.enabledBorderColor,
      this.detailedBorderRadius,
      this.focusColor,
      this.suffixTitleWidget,
      this.hintNextToTitle = '',
      this.hasSearch,
      this.cursorColor,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  _WTextFieldState createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField>
    with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  bool isObscure = false;
  bool showStroke = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
    if (widget.isObscure != null) {
      isObscure = widget.isObscure!;
    }
    focusNode = FocusNode();

    focusNode.addListener(
      () => setState(() {
        focused = !focused;
      }),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: widget.titleTextStyle ??
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Text(
                        ' ${widget.hintNextToTitle}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  if (widget.suffixTitleWidget != null)
                    widget.suffixTitleWidget!,
                ],
              )
            else
              const SizedBox(),
            SizedBox(
              height:
                  widget.title.isNotEmpty ? widget.sizeBetweenFieldTitle : null,
            ),
            Container(
              // height: widget.height ?? 44,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius:
                    widget.detailedBorderRadius ?? BorderRadius.circular(6),
                color: Colors.transparent,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: widget.detailedBorderRadius ??
                        BorderRadius.circular(widget.borderRadius),
                    child: TextFormField(
                      autovalidateMode: widget.autoValidateMode,
                      validator: widget.validate,
                      maxLines: widget.maxLines,
                      onTap: widget.onTap,
                      readOnly: widget.readOnly,
                      textAlign: widget.textAlign,
                      inputFormatters: widget.textInputFormatters,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      obscureText: isObscure,
                      keyboardType: widget.keyBoardType,
                      maxLength: widget.maxLength,
                      controller: widget.controller,
                      autofocus: widget.autoFocus,
                      cursorColor: widget.cursorColor ??
                          Theme.of(context).colorScheme.surface,
                      cursorHeight: 24,
                      onEditingComplete: widget.onEditCompleted,
                      onChanged: (s) {
                        setState(() => hasText = s.isNotEmpty);
                        widget.onChanged(s);
                      },
                      onFieldSubmitted: widget.onFieldSubmitted ?? (value) {},
                      focusNode: widget.focusNode ?? focusNode,
                      style: widget.textStyle ??
                          Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        suffix: widget.suffix != null
                            ? SizedBox(width: widget.suffixSize)
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: widget.detailedBorderRadius ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasError
                                ? Theme.of(context).colorScheme.error
                                : widget.enabledBorderColor ?? red,
                          ),
                        ),
                        counterText: widget.hideCounterText != null &&
                                widget.hideCounterText!
                            ? ''
                            : null,
                        hintText: widget.hintText,
                        hintStyle: widget.hintTextStyle ??
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w400),
                        filled: widget.filled,
                        prefixIconConstraints: widget.prefixConstraints,
                        prefixIcon:
                            widget.hasSearch != null && widget.hasSearch!
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: SvgPicture.asset(
                                      AppIcons.search,
                                    ),
                                  )
                                : widget.prefix,
                        fillColor: focused
                            ? widget.focusColor
                            : widget.disabledColor != null
                                ? widget.controller != null &&
                                        widget.controller!.text.isNotEmpty
                                    ? widget.fillColor ??
                                        Theme.of(context)
                                            .extension<WTextFieldStyle>()!
                                            .fillColor
                                    : widget.disabledColor
                                : widget.fillColor,
                        contentPadding: widget.contentPadding,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: widget.detailedBorderRadius ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.hasBorderColor != null &&
                                      !widget.hasBorderColor!
                                  ? Theme.of(context)
                                      .extension<WTextFieldStyle>()!
                                      .fillColor
                                  : widget.hasError
                                      ? Theme.of(context).colorScheme.error
                                      : widget.disabledBorderColor ??
                                          widget.borderColor ??
                                          Theme.of(context)
                                              .extension<WTextFieldStyle>()!
                                              .borderColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: widget.detailedBorderRadius ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.hasBorderColor != null &&
                                      !widget.hasBorderColor!
                                  ? Theme.of(context)
                                      .extension<WTextFieldStyle>()!
                                      .borderColor
                                  : widget.hasError
                                      ? Theme.of(context).colorScheme.error
                                      : widget.disabledBorderColor ??
                                          widget.enabledBorderColor ??
                                          Theme.of(context)
                                              .extension<WTextFieldStyle>()!
                                              .borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: widget.detailedBorderRadius ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Theme.of(context)
                                    .extension<WTextFieldStyle>()!
                                    .borderColor
                                : widget.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : widget.borderColor ??
                                        Theme.of(context)
                                            .extension<WTextFieldStyle>()!
                                            .borderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.prefixText.isNotEmpty)
                    Positioned(
                      top: 11,
                      left: 12,
                      child: Padding(
                        padding: widget.prefixPadding ?? EdgeInsets.zero,
                        child: Text(
                          widget.prefixText,
                          style: widget.prefixStyle ??
                              Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 15),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: widget.suffixRightPosition ?? 0,
                    child: widget.hasClearButton != null &&
                            widget.hasClearButton!
                        ? widget.controller != null &&
                                widget.controller!.text.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  if (widget.controller != null) {
                                    widget.controller?.clear();
                                    setState(() {});
                                  }
                                  if (widget.onClear != null) {
                                    widget.onClear!();
                                  }
                                },
                                behavior: HitTestBehavior.opaque,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                      height: 24,
                                      width: 24,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .extension<ThemedColors>()!
                                              .whiteSmoke78ToWhiteSmoke12),
                                      child: SvgPicture.asset(AppIcons.close)),
                                ),
                              )
                            : const SizedBox()
                        : Padding(
                            padding:
                                widget.suffixPadding ?? const EdgeInsets.all(8),
                            child: widget.suffix ?? const SizedBox(),
                          ),
                  ),
                  Positioned(
                    // top: 0,
                    right: 8,
                    child: widget.isObscure == null
                        ? widget.suffixIcon != null
                            ? WScaleAnimation(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 6, 2, 6),
                                  child: SvgPicture.asset(
                                    widget.suffixIcon!,
                                  ),
                                ),
                              )
                            : const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                              if (showStroke) {
                                showStroke = false;
                                animationController.forward();
                              } else {
                                showStroke = true;
                                animationController.reverse();
                              }
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10),
                              // width: 24,
                              // height: 24,
                              child: Center(
                                child: AnimatedBuilder(
                                  animation: animationController,
                                  child: SvgPicture.asset(
                                    AppIcons.eye,
                                  ),
                                  builder: (context, child) => SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CustomPaint(
                                      foregroundPainter: StrokePaint(
                                          animationController.value),
                                      child: child,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
