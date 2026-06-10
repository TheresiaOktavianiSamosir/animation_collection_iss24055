import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

// Global ValueNotifier for Theme Mode
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp.router(
          title: 'Animation Collection',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xFF1565C0),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1565C0),
              primary: const Color(0xFF1565C0),
              secondary: const Color(0xFFFDD835),
              surface: Colors.white,
              onSecondary: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold),
              bodyLarge: TextStyle(color: Color(0xFF212121)),
              bodyMedium: TextStyle(color: Color(0xFF212121)),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1565C0),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFDD835),
                foregroundColor: Colors.black,
                elevation: 2,
              ),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primaryColor: const Color(0xFF1565C0),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1565C0),
              brightness: Brightness.dark,
              primary: const Color(0xFF1565C0),
              secondary: const Color(0xFFFDD835),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF0D47A1),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFDD835),
                foregroundColor: Colors.black,
              ),
            ),
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
