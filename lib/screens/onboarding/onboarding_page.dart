import 'package:flutter/material.dart';
import 'package:petopia/screens/auth/login_page.dart';
import 'package:petopia/screens/auth/register_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../models/onboarding_data.dart';
import '../../theme.dart';
import '../../widgets/onboarding_nav.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPurpleColor : kDarkWhiteColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }

  Future setSeenOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    // calll setSeenOnboarding() here
    setSeenOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(
                    () {
                      currentPage = value;
                    },
                  );
                },
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OnboardingNavButton(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            buttonColor: kPurpleColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onboardingContents[index].title,
                          style: kTitleOnboarding,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onboardingContents[index].subtitle,
                          style: kSubtitleOnboarding,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    currentPage == onboardingContents.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => AnimatedContainer(
                                    margin: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: kYellowColor,
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Get Started',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                buttonColor: kYellowColor,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onboardingContents.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Next',
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                buttonColor: kPurpleColor,
                              )
                            ],
                          ),
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
