import 'package:flutter/material.dart';

import 'package:pet_adoption_app/ui/screens/splashScreen/splash_screen.dart';
import 'package:sizer_pro/sizer.dart';

import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
