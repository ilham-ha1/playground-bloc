import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_state.dart';

class QuLoadedWidget extends StatelessWidget {
  const QuLoadedWidget({
    super.key,
    required this.photos,
    required this.capturedPaths,
  });
  final List<QuestionerePhoto> photos;
  final List<String> capturedPaths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Text("Selfie dulu yuk!"),
          Text(
            "Hasil fotonya akan dianalisis oleh dr Ilham untuk memberikan rekomendasi terbaik buat kamu",
          ),
          SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.handshake_outlined),
              SizedBox(width: 12),
              Expanded(child: Text("Contoh foto yang benar")),
            ],
          ),
          SizedBox(height: 18),
          if (photos.isEmpty && capturedPaths.isEmpty)
            const Center(child: Text('No photos'))
          else if (photos.isNotEmpty)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  photos
                      .map(
                        (photo) => SizedBox(
                          width: 120,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  photo.url,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                photo.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          SizedBox(height: 18),
          if (capturedPaths.isNotEmpty) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.camera_alt_outlined),
                SizedBox(width: 12),
                Expanded(child: Text('Foto Kamu')),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  capturedPaths.reversed.take(3).map((path) {
                    return SizedBox(
                      width: 120,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(path),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Foto Kamu',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 18),
          ] else ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tips: Cara terbaik mengambil foto',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.wb_sunny, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Gunakan pencahayaan yang baik — hindari backlight',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.camera_alt, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Pegang kamera stabil atau gunakan tripod'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.center_focus_strong, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Fokuskan wajah/objek di tengah frame'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.cleaning_services, size: 20),
                      SizedBox(width: 12),
                      Expanded(child: Text('Bersihkan lensa sebelum memotret')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
