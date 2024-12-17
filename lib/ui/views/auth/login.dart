import 'package:flutter_svg/svg.dart';
import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.router.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:limpia/ui/components/submit_button.dart';
import 'package:limpia/ui/components/text_field_widget.dart';
import 'package:limpia/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../state.dart';

/// @author George David
/// email: georgequin19@gmail.com
/// Feb, 2024
///

class Login extends StatefulWidget {
  final Function(bool) updateIsLogin;
  const Login({Key? key, required this.updateIsLogin}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool terms = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: ViewModelBuilder<AuthViewModel>.reactive(
          onViewModelReady: (model) {
            model.init();
          },
          viewModelBuilder: () => AuthViewModel(),
          builder: (context, model, child) => ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'roboto'
                    ),
                  ),
                ],
              ),

              verticalSpaceMedium,
              TextFieldWidget(
                hint: "Email",
                controller: model.email,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: "Password",
                controller: model.password,
                obscureText: model.obscure,
                suffix: InkWell(
                  onTap: () {
                    model.toggleObscure();
                  },
                  child: Icon(
                      model.obscure ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: model.toggleRemember,
                    child: Row(
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: model.remember
                                    ? kcSecondaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: model.remember
                                        ? Colors.transparent
                                        : kcPrimaryColor)),
                            child: model.remember
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: kcWhiteColor,
                                      size: 14,
                                    ),
                                  )
                                : const SizedBox()),
                        horizontalSpaceSmall,
                        const Text(
                          "Remember Me",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      locator<NavigationService>().navigateToEnterEmailView();
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 16,
                        color: kcPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
              verticalSpaceLarge,
              SubmitButton(
                isLoading: appLoading.value,
                boldText: true,
                label: "Login Account",
                submit: () {
                  model.login();
                },
                color: kcPrimaryColor,
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/x.svg',
                        height: 30, // Adjust the height as needed
                        width: 30, // Adjust the width as needed
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/fb.svg',
                        height: 30, // Adjust the height as needed
                        width: 30, // Adjust the width as needed
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/ggl.svg',
                        height: 30, // Adjust the height as needed
                        width: 30, // Adjust the width as needed
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              verticalSpaceTiny,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    gotoRegister();
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 12,
                      color: kcPrimaryColor,
                    ),
                  ),
                )
              ]),

              // verticalSpaceMedium,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: const <Widget>[
              //     Expanded(
              //       child: Divider(
              //         color: Colors.grey,
              //         thickness: 1,
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 8),
              //       child: Text(
              //         "OR",
              //         style: TextStyle(
              //           fontSize: 14,
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Divider(
              //         color: Colors.grey,
              //         thickness: 1,
              //       ),
              //     ),
              //   ],
              // ),
              //
              // verticalSpaceMedium,
              //
              // SubmitButton(
              //   isLoading: model.isBusy,
              //   boldText: true,
              //   iconIsPrefix: true,
              //   icon: FontAwesomeIcons.google,
              //   label: "Sign in with Google",
              //   textColor: Colors.black,
              //   submit: () {
              //     Fluttertoast.showToast(msg: 'Coming soon',
              //         toastLength: Toast.LENGTH_LONG
              //     );
              //   },
              //   color: kcLightGrey,
              // ),

              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  void gotoRegister() {
    widget.updateIsLogin(false);
  }
}
