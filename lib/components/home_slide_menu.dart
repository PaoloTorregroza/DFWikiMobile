import 'dart:developer';

import 'package:df_wiki/styles/text.dart';
import 'package:df_wiki/utils/custom_shared_preferences.dart';
import 'package:flutter/material.dart';

class HomeSlideMenu extends StatefulWidget {
  const HomeSlideMenu({Key? key}) : super(key: key);

  @override
  State<HomeSlideMenu> createState() => _HomeSlideMenuState();
}

class _HomeSlideMenuState extends State<HomeSlideMenu> {
  CustomSharedPreferences prefs = CustomSharedPreferences();

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
            onTap: () async {
              final result = await prefs.getEntries();
              print(result);
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
