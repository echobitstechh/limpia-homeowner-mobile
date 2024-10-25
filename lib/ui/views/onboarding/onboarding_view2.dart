import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../components/empty_state.dart';
import '../../components/submit_button.dart';
import '../auth/auth_view.dart';
import '../auth/auth_view.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [

        OnboardingPageModel(
          title: 'Work On Your Schedule',
          description:
          'Find Cleaning Jobs, Manage Your Tasks, Get Paid Quickly. ',
          imageUrl: 'second.json',
          bgColor: kcWhiteColor,
        ),

        OnboardingPageModel(
          title: 'Make an Impact!',
          description:
          'Your points hold the power to create change! Team up with fellow adventurers to support noble causes.',
          imageUrl: 'third.json',
          bgColor: kcWhiteColor,
        )
      ]),
    );
  }
}
final LocalStorage _localStorage = locator<LocalStorage>();

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, required this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    // locator<LocalStorage>().save(LocalStorageDir.onboarded, true);
  }

  @override
  void dispose() {
    // Dispose of the video controller to release resources
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: Column(
          children: [
            // Stack with image inside Align
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: CurvedClipper(),
                    child: Container(
                      height: 500,
                      color: kcPrimaryColor.withOpacity(0.6),
                      child: Align(
                        alignment: Alignment.bottomCenter, // Align image to bottom of the ClipPath
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0), // Optional padding for spacing
                          child: Image.asset(
                            'assets/images/man.png',
                            height: 350,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            verticalSpaceMedium,

            // Text content below the image
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.pages[_currentPage].title,
                style: const TextStyle(
                  fontSize: 28,
                  color: kcBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.pages[_currentPage].description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kcDarkGreyColor,
                ),
              ),
            ),
            const Spacer(), // Spacer to push the content below

            // Page indicator (counter)
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




            // Bottom buttons
      // Padding(
      //   padding:
      //   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      //   child: Column(
      //     children: [
      //       TextButton(
      //         style: TextButton.styleFrom(
      //           visualDensity: VisualDensity.comfortable,
      //           foregroundColor: Colors.white,
      //           textStyle: const TextStyle(
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         onPressed: () {
      //           widget.onSkip?.call();
      //           locator<NavigationService>().clearStackAndShow(Routes.authView);
      //         },
      //         child: const Text("Skip", style: TextStyle(color: kcBlackColor),),
      //       ),]
      //       ),
      //       ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  SubmitButton(
                    isLoading: false,
                    boldText: true,
                    label: "Sign Up",
                    submit: ()async {
                      await _localStorage.save(
                          LocalStorageDir.onboarded, true);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthView()),
                      );
                      //AuthView();
                    },
                    color: kcPrimaryColor,
                  ),
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
                      // Add logic for Sign In
                    },
                    child: Column(
                      children: [
                        Text(
                          "Sign in",
                          style: TextStyle(color: kcPrimaryColor, fontSize: 18),
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
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  });
}



class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    // Start from top-left corner
    path.lineTo(0, size.height - 100);
    // Create a quadratic bezier curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    // Line to the top-right corner
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}










