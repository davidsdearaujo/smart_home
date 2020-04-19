import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_model.dart';

class CardWidget extends StatefulWidget {
  final CardModel model;
  final VoidCallback onCardStateChange;

  const CardWidget(
    this.model,
    this.onCardStateChange, {
    Key key,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Color get customColor => Theme.of(context).primaryColor.withAlpha(120);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  widget.model.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.model.title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Online",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: customColor,
                          ),
                        ),
                        SizedBox(height: 13),
                        Container(
                          height: 2,
                          color: Theme.of(context).dividerColor,
                          width: 100,
                        ),
                        SizedBox(height: 13),
                        Text(
                          "Alarming",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: customColor,
                          ),
                        ),
                        CupertinoSwitch(
                          value: widget.model.status,
                          trackColor: Theme.of(context).dividerColor,
                          activeColor: Theme.of(context).accentColor,
                          onChanged: (val) {
                            setState(() {
                              widget.model.status = val;
                            });

                            if (widget.onCardStateChange != null) {
                              widget.onCardStateChange();
                            }
                          },
                        ),
                      ],
                    ),
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
