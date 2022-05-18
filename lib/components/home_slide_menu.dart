import 'dart:developer';

import 'package:df_wiki/styles/text.dart';
import 'package:flutter/material.dart';

class HomeSlideMenu extends StatefulWidget {
  const HomeSlideMenu({Key? key}) : super(key: key);

  @override
  State<HomeSlideMenu> createState() => _HomeSlideMenuState();
}

class _HomeSlideMenuState extends State<HomeSlideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text(
              'Favorites',
              style: TextStyles.subtitle,
            ),
            onTap: () {
              log('a');
            },
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text(
              'Offline',
              style: TextStyles.subtitle,
            ),
            onTap: () {
              log('a');
            },
          ),
        ],
      ),
    );
  }
}
