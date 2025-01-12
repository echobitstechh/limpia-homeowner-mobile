import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:limpia/ui/views/bookings/bookings_view.dart';
import 'package:limpia/ui/views/dashboard/time-and-date.dart';
import 'package:limpia/ui/views/dashboard/track_map.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../notification/notification_viewmodel.dart';
import 'dashboard_view.dart';

class NotificationDetails extends StackedView<NotificationViewModel> {
  NotificationDetails({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> services = [
    {
      'name': 'Marvin Tracy',
      'description': 'Service: Basic cleaning.',
      'rating': 4.5,
      'price': 100,
      'date': 'October 15 friday 9:00am',
    },
    {
      'name': 'Marvin Tracy',
      'description': 'Service: Basic cleaning.',
      'rating': 4.0,
      'price': 150,
      'date': 'October 15 friday 9:00am',
    },
    {
      'name': 'Marvin Tracy',
      'description': 'Service: Basic cleaning.',
      'rating': 4.0,
      'price': 150,
      'date': 'October 15 friday 9:00am',
    },
  ];

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, // Back button icon
            size: 20, // Size of the back button
            color: kcWhiteColor, // Color of the back button
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates back
          },
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kcWhiteColor, // Matches the icon color
            fontSize: 18, // Adjusted font size for better fit
          ),
        ),
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg_logo.png', // Replace with your image path
                fit: BoxFit.cover, // Ensures the image covers the entire AppBar
              ),
            ),
            // Background color overlay for readability
            Positioned.fill(
              child: Container(color: kcPrimaryColor),
            ),
          ],
        ),
        elevation: 4,
        toolbarHeight: 120, // Increase height of the AppBar
        centerTitle: true, // Centers any additional widgets
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final service = services[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3), // Shadow color
                        blurRadius: 6, // Spread of the shadow
                        offset: Offset(0, 3), // Offset of the shadow (x, y)
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service Name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              service['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  service['rating'].toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        const SizedBox(height: 5),
                        // Service Description
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              service['description'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$${service['price']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kcPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Availability
                        Row(
                          children: [
                            Text(
                              "Availability:",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            horizontalSpaceSmall,
                            Text(
                              service['date'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Accept Button
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Rounded corners
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize
                                            .min, // Adjust size to fit content
                                        children: [
                                          const Text(
                                            'Booking successful',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Colors.green, // Success color
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Image.asset(
                                            'assets/images/successtick.png', // Replace with your success image path
                                            width: 500,
                                            height: 100,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    kcWhiteColor, // Replace with your primary color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: kcPrimaryColor, // Border color
                                    width: 1, // Border width
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: Text(
                                "Accept",
                                style: TextStyle(
                                    fontSize: 16, color: kcPrimaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              buildButton('Choose another cleaner', kcPrimaryColor),
              GestureDetector(
                onTap: () {
                 // showBottomSheetDatePicker(context); // Show BottomSheet for rescheduling
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => HomePage()),);
                },
                child: buildButton('Reschedule', kcPrimaryColor),
              ),
              buildButton('Cancel booking', kcPrimaryColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 350,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ensure the column takes minimum space
            children: [
              Center(child: Image.asset('assets/images/success.png')),
              verticalSpaceSmall,
              Text(
                'Booking Completed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Your booking for service has been successfully booked',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookingView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          kcPrimaryColor, // Replace with your primary color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "View booking services",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  RideDetailView()),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color:
                                kcPrimaryColor), // Replace with your primary color
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Track Booking",
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              kcPrimaryColor), // Replace with your primary color
                    ),
                  ),
                ),
              ),
            ],
          ),
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
