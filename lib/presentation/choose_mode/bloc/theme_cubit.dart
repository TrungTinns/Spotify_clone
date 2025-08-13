import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// ThemeCubit is a Cubit that manages and storage the theme mode of the application
class ThemeCubit extends HydratedCubit<ThemeMode> {
  // Initializing the ThemeCubit with the default theme mode
  ThemeCubit() : super(ThemeMode.system);

  // Method to update the theme mode
  void updateTheme(ThemeMode themeMode) {
    emit(themeMode);
  }

  // Method to reset the theme mode to the default
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  // Method to convert the theme mode to JSON for storage
  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}
