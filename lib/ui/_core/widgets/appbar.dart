import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_imersao_techtaste/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

AppBar getAppBar({
  required BuildContext context,
  String? title,
}) {
  BagProvider bagProvider = Provider.of<BagProvider>(context);

  return AppBar(
    title: title != null ? Text(title) : null,
    actions: [
      badges.Badge(
        showBadge: bagProvider.listDishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(
          start: 0,
          bottom: 0,
        ),
        badgeAnimation: badges.BadgeAnimation.scale(
          animationDuration: Duration(milliseconds: 500),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
        ),
        badgeContent: Text(
          bagProvider.listDishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
