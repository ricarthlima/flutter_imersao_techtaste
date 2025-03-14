import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/data/restaurants_data.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_theme.dart';
import 'package:flutter_imersao_techtaste/ui/_core/bag_provider.dart';
import 'package:flutter_imersao_techtaste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurants();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => restaurantsData),
      ChangeNotifierProvider(create: (context) => BagProvider()),
    ],
    child: const MainApp(),
  ));
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
