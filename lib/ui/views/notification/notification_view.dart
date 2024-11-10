import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      NotificationViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image for the entire body with reduced opacity
          Center(
            child: Opacity(
              opacity: 0.8, // Control the transparency of the background image
              child: SizedBox(
                height: 400, // Set your desired height
                width: 400,  // Set your desired width
                child: Image.asset(
                  'assets/images/limpiar_bg.png', // Replace with your image asset
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),


          // AppBar section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: Size.fromHeight(200.0),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.0), // Adjust this value for the rounded edge
                ),
                child: Stack(
                  alignment: Alignment.center, // Center all children within the Stack
                  children: [
                    // Background color container
                    Container(
                      color: kcPrimaryColor, // Adjust this color as needed
                      height: 200.0,
                    ),
                    // Faint background image in the AppBar
                    Align(
                      alignment: Alignment.centerRight, // Align the image to the right
                      child: Opacity(
                        opacity: 0.8, // Control opacity here
                        child: Image.asset(
                          'assets/images/bg_logo.png', // Replace with your image path
                          height: 200, // Set your desired height
                          width: 300,  // Set your desired width
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/images/limpia.png',
                      width: 220, // Adjust size as needed
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Profile picture overlapping AppBar and body
          Positioned(
            top: 150, // Adjust to position it halfway out of the AppBar
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 70, // Adjust size as needed
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your image asset
                ),
              ),
            ),
          ),

          // Body content, offset down to accommodate profile picture
          Positioned.fill(
            top: 300, // Adjust to start below the profile picture
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person_4_outlined,
                        size: 30,
                      ),
                      iconColor: kcPrimaryColor,
                      title: Text(
                        'Profile',
                        style: TextStyle(
                          color: kcPrimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      )

                    ),
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.account_balance_wallet,
                      size: 30,
                      ),
                      iconColor: kcPrimaryColor,
                      title: Text(
                        'Subscription',
                        style: TextStyle(color: kcPrimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.settings,
                      size: 30,
                      ),
                      iconColor: kcPrimaryColor,
                      title: Text(
                        'Settings',
                        style: TextStyle(color: kcPrimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      NotificationViewModel();
}
