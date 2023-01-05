// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SingleMusofirPage extends StatefulWidget {
//   const SingleMusofirPage({
//     super.key,
//     required this.isFromCompleted,
//     required this.musofirId,
//   });

//   final bool isFromCompleted;
//   final int musofirId;

//   @override
//   State<SingleMusofirPage> createState() => _SingleMusofirPageState();
// }

// class _SingleMusofirPageState extends State<SingleMusofirPage>
//     with SingleTickerProviderStateMixin {
//   ScrollController? _scrollController;
//   CrossFadeState actionState = CrossFadeState.showFirst;
//   CrossFadeState tabState = CrossFadeState.showFirst;
//   double height = 200;

//   late SingleMusofirBloc singleMusofirBloc;
//   late CommentsBloc commentsBloc;
//   late TabController tabController;
//   late TargetPlatform? platform;

//   void _scrollListener() {
//     if (_isShrink) {
//       setState(() {
//         actionState = CrossFadeState.showSecond;
//       });
//     } else {
//       setState(() {
//         actionState = CrossFadeState.showFirst;
//       });
//     }
//   }

//   bool get _isShrink => _scrollController != null &&
//         _scrollController!.hasClients &&
//         _scrollController!.offset > (height - kToolbarHeight);

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController()..addListener(_scrollListener);
//     commentsBloc = CommentsBloc(
//         useCase: CommentsUseCase(
//             repository: serviceLocator<CommentsRepositoryImpl>()))
//       ..add(CommentsEvent.getComments(widget.musofirId));
//     singleMusofirBloc = SingleMusofirBloc()
//       ..add(InitialEvent(widget.musofirId));
//     tabController = TabController(length: 2, vsync: this);
//     tabController.addListener(() {
//       _changeTab();
//     });
//     if (Platform.isAndroid) {
//       platform = TargetPlatform.android;
//     } else {
//       platform = TargetPlatform.iOS;
//     }
//   }

