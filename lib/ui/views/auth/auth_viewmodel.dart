import 'dart:convert';

import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.logger.dart';
import 'package:limpia/app/app.router.dart';
import 'package:limpia/core/data/repositories/repository.dart';
import 'package:limpia/core/network/api_response.dart';
import 'package:limpia/core/utils/local_store_dir.dart';
import 'package:limpia/core/utils/local_stotage.dart';
import 'package:limpia/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/data/models/profile.dart';


/// @author George David
/// email: georgequin19@gmail.com
/// Feb, 2024
///


enum RegistrationResult { success, failure }
class AuthViewModel extends BaseViewModel {
  final log = getLogger("AuthViewModel");
  final repo = locator<Repository>();
  final snackBar = locator<SnackbarService>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final serviceController = TextEditingController();
  String? selectedGender;
  late String phoneValue = "";
  late PhoneNumber phoneNumber;
  late String countryId = "";
  final password = TextEditingController();
  final cPassword = TextEditingController();
  bool obscure = true;
  bool terms = false;
  bool remember = false;

  bool? loadingCountries = false;
  String? countryValue;
  String? addressValue;
  String? cityValue;
  String? stateValue;
  String? zipValue;
  String? streetValue;
  num? long;
  num? lat;


  init() async {

    bool rem = await locator<LocalStorage>().fetch(LocalStorageDir.remember);
    String? token = await locator<LocalStorage>().fetch(LocalStorageDir.authToken);
    String? lastEmail = await locator<LocalStorage>().fetch(LocalStorageDir.lastEmail);
    remember = rem;


    // If remember me is true and we have a token, validate it
    if (remember && token != null && JwtDecoder.isExpired(token)) {
      // Here you should make a call to your backend to validate the token
      // bool isValidToken = await validateToken(token);
      // if (isValidToken) {
        userLoggedIn.value = true;
        // Retrieve and set user profile from saved JSON in local storage
        String? userJson =
        await locator<LocalStorage>().fetch(LocalStorageDir.authUser);
        if (userJson != null) {
          profile.value = Profile.fromJson(jsonDecode(userJson));
        }
        locator<NavigationService>().clearStackAndShow(Routes.homeView);
        return;
      // }
    }

    if( token != null && !JwtDecoder.isExpired(token)){
      await locator<LocalStorage>()
          .delete(LocalStorageDir.authToken);
      userLoggedIn.value = false;
    }

    // Set the lastEmail if remember me is true
    if (remember) {
      String? lastEmail =
      await locator<LocalStorage>().fetch(LocalStorageDir.lastEmail);
      if (lastEmail != null) {
        email.text = lastEmail;
      }
    }


    if (lastEmail != null) {
      email.text = lastEmail;
    }
    rebuildUi();
  }

  void toggleRemember() {
    remember = !remember;
    rebuildUi();
  }

  void toggleObscure() {
    obscure = !obscure;
    rebuildUi();
  }

  void toggleTerms() {
    terms = !terms;
    rebuildUi();
  }

  void login() async {

    appLoading.value = true;

    try {
      ApiResponse res = await repo.login({
        "email": email.text,
        "password": password.text,
        "role": 'HomeOwner'
      });
      if (res.statusCode == 200) {

        userLoggedIn.value = true;
        print(res.data);

        locator<LocalStorage>().save(LocalStorageDir.authToken, res.data['token']);
        locator<LocalStorage>().save(LocalStorageDir.authRefreshToken, res.data['refreshToken']);
        locator<LocalStorage>().save(LocalStorageDir.authUser, jsonEncode(res.data['user']));
        profile.value =
            Profile.fromJson(Map<String, dynamic>.from(res.data["user"]));

        if (remember) {
          locator<LocalStorage>().save(LocalStorageDir.lastEmail, email.text);
        } else {
          locator<LocalStorage>().delete(LocalStorageDir.lastEmail);
        }
        locator<NavigationService>().clearStackAndShow(Routes.homeView);
      } else {
        snackBar.showSnackbar(message: res.data["message"]);
      }
    } catch (e) {
      log.i(e);
    }finally{
      appLoading.value = false;
    }

  }

  Future<RegistrationResult> register() async {


    appLoading.value = true;
    try {

      ApiResponse res = await repo.register({
        "firstName": firstname.text,
        "lastName": lastname.text,
        "email": email.text,
        "address": addressValue,
        "city": cityValue,
        "location": {
          "long": long,
          "lat": lat
        },
        "state": stateValue,
        "country": countryValue,
        "street": streetValue,
        "password": password.text,
        "role": 'HomeOwner',
      });

      if (res.statusCode == 201) {

        userLoggedIn.value = true;
        print(res.data);

        locator<LocalStorage>().save(LocalStorageDir.authToken, res.data['token']);
        locator<LocalStorage>().save(LocalStorageDir.authRefreshToken, res.data['refreshToken']);
        locator<LocalStorage>().save(LocalStorageDir.authUser, jsonEncode(res.data['user']));
        profile.value =
            Profile.fromJson(Map<String, dynamic>.from(res.data["user"]));

        locator<NavigationService>().clearStackAndShow(Routes.homeView);
        firstname.text = "";
        lastname.text = "";
        email.text = "";
        password.text = "";
        terms = false;
        setBusy(false);
        return RegistrationResult.success;
      }
      else {

        if (res.data["message"] is String) {
          snackBar.showSnackbar(message: res.data["message"]);
          return RegistrationResult.failure; // Return failure since it's an error message
        }
        else if (res.data["message"] is List<String>) {
          snackBar.showSnackbar(message: res.data["message"].join('\n'));
          return RegistrationResult.failure; // Return failure since it's an error message
        } else {
          // Handle unexpected data type (e.g., it's not a string or list)
          snackBar.showSnackbar(message: "Unexpected response format");
          return RegistrationResult.failure;
        }
      }

    } catch (e) {
      log.e(e);
      return RegistrationResult.failure;

    } finally {
      appLoading.value = false;
      notifyListeners();
    }

  }

}
