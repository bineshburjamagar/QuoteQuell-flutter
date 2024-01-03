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

class QuoteModel {
  final String quote;
  final bool isFavorite;
  final String author;
  final String backgroundImage;

  QuoteModel({
    required this.quote,
    this.isFavorite = false,
    required this.author,
    required this.backgroundImage,
  });
}

List<QuoteModel> quotesList = [
  QuoteModel(
    quote: "The only way to do great work is to love what you do.",
    isFavorite: true,
    author: "Steve Jobs",
    backgroundImage: "https://source.unsplash.com/featured/?work,love",
  ),
  QuoteModel(
    quote: "Life is what happens when you're busy making other plans.",
    isFavorite: false,
    author: "John Lennon",
    backgroundImage: "https://source.unsplash.com/featured/?life,plans",
  ),
  QuoteModel(
    quote:
        "In the end, we will remember not the words of our enemies, but the silence of our friends.",
    isFavorite: true,
    author: "Martin Luther King Jr.",
    backgroundImage: "https://source.unsplash.com/featured/?friends,silence",
  ),
  // Add more data entries with appropriate Unsplash image URLs
  QuoteModel(
    quote:
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    isFavorite: false,
    author: "Winston Churchill",
    backgroundImage: "https://source.unsplash.com/featured/?success,courage",
  ),
  QuoteModel(
    quote: "The purpose of our lives is to be happy.",
    isFavorite: true,
    author: "Dalai Lama",
    backgroundImage: "https://source.unsplash.com/featured/?happy,life",
  ),
  QuoteModel(
    quote:
        "The only limit to our realization of tomorrow will be our doubts of today.",
    isFavorite: false,
    author: "Franklin D. Roosevelt",
    backgroundImage: "https://source.unsplash.com/featured/?limit,doubts",
  ),
  QuoteModel(
    quote: "Believe you can and you're halfway there.",
    isFavorite: true,
    author: "Theodore Roosevelt",
    backgroundImage: "https://source.unsplash.com/featured/?believe,you",
  ),
  QuoteModel(
    quote: "The best way to predict the future is to create it.",
    isFavorite: false,
    author: "Peter Drucker",
    backgroundImage: "https://source.unsplash.com/featured/?future,create",
  ),
  QuoteModel(
    quote: "Your time is limited, don't waste it living someone else's life.",
    isFavorite: true,
    author: "Steve Jobs",
    backgroundImage: "https://source.unsplash.com/featured/?time,waste",
  ),
  QuoteModel(
    quote: "Strive not to be a success, but rather to be of value.",
    isFavorite: false,
    author: "Albert Einstein",
    backgroundImage: "https://source.unsplash.com/featured/?strive,value",
  ),
  QuoteModel(
    quote:
        "The only person you are destined to become is the person you decide to be.",
    isFavorite: true,
    author: "Ralph Waldo Emerson",
    backgroundImage: "https://source.unsplash.com/featured/?destined,decide",
  ),
  QuoteModel(
    quote: "Don't watch the clock; do what it does. Keep going.",
    isFavorite: false,
    author: "Sam Levenson",
    backgroundImage: "https://source.unsplash.com/featured/?clock,keepgoing",
  ),
];
