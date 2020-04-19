import 'package:flutter/material.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';

import 'links.dart' as links;
import 'widgets/appbar_widget.dart';
import 'widgets/card/card_model.dart';
import 'widgets/clouds_widget.dart';
import 'widgets/lightning_widget.dart';
import 'widgets/list_widget.dart';
import 'widgets/pageview_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  final animationDuration = Duration(milliseconds: 2000);
  double get screenWidth => MediaQuery.of(context).size.width;

  bool get collapsed =>
      cards.firstWhere((e) => e.status, orElse: () => null) == null;

  final cards = <CardModel>[
    CardModel()
      ..imageUrl = links.luminaria
      ..title = "Gateway 1"
      ..status = false,
    CardModel()
      ..imageUrl = links.luminaria
      ..title = "Gateway 2"
      ..status = false,
  ];

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: NoScrollGlow(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  AnimatedContainer(
                    duration: animationDuration,
                    curve: Curves.elasticOut,
                    color: Theme.of(context).primaryColor,
                    height: screenWidth * (collapsed ? 0.8 : 1),
                    width: screenWidth,
                    child: Stack(
                      children: <Widget>[
                        AnimatedPositioned(
                          curve: Curves.elasticOut,
                          duration: animationDuration,
                          top:
                              collapsed ? -screenWidth / 3 : -screenWidth * 0.1,
                          left: collapsed ? 0 : screenWidth / 3.5,
                          right: collapsed ? 0 : -screenWidth / 1.3,
                          child: AnimatedContainer(
                            curve: Curves.elasticOut,
                            duration: animationDuration,
                            width: screenWidth / (collapsed ? 1.5 : 0.9),
                            height: screenWidth / (collapsed ? 1.5 : 0.9),
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.5, 1],
                        colors: [
                          Color(0xFFEDEDFF),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedPositioned(
                curve: Curves.elasticOut,
                top: collapsed ? screenWidth * 0.52 : screenWidth * 0.15,
                left: collapsed ? screenWidth * 0.35 : screenWidth * 0.25,
                right: collapsed ? screenWidth * 0.35 : screenWidth * 0.3,
                duration: animationDuration,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: collapsed ? 0 : 1,
                  child: Image.network(links.boneco),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.elasticOut,
                duration: animationDuration,
                top: collapsed ? 0 : -screenWidth / 2,
                child: CloudsWidget(),
                left: 0,
                right: 0,
              ),
              Center(
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 400),
                  width: collapsed ? screenWidth / 4 : screenWidth,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: collapsed ? 0 : 1,
                    child: LightningWidget(),
                  ),
                ),
              ),
              AppbarWidget(),
              SafeArea(
                child: AnimatedPadding(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 400),
                  padding: collapsed
                      ? EdgeInsets.zero
                      : EdgeInsets.only(top: screenWidth * 0.25),
                  child: Column(
                    children: <Widget>[
                      DefaultTextStyle(
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            .copyWith(
                                fontSize: 18, fontWeight: FontWeight.w300),
                        child: Padding(
                          padding:
                              EdgeInsets.fromLTRB(25, screenWidth / 4, 25, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: "Stan's\n"),
                                  TextSpan(
                                    text: "Office",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ]),
                              ),
                              Text(
                                "23° indoor\nDoor closed",
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      PageviewWidget(
                        controller,
                        models: cards,
                        onCardStateChange: () => setState(() {}),
                      ),
                      ListWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
