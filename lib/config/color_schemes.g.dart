import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006684),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFBDE9FF),
  onPrimaryContainer: Color(0xFF001F2A),
  secondary: Color(0xFF4D616C),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD0E6F2),
  onSecondaryContainer: Color(0xFF081E27),
  tertiary: Color(0xFF006783),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBCE9FF),
  onTertiaryContainer: Color(0xFF001F29),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFE),
  onBackground: Color(0xFF191C1E),
  surface: Color(0xFFFBFCFE),
  onSurface: Color(0xFF191C1E),
  surfaceVariant: Color(0xFFDCE4E9),
  onSurfaceVariant: Color(0xFF40484C),
  outline: Color(0xFF70787D),
  onInverseSurface: Color(0xFFEFF1F3),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFF66D3FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006684),
  outlineVariant: Color(0xFFC0C8CD),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF66D3FF),
  onPrimary: Color(0xFF003546),
  primaryContainer: Color(0xFF004D64),
  onPrimaryContainer: Color(0xFFBDE9FF),
  secondary: Color(0xFFB4CAD6),
  onSecondary: Color(0xFF1F333C),
  secondaryContainer: Color(0xFF354A53),
  onSecondaryContainer: Color(0xFFD0E6F2),
  tertiary: Color(0xFF62D4FF),
  onTertiary: Color(0xFF003545),
  tertiaryContainer: Color(0xFF004D63),
  onTertiaryContainer: Color(0xFFBCE9FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1E),
  onBackground: Color(0xFFE1E2E4),
  surface: Color(0xFF191C1E),
  onSurface: Color(0xFFE1E2E4),
  surfaceVariant: Color(0xFF40484C),
  onSurfaceVariant: Color(0xFFC0C8CD),
  outline: Color(0xFF8A9297),
  onInverseSurface: Color(0xFF191C1E),
  inverseSurface: Color(0xFFE1E2E4),
  inversePrimary: Color(0xFF006684),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF66D3FF),
  outlineVariant: Color(0xFF40484C),
  scrim: Color(0xFF000000),
);

ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Colors.white,
);
ThemeData darkTheme =
    ThemeData(colorScheme: darkColorScheme, fontFamily: 'Poppins');
