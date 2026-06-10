import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF8898AF) : const Color(0xFFE0F0FB),
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: isDark ? Colors.white : Colors.blueGrey[900]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
            icon: ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, mode, _) {
                return Icon(
                  mode == ThemeMode.light ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                  color: isDark ? Colors.white : Colors.blueGrey[900],
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Profile Image - Optimized path
              Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue[100],
                    backgroundImage: const AssetImage('assets/images/profile.jpg'),
                    onBackgroundImageError: (exception, stackTrace) {
                      // Fallback if profile.jpg is missing, try app_icon.png
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Name and ID
              Text(
                'Theresia Oktaviani',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.blueGrey[900] : Colors.blueGrey[900],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '12S24055',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.blueGrey[700] : Colors.blueGrey[600],
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              // About Section Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Tentang Saya',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Saya adalah seorang penggemar animasi yang membangun aplikasi ini untuk memudahkan semua orang bernostalgia dan menonton kembali kartun favorit mereka, dari era klasik hingga modern. Semoga aplikasi ini membawa kenangan indah masa kecil kamu kembali!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey[800],
                        height: 1.7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
