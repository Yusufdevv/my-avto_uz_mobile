import 'dart:async';
import 'dart:developer';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/pages/contact/contact_screen.dart';
import 'package:auto/features/ad/presentation/pages/equipment/equipment_screen.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/map_screen_posting_ad.dart';
import 'package:auto/features/ad/presentation/pages/price/price_screen.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/edit_ad/presentation/bloc/edit_ad/edit_ad_bloc.dart';
import 'package:auto/features/edit_ad/presentation/pages/add_photo/add_photo_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/damage/damage_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/description/description_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/inspection_place/inspection_place_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/mileage/mileage_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/preview/preview_screen.dart';
import 'package:auto/features/edit_ad/presentation/pages/pts/pts_screen.dart';
import 'package:auto/features/edit_ad/presentation/widgets/edit_ad_appbar.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class EditAdScreen extends StatefulWidget {
  final int announcementId;

  const EditAdScreen({
    required this.announcementId,
    Key? key,
  }) : super(key: key);

  @override
  State<EditAdScreen> createState() => _EditAdScreenState();
}

class _EditAdScreenState extends State<EditAdScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late EditAdBloc editAdBloc;
  late GlobalKey globalKey;
  int currentTabIndex = 0;
  final int tabLength = 10;

  @override
  void initState() {
    globalKey = GlobalKey();
    editAdBloc = EditAdBloc();
    editAdBloc.add(EditAdGetAnnouncementEvent(id: widget.announcementId));
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  List<String> tabs = [
    LocaleKeys.photographation.tr(),
    LocaleKeys.pts.tr(),
    LocaleKeys.description.tr(),
    LocaleKeys.complectation.tr(),
    LocaleKeys.body_state.tr(),
    LocaleKeys.contact_data.tr(),
    LocaleKeys.place_of_inspection.tr(),
    LocaleKeys.price.tr(),
    LocaleKeys.Mileage.tr(),
    LocaleKeys.preispection.tr(),
  ];

  void hidePopUp() {
    context.read<ShowPopUpBloc>().add(HidePopUp());
  }

  bool isDistrictsGotten = false;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          hidePopUp();
          if (currentTabIndex != 0) {
            --currentTabIndex;
            editAdBloc.add(EditAdAddEventForEveryPage(page: currentTabIndex));
            await pageController.animateToPage(currentTabIndex,
                duration: const Duration(milliseconds: 150),
                curve: Curves.linear);
            setState(() {});
          } else {
            Navigator.pop(context);
          }
          return Future(() => false);
        },
        child: KeyboardDismisser(
          child: CustomScreen(
            child: AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor:
                    Theme.of(context).extension<ThemedColors>()!.whiteToDark,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              ),
              child: MultiBlocProvider(
                providers: [BlocProvider(create: (c) => editAdBloc)],
                child: BlocConsumer<EditAdBloc, EditAdState>(
                    listener: (context, state) async {
                  if (state.region != null &&
                      state.districts.isEmpty &&
                      !isDistrictsGotten) {
                    isDistrictsGotten = true;
                    editAdBloc.add(
                        EditAdGetDistritsEvent(regionId: state.region!.id));
                  }
                  if (state.createStatus == FormzStatus.submissionSuccess) {
                    FocusScope.of(context).unfocus();
                    context.read<ShowPopUpBloc>().add(
                          ShowPopUp(
                            message:
                                LocaleKeys.your_ad_edited_successfully.tr(),
                            status: PopStatus.success,
                            dismissible: false,
                          ),
                        );
                    Navigator.pop(context, true);
                    return;
                  }

                  if (state.toastMessage != null &&
                      state.toastMessage!.isNotEmpty) {
                    context.read<ShowPopUpBloc>().add(
                          ShowPopUp(
                            message: state.toastMessage!,
                            status: state.popStatus,
                            dismissible: false,
                          ),
                        );
                    editAdBloc.add(EditAdShowToastEvent(
                        message: '', status: PopStatus.success));
                  }
                }, builder: (context, state) {
                  if (state.getAnnouncementToEditStatus ==
                      FormzStatus.submissionFailure) {
                    return Scaffold(
                        body: Center(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.toastMessage ??
                                            'something went wrong',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(fontSize: 24),
                                      ),
                                      const SizedBox(height: 20),
                                      WButton(
                                          text: 'OK',
                                          onTap: () {
                                            Navigator.pop(context);
                                          })
                                    ]))));
                  }
                  return Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(54),
                      child: EditAdAppBar(
                        currentTabIndex: currentTabIndex,
                        tabLength: tabLength,
                        onTapBack: () {
                          hidePopUp();
                          if (currentTabIndex != 0) {
                            --currentTabIndex;
                            editAdBloc.add(EditAdAddEventForEveryPage(
                                page: currentTabIndex));
                            pageController.animateToPage(currentTabIndex,
                                duration: const Duration(milliseconds: 150),
                                curve: Curves.linear);
                            setState(() {});
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        onTapCancel: () {
                          Navigator.pop(context);
                        },
                        title: currentTabIndex == 0
                            ? LocaleKeys.get_back.tr()
                            : tabs[currentTabIndex - 1],
                      ),
                    ),
                    body: Stack(
                      children: [
                        PageView(
                          controller: pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // 0
                            const AddPhotoScreen(),
                            // 1
                            const PtsScreen(),
                            // 2
                            DescriptionScreen(
                                initialText: state.description ?? ''),
                            // 3
                            EquipmentScreen(
                              selectOptions: state.selectOptions,
                              onEquipmentOptionPressed: ({
                                required id,
                                required isAdd,
                                required type,
                                required itemName,
                                selectOption,
                              }) {
                                log('::::::::::  ON EQUIPMENT OPTION PRESSED: id: $id, isAdd: $isAdd, type: $type, itemName: $itemName, sectOPtion: $selectOption  ::::::::::');
                                context.read<EditAdBloc>().add(
                                    EditAdChangeOption(
                                        id: id,
                                        type: type,
                                        itemName: itemName,
                                        isAdd: isAdd,
                                        selectOption: selectOption));
                              },
                              isOptionSelected: state.isOptionSelected,
                              onEquipmentSelected: (equipment) {
                                context.read<EditAdBloc>().add(
                                      EditAdSelectEquipmentEvent(
                                          equipment: equipment),
                                    );
                              },
                              equipmentOptionsList: state.equipmentOptionsList,
                              equipments: state.equipments,
                              equipment: state.equipment,
                            ),
                            // 4
                            const DamageScreen(),
                            // 5
                            ContactScreen(
                              isContactsVerified: state.isContactsVerified,
                              isCallTimed: state.isCallTimed,
                              showOwnerContacts: state.showOwnerContacts,
                              isWaiting: state.status ==
                                  FormzStatus.submissionInProgress,
                              emailController: state.emailController,
                              nameController: state.nameController,
                              phoneController: state.phoneController,
                              callTimeFrom: state.callTimeFrom,
                              callTimeTo: state.callTimeTo,
                              formKey: state.contactsFormKey,
                              onSubmitPhonePressed: () {
                                editAdBloc.add(EditAdSendCodeEvent(
                                    phone: state.phoneController.text,
                                    onSuccess: (session) {
                                      showModalBottomSheet<dynamic>(
                                          useRootNavigator: true,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          context: context,
                                          builder: (context) =>
                                              SmsVerificationSheet(
                                                  session: session,
                                                  phoneNumber: state
                                                      .phoneController
                                                      .text)).then((value) {
                                        if (value is bool) {
                                          editAdBloc.add(
                                            EditAdChooseEvent(
                                              isContactsVerified: value,
                                              ownerEmail:
                                                  state.emailController.text,
                                              ownerName:
                                                  state.nameController.text,
                                              ownerPhone:
                                                  state.phoneController.text,
                                            ),
                                          );
                                        } else if (value is String) {
                                          editAdBloc.add(
                                            EditAdChooseEvent(
                                              isContactsVerified: false,
                                              ownerEmail:
                                                  state.emailController.text,
                                              ownerName:
                                                  state.nameController.text,
                                              ownerPhone:
                                                  state.phoneController.text,
                                            ),
                                          );
                                          context
                                              .read<ShowPopUpBloc>()
                                              .add(ShowPopUp(
                                                message: value.toString(),
                                                status: PopStatus.error,
                                              ));
                                        }
                                      });
                                    }));
                              },
                              onPhoneChanged: (value) {
                                final v =
                                    state.isContactsVerified ? false : null;
                                editAdBloc.add(
                                  EditAdChooseEvent(
                                      ownerName: value,
                                      isContactsVerified: v,
                                      showOwnerContacts: v),
                                );
                              },
                              onShowMyContactChanged: (v) {
                                editAdBloc
                                  ..add(EditAdClearControllersEvent())
                                  ..add(
                                    EditAdChooseEvent(
                                      showOwnerContacts: v,
                                      isContactsVerified: v,
                                    ),
                                  );
                              },
                              onEmailChanged: (value) {
                                editAdBloc
                                    .add(EditAdChooseEvent(ownerEmail: value));
                              },
                              onNameChanged: (value) {
                                final v =
                                    state.isContactsVerified ? false : null;
                                editAdBloc.add(EditAdChooseEvent(
                                  ownerName: value,
                                  showOwnerContacts: v,
                                ));
                              },
                              onGetUserDatas: () =>
                                  editAdBloc.add(EditAdGetUserDataEvent()),
                              onCallTimeChanged: ({
                                required isCallTimed,
                                callTimeFrom,
                                callTimeTo,
                              }) {
                                editAdBloc.add(
                                  EditAdChooseEvent(
                                    callTimeFrom: callTimeFrom,
                                    callTimeTo: callTimeTo,
                                    isCallTimed: isCallTimed,
                                  ),
                                );
                              },
                            ),
                            // 6
                            InspectionPlaceScreen(
                              onToMapPressed: () {
                                hidePopUp();
                                Navigator.push(
                                  context,
                                  fade(page: const MapScreenPostingAd()),
                                ).then(
                                  (latLongZoom) {
                                    hidePopUp();
                                    if (latLongZoom is List<double>) {
                                      editAdBloc.add(
                                        EditAdGetMapScreenShotEvent(
                                          lat: latLongZoom[0],
                                          long: latLongZoom[1],
                                          zoomLevel: latLongZoom[2],
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                            // 7
                            PriceScreen(
                                onPriceChanged: (price) => editAdBloc
                                    .add(EditAdChooseEvent(price: price)),
                                onConditionChanged: (condition) => editAdBloc
                                    .add(EditAdOnRentWithPurchaseEvent(
                                        condition: condition)),
                                onSwitchChanged: (v) => editAdBloc
                                    .add(EditAdChooseEvent(rentToBuy: v)),
                                onCurrencyChanged: (v) => editAdBloc
                                    .add(EditAdChooseEvent(currency: v)),
                                rentToBuy: state.rentToBuy ?? false,
                                price: state.price ?? '',
                                minimumPrice: state.minimumPrice,
                                currency: state.currency,
                                initialPrice: state.price ?? '',
                                conditions: state
                                    .rentWithPurchaseConditions.entries
                                    .map((e) => e.value)
                                    .toList()),
                            // 8
                            MileageScreen(
                                onImageChange: (image) {
                                  editAdBloc.add(
                                      EditAdChooseEvent(milageImage: image));
                                },
                                initialMileageImage: state.milageImage,
                                initialMileage: state.mileage ?? ''),

                            // 9
                            const PreviewScreen(),
                          ],
                        ),
                        if (currentTabIndex < tabLength - 1) ...{
                          Positioned(
                            bottom: MediaQuery.of(context).padding.bottom + 16,
                            right: 16,
                            left: 16,
                            child: WButton(
                              disabledColor: disabledButton,
                              isDisabled: state.buttonStatus(currentTabIndex),
                              onTap: () {
                                hidePopUp();
                                FocusScope.of(context).unfocus();
                                if (currentTabIndex < tabLength - 1) {
                                  currentTabIndex++;
                                  editAdBloc.add(EditAdAddEventForEveryPage(
                                      page: currentTabIndex));
                                  pageController.animateToPage(currentTabIndex,
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                  setState(() {});
                                }
                              },
                              text: LocaleKeys.further.tr(),
                              shadow: state.buttonStatus(currentTabIndex)
                                  ? null
                                  : [
                                      BoxShadow(
                                          offset: const Offset(0, 4),
                                          blurRadius: 20,
                                          color: orange.withOpacity(0.2)),
                                    ],
                            ),
                          ),
                        } else ...{
                          Positioned(
                            bottom: MediaQuery.of(context).padding.bottom + 16,
                            right: 16,
                            left: 16,
                            child: WButton(
                              isDisabled: state.createStatus ==
                                  FormzStatus.submissionSuccess,
                              isLoading: state.createStatus ==
                                  FormzStatus.submissionInProgress,
                              onTap: () async {
                                hidePopUp();
                                editAdBloc.add(
                                    EditAdSubmitEvent(widget.announcementId));
                              },
                              text: LocaleKeys.confirmation.tr(),
                              shadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 20,
                                  color: orange.withOpacity(0.2),
                                ),
                              ],
                            ),
                          ),
                        }
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
}
