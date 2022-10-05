import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:dypay/pages/pay/widgets/scanner_overlay.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

class PagePayScanner extends StatefulWidget {
  const PagePayScanner({super.key});

  @override
  State<PagePayScanner> createState() => _PagePayScannerState();
}

class _PagePayScannerState extends State<PagePayScanner> {
  String? barcode;

  MobileScannerController controller = MobileScannerController(
      torchEnabled: false, formats: [BarcodeFormat.qrCode]);

  bool isStarted = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              MobileScanner(
                controller: controller,
                onDetect: (barcode, args) {
                  setState(() {
                    this.barcode = barcode.rawValue;
                  });
                },
              ),
              WScannerOverlay(overlayColour: ThemeColorBlack.withOpacity(0.3)),
              Positioned(
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          splashRadius: 24,
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: ThemeColorWhite,
                            size: 20.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              color: ThemeColorWhite,
                              icon: ValueListenableBuilder(
                                valueListenable: controller.torchState,
                                builder: (context, state, child) {
                                  if (state == null) {
                                    return Icon(
                                      FontAwesomeIcons.bolt,
                                      color: ThemeColorWhite,
                                    );
                                  }
                                  switch (state as TorchState) {
                                    case TorchState.off:
                                      return Icon(
                                        FontAwesomeIcons.bolt,
                                        color: ThemeColorWhite,
                                      );
                                    case TorchState.on:
                                      return Icon(
                                        FontAwesomeIcons.bolt,
                                        color: ThemeColorPrimary,
                                      );
                                  }
                                },
                              ),
                              iconSize: 20.0,
                              onPressed: () => controller.toggleTorch(),
                            ),
                            IconButton(
                              color: ThemeColorWhite,
                              icon: Icon(FontAwesomeIcons.image),
                              iconSize: 20.0,
                              onPressed: () async {
                                final ImagePicker picker = ImagePicker();
                                // Pick an image
                                final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  if (await controller.analyzeImage(image.path)) {
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Barcode found!'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  } else {
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('No barcode found!'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          ]
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 30.0),
                  child: Column(
                    children: [
                      Text('DY-Pay', style: ThemeStyleFontTitleWhite),
                      Text('Powered by DYVUE', style: ThemeStyleFontSubtitleWhite),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 50,
                        child: FittedBox(
                          child: Text(
                            barcode ?? '',
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: ThemeColorWhite),
                          ),
                        ),
                      ),
                    ]
                  ),
                )
              )
            ],
          );
        },
      ),
    );
  }
}
