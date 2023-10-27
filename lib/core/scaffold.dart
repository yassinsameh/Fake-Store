import 'package:fake_store/core/palette.dart';
import 'package:fake_store/core/theme.dart';
import 'package:flutter/material.dart';

class GeneralScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  const GeneralScaffold(
      {super.key, required this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Palette.primaryColor1,
          title: Text(
            "Fake Store",
            style: AppTheme.textThemes.titleMedium,
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: body);
  }
}
