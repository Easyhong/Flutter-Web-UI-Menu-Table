import 'package:admin/menu_change_notifier.dart';
import 'package:admin/pages/responsive.dart';
import 'package:admin/side_menu_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'menu_controller_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web UI Menu Table',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,

        // scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
        //canvasColor: Colors.black54,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuChangeNotifier(),
          ),
        ],
        child: MainHomePage(),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuChangeNotifier>().scaffoldKey,
      // drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                flex: 1,
                // and it takes 1/6 part of the screen
                child: SideMenuTable(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: MenuControllerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
