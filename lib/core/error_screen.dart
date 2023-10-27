import 'package:fake_store/core/palette.dart';
import 'package:fake_store/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../products_feature/root.dart';

class ErrorBody extends StatelessWidget {
  final String error;
  final VoidCallback? retry;
  const ErrorBody({required this.error, this.retry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error,
                textAlign: TextAlign.center,
                style: AppTheme.textThemes.titleMedium
                    ?.copyWith(color: Palette.errorColor),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (retry == null) {
                    context.goNamed(Root.name);
                    return;
                  }
                  retry;
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.primaryColor1)),
                child: Text("Retry",
                    style: AppTheme.textThemes.titleLarge
                        ?.copyWith(color: Palette.whiteText)),
              )
            ]),
      ),
    );
  }
}
