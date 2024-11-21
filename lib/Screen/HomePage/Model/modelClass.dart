class GitaModel {
  late int chapter;
  late ChapterName chapterName;
  late List<GitaVerses> verses;

  GitaModel(
      {required this.chapter, required this.chapterName, required this.verses});

  factory GitaModel.fromJson(Map m1) {
    return GitaModel(
        chapter: m1['Chapter'],
        verses:
        (m1['Verses'] as List).map((e) => GitaVerses.fromJson(e)).toList(),
        chapterName: ChapterName.fromJson(m1['ChapterName']));
  }
}

class GitaVerses {
  late int verseNumber;
  // late String explanation;
  late Shlokas shlokas;

  GitaVerses({
    required this.verseNumber,
    required this.shlokas,
    // required this.explanation
  });

  factory GitaVerses.fromJson(Map m1) {
    return GitaVerses(
        verseNumber: m1['VerseNumber'],shlokas: Shlokas.fromJson(m1['Text']));//,explanation: m1['Explaination']
  }
}

class Shlokas {
  late String sanskrit, hindi, gujarati, english;

  Shlokas(
      {required this.sanskrit,
        required this.hindi,
        required this.gujarati,
        required this.english});

  factory Shlokas.fromJson(Map m1) {
    return Shlokas(
        sanskrit: m1['Sanskrit'],
        hindi: m1['Hindi'],
        gujarati: m1['Gujarati'],
        english: m1['English']);
  }
}

class ChapterName {
  late String hindi, english, gujarati, sanskrit;

  ChapterName({
    required this.hindi,
    required this.english,
    required this.gujarati,
    required this.sanskrit,
  });

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        hindi: m1['Hindi'],
        english: m1['English'],
        gujarati: m1['Gujarati'],
        sanskrit: m1['Sanskrit']);
  }
}
