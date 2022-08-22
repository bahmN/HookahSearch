import 'package:flutter/material.dart';

import '../mainMenu/mainMenuWidgets.dart';
import 'infoMenuWidgets.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key, required this.id}) : super(key: key);
  final int? id;
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.id != null && widget.id != -1) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBarMenu(
                  icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                  func: () => Navigator.pop(context),
                  addFavourites: true,
                ),
                Galary(id: widget.id),
                NameHookah(
                  id: widget.id,
                ),
                AllInfo(id: widget.id),
              ],
            ),
          ),
        ),
      );
    } else {
      return const ErrorScreen(
        title:
            'Упс... Кажется, Вы не выбрали место где хотите отдохнуть... Нажмите на экран и выбирите на карте любую кальянную, чтобы узнать о ней информацию',
        onTap: true,
      );
    }
  }
}
