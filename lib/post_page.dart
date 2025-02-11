import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_model.dart';

class PostPage extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final HttpService _httpService = HttpService();

  PostPage({required this.surahNumber, required this.surahName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah $surahName"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<QuranAyah>>(
        future: _httpService.getSurahDetail(surahNumber),
        builder: (BuildContext context, AsyncSnapshot<List<QuranAyah>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text("Gagal mengambil data."));
          }

          final List<QuranAyah> ayatList = snapshot.data!;
          return ListView.builder(
            itemCount: ayatList.length,
            itemBuilder: (context, index) {
              final ayah = ayatList[index];
              return ListTile(
                title: Text(ayah.text, textAlign: TextAlign.right, style: TextStyle(fontSize: 20)),
                subtitle: Text("${ayah.transliteration}\n${ayah.translation}"),
              );
            },
          );
        },
      ),
    );
  }
}
