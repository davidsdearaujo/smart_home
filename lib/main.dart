import 'package:flutter/material.dart';

import 'links.dart' as links;
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const primaryColor = const Color(0xFF3F4FA5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        dividerColor: primaryColor.withAlpha(30),
        accentColor: Color(0xFFFE6491),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w300,
          ),
          subtitle1: TextStyle(
              color: primaryColor.withAlpha(120), fontSize: 15, height: 1.5),
        ),
      ),
      home: FutureBuilder(
        future: Future.wait([
          precacheImage(NetworkImage(links.boneco), context),
          precacheImage(NetworkImage(links.camera), context),
          precacheImage(NetworkImage(links.lampada), context),
          precacheImage(NetworkImage(links.lampadaPhilips), context),
          precacheImage(NetworkImage(links.logo), context),
          precacheImage(NetworkImage(links.luminaria), context),
          precacheImage(NetworkImage(links.nuvem), context),
          precacheImage(NetworkImage(links.raio), context),
          precacheImage(NetworkImage(links.ventilador), context),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            return HomePage();
          }

          return Material(
            color: Theme.of(context).primaryColor,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
