import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/global.dart';
import '../Model/modelClass.dart';

int firstTime = 1;

class GitaJsonProvider extends ChangeNotifier {
  List<GitaModel> gitaList = [];
  bool isDark = true;
  late SharedPreferences sharedPreferences;

  Future<void> initGita() async {
    String json = await rootBundle.loadString('assets/JsonData/jsonData.json');
    List response = jsonDecode(json);
    gitaList = response.map((e) => GitaModel.fromJson(e)).toList();
    notifyListeners();
  }

  GitaJsonProvider() {
    initGita();
    getCloseTheme();
  }

  Future<void> setCloseTheme(bool isDark)async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('show',isDark);
  }

  Future<void> getCloseTheme()async {
    sharedPreferences = await SharedPreferences.getInstance();
    isDark = sharedPreferences.getBool('show') ?? false;
  }

  void setTheme() {
    isDark = !isDark;
    setCloseTheme(isDark);
    notifyListeners();
  }

  void getSelectedIndex(int index) {
    selectedIndex = index;
    showLike = likeList[index];
    notifyListeners();
  }

  void getSelectedShloack(int index,gitaJsonProvider) {
    showShloackIndex = index;
    explanation = gitaJsonProvider
        .gitaList[selectedIndex].verses[showShloackIndex].shlokas.hindi;
    notifyListeners();
  }

  void showNextShloack(gitaJsonProvider) {
    showShloackIndex++;
    explanation = gitaJsonProvider
        .gitaList[selectedIndex].verses[showShloackIndex].shlokas.hindi;
    notifyListeners();
  }

  void showBackShloack(gitaJsonProvider) {
    showShloackIndex--;
    explanation = gitaJsonProvider
        .gitaList[selectedIndex].verses[showShloackIndex].shlokas.hindi;
    notifyListeners();
  }

  void setLike() {
    showLike[showShloackIndex] = !showLike[showShloackIndex];
    notifyListeners();
  }

  void setLikeList() {
    likeList[selectedIndex] = showLike;
    notifyListeners();
  }

  void updateLanguage(item, gitaJsonProvider, showShloackIndex) {
    if (item == 1) {
      explanation = gitaJsonProvider
          .gitaList[selectedIndex].verses[showShloackIndex].shlokas.hindi;
      notifyListeners();
    } else if (item == 2) {
      explanation = gitaJsonProvider
          .gitaList[selectedIndex].verses[showShloackIndex].shlokas.english;
      notifyListeners();
    } else if (item == 3) {
      explanation = gitaJsonProvider
          .gitaList[selectedIndex].verses[showShloackIndex].shlokas.gujarati;
      notifyListeners();
    }
  }

  // void launchSMS(String message) {
  //   final String encodedMessage = Uri.encodeComponent(message);
  //   Uri url = Uri.parse('sms: +91 9265097685?body=$encodedMessage');
  //   launchUrl(url);
  // }
  void launchSMS(String message) {
    Uri url = Uri.parse('sms: +91 9328871876');
    launchUrl(url);
  }

  void removeFromLikePage(int index) {
    int chNo = likedShloackList[index]['chNo'];
    int shNo = likedShloackList[index]['shloackNo'];
    print(likeList[chNo - 1][shNo - 1]);
    likeList[chNo - 1][shNo - 1] = false;
    print(likeList[chNo - 1][shNo - 1]);
    likedShloackList.removeAt(index);
    notifyListeners();
  }

  void generateLikeList(gitaJsonProvider){
    if (firstTime == 1) {
      likeList = [
        List.generate(
            gitaJsonProvider.gitaList[0].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[1].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[2].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[3].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[4].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[5].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[6].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[7].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[8].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[9].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[10].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[11].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[12].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[13].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[14].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[15].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[16].verses.length, (index) => false),
        List.generate(
            gitaJsonProvider.gitaList[17].verses.length, (index) => false),
      ];
    }
    firstTime++;
  }
}