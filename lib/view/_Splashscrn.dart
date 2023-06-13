import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/_myColors.dart';
import 'package:techblog/view/mainScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
  
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => homePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/logo.png', height: 71),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 85,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: SpinKitThreeBounce(
                        color: solidcolors.primeryColor, size: 19.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
