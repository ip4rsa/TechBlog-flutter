import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/_myColors.dart';
import 'package:techblog/_mySrtings.dart';


class profileScreen extends StatelessWidget {
  const profileScreen({
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
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //---- profile User
              Image.asset(
                "assets/img/userProfile.png",
                height: 75,
              ),
              const SizedBox(
                height: 15,
              ),

              //---- text Edit profole
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.wand_stars,
                    color: Color.fromARGB(255, 40, 114, 174),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                    child: Text(
                      myStrings.editProfilePhoto,
                      style: textTem.headline3,
                    ),
                  ),
                ],
              ),

              //---- text user name and Gmail
              const SizedBox(
                height: 70,
              ),
              Text("نیکولا تسلا", style: textTem.headline4),

              const SizedBox(
                height: 6,
              ),

              Text("Nikola@gmail.com", style: textTem.headline4),

              const SizedBox(
                height: 40,
              ),
              //---- divider and BTN
              dividerLine(size: size),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                child: InkWell(
                  splashColor: solidcolors.primeryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  onTap: () {
                    // غمل کلیک
                  },
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        myStrings.favArticle,
                        style: textTem.headline4,
                      ),
                    ),
                  ),
                ),
              ),
              dividerLine(size: size),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                child: InkWell(
                  splashColor: solidcolors.primeryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  onTap: () {
                    // غمل کلیک
                  },
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        myStrings.favePodcast,
                        style: textTem.headline4,
                      ),
                    ),
                  ),
                ),
              ),
              dividerLine(size: size),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
                child: InkWell(
                  splashColor: solidcolors.primeryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  onTap: () {
                    // غمل کلیک
                  },
                  child: SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        myStrings.logOute,
                        style: textTem.headline4,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ));
  }
}

class dividerLine extends StatelessWidget {
  const dividerLine({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidcolors.dividerCoror,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
