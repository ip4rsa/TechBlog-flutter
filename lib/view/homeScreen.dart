import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techblog/component/_myColors.dart';
import 'package:techblog/component/_mySrtings.dart';
import 'package:techblog/controller/home_screen_contriller.dart';
import 'package:techblog/model/fakeData.dart';

import '../component/_myComponent.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    super.key,
    required this.size,
    required this.textTem,
    required this.bodyMarginScreen,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

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
            topVisited(),
            titlePodcast(bodyMarginScreen: bodyMarginScreen, textTem: textTem),
            boxPodcast(size: size, textTem: textTem)
          ],
        ),
      ),
    );
  }

  Widget topVisited() {
    return Container(
      height: size.height / 3.1,
      child: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: homeScreenController.topVisitedList.length,
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
                              image: NetworkImage(homeScreenController
                                  .topVisitedList[index].image!),
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
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textTem.headline2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].view!,
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
                    homeScreenController.topVisitedList[index].title!,
                    style: textTem.subtitle2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            );
          },
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
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return Container(
      height: size.height / 2.5,
      child: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //---- blog item
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: size.width / 2.4,
                    height: size.height / 5.3,
                    child: CachedNetworkImage(
                      imageUrl:
                          homeScreenController.topPodcastList[index].poster!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => SpinKitThreeBounce(
                          color: solidcolors.primeryColor, size: 15.0),
                      errorWidget: (context, url, error) => Icon(
                        Icons.image_not_supported_sharp,
                        size: 40,
                        color: const Color.fromARGB(255, 123, 123, 123),
                      ),
                    ),
                  ),
                ),

                //---- Title Podcast
                SizedBox(
                  width: size.width / 2.4,
                  child: Center(
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      style: textTem.subtitle2,
                    ),
                  ),
                )
              ],
            );
          },
        ),
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
