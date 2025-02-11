import 'package:flutter/material.dart';
import 'post_model.dart';

class QuranDetail extends StatelessWidget {
  final QuranAyah ayah;
  final String surahName; // Tambahkan parameter surahName

  QuranDetail({required this.ayah, required this.surahName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surahName), // Gunakan surahName yang dikirim dari post_page.dart
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Ayat Arab
                    Text(
                      ayah.text,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Terjemahan
                    Text(
                      "\"${ayah.translation}\"",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    // Informasi Surah
                    Text(
                      "Surah: $surahName", // Gunakan parameter surahName
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Ayat: ${ayah.numberInSurah}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
