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
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            // Update loading bar.
          },
        ),
      )
      // ..loadHtmlString(htmlCode('phone', ''))
      // ..reload()
      ..loadRequest(Uri.parse('https://jivo.chat/J70GNF82kE'));
  }

  String htmlCode(String phone, String userName) {
    const html = r'''
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
        window.$chatwoot?.setUser("id", {
            email: "elzodxon@gmail.com ",
            name: "Elzodxon",
            phone_number: "+998998729201",
        });
        setTimeout(async () => {
            await window.$chatwoot?.toggle("open"); // To open widget
        }, 100)
    </script>
</head>
<body>
</body>
</html>
''';
    return html;
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: 16 + MediaQuery.of(context).padding.bottom,
                    top: 20),
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: ChatAppBar(phone: widget.phone),
              )
            ],
          ),
        ),
      );
}
