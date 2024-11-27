import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';


/// @author George David
/// email: georgequin19@gmail.com
/// Feb, 2024
///


class AuthView extends StatefulWidget {
  const AuthView({Key? key, required bool isLogin}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthViewState();
  }
}

class _AuthViewState extends State<AuthView> with TickerProviderStateMixin {
  late TabController tabController;
  bool isLogin = true;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void updateIsLogin(bool value) {
    setState(() {
      isLogin = value;
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/groupwash.png",
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SliverList(
            delegate: SliverChildListDelegate(
              [

                Container(
                  padding: const EdgeInsets.all(25),
                  height: MediaQuery.of(context).size.height,  // Set a specific height constraint
                  child: Column(
                    children:  [
                      Flexible(
                        child: SingleChildScrollView(
                          child: isLogin ? Login(updateIsLogin: (value) {
                            setState(() {
                              isLogin = value;
                            });
                          })
                              : Register(updateIsLogin: (value) {
                            setState(() {
                              isLogin = value;
                            });
                          }, isLogin: true,),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(30),
                //   child: Column(
                //     children: const [
                //       Flexible(
                //         child: SingleChildScrollView(
                //           child: Login(),
                //         ),
                //       ),
                //       // Stack(
                //       //   children: [
                //       //
                //       //     // Positioned(
                //       //     //   bottom: 0,
                //       //     //   child: Container(
                //       //     //     height: 4,
                //       //     //     width: MediaQuery.of(context).size.width,
                //       //     //     color: kcVeryLightGrey,
                //       //     //   ),
                //       //     // ),
                //       //     // TabBar(
                //       //     //   controller: tabController,
                //       //     //   labelColor: kcSecondaryColor,
                //       //     //   unselectedLabelColor:
                //       //     //       uiMode.value == AppUiModes.light
                //       //     //           ? kcBlackColor
                //       //     //           : kcWhiteColor,
                //       //     //   indicatorWeight: 4,
                //       //     //   indicatorColor: kcSecondaryColor,
                //       //     //   tabs: const [
                //       //     //     Tab(
                //       //     //       text: "Login",
                //       //     //     ),
                //       //     //     Tab(
                //       //     //       text: "Register",
                //       //     //     )
                //       //     //   ],
                //       //     // ),
                //       //   ],
                //       // ),
                //       // SizedBox(
                //       //   height: MediaQuery.of(context).size.height / 1.7,
                //       //   child: TabBarView(
                //       //     controller: tabController,
                //       //     children: _tabs,
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
