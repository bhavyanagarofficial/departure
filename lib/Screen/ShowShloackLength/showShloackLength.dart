import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/global.dart';
import '../HomePage/Provider/provider.dart';
import '../ShowShloack/showShloack.dart';

class ShowShloackLength extends StatelessWidget {
  const ShowShloackLength({super.key});

  @override
  Widget build(BuildContext context) {
    GitaJsonProvider gitaJsonProvider = Provider.of<GitaJsonProvider>(context);
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
                  pinned: false,
                  floating: true,
                  title: Text(
                    gitaJsonProvider.gitaList[selectedIndex].chapterName.hindi,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  leading: IconButton(
                      onPressed: () {
                        gitaJsonProvider.setLikeList();
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  // backgroundColor: gitaJsonProvider.isDark ? Color(0xffa12628) : Color(0xff880004),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  centerTitle: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      gitaJsonProvider.gitaList[selectedIndex].verses.length +
                          1,
                      (index) => GestureDetector(
                        onTap: () {
                          gitaJsonProvider.getSelectedShloack(index,gitaJsonProvider);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShowShloack(),
                              ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.058,
                          margin: EdgeInsets.fromLTRB(
                            width * 0.045,
                            (index == 0) ? height * 0.021 : width * 0.02,
                            width * 0.045,
                            height * 0.01,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: (gitaJsonProvider.isDark)
                                  ? (showShloackIndex == index)
                                      ? const Color(0xff600f0b)
                                      : Theme.of(context).colorScheme.primary
                                  : (showShloackIndex == index)
                                      ? const Color(0xffFFE8A5)
                                      : Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildDot(width, gitaJsonProvider),
                              Text(
                                'श्लोक ${index + 1}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.04),
                              ),
                              buildDot(width, gitaJsonProvider),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.077,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container buildDot(double width, GitaJsonProvider gitaJsonProvider) {
  return Container(
    height: width * 0.031,
    width: width * 0.031,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: gitaJsonProvider.isDark ? Color(0xffFFD700) : Color(0xff460a07),
    ),
  );
}
