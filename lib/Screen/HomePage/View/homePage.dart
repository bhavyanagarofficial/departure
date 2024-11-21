import 'dart:ui';

import 'package:departure/Screen/LikedShloack/likedShloack.dart';
import 'package:departure/Screen/ShowShloack/showShloack.dart';
import 'package:departure/Screen/ShowShloackLength/showShloackLength.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/global.dart';
import '../Provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GitaJsonProvider gitaJsonProvider = Provider.of<GitaJsonProvider>(context);
    // initializeLikeList(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                      .withOpacity(0.64)),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  pinned: false,
                  floating: true,
                  centerTitle: true,
                  title: const Text(
                    'भगवद गीता',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  // backgroundColor: gitaJsonProvider.isDark ? Color(0xffa12628) : Color(0xff880004),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  actions: [
                    (gitaJsonProvider.isDark)
                        ? IconButton(
                            onPressed: () {
                              gitaJsonProvider.setTheme();
                            },
                            icon: Icon(Icons.light_mode))
                        : IconButton(
                            onPressed: () {
                              gitaJsonProvider.setTheme();
                            },
                            icon: Icon(Icons.dark_mode))
                  ],
                ),
                SliverList(
                    delegate: SliverChildListDelegate(List.generate(
                  gitaJsonProvider.gitaList.length,
                  (index) => Container(
                    margin: EdgeInsets.fromLTRB(
                      width * 0.02,
                      (index == 0) ? height * 0.021 : width * 0.02,
                      width * 0.02,
                      height * 0.01,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: (gitaJsonProvider.isDark)
                            ? (selectedIndex == index)
                                ? const Color(0xff600f0b)
                                : Theme.of(context).colorScheme.primary
                            : (selectedIndex == index)
                                ? const Color(0xffFFE8A5)
                                : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.01),
                      child: ListTile(
                        onTap: () {
                          gitaJsonProvider.generateLikeList(gitaJsonProvider);
                          gitaJsonProvider.getSelectedIndex(index);
                          showShloackIndex = 80;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ShowShloackLength()));
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  width: 1.8,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          child: CircleAvatar(
                            radius: width * 0.059,
                            backgroundImage: AssetImage(imgList[index]),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        title: Text(
                          gitaJsonProvider.gitaList[index].chapterName.hindi,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${gitaJsonProvider.gitaList[index].verses.length} श्लोक',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w500),
                        ),
                        trailing: (gitaJsonProvider.isDark)
                            ? Image.asset(
                                'assets/images/BowImages/2.png',
                                height: height * 0.0455,
                              )
                            : Image.asset(
                                'assets/images/BowImages/1.png',
                                height: height * 0.0455,
                              ),
                      ),
                    ),
                  ),
                )))
              ],
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xfffddc7b),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 7),
                height: 65,
                color: Theme.of(context).colorScheme.surface,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'भगवद गीता',
                        style: TextStyle(
                            fontSize: width * 0.048, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              buildListTile(Icons.home, 'Home'),
              buildListTile(Icons.restart_alt_rounded, 'Reset Progress'),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LikedShloack(),
                        ));
                  },
                  child: buildListTile(Icons.favorite, 'Favorites')),
              buildListTile(Icons.share, 'Share'),
              buildListTile(Icons.app_registration, 'Our Apps'),
              buildListTile(Icons.private_connectivity, 'Privacy Policy'),
            ],
          ),
        ),
      ),
    );
  }
}

ListTile buildListTile(var icon, String text) {
  return ListTile(
    leading: Icon(
      icon,
      color: const Color(0xff880004),
    ),
    title: Text(
      text,
      style: const TextStyle(
          color: Color(0xff880004), fontWeight: FontWeight.bold),
    ),
  );
}

List imgList = [
  'assets/images/ListImages/2.jpeg',
  'assets/images/ListImages/3.jpeg',
  'assets/images/ListImages/4.jpeg',
  'assets/images/ListImages/5.jpeg',
  'assets/images/ListImages/6.jpg',
  'assets/images/ListImages/7.jpeg',
  'assets/images/ListImages/1.jpeg',
  'assets/images/ListImages/8.jpeg',
  'assets/images/ListImages/9.jpeg',
  'assets/images/ListImages/10.jpeg',
  'assets/images/ListImages/11.jpeg',
  'assets/images/ListImages/12.jpeg',
  'assets/images/ListImages/13.jpeg',
  'assets/images/ListImages/14.jpeg',
  'assets/images/ListImages/15.jpeg',
  'assets/images/ListImages/16.jpeg',
  'assets/images/ListImages/16.jpeg',
  'assets/images/ListImages/16.jpeg',
];
