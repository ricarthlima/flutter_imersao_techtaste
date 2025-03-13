import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/data/restaurants_data.dart';
import 'package:flutter_imersao_techtaste/models/restaurant.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_theme.dart';
import 'package:flutter_imersao_techtaste/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<Restaurant> listRest = await RestaurantsData().getRestaurants();
  print(listRest);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
