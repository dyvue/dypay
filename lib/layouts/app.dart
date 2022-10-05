import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:dypay/pages/settings/settings.dart';
import 'package:dypay/pages/transaction/transaction.dart';
import 'package:dypay/pages/home/home.dart';
import 'package:dypay/theme/colors.dart';
import 'package:dypay/theme/styles.dart';

import '../pages/pay/scanner.dart';

class LayoutApp extends StatefulWidget {
  const LayoutApp({super.key});

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  int _pageIndex = 0;
  late PageController _pageController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Container(
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _pageIndex = index);
              },
              children: <Widget>[
                PageHome(),
                PageTransaction(),
                PageSettings(),
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
        decoration: BoxDecoration(
          color: ThemeColorPrimary,
          boxShadow: [
            BoxShadow(
              color: ThemeColorGray.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavyBar(
          showElevation: false,
          backgroundColor: ThemeColorPrimary,
          iconSize: 20,
          selectedIndex: _pageIndex,
          onItemSelected: (index) {
            setState(() => _pageIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                title: Text(
                  'DY-Pay',
                  style: ThemeStyleFontNavbar,
                ),
                icon: Icon(FontAwesomeIcons.wallet),
                activeColor: ThemeColorWhite,
                inactiveColor: ThemeColorWhite),
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                title: Text(
                  'Transaksi',
                  style: ThemeStyleFontNavbar,
                ),
                icon: Icon(FontAwesomeIcons.receipt),
                activeColor: ThemeColorWhite,
                inactiveColor: ThemeColorWhite),
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                title: Text(
                  'Pengaturan',
                  style: ThemeStyleFontNavbar,
                ),
                icon: Icon(FontAwesomeIcons.gear),
                activeColor: ThemeColorWhite,
                inactiveColor: ThemeColorWhite),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initialization();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  void _onLoading() async {
    // your api here
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    // your api here
    _refreshController.refreshCompleted();
  }
}
