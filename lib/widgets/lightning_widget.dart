import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:animation_helpers/animation_helpers.dart';
import '../links.dart' as links;

class LightningWidget extends StatelessWidget {
  InterpolationController interpolation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (interpolation == null) {
        interpolation = InterpolationController(
          begin: MediaQuery.of(context).size.width,
          end: MediaQuery.of(context).size.width / 4,
        );
      }

      final topPadding = interpolation.linear(
        constraints.maxWidth,
        begin: MediaQuery.of(context).size.width / 15,
        end: MediaQuery.of(context).size.width / 2,
      );

      final topIconsSpace = interpolation.linear(
        constraints.maxWidth,
        begin: MediaQuery.of(context).size.width / 3,
        end: MediaQuery.of(context).size.width / 10,
      );

      final bottomIconsSpace = interpolation.linear(
        constraints.maxWidth,
        begin: MediaQuery.of(context).size.width / 1.6,
        end: MediaQuery.of(context).size.width / 10,
      );

      final topIconSize = interpolation.linear(
        constraints.maxWidth,
        begin: 40,
        end: 10,
      );

      final bottomIconSize = interpolation.linear(
        constraints.maxWidth,
        begin: 50,
        end: 10,
      );

      return Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.width / 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  links.raio,
                  height: topIconSize,
                ),
                SizedBox(width: topIconsSpace),
                Transform(
                  transform: Matrix4.rotationY(pi),
                  child: Image.network(
                    links.raio,
                    height: topIconSize,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 5.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  links.raio,
                  height: bottomIconSize,
                ),
                SizedBox(width: bottomIconsSpace),
                Transform(
                  transform: Matrix4.rotationY(pi),
                  child: Image.network(
                    links.raio,
                    height: bottomIconSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
