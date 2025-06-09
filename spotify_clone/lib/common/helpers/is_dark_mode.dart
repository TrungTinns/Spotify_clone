import 'package:flutter/material.dart';

/// Extension to check if the current theme is dark mode
/// Usage: context.isDarkMode
/// This extension can be used in any widget to determine if the current theme is dark mode or not.
/// It checks the brightness of the current theme and returns true if it is dark mode, false otherwise.
extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}