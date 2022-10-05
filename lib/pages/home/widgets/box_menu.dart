import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dypay/pages/pay/scanner.dart';
import 'package:dypay/pages/pay_confirm/pay_confirm.dart';
import 'package:dypay/pages/settings/settings.dart';
import 'package:dypay/pages/transaction/transaction.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

class WBoxMenu extends StatelessWidget {
  const WBoxMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10.0),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PagePayScanner();
              }));
            },
                Icon(
                  FontAwesomeIcons.solidCircleUp,
                  color: ThemeColorPrimary,
                  size: 24.0,
                ),
                'Bayar/Beli'),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PagePayConfirm();
              }));
            },
                Icon(
                  FontAwesomeIcons.plusCircle,
                  color: ThemeColorPrimary,
                  size: 24.0,
                ),
                'Top Up'),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PagePayScanner();
              }));
            },
                Icon(
                  FontAwesomeIcons.solidCircleDown,
                  color: ThemeColorPrimary,
                  size: 24.0,
                ),
                'Request'),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PageTransaction();
              }));
            },
                Icon(
                  FontAwesomeIcons.receipt,
                  color: ThemeColorPrimary,
                  size: 22.0,
                ),
                'Transaksi'),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PagePayScanner();
              }));
            },
                Icon(
                  FontAwesomeIcons.solidQuestionCircle,
                  color: ThemeColorPrimary,
                  size: 24.0,
                ),
                'Bantuan'),
            BoxMenuItem(context, () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PageSettings();
              }));
            },
                Icon(
                  FontAwesomeIcons.cog,
                  color: ThemeColorPrimary,
                  size: 24.0,
                ),
                'Pengaturan'),
            SizedBox(width: 10.0),
          ],
        ),
      ),
    );
  }

  TextButton BoxMenuItem(BuildContext context, onPressed, icon, text) {
    return TextButton(
        onPressed: onPressed,
        child: Column(
          children: [
            CircleAvatar(
                radius: 28.0,
                backgroundColor: ThemeColorPrimary.withOpacity(0.1),
                child: icon),
            SizedBox(height: 8.0),
            Text(text, style: ThemeStyleFontBoxMenu)
          ],
        ));
  }
}
