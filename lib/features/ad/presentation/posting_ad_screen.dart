import 'dart:async';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
import 'package:auto/features/ad/presentation/bloc/bloc/choose_make_anime_bloc.dart';
import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
import 'package:auto/features/ad/presentation/pages/add_photo/add_photo_screen.dart';
import 'package:auto/features/ad/presentation/pages/carcase/carcase_screen.dart';
import 'package:auto/features/ad/presentation/pages/choose_car_brand/choose_brand_screen.dart';
import 'package:auto/features/ad/presentation/pages/choose_model/choose_car_model.dart';
import 'package:auto/features/ad/presentation/pages/color/colors_screen.dart';
import 'package:auto/features/ad/presentation/pages/contact/contact_screen.dart';
import 'package:auto/features/ad/presentation/pages/damage/damage_screen.dart';
import 'package:auto/features/ad/presentation/pages/description/description_screen.dart';
import 'package:auto/features/ad/presentation/pages/drive_type/drive_type_screen.dart';
import 'package:auto/features/ad/presentation/pages/engine/engine_screen.dart';
import 'package:auto/features/ad/presentation/pages/equipment/equipment_screen.dart';
import 'package:auto/features/ad/presentation/pages/gear_box/gearbox_screen.dart';
import 'package:auto/features/ad/presentation/pages/generation/generation_screen.dart';
import 'package:auto/features/ad/presentation/pages/inspection_place/inspection_place_screen.dart';
import 'package:auto/features/ad/presentation/pages/map_screen/map_screen_posting_ad.dart';
import 'package:auto/features/ad/presentation/pages/mileage/mileage_screen.dart';
import 'package:auto/features/ad/presentation/pages/modification/modification_screen.dart';
import 'package:auto/features/ad/presentation/pages/preview/preview_screen.dart';
import 'package:auto/features/ad/presentation/pages/price/price_screen.dart';
import 'package:auto/features/ad/presentation/pages/pts/pts_screen.dart';
import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
import 'package:auto/features/common/widgets/custom_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PostingAdScreen extends StatefulWidget {
  const PostingAdScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostingAdScreen> createState() => _PostingAdScreenState();
}

