import 'package:flutter/material.dart';
import '../links.dart' as links;

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(
              links.logo,
              width: 25,
            ),
            Icon(
              Icons.menu,
              size: 35,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
