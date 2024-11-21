import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../utils/global.dart';
import '../HomePage/Provider/provider.dart';
import '../ShowShloackLength/showShloackLength.dart';

class ShowShloack extends StatelessWidget {
  const ShowShloack({super.key});

  @override
  Widget build(BuildContext context) {
    GitaJsonProvider gitaJsonProvider = Provider.of<GitaJsonProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                gitaJsonProvider.setLikeList();
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            gitaJsonProvider.gitaList[selectedIndex].chapterName.hindi,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.translate,
                size: width * 0.07,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Hindi',
                      style: TextStyle(
                          fontSize: width * 0.036, color: Colors.white)),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('English',
                      style: TextStyle(
                          fontSize: width * 0.036, color: Colors.white)),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('Gujarati',
                      style: TextStyle(
                          fontSize: width * 0.036, color: Colors.white)),
                ),
              ],
              onSelected: (item) {
                gitaJsonProvider.updateLanguage(
                    item, gitaJsonProvider, showShloackIndex);
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpeg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withOpacity(0.72)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //todo ------------------------------> Shloack Number
                Container(
                  alignment: Alignment.center,
                  height: height * 0.055,
                  margin: EdgeInsets.fromLTRB(width * 0.24, height * 0.04,
                      width * 0.24, height * 0.015),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDot(width, gitaJsonProvider),
                      Text(
                        'श्लोक ${gitaJsonProvider.gitaList[selectedIndex].verses[showShloackIndex].verseNumber}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04),
                      ),
                      buildDot(width, gitaJsonProvider),
                    ],
                  ),
                ),
                //todo ------------------------------> Shloack
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Text(
                    textAlign: TextAlign.center,
                    gitaJsonProvider.gitaList[selectedIndex]
                        .verses[showShloackIndex].shlokas.sanskrit,
                    style: TextStyle(
                        color: gitaJsonProvider.isDark
                            ? Color(0xff880004)
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04),
                  ),
                ),
                //todo ------------------------------> Vivran Heading
                Container(
                  alignment: Alignment.center,
                  height: height * 0.055,
                  margin: EdgeInsets.fromLTRB(width * 0.24, height * 0.038,
                      width * 0.24, height * 0.015),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildDot(width, gitaJsonProvider),
                      Text(
                        'विवरण',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04),
                      ),
                      buildDot(width, gitaJsonProvider),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              explanation,
                              style: TextStyle(
                                  color: gitaJsonProvider.isDark
                                      ? Color(0xff880004)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //todo ------------------------------> Flaute Image
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.064, right: width * 0.05),
                  child: Image.asset('assets/images/flaute.png'),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (showShloackIndex != 0)
                        ? GestureDetector(
                            onTap: () {
                              gitaJsonProvider
                                  .showBackShloack(gitaJsonProvider);
                            },
                            child: Container(
                              width: width * 0.1,
                              padding: EdgeInsets.fromLTRB(9.5, 8.5, 0, 8.5),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEF3D47),
                                    Color(0xFF850001)
                                  ],
                                  // Gradient colors
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(),
                    //todo ---------------------------------> Share Button
                    GestureDetector(
                        onTap: () {
                          gitaJsonProvider.launchSMS(gitaJsonProvider
                              .gitaList[selectedIndex]
                              .verses[showShloackIndex]
                              .shlokas
                              .sanskrit);
                        },
                        child: customButton(Icons.share, width)),
                    //todo ---------------------------------> Copy Button
                    GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                                text:
                                    'श्लोक:\n${gitaJsonProvider.gitaList[selectedIndex].verses[showShloackIndex].shlokas.sanskrit}\n\nअर्थ:\n$explanation'),
                          );
                          Fluttertoast.showToast(
                            msg: 'Text Copied',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        },
                        child: customButton(Icons.copy, width)),
                    //todo ---------------------------------> Like Button
                    GestureDetector(
                        onTap: () {
                          gitaJsonProvider.setLike();
                          if (showLike[showShloackIndex]) {
                            likedShloackList.add({
                              'chNo': gitaJsonProvider
                                  .gitaList[selectedIndex].chapter,
                              'shloack': gitaJsonProvider
                                  .gitaList[selectedIndex]
                                  .verses[showShloackIndex]
                                  .shlokas
                                  .sanskrit,
                              'shloackNo': gitaJsonProvider
                                  .gitaList[selectedIndex]
                                  .verses[showShloackIndex]
                                  .verseNumber,
                              'chName': gitaJsonProvider
                                  .gitaList[selectedIndex].chapterName.hindi,
                            });
                          } else {
                            for (int i = 0; i < likedShloackList.length; i++) {
                              if (likedShloackList[i]['shloack'] ==
                                  gitaJsonProvider
                                      .gitaList[selectedIndex]
                                      .verses[showShloackIndex]
                                      .shlokas
                                      .sanskrit) {
                                likedShloackList.removeAt(i);
                                break;
                              }
                            }
                            // gitaJsonProvider.removeFromShloackPage(gitaJsonProvider);
                          }
                          Fluttertoast.showToast(
                            msg: (showLike[showShloackIndex])
                                ? 'Added to Favourites'
                                : 'Removed from Favourites',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFEF3D47), Color(0xFF850001)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: (showLike[showShloackIndex])
                                ? Colors.green
                                : Colors.white,
                          ),
                        )),
                    //todo ---------------------------------> Next Button
                    (gitaJsonProvider.gitaList[selectedIndex]
                                .verses[showShloackIndex].verseNumber <
                            gitaJsonProvider
                                .gitaList[selectedIndex].verses.length)
                        ? GestureDetector(
                            onTap: () {
                              gitaJsonProvider
                                  .showNextShloack(gitaJsonProvider);
                              print(showShloackIndex);
                              print(gitaJsonProvider
                                  .gitaList[selectedIndex].verses.length);
                            },
                            child: customButton(Icons.arrow_forward_ios, width))
                        : const SizedBox(),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.042),
                  height: height * 0.077,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container customButton(var icon, double width) {
    return Container(
      padding: EdgeInsets.all(8.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFEF3D47), Color(0xFF850001)],
          // Gradient colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: Colors.white, // W
      ),
    );
  }
}