//   void _changeTab() {
//     if (tabController.index == 0) {
//       setState(() {
//         tabState = CrossFadeState.showFirst;
//       });
//     } else {
//       setState(() {
//         tabState = CrossFadeState.showSecond;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController?.removeListener(_scrollListener);
//     _scrollController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => SwipePop(
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => singleMusofirBloc),
//           BlocProvider(create: (context) => commentsBloc),
//         ],
//         child: BlocBuilder<SingleMusofirBloc, SingleMusofirState>(
//           builder: (context, state) =>WillPopScope(
//               onWillPop: () async {
//                 Navigator.pop(context, state.musofir.id != -1);
//                 return false;
//               },
//               child: state.getSingleStatus.isSubmissionInProgress
//                   ? const Scaffold(
//                       body: Center(
//                         child: CupertinoActivityIndicator(),
//                       ),
//                     )
//                   : state.getSingleStatus.isSubmissionSuccess
//                       ? Scaffold(
//                           backgroundColor: scaffoldBackground,
//                           body: Column(
//                             children: [
//                               Expanded(
//                                 child: CustomScrollView(
//                                   controller: _scrollController,
//                                   slivers: [
//                                     SingleMusofirAppBar(
//                                       onTapBack: () {
//                                         Navigator.pop(
//                                             context, state.musofir.id != -1);
//                                       },
//                                       collectedAmount:
//                                           state.musofir.collectedAmount,
//                                       requiredAmount:
//                                           state.musofir.requiredAmount,
//                                       title: state.musofir.region.title,
//                                       viewsCount: state.musofir.viewsCount,
//                                       onTapFavorite: () {
//                                         singleMusofirBloc.add(
//                                             AddFavoriteEvent(widget.musofirId));
//                                       },
//                                       isFavorite: state.musofir.isFavourite,
//                                       image: state.musofir.image,
//                                       sharedCount: state.musofir.sharedCount,
//                                       actionState: actionState,
//                                       musofirId: widget.musofirId,
//                                     ),
//                                     SliverList(
//                                       delegate: SliverChildListDelegate(
//                                         [
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 20, vertical: 12),
//                                             margin: const EdgeInsets.only(
//                                                 bottom: 12),
//                                             color: white,
//                                             child: Column(
//                                               children: [
//                                                 if (widget.isFromCompleted)
//                                                   SingleMusofirTabBar(
//                                                       tabController:
//                                                           tabController),
//                                                 if (widget.isFromCompleted) PayStatusInfo(
//                                                         collectedSum: state
//                                                             .musofir
//                                                             .requiredAmount,
//                                                         payPeopleCount: state
//                                                             .musofir
//                                                             .donationsCount,
//                                                         currency: 'UZS',
//                                                         yourPay: state.musofir
//                                                             .myDonationAmount,
//                                                         isSingle: true,
//                                                       ) else MainStatusInfoo(
//                                                         collectedSum: state
//                                                             .musofir
//                                                             .collectedAmount,
//                                                         neededSum: state.musofir
//                                                             .requiredAmount,
//                                                         yourPay: state.musofir
//                                                             .myDonationAmount,
//                                                         isSingle: false,
//                                                         deadline:
//                                                             state.musofir.date,
//                                                       ),
//                                                 WhosDonated(
//                                                   id: widget.musofirId,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           AnimatedCrossFade(
//                                             firstChild: Column(
//                                               children: [
//                                                 CollectionBodyInfo(
//                                                   onTap: () {
//                                                     showModalBottomSheet(
//                                                       context: context,
//                                                       isScrollControlled: true,
//                                                       useRootNavigator: true,
//                                                       isDismissible: true,
//                                                       shape: const RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius.vertical(
//                                                                   top: Radius
//                                                                       .circular(
//                                                                           12))),
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           DocumentBottomSheet(
//                                                               docs: state
//                                                                   .musofir
//                                                                   .docs),
//                                                     );
//                                                   },
//                                                   category:
//                                                       state.musofir.category,
//                                                   title: state.musofir.title,
//                                                   body: state.musofir.body,
//                                                 ),
//                                                 BlocBuilder<CommentsBloc,
//                                                     CommentsState>(
//                                                   builder: (context, state1) => CommentsField(
//                                                       onTap: () {
//                                                         Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder: (_) => CommentsPage(
//                                                                     id: state
//                                                                         .musofir
//                                                                         .id,
//                                                                     bloc:
//                                                                         commentsBloc,
//                                                                     canComment: state
//                                                                             .musofir
//                                                                             .myDonationAmount >
//                                                                         0)));
//                                                       },
//                                                       entity: state1.entity,
//                                                       count: state1.count,
//                                                     );
//                                                   },
//                                                 ),
//                                               ],
//                                             ),
//                                             secondChild: ReportTabField(
//                                                 entity: state.musofir.report),
//                                             crossFadeState: tabState,
//                                             duration: const Duration(
//                                                 milliseconds: 150),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ShareButton(
//                                 musofirId: state.musofir.id,
//                                 onTapHelp: () {
//                                   SizeConfig().init(context);
//                                   showModalBottomSheet(
//                                     context: context,
//                                     useRootNavigator: true,
//                                     barrierColor: luckyPoint.withOpacity(.4),
//                                     isScrollControlled: true,
//                                     backgroundColor: Colors.transparent,
//                                     builder: (ctx) => DonationSheet(
//                                       id: widget.musofirId,
//                                       hasTab: false,
//                                       parentContext: context,
//                                       title: state.musofir.title,
//                                     ),
//                                   );
//                                 },
//                                 buttonIcon: AppIcons.kindHand,
//                                 buttonText: LocaleKeys.help.tr(),
//                               ),
//                             ],
//                           ),
//                         )
//                       : state.getSingleStatus.isSubmissionFailure
//                           ? const Scaffold(
//                               body: Center(
//                                 child: Text('error'),
//                               ),
//                             )
//                           : const SizedBox(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
