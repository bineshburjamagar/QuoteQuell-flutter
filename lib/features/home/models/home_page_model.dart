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
    icon: Ph.paint_brush_broad,
    onTap: () {},
  ),
  HomePageBottomNavModel(
    icon: Carbon.settings,
    onTap: () {},
  ),
];

List<String> quotes = [
  "The only way to do great work is to love what you do. - Steve Jobs",
  "In three words I can sum up everything I've learned about life: it goes on. - Robert Frost",
  "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
  "The only limit to our realization of tomorrow will be our doubts of today. - Franklin D. Roosevelt",
  "The greatest glory in living lies not in never falling, but in rising every time we fall. - Nelson Mandela",
  "The only person you are destined to become is the person you decide to be. - Ralph Waldo Emerson",
  "Be yourself; everyone else is already taken. - Oscar Wilde",
  "Life is what happens when you're busy making other plans. - Allen Saunders",
  "Believe you can and you're halfway there. - Theodore Roosevelt",
  "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
];
