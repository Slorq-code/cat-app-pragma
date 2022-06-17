import 'package:cat_aplication/pages/details_screen.dart';
import 'package:cat_aplication/pages/home_screen.dart';
import 'package:cat_aplication/pages/splash_screen.dart';
import 'package:cat_aplication/services/cat_service.dart';
import 'package:flutter/material.dart';
import 'package:cat_aplication/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: unnecessary_new
        ChangeNotifierProvider(create: (_)=> new CatsService() ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cat App',
          initialRoute: 'splash',
          routes: {
            'splash':    ( _ ) => const SplashScreen(),
            'home':    ( _ ) => const HomeScreen(),
          },
          theme: miTema,
          ),
    );
  }
}
