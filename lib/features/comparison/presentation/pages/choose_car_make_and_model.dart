// import 'dart:async';
// import 'dart:developer';
//
// import 'package:auto/assets/colors/color.dart';
// import 'package:auto/assets/themes/theme_extensions/themed_colors.dart';
// import 'package:auto/features/ad/domain/entities/types/make.dart';
// import 'package:auto/features/ad/presentation/bloc/bloc/choose_make_anime_bloc.dart';
// import 'package:auto/features/ad/presentation/bloc/posting_ad/posting_ad_bloc.dart';
// import 'package:auto/features/ad/presentation/pages/add_photo/add_photo_screen.dart';
// import 'package:auto/features/ad/presentation/pages/carcase/carcase_screen.dart';
// import 'package:auto/features/ad/presentation/pages/choose_car_brand/choose_brand_screen.dart';
// import 'package:auto/features/ad/presentation/pages/choose_model/choose_car_model.dart';
// import 'package:auto/features/ad/presentation/pages/color/colors_screen.dart';
// import 'package:auto/features/ad/presentation/pages/contact/contact_screen.dart';
// import 'package:auto/features/ad/presentation/pages/damage/damage_screen.dart';
// import 'package:auto/features/ad/presentation/pages/description/description_screen.dart';
// import 'package:auto/features/ad/presentation/pages/drive_type/drive_type_screen.dart';
// import 'package:auto/features/ad/presentation/pages/engine/engine_screen.dart';
// import 'package:auto/features/ad/presentation/pages/equipment/equipment_screen.dart';
// import 'package:auto/features/ad/presentation/pages/gear_box/gearbox_screen.dart';
// import 'package:auto/features/ad/presentation/pages/generation/generation_screen.dart';
// import 'package:auto/features/ad/presentation/pages/inspection_place/inspection_place_screen.dart';
// import 'package:auto/features/ad/presentation/pages/map_screen/map_screen_posting_ad.dart';
// import 'package:auto/features/ad/presentation/pages/mileage/mileage_screen.dart';
// import 'package:auto/features/ad/presentation/pages/modification/modification_screen.dart';
// import 'package:auto/features/ad/presentation/pages/preview/preview_screen.dart';
// import 'package:auto/features/ad/presentation/pages/price/price_screen.dart';
// import 'package:auto/features/ad/presentation/pages/pts/pts_screen.dart';
// import 'package:auto/features/ad/presentation/pages/year_of_issue/year_issue_screen.dart';
// import 'package:auto/features/ad/presentation/widgets/posting_ad_appbar.dart';
// import 'package:auto/features/ad/presentation/widgets/sms_verification_sheet.dart';
// import 'package:auto/features/common/bloc/get_car_model/get_car_model_bloc.dart';
// import 'package:auto/features/common/bloc/show_pop_up/show_pop_up_bloc.dart';
// import 'package:auto/features/common/bloc/wishlist_add/wishlist_add_bloc.dart';
// import 'package:auto/features/common/widgets/custom_screen.dart';
// import 'package:auto/features/common/widgets/w_button.dart';
// import 'package:auto/features/navigation/presentation/navigator.dart';
// import 'package:auto/features/profile/presentation/bloc/profile/profile_bloc.dart';
// import 'package:auto/generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';
//
// class ChooseCarMakeAndModel extends StatefulWidget {
//   final MakeEntity? initialModel;
//   final MakeEntity? initialMake;
//
//   const ChooseCarMakeAndModel({
//     required this.initialMake,
//     required this.initialModel,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ChooseCarMakeAndModel> createState() => _ChooseCarMakeAndModelState();
// }
//
// class _ChooseCarMakeAndModelState extends State<ChooseCarMakeAndModel>
//     with SingleTickerProviderStateMixin {
//   late PageController pageController;
//   late CarModelsBloc carModelsBloc;
//   late int currentTabIndex;
//   static int initialPage = 0;
//   final int tabLength = 2;
//
//   @override
//   void initState() {
//
//     carModelsBloc = CarModelsBloc(initialSelectedId: widget.initialModel?.id ?? -1)
//       ..add(CarModelsGetEvent(
//         getId: widget.initialMake?.id ?? -1,
//         search: '',
//       ))
//       ..add(CarModelsGetAnnouncementsEvent(
//         makeId: widget.initialMake?.id ?? -1,
//         modelId: widget.initialModel?.id ?? -1,
//       ));
//     currentTabIndex = initialPage;
//     postingAdBloc.add(PostingAdMakesEvent());
//     pageController = PageController(initialPage: initialPage);
//     super.initState();
//   }
//
//   List<String> tabs = [
//     LocaleKeys.car_make.tr(),
//     LocaleKeys.car_model.tr(),
//     LocaleKeys.year_of_issue.tr(),
//     LocaleKeys.generation.tr(),
//     LocaleKeys.body.tr(),
//     LocaleKeys.motor.tr(),
//     LocaleKeys.drive_unit.tr(),
//     LocaleKeys.drive_gearbox.tr(),
//     LocaleKeys.modification.tr(),
//     LocaleKeys.car_color.tr(),
//     LocaleKeys.photographation.tr(),
//     LocaleKeys.pts.tr(),
//     LocaleKeys.description.tr(),
//     LocaleKeys.complectation.tr(),
//     LocaleKeys.body_state.tr(),
//     LocaleKeys.contact_data.tr(),
//     LocaleKeys.place_of_inspection.tr(),
//     LocaleKeys.price.tr(),
//     LocaleKeys.Mileage.tr(),
//     LocaleKeys.preispection.tr(),
//   ];
//
//   @override
//   Widget build(BuildContext context) => WillPopScope(
//         onWillPop: () async {
//           FocusScope.of(context).unfocus();
//           return Future.value(false);
//         },
//         child: KeyboardDismisser(
//           child: CustomScreen(
//             child: AnnotatedRegion(
//               value: SystemUiOverlayStyle(
//                 statusBarColor:
//                     Theme.of(context).extension<ThemedColors>()!.whiteToDark,
//                 statusBarBrightness: Brightness.light,
//                 statusBarIconBrightness: Brightness.dark,
//               ),
//               child: MultiBlocProvider(
//                 providers: [
//                   BlocProvider(create: (c) => animeBloc),
//                   BlocProvider(create: (c) => postingAdBloc)
//                 ],
//                 child: BlocConsumer<PostingAdBloc, PostingAdState>(
//                     listener: (context, state) async {
//                       if (state.createStatus == FormzStatus.submissionSuccess) {
//                         FocusScope.of(context).unfocus();
//                         var error = state.toastMessage ?? '';
//                         if (error.toLowerCase().contains('dio') ||
//                             error.toLowerCase().contains('type')) {
//                           error = LocaleKeys.service_error.tr();
//                         } else if (error.toLowerCase().contains('bad')) {
//                           error = LocaleKeys.bad_request.tr();
//                         } else if (error.toLowerCase().contains('internal') ||
//                             error.toLowerCase().contains('internet')) {
//                           error = LocaleKeys.internal_error_server.tr();
//                         }
//                         context.read<ShowPopUpBloc>().add(
//                               ShowPopUp(
//                                 message: error,
//                                 status: PopStatus.success,
//                               ),
//                             );
//                         await Future.delayed(
//                             const Duration(milliseconds: 1000));
//                         context
//                             .read<WishlistAddBloc>()
//                             .add(WishlistAddEvent.goToAdds(1));
//                         context.read<ProfileBloc>().add(
//                             ChangeCountDataEvent(adding: true, myAdsCount: 1));
//
//                         currentTabIndex = 0;
//                         await Future.delayed(const Duration(milliseconds: 500));
//                         await pageController.animateToPage(currentTabIndex,
//                             duration: const Duration(milliseconds: 150),
//                             curve: Curves.linear);
//                         postingAdBloc.add(PostingAdClearStateEvent());
//                         setState(() {});
//                         Navigator.of(context).pop(true);
//
//                         return;
//                       }
//
//                       if (state.toastMessage != null &&
//                           state.toastMessage!.isNotEmpty) {
//                         var error = state.toastMessage ?? '';
//                         if (error.toLowerCase().contains('dio') ||
//                             error.toLowerCase().contains('type')) {
//                           error = LocaleKeys.service_error.tr();
//                         } else if (error.toLowerCase().contains('bad')) {
//                           error = LocaleKeys.bad_request.tr();
//                         } else if (error.toLowerCase().contains('internal') ||
//                             error.toLowerCase().contains('internet')) {
//                           error = LocaleKeys.internal_error_server.tr();
//                         }
//                         context.read<ShowPopUpBloc>().add(
//                               ShowPopUp(
//                                 message: error,
//                                 status: state.popStatus,
//                               ),
//                             );
//                         postingAdBloc.add(PostingAdShowToastEvent(
//                             message: '', status: PopStatus.success));
//                       }
//                     },
//                     builder: (context, state) =>
//                         BlocBuilder<ChooseMakeAnimeBloc, ChooseMakeAnimeState>(
//                           builder: (context, animeState) => Scaffold(
//                             appBar: PreferredSize(
//                               preferredSize: const Size.fromHeight(54),
//                               child: PostingAdAppBar(
//                                 hasCancelButton: currentTabIndex != 0,
//                                 currentTabIndex: currentTabIndex,
//                                 reversScaleAnimation:
//                                     animeState.reversScaleAnimation,
//                                 reverseTitle: LocaleKeys.choose_brand_auto.tr(),
//                                 scaleAnimation: animeState.scaleAnimation,
//                                 tabLength: tabLength,
//                                 hasShadow: state.hasAppBarShadow,
//                                 onTapBack: () {
//                                   if (currentTabIndex != 0) {
//                                     --currentTabIndex;
//                                     pageController.animateToPage(
//                                         currentTabIndex,
//                                         duration:
//                                             const Duration(milliseconds: 150),
//                                         curve: Curves.linear);
//                                     setState(() {});
//                                   } else {
//                                     Navigator.pop(context);
//                                   }
//                                 },
//                                 onTapCancel: () async {
//                                   postingAdBloc.add(PostingAdClearStateEvent());
//                                   log(':::::::::: on tap cancel triggered: $currentTabIndex}  ::::::::::');
//                                   currentTabIndex = 0;
//                                   log(':::::::::: on tap cancel triggered: $currentTabIndex}  ::::::::::');
//                                   await pageController.animateToPage(
//                                       currentTabIndex,
//                                       duration:
//                                           const Duration(milliseconds: 100),
//                                       curve: Curves.linear);
//                                 },
//                                 title: currentTabIndex == 0
//                                     ? LocaleKeys.get_back.tr()
//                                     : tabs[currentTabIndex - 1],
//                               ),
//                             ),
//                             body: Stack(
//                               children: [
//                                 PageView(
//                                   controller: pageController,
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   children: [
//                                     //0
//                                     ChooseCarBrand(
//                                       tabLength: tabLength,
//                                       postingAddBloc: postingAdBloc,
//                                       onTopBrandPressed: (makeId) {
//                                         postingAdBloc.add(
//                                             PostingAdChooseEvent(make: makeId));
//                                         currentTabIndex++;
//                                         postingAdBloc.add(
//                                             PostingAdAddEventForEveryPage(
//                                                 page: currentTabIndex));
//                                         pageController.animateToPage(
//                                             currentTabIndex,
//                                             duration: const Duration(
//                                                 milliseconds: 150),
//                                             curve: Curves.linear);
//                                         setState(() {});
//                                       },
//                                     ),
//                                     //1
//                                     const ChooseCarModelScreen(),
//                                     //2
//                                     const YearIssueScreenn(),
//                                     //3
//                                     const GenerationScreen(),
//                                     //4
//                                     const BodyTypeScreen(),
//                                     //5
//                                     const EngineScreen(),
//                                     //6
//                                     const DriveTypeScreen(),
//                                     //7
//                                     const GearboxScreen(),
//                                     //8
//                                     ModificationScreen(
//                                       noData: () {
//                                         FocusScope.of(context).unfocus();
//                                         if (currentTabIndex < tabLength - 1) {
//                                           if (currentTabIndex == 0 &&
//                                               animeState.isCollapsed) {
//                                             animeState.animationController
//                                                 .reverse();
//                                           }
//                                           currentTabIndex++;
//                                           postingAdBloc.add(
//                                               PostingAdAddEventForEveryPage(
//                                                   page: currentTabIndex));
//                                           pageController.animateToPage(
//                                               currentTabIndex,
//                                               duration: const Duration(
//                                                   milliseconds: 60),
//                                               curve: Curves.linear);
//                                           setState(() {});
//                                           postingAdBloc.add(
//                                               PostingAdChooseEvent(
//                                                   getModificationStatus:
//                                                       FormzStatus.pure));
//                                         }
//                                       },
//                                     ),
//                                     //9
//                                     const ColorsScreen(),
//                                     //10
//                                     const AddPhotoScreen(),
//                                     //11
//                                     const PtsScreen(),
//                                     //12
//                                     DescriptionScreen(
//                                         initialText: state.description ?? ''),
//                                     //13
//                                     EquipmentScreen(
//                                       selectOptions: state.selectOptions,
//                                       onEquipmentOptionPressed: ({
//                                         required id,
//                                         required isAdd,
//                                         required type,
//                                         required itemName,
//                                         selectOption,
//                                       }) {
//                                         context.read<PostingAdBloc>().add(
//                                             PostingAdChangeOption(
//                                                 id: id,
//                                                 type: type,
//                                                 itemName: itemName,
//                                                 isAdd: isAdd,
//                                                 selectOption: selectOption));
//                                       },
//                                       isOptionSelected: state.isOptionSelected,
//                                       onEquipmentSelected: (equipment) {
//                                         context.read<PostingAdBloc>().add(
//                                               PostingAdSelectEquipmentEvent(
//                                                   equipment: equipment),
//                                             );
//                                       },
//                                       equipmentOptionsList:
//                                           state.equipmentOptionsList,
//                                       equipments: state.equipments,
//                                       equipment: state.equipment,
//                                     ),
//                                     //14
//                                     const DamageScreen(),
//                                     //15
//                                     ContactScreen(
//                                       isContactsVerified:
//                                           state.isContactsVerified,
//                                       isCallTimed: state.isCallTimed,
//                                       showOwnerContacts:
//                                           state.showOwnerContacts,
//                                       isWaiting: state.status ==
//                                           FormzStatus.submissionInProgress,
//                                       emailController: state.emailController,
//                                       nameController: state.nameController,
//                                       phoneController: state.phoneController,
//                                       callTimeFrom: state.callTimeFrom,
//                                       callTimeTo: state.callTimeTo,
//                                       formKey: state.contactsFormKey,
//                                       onSubmitPhonePressed: () {
//                                         postingAdBloc.add(
//                                             PostingAdSendCodeEvent(
//                                                 phone:
//                                                     state.phoneController.text,
//                                                 onSuccess: (session) {
//                                                   showModalBottomSheet<dynamic>(
//                                                       useRootNavigator: true,
//                                                       isScrollControlled: true,
//                                                       backgroundColor:
//                                                           Colors.transparent,
//                                                       isDismissible: false,
//                                                       context: context,
//                                                       builder: (context) =>
//                                                           SmsVerificationSheet(
//                                                               session: session,
//                                                               phoneNumber: state
//                                                                   .phoneController
//                                                                   .text)).then(
//                                                       (value) {
//                                                     if (value is bool) {
//                                                       context
//                                                           .read<PostingAdBloc>()
//                                                           .add(
//                                                             PostingAdChooseEvent(
//                                                               isContactsVerified:
//                                                                   value,
//                                                               ownerEmail: state
//                                                                   .emailController
//                                                                   .text,
//                                                               ownerName: state
//                                                                   .nameController
//                                                                   .text,
//                                                               ownerPhone: state
//                                                                   .phoneController
//                                                                   .text,
//                                                             ),
//                                                           );
//                                                     } else if (value
//                                                         is String) {
//                                                       context
//                                                           .read<PostingAdBloc>()
//                                                           .add(
//                                                             PostingAdChooseEvent(
//                                                               isContactsVerified:
//                                                                   false,
//                                                               ownerEmail: state
//                                                                   .emailController
//                                                                   .text,
//                                                               ownerName: state
//                                                                   .nameController
//                                                                   .text,
//                                                               ownerPhone: state
//                                                                   .phoneController
//                                                                   .text,
//                                                             ),
//                                                           );
//                                                       context
//                                                           .read<ShowPopUpBloc>()
//                                                           .add(ShowPopUp(
//                                                             message: value
//                                                                 .toString(),
//                                                             status:
//                                                                 PopStatus.error,
//                                                           ));
//                                                     }
//                                                   });
//                                                 }));
//                                       },
//                                       onPhoneChanged: (value) {
//                                         final v = state.isContactsVerified
//                                             ? false
//                                             : null;
//                                         postingAdBloc.add(
//                                           PostingAdChooseEvent(
//                                               ownerName: value,
//                                               isContactsVerified: v,
//                                               showOwnerContacts: v),
//                                         );
//                                       },
//                                       onShowMyContactChanged: (v) {
//                                         context.read<PostingAdBloc>().add(
//                                             PostingAdClearControllersEvent());
//
//                                         context.read<PostingAdBloc>().add(
//                                               PostingAdChooseEvent(
//                                                 showOwnerContacts: v,
//                                                 isContactsVerified: v,
//                                               ),
//                                             );
//                                       },
//                                       onEmailChanged: (value) {
//                                         postingAdBloc.add(PostingAdChooseEvent(
//                                             ownerEmail: value));
//                                       },
//                                       onNameChanged: (value) {
//                                         final v = state.isContactsVerified
//                                             ? false
//                                             : null;
//                                         postingAdBloc.add(PostingAdChooseEvent(
//                                           ownerName: value,
//                                           showOwnerContacts: v,
//                                         ));
//                                       },
//                                       onGetUserDatas: () => context
//                                           .read<PostingAdBloc>()
//                                           .add(PostingAdGetUserDataEvent()),
//                                       onCallTimeChanged: ({
//                                         required isCallTimed,
//                                         callTimeFrom,
//                                         callTimeTo,
//                                       }) {
//                                         postingAdBloc.add(
//                                           PostingAdChooseEvent(
//                                             callTimeFrom: callTimeFrom,
//                                             callTimeTo: callTimeTo,
//                                             isCallTimed: isCallTimed,
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                     //16
//                                     InspectionPlaceScreen(
//                                       onToMapPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             fade(
//                                                 page: MapScreenPostingAd(
//                                               initialLat: state.lat ?? 0,
//                                               initialLong: state.long ?? 0,
//                                             ))).then(
//                                           (latLongZoom) {
//                                             if (latLongZoom is List<double>) {
//                                               postingAdBloc.add(
//                                                 PostingAdGetMapScreenShotEvent(
//                                                   lat: latLongZoom[0],
//                                                   long: latLongZoom[1],
//                                                   zoomLevel: latLongZoom[2],
//                                                 ),
//                                               );
//                                             }
//                                           },
//                                         );
//                                       },
//                                     ),
//                                     //17
//                                     PriceScreen(
//                                         currency: state.currency,
//                                         minimumPrice: state.minimumPrice,
//                                         price: state.price ?? '',
//                                         rentToBuy: state.rentToBuy ?? false,
//                                         onCurrencyChanged: (currency) =>
//                                             postingAdBloc.add(
//                                                 PostingAdChooseEvent(
//                                                     currency: currency)),
//                                         onSwitchChanged: (v) => postingAdBloc.add(
//                                             PostingAdChooseEvent(rentToBuy: v)),
//                                         onConditionChanged: (condition) =>
//                                             postingAdBloc.add(
//                                                 PostingAdOnRentWithPurchaseConditionChangedEvent(
//                                                     condition: condition)),
//                                         onPriceChanged: (price) => postingAdBloc.add(
//                                             PostingAdChooseEvent(price: price)),
//                                         initialPrice: state.price ?? '',
//                                         conditions: state
//                                             .rentWithPurchaseConditions.entries
//                                             .map((e) => e.value)
//                                             .toList()),
//                                     //18
//                                     MileageScreen(
//                                         onImageChange: (image) {
//                                           postingAdBloc.add(
//                                               PostingAdChooseEvent(
//                                                   milageImage: image));
//                                         },
//                                         initialMileageImage: state.milageImage,
//                                         initialMileage: state.mileage ?? ''),
//                                     //19
//
//                                     PreviewScreen(
//                                       isWaiting: state.getMakesStatus
//                                           .isSubmissionInProgress,
//                                       regionName: state.region?.title ?? '',
//                                       districtName: state.district?.title ?? '',
//                                       equipment: state.equipment,
//                                       currency: state.currency,
//                                       price: state.price ?? '',
//                                       description: state.description ?? '',
//                                       bodyType: state.bodyType?.type ?? '',
//                                       colorName: state.colorName?.name ?? '',
//                                       gallery: state.gallery,
//                                       gearboxType: state.gearbox?.type ?? '',
//                                       generationName:
//                                           state.generation?.name ?? '',
//                                       makeName: state.make?.name ?? '',
//                                       mapPointBodyBytes: state.mapPointBytes,
//                                       mileage: state.mileage ?? '0',
//                                       modelName: state.model?.name ?? '',
//                                       modificationPower:
//                                           state.modification?.power ?? '',
//                                       modificationVolume:
//                                           state.modification?.volume ?? '',
//                                       panaramaGallery: state.panaramaGallery,
//                                       purchasedDate: state.purchasedDate ?? '',
//                                       registeredInUzbekistan:
//                                           !state.notRegisteredInUzbekistan,
//                                       selectedRadioOptions: state.radioOptions,
//                                       selectedSelectOptions:
//                                           state.selectOptions,
//                                       year:
//                                           '${state.yearEntity?.yearBegin ?? ''}',
//                                     ),
//                                   ],
//                                 ),
//                                 if (currentTabIndex < tabLength - 1) ...{
//                                   Positioned(
//                                     bottom:
//                                         MediaQuery.of(context).padding.bottom +
//                                             16,
//                                     right: 16,
//                                     left: 16,
//                                     child: WButton(
//                                       disabledColor: disabledButton,
//                                       isDisabled:
//                                           state.buttonStatus(currentTabIndex),
//                                       onTap: () {
//                                         FocusScope.of(context).unfocus();
//                                         if (currentTabIndex < tabLength - 1) {
//                                           if (currentTabIndex == 0 &&
//                                               animeState.isCollapsed) {
//                                             animeState.animationController
//                                                 .reverse();
//                                           }
//                                           currentTabIndex++;
//                                           postingAdBloc.add(
//                                               PostingAdAddEventForEveryPage(
//                                                   page: currentTabIndex));
//                                           pageController.animateToPage(
//                                               currentTabIndex,
//                                               duration: const Duration(
//                                                   milliseconds: 150),
//                                               curve: Curves.linear);
//                                           setState(() {});
//                                         }
//                                       },
//                                       text: LocaleKeys.further.tr(),
//                                       shadow: state
//                                               .buttonStatus(currentTabIndex)
//                                           ? null
//                                           : [
//                                               BoxShadow(
//                                                   offset: const Offset(0, 4),
//                                                   blurRadius: 20,
//                                                   color:
//                                                       orange.withOpacity(0.2)),
//                                             ],
//                                     ),
//                                   ),
//                                 } else ...{
//                                   Positioned(
//                                     bottom:
//                                         MediaQuery.of(context).padding.bottom +
//                                             16,
//                                     right: 16,
//                                     left: 16,
//                                     child: WButton(
//                                       isDisabled: state.createStatus ==
//                                           FormzStatus.submissionSuccess,
//                                       isLoading: state.createStatus ==
//                                           FormzStatus.submissionInProgress,
//                                       onTap: () async {
//                                         postingAdBloc
//                                             .add(PostingAdCreateEvent());
//                                       },
//                                       text: LocaleKeys.start_free_week.tr(),
//                                       shadow: [
//                                         BoxShadow(
//                                           offset: const Offset(0, 4),
//                                           blurRadius: 20,
//                                           color: orange.withOpacity(0.2),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 }
//                               ],
//                             ),
//                           ),
//                         )),
//               ),
//             ),
//           ),
//         ),
//       );
// }
