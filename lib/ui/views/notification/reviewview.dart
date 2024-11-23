import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import '../../common/app_colors.dart';
import 'notification_viewmodel.dart';

class Reviewview extends StackedView<NotificationViewModel> {
  const Reviewview({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        backgroundColor: kcPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
        toolbarHeight: 200.0,
        title: Center(
          child: Container(
            padding:
                const EdgeInsets.only(left: 7, right: 7, bottom: 7, top: 7),
            decoration: BoxDecoration(
              color: uiMode.value == AppUiModes.dark
                  ? kcPrimaryColor.withOpacity(0.7)
                  : kcPrimaryColor.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kcPrimaryColor, width: 0),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  'Mavin Tracy'),
              verticalSpaceTiny,
              Text(
                  style: TextStyle(fontSize: 28, color: Colors.white),
                  'Work Completion Details'),
              Text(
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  'Service: Basic Cleaning'),
              Row(
                children: [
                  Text(
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      'Date: October 15, 2024 '),
                  horizontalSpaceMedium,
                  Text(
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      'Time: 9:00 AM - 12:00 PM'),
                ],
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  'Uploaded Photos:'),
              Text(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  'Before Photo'),
              verticalSpaceSmall,
              Image.asset('assets/images/before.png'),
              verticalSpaceMedium,
              Text(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  'Before Photo'),
              verticalSpaceSmall,
              Image.asset('assets/images/after.png'),
              verticalSpaceMedium,
              Text('Do you accept the work as completed?'),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: kcPrimaryColor,
                          minimumSize: Size(150, 80),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                            'Yes')
                    ),
                    horizontalSpaceMedium,
                    ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: kcPrimaryColor),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Colors.white,
                          minimumSize: Size(150, 80),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: Text(
                            style: TextStyle(
                                fontSize: 24,
                                color: kcPrimaryColor
                            ),
                            'Yes')
                    ),
                  ],
                ),
              ),
            ],
          ),
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
