import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../common/app_colors.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [
        OnboardingPageModel(
          title: 'Find Trusted Cleaners, Anytime!',
          description:
          'Easily book experienced cleaners for your home or property. Choose the service, set the schedule, and leave the rest to us!',
          imageUrl: "assets/images/cleaner.png",
          bgImage: "assets/images/backround.png", textColor: kcWhiteColor,
        ),
        OnboardingPageModel(
          title: 'Track Progress and Payments',
          description:
          'View your upcoming appointments, track cleaner arrival, and handle payments securely—all in one app.',
          imageUrl: 'assets/images/Object.png',
          bgImage: "assets/images/backround2.png", textColor: kcWhiteColor,
        ),
        OnboardingPageModel(
          title: 'Custom Cleaning for Every Need',
          description:
          'Whether it’s a one-time deep clean or regular maintenance, we offer personalized services that fit your schedule and needs.',
          imageUrl: 'assets/images/Object2.png',
          bgImage: "assets/images/backround3.png", textColor: kcPrimaryColor,
        ),
      ]),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter({
    Key? key,
    required this.pages,
    this.onSkip,
    this.onFinish,
  }) : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kcPrimaryColor,
      //   actions: [
      //     TextButton(
      //       style: TextButton.styleFrom(
      //         visualDensity: VisualDensity.comfortable,
      //         foregroundColor: Colors.white,
      //         textStyle: const TextStyle(
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       onPressed: () {
      //         widget.onSkip?.call();
      //         locator<NavigationService>().clearStackAndShow(Routes.homeView);
      //       },
      //       child: const Text(
      //         "Skip",
      //         style: TextStyle(color: kcBlackColor),
      //       ),
      //     ),
      //   ],
      // ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.pages[_currentPage].bgImage),
          fit: BoxFit.cover,

        )
      ),
      child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.comfortable,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      widget.onSkip?.call();
                      locator<NavigationService>().clearStackAndShow(Routes.homeView);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: kcBlackColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 500,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Image.asset(
                                      item.imageUrl,
                                      height: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                          child: Text(
                            item.title,
                            style:  TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: item.textColor, // Set text color dynamically

                            ),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            item.description,
                            style:  TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: item.textColor, // Set text color dynamically

                            ),
                          ),

                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages.map((item) {
                  int index = widget.pages.indexOf(item);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: _currentPage == index ? 30 : 8,
                    height: 8,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: kcBlackColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: kcPrimaryColor,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          widget.onFinish?.call();
                          locator<NavigationService>().clearStackAndShow(Routes.authView);
                        } else {
                          _pageController.animateToPage(
                            _currentPage + 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 250),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Icon(
                            _currentPage == widget.pages.length - 1
                                ? Icons.done
                                : Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final String bgImage;
  final Color textColor;


  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.bgImage,
    required this.textColor,
  });
}
