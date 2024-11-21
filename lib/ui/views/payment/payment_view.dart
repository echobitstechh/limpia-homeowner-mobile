import 'package:flutter/material.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kcPrimaryColor, // Replace with `kcPrimaryColor`
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
        title: const Text(
          "Payment Methods",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle add action
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          height: 200,
                            fit: BoxFit.cover,
                            'assets/images/visa.png'
                        ),
                        horizontalSpaceMedium,
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                            'Visa',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                            height: 200,
                            fit: BoxFit.cover,
                            'assets/images/master_card.png'
                        ),
                        horizontalSpaceMedium,
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          'Master Card',
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                            height: 200,
                            fit: BoxFit.cover,
                            'assets/images/Amex.png'
                        ),
                        horizontalSpaceMedium,
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          'American Express',
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                            height: 200,
                            fit: BoxFit.cover,
                            'assets/images/Paypal.png'
                        ),
                        horizontalSpaceMedium,
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          'PayPal',
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 80,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                            height: 200,
                            fit: BoxFit.cover,
                            'assets/images/Diners.png'
                        ),
                        horizontalSpaceMedium,
                        Text(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          'Diners',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
