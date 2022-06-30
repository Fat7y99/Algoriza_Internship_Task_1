import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/reusableComponents/reusable_components.dart';

class OnBoardingModel {
  final String image;
  final String titleText;
  final String bodyText;

  OnBoardingModel({
    required this.image,
    required this.titleText,
    required this.bodyText,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  var pageController = PageController();
  List<OnBoardingModel> onBoard = [
    OnBoardingModel(
      image: 'assets/images/1.png',
      bodyText:
          'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
      titleText: 'Get food delivery to your doorstep asap',
    ),
    OnBoardingModel(
      image: 'assets/images/2.png',
      bodyText:
          'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
      titleText: 'Buy Any Food from your favorite restaurant',
    ),
    OnBoardingModel(
      image: 'assets/images/3.png',
      bodyText:
          'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
      titleText: 'Get food delivery to your doorstep asap',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: defaultTextButton(
                  text: 'Skip',
                  function: () {
                    Navigator.pushNamed(context, 'login');
                  }),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == onBoard.length - 1) {
                    setState(() {
                      isLast = true;
                      print(' Last');
                    });
                  } else {
                    setState(() {
                      isLast = false;
                      print('not Last');
                    });
                  }
                },
                itemBuilder: (context, index) => buildSreenItem(onBoard[index]),
                itemCount: onBoard.length,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                SmoothPageIndicator(
                    controller: pageController,
                    count: onBoard.length,
                    effect: ExpandingDotsEffect(
                      dotColor: HexColor("#aecdb8"),
                      activeDotColor: Colors.orange,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 15,
                      spacing: 5,
                    )),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    function: () {
                      Navigator.pushNamed(context, 'signin');
                    },
                    text: 'Get Started'),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    defaultTextButton(
                        function: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        text: 'Sign Up',
                        color: Colors.teal)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSreenItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          Text(
            model.titleText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'candy',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.bodyText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      );
}
