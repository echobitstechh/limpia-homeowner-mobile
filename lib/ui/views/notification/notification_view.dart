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
      appBar: AppBar(
        leading: Icon(
          Icons.notifications_outlined,
          size: 30,
          color: kcPrimaryColor,
        ),
        title: const Text(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kcPrimaryColor,
              fontSize: 24,
              decorationColor: kcPrimaryColor,
            ),
            "Notification"
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              width: 60,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  color: Colors.lightBlueAccent,
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                      'assets/images/Frame16.png'
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '🔔Cleaner Accepted',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20, ),
                                      ),
                                      Text(
                                        'Track Cleaner',
                                        style: TextStyle(
                                          color: kcPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20, ),
                                      ),
                                    ],
                                  ),
                                ],
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
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              width: 60,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  color: Colors.lightBlueAccent,
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                      'assets/images/Frame15.png'
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '🔔Your cleaning service has\n been canceled',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18, ),
                                      ),
                                      Text(
                                        'The cleaner has canceled your booking...',
                                        style: TextStyle(
                                          fontSize: 14, ),
                                      ),
                                    ],
                                  ),
                                ],
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
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              elevation: 5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                              width: 60,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  color: Colors.lightBlueAccent,
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                      'assets/images/Frame13.png'
                                  ),
                                ),
                              )
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '🔔Cleaner Booked',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18, ),
                                      ),
                                      Text(
                                        'Schedule appointment this week',
                                        style: TextStyle(
                                          color: kcPrimaryColor,
                                          fontSize: 14, ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '12:30.00',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18, ),
                                          ),
                                          horizontalSpaceLarge,
                                          Text(
                                            'Feb 7,2024',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kcPrimaryColor,
                                              fontSize: 14, ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
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
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      NotificationViewModel();
}