class _PostingAdScreenState extends State<PostingAdScreen>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  late PostingAdBloc postingAdBloc;
  late ChooseMakeAnimeBloc animeBloc;
  late GlobalKey globalKey;

  final ValueNotifier<int> currentTabNotifier = ValueNotifier(0);
  late AnimationController animeController;

  final int tabLength = 20;

  @override
  void initState() {
    animeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animeBloc = ChooseMakeAnimeBloc(
      scaleAnimation: Tween<double>(
        begin: 1,
        end: 0,
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animeController,
        ),
      ),
      reversScaleAnimation: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          curve: Curves.decelerate,
          parent: animeController,
        ),
      ),
      animationController: animeController,
    );
    globalKey = GlobalKey();
    postingAdBloc = PostingAdBloc()
      ..add(
        PostingAdMakesEvent(),
      )
      ..add(
        PostingAdTopMakesEvent(),
      );

    pageController = PageController(initialPage: 0);
    super.initState();
  }

  List<String> tabs = [
    LocaleKeys.car_make.tr(),
    LocaleKeys.car_model.tr(),
    LocaleKeys.year_of_issue.tr(),
    LocaleKeys.generation.tr(),
    LocaleKeys.body.tr(),
    LocaleKeys.motor.tr(),
    LocaleKeys.drive_unit.tr(),
    LocaleKeys.drive_gearbox.tr(),
    LocaleKeys.modification.tr(),
    LocaleKeys.car_color.tr(),
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

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).unfocus();
          if (currentTabNotifier.value != 0) {
            --currentTabNotifier.value;

            await pageController.animateToPage(currentTabNotifier.value,
                duration: const Duration(milliseconds: 150),
                curve: Curves.linear);

            return Future.value(false);
          } else {
            return Future.value(true);
          }
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
                providers: [
                  BlocProvider(create: (c) => animeBloc),
                  BlocProvider(create: (c) => postingAdBloc)
                ],
                child: BlocConsumer<PostingAdBloc, PostingAdState>(
                  listener: (context, state) async {
                    if (state.createStatus == FormzStatus.submissionSuccess) {
                      FocusScope.of(context).unfocus();
                      var error = state.toastMessage ?? '';
                      if (error.toLowerCase().contains('dio') ||
                          error.toLowerCase().contains('type')) {
                        error = LocaleKeys.service_error.tr();
                      } else if (error.toLowerCase().contains('bad')) {
                        error = LocaleKeys.bad_request.tr();
                      } else if (error.toLowerCase().contains('internal') ||
                          error.toLowerCase().contains('internet')) {
                        error = LocaleKeys.internal_error_server.tr();
                      }
                      context.read<ShowPopUpBloc>().add(
                            ShowPopUp(
                              message: error,
                              status: PopStatus.success,
                            ),
                          );
                      await Future.delayed(const Duration(milliseconds: 1000));
                      context
                          .read<WishlistAddBloc>()
                          .add(WishlistAddEvent.goToAdds(1));
                      context.read<ProfileBloc>().add(
                          ChangeCountDataEvent(adding: true, myAdsCount: 1));

                      currentTabNotifier.value = 0;
                      await Future.delayed(const Duration(milliseconds: 500));
                      await pageController.animateToPage(
                          currentTabNotifier.value,
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.linear);
                      postingAdBloc.add(PostingAdClearStateEvent());

                      Navigator.of(context).pop(true);

                      return;
                    }

                    if (state.toastMessage != null &&
                        state.toastMessage!.isNotEmpty) {
                      var error = state.toastMessage ?? '';
                      if (error.toLowerCase().contains('dio') ||
                          error.toLowerCase().contains('type')) {
                        error = LocaleKeys.service_error.tr();
                      } else if (error.toLowerCase().contains('bad')) {
                        error = LocaleKeys.bad_request.tr();
                      } else if (error.toLowerCase().contains('internal') ||
                          error.toLowerCase().contains('internet')) {
                        error = LocaleKeys.internal_error_server.tr();
                      }
                      context.read<ShowPopUpBloc>().add(
                            ShowPopUp(
                              message: error,
                              status: state.popStatus,
                            ),
                          );
                      postingAdBloc.add(PostingAdShowToastEvent(
                          message: '', status: PopStatus.success));
                    }
                  },
                  builder: (context, state) =>
                      BlocBuilder<ChooseMakeAnimeBloc, ChooseMakeAnimeState>(
                    builder: (context, animeState) => Scaffold(
                      appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(54),
                        child: ValueListenableBuilder<int>(
                          valueListenable: currentTabNotifier,
                          builder: (c, val, child) => PostingAdAppBar(
                            hasCancelButton: currentTabNotifier.value != 0,
                            currentTabIndex: currentTabNotifier.value,
                            reversScaleAnimation:
                                animeState.reversScaleAnimation,
                            reverseTitle: LocaleKeys.choose_brand_auto.tr(),
                            scaleAnimation: animeState.scaleAnimation,
                            tabLength: tabLength,
                            hasShadow: state.hasAppBarShadow,
                            onTapBack: () {
                              if (currentTabNotifier.value != 0) {
                                --currentTabNotifier.value;

                                pageController.animateToPage(
                                    currentTabNotifier.value,
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            onTapCancel: () async {
                              postingAdBloc.add(PostingAdClearStateEvent());
                              currentTabNotifier.value = 0;
                              await pageController.animateToPage(
                                  currentTabNotifier.value,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.linear);
                            },
                            title: currentTabNotifier.value == 0
                                ? LocaleKeys.get_back.tr()
                                : tabs[currentTabNotifier.value - 1],
                          ),
                        ),
                      ),
                      body: Stack(
                        children: [
                          PageView(
                            controller: pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              //0
                              ChooseCarBrand(
                                tabLength: tabLength,
                                postingAddBloc: postingAdBloc,
                                onTopBrandPressed: (makeId) {
                                  postingAdBloc
                                      .add(PostingAdChooseEvent(make: makeId));
                                  currentTabNotifier.value++;
                                  postingAdBloc.add(
                                      PostingAdAddEventForEveryPage(
                                          page: currentTabNotifier.value));
                                  pageController.animateToPage(
                                      currentTabNotifier.value,
                                      duration:
                                          const Duration(milliseconds: 150),
                                      curve: Curves.linear);
                                },
                              ),
                              //1
                              const ChooseCarModelScreen(),
                              //2
                              const YearIssueScreenn(),
                              //3
                              const GenerationScreen(),
                              //4
                              const BodyTypeScreen(),
                              //5
                              const EngineScreen(),
                              //6
                              const DriveTypeScreen(),
                              //7
                              const GearboxScreen(),
                              //8
                              ModificationScreen(
                                noData: () {
                                  FocusScope.of(context).unfocus();
                                  if (currentTabNotifier.value <
                                      tabLength - 1) {
                                    if (currentTabNotifier.value == 0 &&
                                        animeState.isCollapsed) {
                                      animeState.animationController.reverse();
                                    }
                                    currentTabNotifier.value++;
                                    postingAdBloc.add(
                                        PostingAdAddEventForEveryPage(
                                            page: currentTabNotifier.value));
                                    pageController.animateToPage(
                                        currentTabNotifier.value,
                                        duration:
                                            const Duration(milliseconds: 60),
                                        curve: Curves.linear);

                                    postingAdBloc.add(PostingAdChooseEvent(
                                        getModificationStatus:
                                            FormzStatus.pure));
                                  }
                                },
                              ),
                              //9
                              const ColorsScreen(),
                              //10
                              AddPhotoScreen(
                                isWaiting: false,
                                panoramas: state.panoramas,
                                gallery: state.gallery,
                                onImagesChanged: (gallery, panoramas) {
                                  postingAdBloc.add(
                                    PostingAdChooseEvent(
                                      gallery: gallery,
                                      panaramaGallery: panoramas,
                                    ),
                                  );
                                },
                                onShowToast: (message, status) {
                                  postingAdBloc.add(
                                    PostingAdShowToastEvent(
                                      message: message,
                                      status: status,
                                    ),
                                  );
                                },
                              ),
                              //11
                              const PtsScreen(),
                              //12
                              DescriptionScreen(
                                  initialText: state.description ?? ''),
                              //13
                              EquipmentScreen(
                                selectOptions: state.selectOptions,
                                onEquipmentOptionPressed: ({
                                  required id,
                                  required isAdd,
                                  required type,
                                  required itemName,
                                  selectOption,
                                }) {
                                  context.read<PostingAdBloc>().add(
                                      PostingAdChangeOption(
                                          id: id,
                                          type: type,
                                          itemName: itemName,
                                          isAdd: isAdd,
                                          selectOption: selectOption));
                                },
                                isOptionSelected: state.isOptionSelected,
                                onEquipmentSelected: (equipment) {
                                  context.read<PostingAdBloc>().add(
                                        PostingAdSelectEquipmentEvent(
                                            equipment: equipment),
                                      );
                                },
                                equipmentOptionsList:
                                    state.equipmentOptionsList,
                                equipments: state.equipments,
                                equipment: state.equipment,
                              ),
                              //14
                              DamageScreen(
                                damagedParts: state.damagedParts,
                                onDamageTypeChanged: (part, type) {
                                  context.read<PostingAdBloc>().add(
                                      PostingAdDamageEvent(
                                          part: part, type: type));
                                },
                              ),
                              //15
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
                                  postingAdBloc.add(PostingAdSendCodeEvent(
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
                                            context.read<PostingAdBloc>().add(
                                                  PostingAdChooseEvent(
                                                    isContactsVerified: value,
                                                    ownerEmail: state
                                                        .emailController.text,
                                                    ownerName: state
                                                        .nameController.text,
                                                    ownerPhone: state
                                                        .phoneController.text,
                                                  ),
                                                );
                                          } else if (value is String) {
                                            context.read<PostingAdBloc>().add(
                                                  PostingAdChooseEvent(
                                                    isContactsVerified: false,
                                                    ownerEmail: state
                                                        .emailController.text,
                                                    ownerName: state
                                                        .nameController.text,
                                                    ownerPhone: state
                                                        .phoneController.text,
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
                                  postingAdBloc.add(
                                    PostingAdChooseEvent(
                                        ownerName: value,
                                        isContactsVerified: v,
                                        showOwnerContacts: v),
                                  );
                                },
                                onShowMyContactChanged: (v) {
                                  context
                                      .read<PostingAdBloc>()
                                      .add(PostingAdClearControllersEvent());

                                  context.read<PostingAdBloc>().add(
                                        PostingAdChooseEvent(
                                          showOwnerContacts: v,
                                          isContactsVerified: v,
                                        ),
                                      );
                                },
                                onEmailChanged: (value) {
                                  postingAdBloc.add(
                                      PostingAdChooseEvent(ownerEmail: value));
                                },
                                onNameChanged: (value) {
                                  final v =
                                      state.isContactsVerified ? false : null;
                                  postingAdBloc.add(PostingAdChooseEvent(
                                    ownerName: value,
                                    showOwnerContacts: v,
                                  ));
                                },
                                onGetUserDatas: () => context
                                    .read<PostingAdBloc>()
                                    .add(PostingAdGetUserDataEvent()),
                                onCallTimeChanged: ({
                                  required isCallTimed,
                                  callTimeFrom,
                                  callTimeTo,
                                }) {
                                  postingAdBloc.add(
                                    PostingAdChooseEvent(
                                      callTimeFrom: callTimeFrom,
                                      callTimeTo: callTimeTo,
                                      isCallTimed: isCallTimed,
                                    ),
                                  );
                                },
                              ),
                              //16
                              InspectionPlaceScreen(
                                onToMapPressed: () {
                                  Navigator.push(
                                      context,
                                      fade(
                                          page: MapScreenPostingAd(
                                        initialLat: state.lat ?? 0,
                                        initialLong: state.long ?? 0,
                                      ))).then(
                                    (latLongZoom) {
                                      if (latLongZoom is List<double>) {
                                        postingAdBloc.add(
                                          PostingAdGetMapScreenShotEvent(
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
                              //17
                              PriceScreen(
                                  currency: state.currency,
                                  minimumPrice: state.minimumPrice,
                                  price: state.price ?? '',
                                  rentToBuy: state.rentToBuy ?? false,
                                  onCurrencyChanged: (currency) =>
                                      postingAdBloc.add(PostingAdChooseEvent(
                                          currency: currency)),
                                  onSwitchChanged: (v) => postingAdBloc
                                      .add(PostingAdChooseEvent(rentToBuy: v)),
                                  onConditionChanged: (condition) =>
                                      postingAdBloc.add(
                                          PostingAdOnRentWithPurchaseConditionChangedEvent(
                                              condition: condition)),
                                  onPriceChanged: (price) => postingAdBloc
                                      .add(PostingAdChooseEvent(price: price)),
                                  initialPrice: state.price ?? '',
                                  conditions: state
                                      .rentWithPurchaseConditions.entries
                                      .map((e) => e.value)
                                      .toList()),
                              //18
                              MileageScreen(
                                  onImageChange: (image) {
                                    postingAdBloc.add(PostingAdChooseEvent(
                                        milageImage: image));
                                  },
                                  initialMileageImage: state.milageImage,
                                  initialMileage: state.mileage ?? ''),
                              //19

                              PreviewScreen(
                                isWaiting:
                                    state.getMakesStatus.isSubmissionInProgress,
                                regionName: state.region?.title ?? '',
                                districtName: state.district?.title ?? '',
                                equipment: state.equipment,
                                currency: state.currency,
                                price: state.price ?? '',
                                description: state.description ?? '',
                                bodyType: state.bodyType?.type ?? '',
                                colorName: state.colorName?.name ?? '',
                                gallery: state.gallery,
                                gearboxType: state.gearbox?.type ?? '',
                                generationName: state.generation?.name ?? '',
                                makeName: state.make?.name ?? '',
                                mapPointBodyBytes: state.mapPointBytes,
                                mileage: state.mileage ?? '0',
                                modelName: state.model?.name ?? '',
                                modificationPower:
                                    state.modification?.power ?? '',
                                modificationVolume:
                                    state.modification?.volume ?? '',
                                panaramaGallery: state.panoramas,
                                purchasedDate: state.purchasedDate ?? '',
                                registeredInUzbekistan:
                                    !state.notRegisteredInUzbekistan,
                                selectedRadioOptions: state.radioOptions,
                                selectedSelectOptions: state.selectOptions,
                                year: '${state.selectedYear ?? ''}',
                              ),
                            ],
                          ),
                          ValueListenableBuilder<int>(
                            valueListenable: currentTabNotifier,
                            builder: (context, val, child) {
                              if (val < tabLength - 1) {
                                return Positioned(
                                  bottom:
                                      MediaQuery.of(context).padding.bottom +
                                          16,
                                  right: 16,
                                  left: 16,
                                  child: WButton(
                                    disabledColor: disabledButton,
                                    isDisabled: state
                                        .buttonStatus(currentTabNotifier.value),
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (currentTabNotifier.value <
                                          tabLength - 1) {
                                        if (currentTabNotifier.value == 0 &&
                                            animeState.isCollapsed) {
                                          animeState.animationController
                                              .reverse();
                                        }
                                        currentTabNotifier.value++;
                                        postingAdBloc.add(
                                            PostingAdAddEventForEveryPage(
                                                page:
                                                    currentTabNotifier.value));
                                        pageController.animateToPage(
                                            currentTabNotifier.value,
                                            duration: const Duration(
                                                milliseconds: 150),
                                            curve: Curves.linear);
                                      }
                                    },
                                    text: LocaleKeys.further.tr(),
                                    shadow: state.buttonStatus(
                                            currentTabNotifier.value)
                                        ? null
                                        : [
                                            BoxShadow(
                                                offset: const Offset(0, 4),
                                                blurRadius: 20,
                                                color: orange.withOpacity(0.2)),
                                          ],
                                  ),
                                );
                              } else {
                                return Positioned(
                                  bottom:
                                      MediaQuery.of(context).padding.bottom +
                                          16,
                                  right: 16,
                                  left: 16,
                                  child: WButton(
                                    isDisabled: state.createStatus ==
                                        FormzStatus.submissionSuccess,
                                    isLoading: state.createStatus ==
                                        FormzStatus.submissionInProgress,
                                    onTap: () async {
                                      postingAdBloc.add(PostingAdCreateEvent());
                                    },
                                    text: LocaleKeys.start_free_week.tr(),
                                    shadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 20,
                                        color: orange.withOpacity(0.2),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
