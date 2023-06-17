import 'package:afriprize/app/app.locator.dart';
import 'package:afriprize/app/app.logger.dart';
import 'package:afriprize/app/app.router.dart';
import 'package:afriprize/core/data/repositories/repository.dart';
import 'package:afriprize/core/network/api_response.dart';
import 'package:afriprize/ui/components/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel {
  final otp = TextEditingController();
  final repo = locator<Repository>();
  final snackBar = locator<SnackbarService>();
  final log = getLogger("OtpViewModel");

  void verify(String email, context) async {
    setBusy(true);

    try {
      ApiResponse res = await repo.verify({
        "email": email,
        "code": otp.text,
      });
      if (res.statusCode == 200) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return SuccessPage(
            title: "Congratulations!",
            description: "Your account is ready!",
            callback: () {
              locator<NavigationService>().replaceWithAuthView();
            },
          );
        }));
      } else {
        snackBar.showSnackbar(message: res.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }

    setBusy(false);
  }
}