import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/animation_data.dart';

class AnimationDetailScreen extends StatelessWidget {
  final String animationId;

  const AnimationDetailScreen({super.key, required this.animationId});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final anim = AnimationData.animations.firstWhere(
      (element) => element.id == animationId,
      orElse: () => throw Exception('Animation not found'),
    );

    // Responsive design helpers
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 800;
    
    // Calculate adaptive image height
    final double imageHeight = isDesktop ? 400 : 250;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FE),
      appBar: AppBar(
        leading: IconButton(
          icon: const Text('⬅', style: TextStyle(fontSize: 24)),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Kembali',
        ),
        title: Text(
          anim.nama,
          style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Container(
          // Limit width on desktop for better readability
          constraints: BoxConstraints(maxWidth: isDesktop ? 900 : double.infinity),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Optimized Responsive Image Container
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Center(
                    child: Container(
                      height: imageHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 25,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          anim.gambar,
                          fit: BoxFit.contain, // Ensures full image is visible
                          alignment: Alignment.center,
                          // Ensures it doesn't look blurry on large screens
                          isAntiAlias: true,
                          filterQuality: FilterQuality.high,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Content Section
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              anim.nama,
                              style: TextStyle(
                                fontSize: isDesktop ? 32 : 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDD835),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFFDD835).withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                )
                              ]
                            ),
                            child: Text(
                              anim.tipe,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${anim.tahun} • ${anim.studio}',
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.blueGrey[600], 
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(thickness: 1.5, height: 1),
                      ),
                      
                      // Grid for details on desktop, list on mobile
                      isDesktop 
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Column(children: [
                                _buildDetailRow('Era', anim.era),
                                _buildDetailRow('Genre', anim.genre),
                              ])),
                              const SizedBox(width: 40),
                              Expanded(child: Column(children: [
                                _buildDetailRow('Negara', anim.negara),
                                _buildDetailRow('Bahasa', anim.bahasa),
                              ])),
                            ],
                          )
                        : Column(
                            children: [
                              _buildDetailRow('Era', anim.era),
                              _buildDetailRow('Genre', anim.genre),
                              _buildDetailRow('Negara', anim.negara),
                              _buildDetailRow('Bahasa', anim.bahasa),
                            ],
                          ),
                          
                      const SizedBox(height: 35),
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        anim.deskripsi,
                        style: TextStyle(
                          fontSize: 15, 
                          height: 1.7,
                          color: Colors.blueGrey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 45),
                      
                      // Action Button
                      Center(
                        child: SizedBox(
                          width: isDesktop ? 400 : double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(anim.youtubeUrl),
                            icon: const Icon(Icons.play_circle_fill, size: 30),
                            label: const Text('Tonton di YouTube'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE53935),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[400], fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: Colors.blueGrey[800], fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
