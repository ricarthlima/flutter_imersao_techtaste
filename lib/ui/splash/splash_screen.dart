import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_imersao_techtaste/ui/_core/dimensions.dart';
import 'package:flutter_imersao_techtaste/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/banners/banner_splash.png",
              width: width(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 128.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 32,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 192,
                    ),
                    Column(
                      children: [
                        Text(
                          "Um parceiro inovador para sua",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "melhor experiência culinária!",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.mainColor,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width(context),
                      child: ElevatedButton(
                        onPressed: () {
                          _onBoraButtonPressed(context);
                        },
                        child: Text("Bora!"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onBoraButtonPressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }
}
