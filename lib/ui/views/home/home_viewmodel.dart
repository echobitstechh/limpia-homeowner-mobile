import 'dart:io';

import 'package:limpia/app/app.bottomsheets.dart';
import 'package:limpia/app/app.dialogs.dart';
import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.router.dart';
import 'package:limpia/core/utils/config.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/app_strings.dart';
import 'package:limpia/ui/views/bookings/booked_view.dart';
import 'package:limpia/ui/views/bookings/bookings_view.dart';
import 'package:limpia/ui/views/dashboard/dashboard_view.dart';
import 'package:limpia/ui/views/notification/notification_view.dart';
import 'package:limpia/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:update_available/update_available.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../state.dart';

/// @author George David
/// email: georgequin19@gmail.com
/// Feb, 2024
///

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  List<Widget> pages = [
     DashboardView(),
     const BookingView(),
    // const CartView(),
    // const NotificationView(),
    const ProfileView()
  ];

  int selectedHomeTab = 0;
  int selectedShopTab = 0;

  @override
  void dispose() {
    // Don't forget to remove the listener when the view model is disposed.
    currentModuleNotifier.removeListener(notifyListeners);
    super.dispose();
  }



  // Pages for the Raffles dashboard
  List<Widget> rafflesPages = [
    DashboardView(),
     const BookingView(),
    // const NotificationView(),
    const ProfileView()
  ];

  // Pages for the Shop dashboard
  List<Widget> shopPages = [
    // ShopDashboardView(),
     const BookingView(),
     NotificationView(),
    const ProfileView()
  ];

  HomeViewModel() {
    currentModuleNotifier.addListener(notifyListeners);
  }


  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  int selectedTab = 0;

  AppModules selectedModule = AppModules.raffle;

  // void toggleModule(bool isRafflesSelected) {
  //   selectedModule = isRafflesSelected ? AppModules.raffle : AppModules.shop;
  //   notifyListeners();
  // }

  void toggleModule(bool isRafflesSelected) {
    currentModuleNotifier.value = isRafflesSelected ? AppModules.raffle : AppModules.shop;
    notifyListeners();
  }

  //for test
  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void changeSelected(int index, AppModules module) {
    // if (index != 0 && !userLoggedIn.value) {
    //   showModalBottomSheet(
    //       context: StackedService.navigatorKey!.currentState!.context,
    //       shape: const RoundedRectangleBorder(
    //           borderRadius: BorderRadius.only(
    //               topRight: Radius.circular(20), topLeft: Radius.circular(20))),
    //       builder: (ctx) {
    //         return Container(
    //           padding: const EdgeInsets.all(30),
    //           height: 200,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               const Text("You need to login to continue"),
    //               verticalSpaceMedium,
    //               SubmitButton(
    //                 isLoading: false,
    //                 label: "Login",
    //                 submit: () {
    //                   locator<NavigationService>().replaceWithAuthView();
    //                 },
    //                 color: kcSecondaryColor,
    //               )
    //             ],
    //           ),
    //         );
    //       });
    //   return;
    //}

      selectedHomeTab = index;
      notifyListeners();
  }


  Widget get currentPage {
    return currentModuleNotifier.value == AppModules.raffle
        ? rafflesPages[selectedHomeTab]
        : shopPages[selectedShopTab];
  }

  void _showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> checkForUpdates(BuildContext context) async {
    final availability = await getUpdateAvailability();
    if (availability is UpdateAvailable) {
      showUpdateCard(context);
    }
  }

  void showUpdateCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/update.svg',
                  height: 94,
                ),
                const ListTile(
                  title: Text('App Updates', style: TextStyle(fontSize: 22,
                    fontFamily: "Panchang", fontWeight: FontWeight.bold, color: kcSecondaryColor)),
                  subtitle: Text('A new version of Limpia is now available.'
                      ' download now to enjoy our lastest features.', style: TextStyle(fontSize: 13,
                    fontFamily: "Panchang",)),
                ),
                ButtonBar(
                  children: <Widget>[
                    TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kcSecondaryColor)),
                      onPressed: () {
                        Platform.isIOS ? _launchURL(AppConfig.APPLESTOREURL) : _launchURL(AppConfig.GOOGLESTOREURL);
                        Navigator.pop(context);
                      },
                      child: const Text('Update Now', style: TextStyle(
                          fontFamily: "Panchang", fontWeight: FontWeight.bold, color: kcWhiteColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
