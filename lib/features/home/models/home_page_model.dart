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
    isFavorite: false,
    author: "Steve Jobs",
    backgroundImage: "https://example.com/image1.jpg",
  ),
  QuoteModel(
    quote:
        "In three words I can sum up everything I've learned about life: it goes on.",
    isFavorite: true,
    author: "Robert Frost",
    backgroundImage: "https://example.com/image2.jpg",
  ),
  QuoteModel(
    quote:
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    isFavorite: false,
    author: "Winston Churchill",
    backgroundImage: "https://example.com/image3.jpg",
  ),
  QuoteModel(
    quote:
        "The only limit to our realization of tomorrow will be our doubts of today.",
    isFavorite: true,
    author: "Franklin D. Roosevelt",
    backgroundImage: "https://example.com/image4.jpg",
  ),
  QuoteModel(
    quote:
        "The greatest glory in living lies not in never falling, but in rising every time we fall.",
    isFavorite: false,
    author: "Nelson Mandela",
    backgroundImage: "https://example.com/image5.jpg",
  ),
  QuoteModel(
    quote:
        "The only person you are destined to become is the person you decide to be.",
    isFavorite: true,
    author: "Ralph Waldo Emerson",
    backgroundImage: "https://example.com/image6.jpg",
  ),
  QuoteModel(
    quote: "Be yourself; everyone else is already taken.",
    isFavorite: false,
    author: "Oscar Wilde",
    backgroundImage: "https://example.com/image7.jpg",
  ),
  QuoteModel(
    quote: "Life is what happens when you're busy making other plans.",
    isFavorite: true,
    author: "Allen Saunders",
    backgroundImage: "https://example.com/image8.jpg",
  ),
  QuoteModel(
    quote: "Believe you can and you're halfway there.",
    isFavorite: false,
    author: "Theodore Roosevelt",
    backgroundImage: "https://example.com/image9.jpg",
  ),
  QuoteModel(
    quote:
        "The future belongs to those who believe in the beauty of their dreams.",
    isFavorite: true,
    author: "Eleanor Roosevelt",
    backgroundImage: "https://example.com/image10.jpg",
  ),
  // Add more quotes as needed
];
