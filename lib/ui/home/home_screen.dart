import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 147,
                ),
              ),
              Text("Boas vindas!"),
              TextFormField(),
              Text("Escolha por categoria"),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
            ],
          ),
        ),
      ),
    );
  }
}
