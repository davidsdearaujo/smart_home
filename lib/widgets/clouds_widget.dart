import 'package:flutter/material.dart';
import '../links.dart' as links;

class CloudsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.width / 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            links.nuvem,
            height: 15,
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 15),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 15,
            ),
            child: Image.network(
              links.nuvem,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
