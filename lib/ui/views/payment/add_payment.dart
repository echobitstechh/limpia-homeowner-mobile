import 'package:flutter/material.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';

import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'booking_success.dart';

class AddPaymentView extends StatelessWidget {
  const AddPaymentView({super.key});



  @override
  Widget build(BuildContext context) {
    final cardName = TextEditingController();
    final cardNumber = TextEditingController();
    final month = TextEditingController();
    final year = TextEditingController();
    bool isBusy = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor, // Replace with `kcPrimaryColor`
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
        title: const Text(
          "Add Payment Methods",
          style: TextStyle(fontWeight: FontWeight.bold, color: kcWhiteColor,),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/credit card - Account Card.png'),
              TextFieldWidget(
                hint: "Name on card",
                controller: cardName,
              ),
              verticalSpaceSmall,
              TextFieldWidget(
                hint: "Card Number",
                controller: cardNumber,
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hint: "Month",
                      controller: month,
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between TextFields
                  Expanded(
                    child: TextFieldWidget(
                      hint: "Year",
                      controller: year,
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hint: "CVV",
                      controller: month,
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between TextFields
                  Expanded(
                    child: Text(
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                       "3 0r 4 digit usually found on the \nsignature strip",
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
              SubmitButton(
                isLoading: isBusy,
                boldText: true,
                label: "Proceed",
                submit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingSuccessView()),
                  );
                },
                color: kcPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
