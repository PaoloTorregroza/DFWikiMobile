import 'package:df_wiki/components/df_icon_button.dart';
import 'package:df_wiki/components/favorite_card.dart';
import 'package:df_wiki/pages/search.dart';
import 'package:df_wiki/styles/slide_animation.dart';
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
      bottom: false,
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
                      children: <Widget>[
                        DFIconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlideInRoute(
                                page: const DFSearch(),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        DFIconButton(
                          icon: const Icon(Icons.menu_book),
                          onPressed: () {},
                        ),
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: FavoriteCard(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
