import 'dart:convert';

import 'package:limpia/core/utils/local_store_dir.dart';
import 'package:limpia/core/utils/local_stotage.dart';
import 'package:stacked/stacked.dart';
import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/data/models/profile.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/interceptors.dart';
import '../../../state.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    String? token = await locator<LocalStorage>().fetch(LocalStorageDir.authToken);
    String? user = await locator<LocalStorage>().fetch(LocalStorageDir.authUser);
    bool? onboarded = await locator<LocalStorage>().fetch(LocalStorageDir.onboarded);
    print('value of onboarded is: $onboarded');
    if (onboarded == null || onboarded == false) {
      _navigationService.replaceWithOnboardingView2();
    } else {
      print('checking tokens');
      if (token != null && user != null) {
        print('got token');
        userLoggedIn.value = true;
        profile.value = Profile.fromJson(Map<String, dynamic>.from(jsonDecode(user)));
        _navigationService.replaceWithHomeView();
      }else{
        _navigationService.clearStackAndShow(Routes.authView);
      }
    }
  }

  // void getProfile() async {
  //   try {
  //     ApiResponse res = await repo.getProfile();
  //     if (res.statusCode == 200) {
  //       profile.value =
  //           Profile.fromJson(Map<String, dynamic>.from(res.data['data']));
  //       await locator<LocalStorage>().save(LocalStorageDir.profileView, res.data["data"]);
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }


}
