import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'screens/home_screen.dart';
import 'style/style.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDt6T0a5PcNwHTiHSws1qcy1Myf_jgoITY",
          appId: "1:88767754658:web:dae9bc60c3038141b002fb",
          authDomain: "mental-note-46901.firebaseapp.com",
          messagingSenderId: "88767754658",
          projectId: "mental-note-46901",
          storageBucket: "mental-note-46901.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Comfortaa'),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
              textScaleFactor: data.textScaleFactor * Style.textScaleFactor),
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}
