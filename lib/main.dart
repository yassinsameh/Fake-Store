import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router.dart';
import 'core/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProviderSingleton = ref.watch(routerProvider);

    return MaterialApp.router(
        routerConfig: routerProviderSingleton.router,
        title: 'Fake Store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData);
  }
}
