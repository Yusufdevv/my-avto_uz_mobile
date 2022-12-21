import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/common/widgets/w_app_bar.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_textfield.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/rent/domain/entities/rent_list_entity.dart';
import 'package:auto/features/rent/presentation/pages/confimation/presentation/pages/confirmation_screen.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  final RentListEntity rentListEntity;
  final String toDate;
  final String fromDate;
  const MapScreen(
      {required this.fromDate,
      required this.toDate,
      required this.rentListEntity,
      Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TextEditingController getController;
  late TextEditingController returnController;
  @override
  void initState() {
    getController = TextEditingController();
    returnController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    getController.dispose();
    returnController.dispose();
    super.dispose();
  }

  bool focused = false;
  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: WAppBar(
            title: LocaleKeys.receipt_and_return.tr(),
            centerTitle: false,
          ),
          body: Stack(
            children: [
              YandexMap(
                
                onMapTap: (argument) {
                  print(' =====  ${argument.latitude.toString()}  =====');
                  print(' =====  ${argument.longitude.toString()}  =====');
                },
                onMapCreated: (controller) {
                  controller.getPoint(const ScreenPoint(x: 0.8, y: 0.8));
                },
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<ThemedColors>()!
                            .whiteToDark,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context)
                                .extension<ThemedColors>()!
                                .silver50ToNightRider),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context)
                              .extension<ThemedColors>()!
                              .whiteSmokeToBlack,
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8)),
                              child: WTextField(
                                controller: getController,
                                onChanged: (value) {
                                  print('first =====  $value  =====');
                                  setState(() {});
                                },
                                fillColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                                focusColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                                borderColor: Colors.transparent,
                                disabledBorderColor: Colors.transparent,
                                enabledBorderColor: Colors.transparent,
                                disabledColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                                hintText: LocaleKeys.getting_here.tr(),
                                prefix: Padding(
                                  padding: getController.text.isNotEmpty
                                      ? const EdgeInsets.all(10)
                                      : const EdgeInsets.all(6),
                                  child: SvgPicture.asset(
                                      getController.text.isNotEmpty
                                          ? AppIcons.searchOrange
                                          : AppIcons.circle),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Theme.of(context).dividerColor,
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(8)),
                              child: WTextField(
                                hintText: LocaleKeys.return_here.tr(),
                                controller: returnController,
                                prefix: Padding(
                                  padding: returnController.text.isNotEmpty
                                      ? const EdgeInsets.all(10)
                                      : const EdgeInsets.all(6),
                                  child: SvgPicture.asset(
                                      returnController.text.isNotEmpty
                                          ? AppIcons.searchOrange
                                          : AppIcons.circle),
                                ),
                                onChanged: (value) {
                                  print('=====  $value  =====');
                                  setState(() {});
                                },
                                fillColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                                borderColor: Colors.transparent,
                                focusColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                                disabledBorderColor: Colors.transparent,
                                enabledBorderColor: Colors.transparent,
                                disabledColor: Theme.of(context)
                                    .extension<ThemedColors>()!
                                    .whiteSmokeToBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    WButton(
                      onTap: () => Navigator.push(
                        context,
                        fade(
                          page: ConfirmationScreen(
                            receivingAddress: 'receiving address',
                            returningAddress: 'returning address',
                            fromDate: widget.fromDate,
                            toDate: widget.toDate,
                            rentListEntity: widget.rentListEntity,
                          ),
                        ),
                      ),
                      text: LocaleKeys.further.tr(),
                      shadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 20,
                            color: orange.withOpacity(0.2)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
