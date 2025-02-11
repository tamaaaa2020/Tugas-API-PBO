import 'package:flutter/foundation.dart';

// Model untuk daftar surah
class Surah {
  final int number;
  final String arabicName;
  final String latinName;
  final int ayahCount;
  final String revelation;
  final String meaning;
  final String description;
  final String audioUrl;

  const Surah({
    required this.number,
    required this.arabicName,
    required this.latinName,
    required this.ayahCount,
    required this.revelation,
    required this.meaning,
    required this.description,
    required this.audioUrl,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json["nomor"],
      arabicName: json["nama"],
      latinName: json["nama_latin"],
      ayahCount: json["jumlah_ayat"],
      revelation: json["tempat_turun"],
      meaning: json["arti"],
      description: json["deskripsi"],
      audioUrl: json["audio"],
    );
  }
}

// Model untuk detail ayat
class QuranAyah {
  final int id;
  final int surahNumber;
  final int numberInSurah;
  final String text;
  final String transliteration;
  final String translation;

  const QuranAyah({
    required this.id,
    required this.surahNumber,
    required this.numberInSurah,
    required this.text,
    required this.transliteration,
    required this.translation,
  });

  factory QuranAyah.fromJson(Map<String, dynamic> json) {
    return QuranAyah(
      id: json["id"],
      surahNumber: json["surah"],
      numberInSurah: json["nomor"],
      text: json["ar"],
      transliteration: json["tr"],
      translation: json["idn"],
    );
  }
}
