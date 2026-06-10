import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> eras = [
    {'title': '1950-1970an', 'short': '1970an', 'emoji': '📺', 'color': Color(0xFFE3F2FD)},
    {'title': '1980-1990an', 'short': '1990an', 'emoji': '🎞️', 'color': Color(0xFFF3E5F5)},
    {'title': '1990-2000an', 'short': '2000an', 'emoji': '🎬', 'color': Color(0xFFE8F5E9)},
    {'title': '2000-2010an', 'short': '2010an', 'emoji': '🌟', 'color': Color(0xFFFFF3E0)},
    {'title': '2010-2020an', 'short': '2020an', 'emoji': '✨', 'color': Color(0xFFFCE4EC)},
    {'title': '2020an', 'short': '2020an', 'emoji': '🚀', 'color': Color(0xFFE0F7FA)},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Home', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.blueGrey[900],
          )
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark 
              ? [const Color(0xFF8898AF), const Color(0xFFE0F0FB)] // Mix Dark as requested
              : [const Color(0xFFE0F0FB), const Color(0xFFFFFFFF)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                // Banner "Animation Collection" - Clickable & Colorful
                GestureDetector(
                  onTap: () => context.go('/animations'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withOpacity(0.15) : Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🎬', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 10),
                        Text(
                          'Animation Collection',
                          style: TextStyle(
                            fontSize: 18, // Reduced font size
                            fontWeight: FontWeight.w900,
                            color: isDark ? const Color(0xFF1565C0) : const Color(0xFF1565C0),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('🎬', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Era Grid with Styled Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: eras.map((era) {
                      return GestureDetector(
                        onTap: () => context.go('/animations?era=${era['title']}'),
                        child: Column(
                          children: [
                            Container(
                              width: 65, // Slightly smaller
                              height: 65,
                              decoration: BoxDecoration(
                                color: isDark ? era['color'].withOpacity(0.3) : era['color'],
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), // Thicker shadow
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  era['emoji'],
                                  style: const TextStyle(fontSize: 28),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              era['short'],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900, // Bolder text
                                color: isDark ? Colors.blueGrey[900] : Colors.blueGrey[800],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
