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
          padding: const EdgeInsets.all(25.0),
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                'assets/images/before.png',
                                fit: BoxFit.contain,
                                // width: 700, // Set a size for the image
                                // height: 500,
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.black),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/before.png',
                  ),
                ),
              ),
              verticalSpaceMedium,
              Text(
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  'Before Photo'),
              verticalSpaceSmall,
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                'assets/images/after.png',
                                fit: BoxFit.contain,
                                // width: 700, // Set a size for the image
                                // height: 500,
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.black),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/after.png',
                  ),
                ),
              ),
              verticalSpaceMedium,
              Text('Do you accept the work as completed?'),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // Title
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Rate Mavin Tracy",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),

                                          // Stars Row
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: List.generate(
                                              5,
                                                  (index) => Icon(
                                                Icons.star,
                                                size: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),

                                          // Subtitle
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "What did you like?",
                                              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                            ),
                                          ),
                                          SizedBox(height: 8),

                                          // Tag buttons
                                          Column(
                                            children: [
                                              SizedBox(
                                                child: Row(
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
                                                          backgroundColor: Colors.grey,
                                                          minimumSize: Size(80, 50),
                                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                        ),
                                                        child: Text(
                                                            style: TextStyle(
                                                                fontSize: 13,
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
                                                          backgroundColor: Colors.grey,
                                                          minimumSize: Size(80, 50),
                                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                        ),
                                                        child: Text(
                                                            style: TextStyle(
                                                                fontSize: 13,
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
                                                          backgroundColor: Colors.grey,
                                                          minimumSize: Size(80, 50),
                                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                        ),
                                                        child: Text(
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.black
                                                            ),
                                                            'Efficiency')
                                                    ),
                                                  ],
                                                ),
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
                                                        backgroundColor: Colors.grey,
                                                        minimumSize: Size(80, 50),
                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                      ),
                                                      child: Text(
                                                          style: TextStyle(
                                                              fontSize: 13,
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
                                                        backgroundColor: Colors.grey,
                                                        minimumSize: Size(80, 50),
                                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                      ),
                                                      child: Text(
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.black
                                                          ),
                                                          'Professionalism')
                                                  ),
                                                ],
                                              ),
                                              verticalSpaceMedium,
                                            ],
                                          ),

                                          SizedBox(height: 16),

                                          // Comments Field
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Comments",
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          TextField(
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                              hintText: "Tell us what you liked...or didn’t",
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),

                                          // Submit Button
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Dialog(
                                                      backgroundColor: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(16.0),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              // Title
                                                              Align(
                                                                alignment: Alignment.center,
                                                                child: Text(
                                                                  "Thanks for your Review",
                                                                  style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.green
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(height: 16),
                                                              Image.asset('assets/images/success2.png'),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("Submit"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: kcPrimaryColor,
                          minimumSize: Size(120, 50),
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
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.white,
                          minimumSize: Size(120, 50),
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
  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
