import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import '../../common/app_colors.dart';
import '../../components/submit_button.dart';
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
                          _showCustomBottomSheet(context);
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
                            'No')
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
  void _showCustomBottomSheet(BuildContext context) {
    int selectedRooms = 1; // Default selected room number
    double selectedBathrooms = 0; // Default selected bathroom count
    bool isIndividualCleaner = true;
    int selectedCleaners = 1;

    showModalBottomSheet(
      backgroundColor: Colors.grey,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                                'Rate Mavin Tracy'
                            ),
                            Center(
                              child: RatingBarIndicator(
                                rating:
                                5, // Replace with dynamic rating
                                itemBuilder: (context, index) =>
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                itemCount: 5,
                                itemSize: 70.0,
                              ),
                            ),
                            Text(
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                                'What did you like?'
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(80, 50),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black
                                            ),
                                            'Punctuality')
                                    ),
                                    ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(80, 50),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black
                                            ),
                                            'Thoroughness')
                                    ),
                                    ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(80, 50),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black
                                            ),
                                            'Professionalism')
                                    ),
                                  ],
                                ),
                                verticalSpaceSmall,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(80, 50),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black
                                            ),
                                            'Communication')
                                    ),
                                    horizontalSpaceMedium,
                                    ElevatedButton(
                                        onPressed: () {

                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          backgroundColor: Colors.white,
                                          minimumSize: Size(80, 50),
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        child: Text(
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black
                                            ),
                                            'Efficiency')
                                    ),
                                  ],
                                ),
                                verticalSpaceMedium,
                                TextField(
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Comments',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 4,
                                ),
                                // SubmitButton(
                                //   isLoading: model.isBusy,
                                //   boldText: true,
                                //   label: "Continue",
                                //   submit: () {
                                //   },
                                //   color: Colors.black,
                                // ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]
                ),
              ),
            );
          },
        );
      },
    );
  }
  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
