import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';

class HomePageBottomNavModel {
  HomePageBottomNavModel({required this.icon});
  final String icon;
}

List<HomePageBottomNavModel> homePageBottomNavList = [
  HomePageBottomNavModel(
    icon: Ph.share_bold,
  ),
  HomePageBottomNavModel(
    icon: MaterialSymbols.favorite_outline_rounded,
  ),
  HomePageBottomNavModel(
    icon: Ph.download_simple_bold,
  ),
  HomePageBottomNavModel(
    icon: Ph.dots_three_circle,
  ),
];
