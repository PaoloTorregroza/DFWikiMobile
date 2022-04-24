import 'package:df_wiki/components/df_icon_button.dart';
import 'package:df_wiki/components/favorite_card.dart';
import 'package:flutter/material.dart';

class DFHome extends StatefulWidget {
  const DFHome({Key? key}) : super(key: key);

  @override
  State<DFHome> createState() => DFHomeState();
}

class DFHomeState extends State<DFHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const <Widget>[
                        DFIconButton(),
                        Spacer(),
                        DFIconButton(),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Dwarf Fortress Wiki",
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const <Widget>[FavoriteCard()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
