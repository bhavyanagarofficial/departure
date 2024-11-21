import 'package:departure/Screen/HomePage/View/homePage.dart';
import 'package:departure/Screen/SplashScreen/splashScreen.dart';
import 'package:departure/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/HomePage/Provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GitaJsonProvider()),
      ],
      child: Consumer<GitaJsonProvider>(
        builder: (context, gitaJsonProvider, child) {
          return MaterialApp(
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: gitaJsonProvider.isDark ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}