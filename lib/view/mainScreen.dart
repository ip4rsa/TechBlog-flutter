import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/_myColors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/homeScreen.dart';
import 'package:techblog/view/profileScreen.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();
var selectedIndexPage = 0;

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTem = Theme.of(context).textTheme;
    double bodyMarginScreen = size.width / 11.5;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: solidcolors.scafoldBg,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.img.logo.path,
                      scale: 3.4,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTem.headline5,
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      "درباره تک‌بلاگ",
                      style: textTem.headline5,
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: textTem.headline5,
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      "تک‌بلاگ در گیت هاب",
                      style: textTem.headline5,
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
        //---- AppBar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 250, 250, 250),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (() {
                  _key.currentState!.openDrawer();
                }),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                'assets/img/logo.png',
                height: size.height / 13.6,
              ),
              Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        //---- NavBAr
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedIndexPage,
                children: [
                  homeScreen(
                      size: size,
                      textTem: textTem,
                      bodyMarginScreen: bodyMarginScreen),
                  profileScreen(
                      size: size,
                      textTem: textTem,
                      bodyMarginScreen: bodyMarginScreen),
                ],
              ),
            ),

            //---- navigation bar
            btnNAa(
              size: size,
              changeScreen: (int valeu) {
                setState(() {
                  selectedIndexPage = valeu;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class btnNAa extends StatelessWidget {
  const btnNAa({
    super.key,
    required this.size,
    required this.changeScreen,
  });

  final Size size;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 9.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
          child: Container(
            height: size.height / 10,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 40, 40, 40),
                    spreadRadius: 1,
                    blurRadius: 13)
              ],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(colors: gradiantColors.bottmNav),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: Image.asset("assets/img/homeIcon.png")),
                IconButton(
                    onPressed: () => changeScreen(2),
                    icon: Image.asset("assets/img/writerIcon.png")),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: Image.asset("assets/img/userIcon.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
