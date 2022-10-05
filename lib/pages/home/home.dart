import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dypay/helpers/factories.dart';
import 'package:dypay/helpers/times.dart';
import 'package:dypay/pages/home/widgets/banner.dart';
import 'package:dypay/pages/home/widgets/box_menu.dart';
import 'package:dypay/pages/pay/scanner.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    final String regardsTime = TimesGreeting();
    final String regardsName = StringGetFirstWord('Romadhan Edy Prasetyo');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "DY-Pay",
          style: ThemeStyleFontHeader,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 24,
            icon: Icon(
              FontAwesomeIcons.bell,
              color: ThemeColorBlack,
              size: 20.0,
            ),
          ),
        ],
      ),
      backgroundColor: ThemeColorWhite,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${regardsTime}, ${regardsName}',
                    style: ThemeStyleFontTitle,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Saldo DY-Pay',
                    style: ThemeStyleFontDisable,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp1.234.567',
                    style: ThemeStyleFontBalance,
                  ),
                ],
              ),
            ),
            WBoxMenu(),
            SizedBox(height: 25),
            WBanner(),
          ]
        ),
      )
    );
  }
}
