import 'package:flutter/material.dart';

import 'mainMenuWidgets.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBarMenu(
            icon: const Icon(Icons.apps),
            func: () => Scaffold.of(context).openDrawer(),
            addFavourites: false,
          ),
          Expanded(
            child: ListView(
              primary: false,
              children: const [
                HookahMap(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
