import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'card/card_model.dart';
import 'card/card_widget.dart';

class PageviewWidget extends StatelessWidget {
  final PageController controller;
  final List<CardModel> models;
  final VoidCallback onCardStateChange;

  const PageviewWidget(
    this.controller, {
    Key key,
    this.onCardStateChange,
    @required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 2 / 1,
          child: PageView(
            controller: controller,
            children: models
                .map((model) => CardWidget(model, onCardStateChange))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: SmoothPageIndicator(
            controller: controller,
            count: models.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ),
      ],
    );
  }
}
