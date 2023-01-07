
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/bloc/add_photo/image_bloc.dart';
import 'package:auto/features/profile/domain/entities/message_entity.dart';
import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:auto/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ChatPage extends StatefulWidget {
  final bool hasChat;
  final ImageBloc imageBloc;
  final String phone;
  final String userName;

  const ChatPage({
    required this.hasChat,
    required this.imageBloc,
    required this.phone,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late InAppWebViewController _contoller;
  String chatwoot = 'chatwoot';

  String htmlCode(String chatwoot, String phone, String userName) {
    final html = '''
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
    <style>
        .woot-widget-bubble.woot-elements--right{
            display: none !important;
        }
    </style>
    <script>
        (function(d,t) {
            var BASE_URL="https://chat.uicgroup.tech";
            var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=BASE_URL+"/packs/js/sdk.js";
            g.defer = true;
            g.async = true;
            s.parentNode.insertBefore(g,s);
            g.onload=function(){
                window.chatwootSDK.run({
                    websiteToken: 'mnqYhsT6uekwhXN1c6ToQcdc',
                    baseUrl: BASE_URL
                })
            }
        })(document,"script");
         window.\$chatwoot?.setUser("id", {
            name: $userName,
            phone_number: $phone,
        });
        setTimeout(async ()=> {
            await window.$chatwoot.toggle("open"); // To open widget
        }, 100)
    </script>
</head>
<body>
</body>
</html>''';
    return html;
  }

  // @override
  // void initState() {
  //   // final controller =
  //   //     WebViewController();
  //   // ignore: cascade_invocations
  //   // controller
  //   //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   //   ..loadRequest(Uri.parse('https://flutter.dev'));
  //   // // #enddocregion platform_features
  //   // _contoller = controller;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: const WAppBarChild(),
          body: Column(
            children: [
              Expanded(
                child: InAppWebView(
                  onWebViewCreated: (controller) {
                    _contoller = controller;
                    _contoller.loadData(data: htmlCode(chatwoot, widget.phone, 'Elzodxon'));
                  },
                  // initialData: InAppWebViewInitialData(
                  //     data: htmlCode(chatwoot, widget.phone, 'Elzodxon'),
                  //     //  baseUrl:Uri.parse( 'https://chat.uicgroup.tech'0
                  //     baseUrl: Uri.parse('http://localhost')),
                ),
              ),
            ],
          ),
        ),
      );
}

List<MessageEntity> messages = [
  MessageEntity(
      user: AppIcons.checks,
      text: LocaleKeys.hello.tr(),
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSendByMe: true,
      id: 1),
  MessageEntity(
      user: 'Тешмат',
      text:
          'Здравствуйте, уважаемый клиент! \nЭто служба поддержки auto.uz \nМы к вашим услугам 24 часа в сутки. \nМы общаемся на узбекском, русском и английском языках и ответим на любые интересующие вас вопросы',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSendByMe: false,
      id: 1),
];

