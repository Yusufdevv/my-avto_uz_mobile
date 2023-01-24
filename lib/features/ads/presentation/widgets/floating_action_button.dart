// floatingActionButtonLocation:
//                   FloatingActionButtonLocation.startFloat,
//               floatingActionButton: state.isHistory
//                   ? const SizedBox()
//                   : WScaleAnimation(
//                       onTap: () {
//                         context
//                             .read<AnnouncementListBloc>()
//                             .add(AnnouncementListEvent.getIsHistory(true));
//                         setState(() {});
//                       },
//                       child: AnimatedContainer(
//                         alignment: crossFadeState == CrossFadeState.showFirst
//                             ? const Alignment(-.2, 0)
//                             : const Alignment(-.85, 0),
//                         width: crossFadeState == CrossFadeState.showFirst
//                             ? double.maxFinite
//                             : 44,
//                         height: 44,
//                         duration: fadeDuration,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: orange,
//                               borderRadius: BorderRadius.circular(22)),
//                           width: crossFadeState == CrossFadeState.showFirst
//                               ? 221
//                               : 44,
//                           height: 44,
//                           child: AnimatedCrossFade(
//                             alignment: Alignment.center,
//                             duration: fadeDuration,
//                             crossFadeState: crossFadeState,
//                             firstChild: Padding(
//                               padding: const EdgeInsets.only(top: 12),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   if (_scrollController.hasClients)
//                                     _scrollController.offset <= 70
//                                         ? const FittedBox(
//                                             fit: BoxFit.cover,
//                                             child: Text(
//                                               'Сохранить поиск',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: white,
//                                               ),
//                                             ),
//                                           )
//                                         : const Text('')
//                                   else
//                                     const Text(
//                                       'Сохранить поиск',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: white,
//                                       ),
//                                     ),
//                                   SvgPicture.asset(
//                                     AppIcons.searchWithHeartWhite,
//                                     height: 20,
//                                     width: 20,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             secondChild: Padding(
//                               padding: const EdgeInsets.only(top: 12, left: 12),
//                               child: SvgPicture.asset(
//                                 AppIcons.searchWithHeartWhite,
//                                 height: 20,
//                                 width: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
            