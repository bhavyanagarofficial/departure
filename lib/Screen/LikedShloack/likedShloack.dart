import 'package:departure/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../HomePage/Provider/provider.dart';

class LikedShloack extends StatelessWidget {
  const LikedShloack({super.key});

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
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            'पसंदीदा',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite,
                    color: Colors.white, size: width * 0.068))
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
            (likedShloackList.isEmpty)
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      'आपने अध्याय नहीं जोड़ा जो आपको पसंद है',
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: gitaJsonProvider.isDark
                              ? Color(0xff370705)
                              : Colors.white),
                    ))
                : Column(children: [
                    Expanded(
                        child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            likedShloackList.length,
                            (index) => Container(
                                padding: EdgeInsets.all(width * 0.01),
                                margin: EdgeInsets.fromLTRB(
                                  width * 0.02,
                                  height * 0.018,
                                  width * 0.02,
                                  height * 0.01,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  //shloack, shloackNo, chName
                                  onTap: () {},
                                  title: Text(
                                    textAlign: TextAlign.center,
                                    '${likedShloackList[index]['chName']} (श्लोक ${likedShloackList[index]['shloackNo']})',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    textAlign: TextAlign.center,
                                    likedShloackList[index]['shloack'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      gitaJsonProvider
                                          .removeFromLikePage(index);
                                    },
                                    icon: Icon(Icons.favorite,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: width * 0.074),
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ),
                    Container(
                      height: height * 0.077,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ]),
          ],
        ),
      ),
    );
  }
}