// widget.hasChat
          //     ? Center(
          //         child: Container(
          //             decoration: BoxDecoration(
          //               color: Theme.of(context).appBarTheme.backgroundColor,
          //               borderRadius: BorderRadius.circular(12),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.black.withOpacity(0.05),
          //                   spreadRadius: 0,
          //                   blurRadius: 16,
          //                   offset: const Offset(
          //                       0, 4), // changes position of shadow
          //                 ),
          //               ],
          //             ),
          //             margin: const EdgeInsets.symmetric(horizontal: 75),
          //             padding: const EdgeInsets.all(16),
          //             height: 200,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.only(top: 8),
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     boxShadow: [
          //                       BoxShadow(
          //                           color: yellowShadow.withOpacity(0.3),
          //                           spreadRadius: 15,
          //                           blurRadius: 30,
          //                           offset: const Offset(0, 5)),
          //                     ],
          //                   ),
          //                   child: Image.asset(
          //                     AppImages.hello,
          //                     height: 56,
          //                   ),
          //                 ),
          //                 const SizedBox(height: 13),
          //                 Text(
          //                   'auto.uz',
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .headline1!
          //                       .copyWith(fontSize: 24),
          //                 ),
          //                 Text(
          //                   LocaleKeys.there_you_can.tr(),
          //                   textAlign: TextAlign.center,
          //                   style: Theme.of(context).textTheme.headline2,
          //                 ),
          //               ],
          //             )),
          //       )
          //     : Builder(
          //         builder: (context) => Column(
          //           children: [
          //             Expanded(
          //               child: GroupedListView<MessageEntity, DateTime>(
          //                 padding: const EdgeInsets.all(8),
          //                 elements: messages,
          //                 groupBy: (messages) => DateTime(
          //                   messages.date.year,
          //                 ),
          //                 groupHeaderBuilder: (message) => const SizedBox(),
          //                 itemBuilder: (context, message) => message.isSendByMe
          //                     ? Container(
          //                         margin: const EdgeInsets.only(right: 16),
          //                         child: Column(
          //                           crossAxisAlignment: CrossAxisAlignment.end,
          //                           children: [
          //                             Container(
          //                               padding: const EdgeInsets.symmetric(
          //                                   horizontal: 12, vertical: 8),
          //                               decoration: const BoxDecoration(
          //                                   borderRadius: BorderRadius.only(
          //                                       topLeft: Radius.circular(16),
          //                                       topRight: Radius.circular(16),
          //                                       bottomLeft: Radius.circular(16),
          //                                       bottomRight:
          //                                           Radius.circular(4)),
          //                                   color: orange),
          //                               child: Text(
          //                                 message.text,
          //                                 style: Theme.of(context)
          //                                     .textTheme
          //                                     .headline4!
          //                                     .copyWith(
          //                                         fontSize: 14,
          //                                         fontWeight: FontWeight.w400),
          //                               ),
          //                             ),
          //                             Row(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.end,
          //                               children: [
          //                                 Text(
          //                                   '${message.date.hour}:${message.date.minute}',
          //                                   style: Theme.of(context)
          //                                       .textTheme
          //                                       .headline6!
          //                                       .copyWith(
          //                                           fontSize: 14,
          //                                           fontWeight:
          //                                               FontWeight.w400),
          //                                 ),
          //                                 const SizedBox(width: 4),
          //                                 SvgPicture.asset(
          //                                   message.user,
          //                                   color: Theme.of(context)
          //                                       .extension<ThemedColors>()!
          //                                       .darkToPurple,
          //                                 )
          //                               ],
          //                             )
          //                           ],
          //                         ),
          //                       )
          //                     : Container(
          //                         margin: const EdgeInsets.only(top: 16),
          //                         child: Row(
          //                           crossAxisAlignment: CrossAxisAlignment.end,
          //                           children: [
          //                             Container(
          //                               margin: const EdgeInsets.only(
          //                                   right: 8, bottom: 22),
          //                               height: 40,
          //                               width: 40,
          //                               decoration: const BoxDecoration(
          //                                 image: DecorationImage(
          //                                   image: AssetImage(
          //                                     AppImages.autoUzCircle,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 Container(
          //                                   width: 283,
          //                                   padding: const EdgeInsets.fromLTRB(
          //                                       12, 8, 12, 12),
          //                                   decoration: BoxDecoration(
          //                                     borderRadius:
          //                                         const BorderRadius.only(
          //                                             topLeft:
          //                                                 Radius.circular(16),
          //                                             topRight:
          //                                                 Radius.circular(16),
          //                                             bottomRight:
          //                                                 Radius.circular(16),
          //                                             bottomLeft:
          //                                                 Radius.circular(4)),
          //                                     color: Theme.of(context)
          //                                         .extension<ThemedColors>()!
          //                                         .greyToDarkRider,
          //                                   ),
          //                                   child: Column(
          //                                     crossAxisAlignment:
          //                                         CrossAxisAlignment.start,
          //                                     children: [
          //                                       Text(
          //                                         'auto.uz',
          //                                         style: Theme.of(context)
          //                                             .textTheme
          //                                             .headline1!
          //                                             .copyWith(
          //                                                 fontSize: 14,
          //                                                 fontWeight:
          //                                                     FontWeight.w600),
          //                                       ),
          //                                       const SizedBox(height: 4),
          //                                       Text(
          //                                         message.text,
          //                                         style: Theme.of(context)
          //                                             .textTheme
          //                                             .headline2,
          //                                       ),
          //                                     ],
          //                                   ),
          //                                 ),
          //                                 const SizedBox(height: 4),
          //                                 Text(
          //                                   '${message.date.hour}:${message.date.minute} • ${message.user}',
          //                                   style: Theme.of(context)
          //                                       .textTheme
          //                                       .headline6!
          //                                       .copyWith(
          //                                           fontSize: 14,
          //                                           fontWeight:
          //                                               FontWeight.w400),
          //                                 ),
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          // bottomNavigationBar: Container(
          //   padding: const EdgeInsets.all(8),
          //   color: Theme.of(context).appBarTheme.backgroundColor,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //             child: WTextField(
          //               focusColor:
          //                   Theme.of(context).appBarTheme.backgroundColor,
          //               borderColor: purple,
          //               cursorColor: purple,
          //               disabledColor: Theme.of(context)
          //                   .extension<ThemedColors>()!
          //                   .whiteToNero1,
          //               height: 44,
          //               prefix: WScaleAnimation(
          //                 onTap: () {
          //                   showModalBottomSheet(
          //                     // isScrollControlled: true,
          //                     context: context,
          //                     useRootNavigator: true,
          //                     backgroundColor: Colors.transparent,
          //                     // constraints: BoxConstraints(
          //                     //     maxHeight:
          //                     //         MediaQuery.of(context).size.height * 0.3,
          //                     //     minWidth: MediaQuery.of(context).size.width),
          //                     builder: (context) => CameraBottomSheet(
          //                         imageBloc: widget.imageBloc),
          //                   );
          //                 },
          //                 child: Container(
          //                   height: 32,
          //                   width: 32,
          //                   margin: const EdgeInsets.all(6),
          //                   padding: const EdgeInsets.all(4),
          //                   decoration: BoxDecoration(
          //                       color: Theme.of(context)
          //                           .extension<ThemedColors>()!
          //                           .greyToDarkRider,
          //                       borderRadius: BorderRadius.circular(6)),
          //                   child: SvgPicture.asset(
          //                     AppIcons.piperClip,
          //                     color: Theme.of(context)
          //                         .extension<ThemedColors>()!
          //                         .darkToGrey,
          //                   ),
          //                 ),
          //               ),
          //               borderRadius: 8,
          //               textStyle: Theme.of(context)
          //                   .textTheme
          //                   .headline1!
          //                   .copyWith(
          //                       fontWeight: FontWeight.w600, fontSize: 14),
          //               hintText: LocaleKeys.write_message.tr(),
          //               hintTextStyle: Theme.of(context)
          //                   .textTheme
          //                   .headline2!
          //                   .copyWith(
          //                       fontWeight: FontWeight.w600, fontSize: 14),
          //               onChanged: (tmp) {},
          //               controller: TextEditingController(),
          //               filled: true,
          //               contentPadding:
          //                   const EdgeInsets.symmetric(horizontal: 16),
          //               fillColor: borderCircular,
          //             ),
          //           ),
          //           WScaleAnimation(
          //             onTap: () {},
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   vertical: 20, horizontal: 18),
          //               child: SvgPicture.asset(AppIcons.send),
          //             ),
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: MediaQuery.of(context).viewInsets.bottom,
          //       ),
          //     ],
          //   ),
          // ),