// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/_myColors.dart';
import 'package:techblog/_mySrtings.dart';
import 'package:techblog/model/fakeData.dart';

import '../_myComponent.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
    super.key,
    required this.size,
    required this.textTem,
    required this.bodyMarginScreen,
  });

  final Size size;
  final TextTheme textTem;
  final double bodyMarginScreen;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            homePAgePoster(size: size, textTem: textTem),
            const SizedBox(
              height: 15,
            ),
            hashtagLost(bodyMarginScreen: bodyMarginScreen, textTem: textTem),
            const SizedBox(
              height: 29,
            ),
            titleArticle(bodyMarginScreen: bodyMarginScreen, textTem: textTem),
            boxArticle(size: size, textTem: textTem),
            titlePodcast(bodyMarginScreen: bodyMarginScreen, textTem: textTem),
            boxPodcast(size: size, textTem: textTem)
          ],
        ),
      ),
    );
  }
}

class boxPodcast extends StatelessWidget {
  const boxPodcast({
    super.key,
    required this.size,
    required this.textTem,
  });

  final Size size;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2.5,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //---- blog item
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    //---- image and gradiant Podcast
                    Container(
                      height: size.height / 5.1,
                      width: size.width / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: NetworkImage(podcadtList[index].imageUrl),
                            fit: BoxFit.cover,
                          )),
                      foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: const LinearGradient(
                              colors: gradiantColors.articleCoverGradiant,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  ],
                ),
              ),

              //---- Title Podcast
              SizedBox(
                width: size.width / 2.4,
                child: Center(
                  child: Text(
                    podcadtList[index].namePodcast,
                    style: textTem.subtitle2,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class titlePodcast extends StatelessWidget {
  const titlePodcast({
    super.key,
    required this.bodyMarginScreen,
    required this.textTem,
  });

  final double bodyMarginScreen;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMarginScreen, bottom: 10),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.mic,
            color: const Color.fromARGB(255, 40, 114, 174),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
            child: Text(
              myStrings.viewHotPodcast,
              style: textTem.headline3,
            ),
          ),
        ],
      ),
    );
  }
}

class boxArticle extends StatelessWidget {
  const boxArticle({
    super.key,
    required this.size,
    required this.textTem,
  });

  final Size size;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 3.1,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //---- blog item
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    //---- image and gradiant Article
                    Container(
                      height: size.height / 5.1,
                      width: size.width / 2.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: NetworkImage(blogList[index].imageUrl),
                            fit: BoxFit.cover,
                          )),
                      foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: const LinearGradient(
                              colors: gradiantColors.articleCoverGradiant,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),

                    //---- subtitle Article
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              blogList[index].writer,
                              style: textTem.headline2,
                            ),
                            Row(
                              children: [
                                Text(
                                  blogList[index].views,
                                  style: textTem.headline2,
                                ),
                                const SizedBox(
                                  width: 25,
                                  child: Icon(
                                    CupertinoIcons.eye,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width / 2.6,
                // height: 18,
                child: Text(
                  blogList[index].title,
                  style: textTem.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class titleArticle extends StatelessWidget {
  const titleArticle({
    super.key,
    required this.bodyMarginScreen,
    required this.textTem,
  });

  final double bodyMarginScreen;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMarginScreen, bottom: 15),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.layers,
            color: Color.fromARGB(255, 40, 114, 174),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
            child: Text(
              myStrings.viewHotBlog,
              style: textTem.headline3,
            ),
          ),
        ],
      ),
    );
  }
}

class hashtagLost extends StatelessWidget {
  const hashtagLost({
    super.key,
    required this.bodyMarginScreen,
    required this.textTem,
  });

  final double bodyMarginScreen;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: hashtagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                5, 15, index == 0 ? bodyMarginScreen : 1.5, 0),
            child: hashtagCOMPONNT(
              textTem: textTem,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class homePAgePoster extends StatelessWidget {
  const homePAgePoster({
    super.key,
    required this.size,
    required this.textTem,
  });

  final Size size;
  final TextTheme textTem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //----- Poster photo
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: Image.asset("assets/img/posterImg.jpg").image,
                  fit: BoxFit.cover),
              boxShadow: [
                const BoxShadow(
                  color: const Color.fromARGB(255, 92, 92, 92),
                  spreadRadius: 0.5,
                  blurRadius: 4,
                ),
              ]),
        ),
        //----- Poster gradiant
        Container(
          width: size.width / 1.19,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  colors: gradiantColors.posterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        //----- Poster title
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homPagePosterMap["writer"] + "  -  یک روز پیش ",
                    style: textTem.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homPagePosterMap["view"],
                        style: textTem.subtitle1,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        CupertinoIcons.eye_fill,
                        color: Colors.white,
                        size: 17,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 0, 0),
                child: Text(
                  homPagePosterMap["title"],
                  style: textTem.headline1,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
