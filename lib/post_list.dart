import 'package:flutter/material.dart';
import 'http_service.dart';
import 'post_page.dart';
import 'post_model.dart';

class PostList extends StatelessWidget {
  final HttpService _httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Surat"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Surah>>(
        future: _httpService.getSurahList(),
        builder: (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text("Gagal mengambil data."));
          }

          final List<Surah> surahList = snapshot.data!;
          return ListView.builder(
            itemCount: surahList.length,
            itemBuilder: (context, index) {
              final surah = surahList[index];
              return ListTile(
                title: Text("${surah.number}. ${surah.latinName}"),
                subtitle: Text("${surah.meaning} - ${surah.ayahCount} ayat (${surah.revelation})"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostPage(surahNumber: surah.number, surahName: surah.latinName),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
