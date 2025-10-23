import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:killqwerty_flutter/di/injections.dart' as di;
import 'package:killqwerty_flutter/routes/AppRouter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appRouter = AppRouter();
  runApp(MyApp(router: appRouter.router));
}

class MyApp extends StatelessWidget {
  final GoRouter? router;
  const MyApp({super.key, this.router});

  @override
  Widget build(BuildContext context) {
    final goRouter = router ?? AppRouter().router;
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Ki11Qwerty flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
