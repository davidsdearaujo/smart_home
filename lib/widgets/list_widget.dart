import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/widgets/card/card_model.dart';

import '../links.dart' as links;

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final models = <CardModel>[
    CardModel()
      ..title = "My Lamp"
      ..status = false
      ..imageUrl = links.lampada,
    CardModel()
      ..title = "Philips lamp"
      ..status = false
      ..imageUrl = links.lampadaPhilips,
    CardModel()
      ..title = "Camera"
      ..status = false
      ..imageUrl = links.camera,
    CardModel()
      ..title = "Ventilador"
      ..status = false
      ..imageUrl = links.ventilador,
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25),
        separatorBuilder: (_, i) => Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: Theme.of(context).dividerColor,
          height: 1,
          width: double.infinity,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: models.length,
        itemBuilder: (context, index) {
          final current = models[index];
          return ListTile(
            onTap: () => setState(() => current.status = !current.status),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(current.imageUrl),
              ),
            ),
            trailing: CupertinoSwitch(
              value: current.status,
              trackColor: Theme.of(context).dividerColor,
              activeColor: Theme.of(context).accentColor,
              onChanged: (val) {
                setState(() {
                  current.status = val;
                });
              },
            ),
            subtitle: Text(
              "Online",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  current.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
