import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/ad/presentation/posting_ad_screen.dart';
import 'package:auto/features/common/widgets/w_button.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:auto/features/navigation/presentation/home.dart';
import 'package:auto/features/navigation/presentation/navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(flex: 4, child: _buildQrView(context)),
          ],
        ),
      );

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = MediaQuery.of(context).size.width - 128;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      alignment: Alignment.center,
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderRadius: 8,
              borderLength: 0,
              borderWidth: 1,
              cutOutWidth: 343,
              cutOutHeight: 64),
          onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 15,
          left: 16,
          child: WScaleAnimation(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(fade(page: const HomeScreen()));
            },
            child: SvgPicture.asset(
              AppIcons.chevronLeft,
              height: 24,
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).padding.top + 15,
            child: Text(
              'Сканер VIN',
              style: Theme.of(context).textTheme.headline4,
            )),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.8,
          child: Container(
              margin: const EdgeInsets.all(8),
              child: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (result != null) {
                    return Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: border.withOpacity(0.7)));
                  } else {
                    return Text(
                      'Scan a code',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: border.withOpacity(0.7)),
                    );
                  }
                },
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3.5 + scanArea,
          child: WButton(
            padding: EdgeInsets.all(10),
            color: white,
            shadow: const [
              BoxShadow(
                color: Color(0x3DEA5930),
                blurRadius: 44,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            onTap: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
            child: FutureBuilder(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data as bool) {
                  return SvgPicture.asset(
                    AppIcons.flashOn,
                  );
                } else {
                  return SvgPicture.asset(
                    AppIcons.flashOff,
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 + scanArea,
          left: 16,
          right: 16,
          child: WButton(
              color: white,
              shadow: [
                BoxShadow(
                  color: white.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
              onTap: () => Navigator.of(context)
                  .push(fade(page: const PostingAdScreen())),
              child: Text(
                'Ввести вручную',
                style: Theme.of(context).textTheme.button,
              )),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
