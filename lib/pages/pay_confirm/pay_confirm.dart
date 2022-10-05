import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

class PagePayConfirm extends StatefulWidget {
  const PagePayConfirm({super.key});

  @override
  State<PagePayConfirm> createState() => _PagePayConfirmState();
}

class _PagePayConfirmState extends State<PagePayConfirm> {
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
          "Konfirmasi",
          style: ThemeStyleFontHeader,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah',
              style: ThemeStyleFontDisable,
              textAlign: TextAlign.left,
            ),
            TextField(
              inputFormatters: <TextInputFormatter>[CurrencyTextInputFormatter(
                locale: 'id',
                decimalDigits: 0,
                symbol: 'Rp'
              )],
              keyboardType: TextInputType.number,
              maxLength: 13,
              decoration: InputDecoration(
                hintText: 'Rp0',
              ),
              style: ThemeStyleFontHeader,
            ),
          ],
        ),
      ),
    );
  }
}