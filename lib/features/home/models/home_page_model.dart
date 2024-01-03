import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/icons/carbon.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';

class HomePageBottomNavModel {
  HomePageBottomNavModel({required this.icon, required this.onTap});
  final String icon;
  final VoidCallback onTap;
}

List<HomePageBottomNavModel> homePageBottomNavList = [
  HomePageBottomNavModel(
    icon: Ph.share_bold,
    onTap: () {},
  ),
  HomePageBottomNavModel(
    icon: MaterialSymbols.favorite_outline_rounded,
    onTap: () {},
  ),
  HomePageBottomNavModel(
    icon: Ph.download_simple_bold,
    onTap: () {},
  ),
  HomePageBottomNavModel(
    icon: Carbon.settings,
    onTap: () {},
  ),
];
