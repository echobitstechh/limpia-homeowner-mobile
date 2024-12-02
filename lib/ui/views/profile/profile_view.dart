import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.router.dart';
import 'package:limpia/core/utils/local_store_dir.dart';
import 'package:limpia/core/utils/local_stotage.dart';
import 'package:limpia/state.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:limpia/ui/components/profile_picture.dart';
import 'package:limpia/ui/views/profile/order_list.dart';
import 'package:limpia/ui/views/profile/profile_details.dart';
import 'package:limpia/ui/views/profile/refferal.dart';
import 'package:limpia/ui/views/profile/settings_view.dart';
import 'package:limpia/ui/views/profile/support.dart';
import 'package:limpia/ui/views/profile/ticket_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/interceptors.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  get isBiometricLoginEnabled => false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (viewModel) {
        viewModel.getProfile();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Profile"),
            ),
            body:viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Container(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    // barrierColor: Colors.black.withAlpha(50),
                                    // backgroundColor: Colors.transparent,
                                    backgroundColor:
                                    Colors.black.withOpacity(0.7),
                                    builder: (BuildContext context) {
                                      return const FractionallySizedBox(
                                        heightFactor:
                                        1.0, // 70% of the screen's height
                                        child: ProfileScreen(),
                                      );
                                    },
                                  );
                                  // viewModel.updateProfilePicture();
                                },
                                child: ProfilePicture(
                                  size: 100,
                                  url: profile.value.profilePic?.url,
                                ),
                              ),
                              // horizontalSpaceLarge,
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    // barrierColor: Colors.black.withAlpha(50),
                                    // backgroundColor: Colors.transparent,
                                    backgroundColor:
                                    Colors.black.withOpacity(0.7),
                                    builder: (BuildContext context) {
                                      return const FractionallySizedBox(
                                        heightFactor:
                                        1.0, // 70% of the screen's height
                                        child: ProfileScreen(),
                                      );
                                    },
                                  );
                                  // viewModel.updateProfilePicture();
                                },
                                child: Container(
                                  width: 30, // Width and height of the circle
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color:
                                    kcPrimaryColor, // Background color of the circle
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                      kcWhiteColor, // Border color of the circle
                                      width: 2, // Border width
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: kcWhiteColor, // Icon color
                                    size: 18, // Icon size
                                  ),
                                ),
                              ),
                            ],
                          ),
                          horizontalSpaceMedium,
                          Container(
                            height: 100,
                            width: 370,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${profile.value.firstname} ${profile.value.lastname}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(profile.value.username ?? ""),
                                  Text(
                                      style: TextStyle(
                                      ),
                                      '@layemi'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                viewModel.showChangePP
                    ? Column(
                  children: [
                    verticalSpaceMedium,
                    InkWell(
                      onTap: () {
                        viewModel.updateProfilePicture();
                      },
                      child: const Text(
                        "Change Profile Picture",
                        style: TextStyle(
                          color: kcSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                )
                    : const SizedBox(),
                verticalSpaceMedium,
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 25
                                ),
                                'Home Owner data'
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  // onTap: () {
                                  //   showModalBottomSheet(
                                  //     context: context,
                                  //     isScrollControlled: true,
                                  //     // barrierColor: Colors.black.withAlpha(50),
                                  //     // backgroundColor: Colors.transparent,
                                  //     backgroundColor: Colors.black.withOpacity(0.7),
                                  //     builder: (BuildContext context) {
                                  //       return const FractionallySizedBox(
                                  //         heightFactor:
                                  //             1.0, // 70% of the screen's height
                                  //         child: ProfileScreen(),
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.person_outline_outlined),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "View details"
                                      ),
                                      const Text(
                                          "Full Name, email, phone no etc"
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 25
                                ),
                                'Security'
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  // onTap: () {
                                  //   showModalBottomSheet(
                                  //     context: context,
                                  //     isScrollControlled: true,
                                  //     // barrierColor: Colors.black.withAlpha(50),
                                  //     // backgroundColor: Colors.transparent,
                                  //     backgroundColor: Colors.black.withOpacity(0.7),
                                  //     builder: (BuildContext context) {
                                  //       return const FractionallySizedBox(
                                  //         heightFactor:
                                  //             1.0, // 70% of the screen's height
                                  //         child: ProfileScreen(),
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.lock_outline_sharp),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "Change Password"
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.fingerprint),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Text('Biometric Login'),
                                  trailing: Switch(
                                    value: isBiometricLoginEnabled,
                                    onChanged: (value) {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: TextStyle(
                                    fontSize: 25
                                ),
                                'Others'
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  // onTap: () {
                                  //   showModalBottomSheet(
                                  //     context: context,
                                  //     isScrollControlled: true,
                                  //     // barrierColor: Colors.black.withAlpha(50),
                                  //     // backgroundColor: Colors.transparent,
                                  //     backgroundColor: Colors.black.withOpacity(0.7),
                                  //     builder: (BuildContext context) {
                                  //       return const FractionallySizedBox(
                                  //         heightFactor:
                                  //         1.0, // 70% of the screen's height
                                  //         child: ProfileScreen(),
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.call),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "Customer Support"
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                ListTile(
                                  // onTap: () {
                                  //   showModalBottomSheet(
                                  //     context: context,
                                  //     isScrollControlled: true,
                                  //     // barrierColor: Colors.black.withAlpha(50),
                                  //     // backgroundColor: Colors.transparent,
                                  //     backgroundColor: Colors.black.withOpacity(0.7),
                                  //     builder: (BuildContext context) {
                                  //       return const FractionallySizedBox(
                                  //         heightFactor:
                                  //         1.0, // 70% of the screen's height
                                  //         child: ProfileScreen(),
                                  //       );
                                  //     },
                                  //   );
                                  // },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.settings_sharp),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "Preferences"
                                      ),
                                      const Text(
                                          "Themes, Language, Notifications etc"
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                ListTile(
                                  onTap: () {
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   isScrollControlled: true,
                                    //   // barrierColor: Colors.black.withAlpha(50),
                                    //   // backgroundColor: Colors.transparent,
                                    //   backgroundColor: Colors.black.withOpacity(0.7),
                                    //   builder: (BuildContext context) {
                                    //     return const FractionallySizedBox(
                                    //       heightFactor:
                                    //       1.0, // 70% of the screen's height
                                    //       child: ProfileScreen(),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.refresh_outlined),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "Referral program"
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpaceMedium,
                                ListTile(
                                  onTap: () {
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   isScrollControlled: true,
                                    //   // barrierColor: Colors.black.withAlpha(50),
                                    //   // backgroundColor: Colors.transparent,
                                    //   backgroundColor: Colors.black.withOpacity(0.7),
                                    //   builder: (BuildContext context) {
                                    //     return const FractionallySizedBox(
                                    //       heightFactor:
                                    //       1.0, // 70% of the screen's height
                                    //       child: ProfileScreen(),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  leading: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: IconButton(
                                        icon: Icon(Icons.people),
                                        iconSize: 50,
                                        onPressed: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                          "About us"
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: ListTile(
                                    // onTap: () {
                                    //   showModalBottomSheet(
                                    //     context: context,
                                    //     isScrollControlled: true,
                                    //     // barrierColor: Colors.black.withAlpha(50),
                                    //     // backgroundColor: Colors.transparent,
                                    //     backgroundColor: Colors.black.withOpacity(0.7),
                                    //     builder: (BuildContext context) {
                                    //       return const FractionallySizedBox(
                                    //         heightFactor:
                                    //             1.0, // 70% of the screen's height
                                    //         child: ProfileScreen(),
                                    //       );
                                    //     },
                                    //   );
                                    // },
                                    leading: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                          icon: Icon(Icons.logout),
                                          iconSize: 50,
                                          onPressed: () {
                                          },
                                        ),
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold
                                            ),
                                            "Logout"
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Center(
                  child: Opacity(
                    opacity: 0.4,
                    child: GestureDetector(
                      onTap: () async {
                        locator<NavigationService>()
                            .navigateToDeleteAccountView();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ensures the Row takes only the space of its children
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                              width:
                              8), // Spacing between the icon and text
                          Text(
                            "Delete Account",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  // @override
  // void onViewModelReady(ProfileViewModel viewModel) {
  //    viewModel.getProfile();
  //   super.onViewModelReady(viewModel);
  // }

  @override
  ProfileViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ProfileViewModel();
}
