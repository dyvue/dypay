import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

class PageTransaction extends StatefulWidget {
  const PageTransaction({super.key});

  @override
  State<PageTransaction> createState() => _PageTransactionState();
}

class _PageTransactionState extends State<PageTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 24,
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: ThemeColorBlack,
            size: 20.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Riwayat Transaksi',
          style: ThemeStyleFontHeader,
        ),
      )
    );
  }
}