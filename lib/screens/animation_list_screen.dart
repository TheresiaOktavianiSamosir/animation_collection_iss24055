import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/animation_data.dart';
import '../models/animation_model.dart';

class AnimationListScreen extends StatelessWidget {
  final String? era;

  const AnimationListScreen({super.key, this.era});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<AnimationModel> filteredList = era != null
        ? AnimationData.animations.where((anim) => anim.era == era).toList()
        : AnimationData.animations;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF8898AF) : const Color(0xFFE0F0FB),
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('⬅', style: TextStyle(fontSize: 24)),
          onPressed: () => context.go('/home'),
          tooltip: 'Kembali ke Home',
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              era ?? 'Semua Animasi', 
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.blueGrey[900],
              )
            ),
            Text(
              era != null 
                  ? '$era: ${filteredList.length} Animasi' 
                  : 'Total: ${AnimationData.animations.length} Animasi',
              style: TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : Colors.blueGrey[600],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.blueGrey[900],
      ),
      body: filteredList.isEmpty
          ? const Center(child: Text('Tidak ada animasi ditemukan.'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final anim = filteredList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  color: isDark ? Colors.black.withOpacity(0.2) : Colors.white.withOpacity(0.9),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: 'anim-${anim.id}',
                        child: Image.asset(
                          anim.gambar,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => 
                            Container(color: Colors.grey[200], child: const Icon(Icons.movie)),
                        ),
                      ),
                    ),
                    title: Text(
                      anim.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: isDark ? Colors.white : Colors.blueGrey[900],
                      ),
                    ),
                    subtitle: Text(
                      '${anim.tahun} | ${anim.studio}',
                      style: TextStyle(
                        color: isDark ? Colors.white70 : Colors.blueGrey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded, 
                      size: 18,
                      color: isDark ? Colors.white54 : Colors.blueGrey[300],
                    ),
                    onTap: () {
                      context.push('/animation/${anim.id}');
                    },
                  ),
                );
              },
            ),
    );
  }
}
