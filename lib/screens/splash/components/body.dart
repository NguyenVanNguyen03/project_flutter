import 'package:flutter/material.dart';
import 'package:project_flutter/components/default_button.dart';
import 'package:project_flutter/size_config.dart';
import 'package:project_flutter/constants.dart';
import 'package:project_flutter/screens/login/sign_in_creen.dart';

import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  late PageController _controller;
  List<Map<String, String>> splashData = [
    {
      "title": "Identify Plants",
      "text": "You can identify the plants you don't know through your camera",
      "image": "assets/images/intro1.png"
    },
    {
      "title": "Learn Many Plants Species",
      "text":
          "Let's learn about the many plant species that exist in this world",
      "image": "assets/images/intro2.png"
    },
    {
      "title": "Read Many Articles About Plant",
      "text": "Let's learn more about beautiful plants ",
      "image": "assets/images/intro1.png"
    },
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: _controller,
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: splashData[index]['title'],
                  text: splashData[index]['text'],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: EdgeInsets.only(right: 5),
                          height: 6,
                          width: currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? kPrimaryColor
                                : Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    DefaultButton(
                      text: currentPage == splashData.length - 1
                          ? "Continue"
                          : "Next",
                      press: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => SignInScreen()),
                        // );
                        if (currentPage == splashData.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignInScreen(),
                            ),
                          );
                        }
                        _controller.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
