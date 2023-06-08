import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/auth/login_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/auth/auth_view_model.dart';
// import 'package:furniture_e_commerce/view/screens/home/home_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/bottom_navigation_bar/bottom_navbar_viewmodel.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarComponentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Furniture App',
        theme: ThemeData(
          primaryColor: whiteColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
