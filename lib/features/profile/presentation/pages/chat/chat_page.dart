import 'package:auto/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatPage extends StatefulWidget {
  final String phone;
  final String userName;

  const ChatPage({
    required this.phone,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // late InAppWebViewController _webViewController;
  late WebViewController webViewController;

  String htmlCode(String phone, String userName) {
    final html = '''
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
    <style>
        .woot-widget-bubble.woot-elements--right {
            display: none !important;
        }
    </style>
    <script>
        (function (d, t) {
            var BASE_URL = "https://chat.uicgroup.tech";
            var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
            g.src = BASE_URL + "/packs/js/sdk.js";
            g.defer = true;
            g.async = true;
            s.parentNode.insertBefore(g, s);
            g.onload = function () {
                window.chatwootSDK.run({
                    websiteToken: 'mnqYhsT6uekwhXN1c6ToQcdc',
                    baseUrl: BASE_URL
                })
            }
        })(document, "script");
        window.\$chatwoot?.setUser("id", {
            name: "$userName",
            phone_number: "$phone",
        });
        setTimeout(async () => {
            await window.\$chatwoot.toggle("open"); // To open widget
        }, 100)
    </script>
</head>
<body>
  <h1>Bu html code ishlayotganidan dalolat</h1>
  <h1>Hozircha xabar jo'natish ishlamayapti</h1>
  <button>button</button>
</body>
</html>''';
    return html;
  }

  @override
  void initState() {
    final controller = WebViewController();
    // ignore: cascade_invocations
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlCode(widget.phone, widget.userName));
    webViewController = controller;
    // webViewController.loadHtmlString(htmlCode(widget.phone, widget.userName));

    super.initState();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
            appBar: ChatAppBar(phone: widget.phone),
            body:
//             InAppWebView(
//               initialData: InAppWebViewInitialData(data: '''
// <!doctype html>
// <html lang="en">
// <head>
//     <meta charset="UTF-8">
//     <meta name="viewport"
//         content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
//     <title>Document</title>
//     <style>
//         .woot-widget-bubble.woot-elements--right {
//             display: none !important;
//         }
//     </style>
//     <script>
//         (function (d, t) {
//             var BASE_URL = "https://chat.uicgroup.tech";
//             var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
//             g.src = BASE_URL + "/packs/js/sdk.js";
//             g.defer = true;
//             g.async = true;
//             s.parentNode.insertBefore(g, s);
//             g.onload = function () {
//                 window.chatwootSDK.run({
//                     websiteToken: 'mnqYhsT6uekwhXN1c6ToQcdc',
//                     baseUrl: BASE_URL
//                 })
//             }
//         })(document, "script");
//         window.\$chatwoot?.setUser("id", {
//             name: "${widget.userName}",
//             phone_number: "${widget.phone}",
//         });
//         setTimeout(async () => {
//             await window.\$chatwoot.toggle("open"); // To open widget
//         }, 100)
//     </script>
// </head>
// <body>
// <h1>JavaScript Handlers (Channels) TEST</h1>
// </body>
// </html>'''),
//               initialOptions: InAppWebViewGroupOptions(
//                   crossPlatform: InAppWebViewOptions(
//                 javaScriptEnabled: true,
//               )),
//               onWebViewCreated: (controller) {
//                 _webViewController = controller;
//               },
//             )
                WebViewWidget(controller: webViewController)),
      );
}
