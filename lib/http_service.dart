import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';
import 'package:flutter/foundation.dart';

class HttpService {
  static const String _baseURL = "https://open-api.my.id/api/quran/surah";

  // Mengambil daftar surah
  Future<List<Surah>> getSurahList() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));

      debugPrint("API Response: ${response.body}");

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Surah.fromJson(json)).toList();
      } else {
        debugPrint('Gagal mengambil daftar surah: HTTP ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Exception: $e');
      return [];
    }
  }

  // Mengambil detail surat beserta ayat-ayatnya
  Future<List<QuranAyah>> getSurahDetail(int surahNumber) async {
    final String url = "$_baseURL/$surahNumber";

    try {
      final response = await http.get(Uri.parse(url));

      debugPrint("Surah Detail Response: ${response.body}");

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> ayatList = data["ayat"];

        return ayatList.map((json) => QuranAyah.fromJson(json)).toList();
      } else {
        debugPrint('Gagal mengambil detail surat: HTTP ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Exception: $e');
      return [];
    }
  }
}
