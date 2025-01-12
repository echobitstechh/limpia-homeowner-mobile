import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';

import 'call.dart';
import 'chatDetails.dart';

class BookedView extends StatelessWidget {
  const BookedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Booked'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile picture with "Booked" label
                Stack(
                  clipBehavior: Clip
                      .none, // This ensures the Positioned widget isn't clipped
                  children: [
                    CircleAvatar(
                      radius: 70, // Adjust size as needed
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 68, // Slightly smaller to add a border effect
                        backgroundImage:
                            AssetImage('assets/images/profile_picture.png'),
                      ),
                    ),
                    Positioned(
                      top:
                          70, // Adjust to position the overlay relative to the profile picture
                      right: -30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Booked',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Profile details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'John Abraham',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatDetailPage(
                                        driverName: 'amrah',
                                        driverId: '234',
                                        rideId: 'fgh',
                                      )),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: kcVeryLightGrey,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child:
                                const Icon(Icons.chat, color: kcPrimaryColor),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(
                              8.0), // Adjust padding as needed
                          decoration: BoxDecoration(
                            color:
                                kcVeryLightGrey, // You can set a background color for the rounded container
                            borderRadius: BorderRadius.circular(
                                12.0), // Adjust the radius as needed
                          ),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CallScreen(),
                                    ));
                              },
                              child: const Icon(Icons.phone,
                                  color: kcPrimaryColor)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Rating:",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(width: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star_half,
                                color: Colors.amber, size: 16),
                          ],
                        ),
                        SizedBox(width: 4),
                        Text(
                          "(4.8/5)",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Experience: 5 years in residential and commercial cleaning',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Bookings status',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            verticalSpaceMedium,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Details',
                style: TextStyle(fontSize: 16),
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              children: [
                buildDetailTile('2h 30 min', 'Est Time', Icons.access_time),
                buildDetailTile('California', 'Location', Icons.location_on),
                buildDetailTile('27 Feb, 2024', 'Date', Icons.calendar_today),
                buildDetailTile('\$50 per hour', 'Price', Icons.money),
              ],
            ),
            verticalSpaceLarge,
            Column(
              children: [
                buildButton('Renotify', kcPrimaryColor),
                verticalSpaceMedium,
                buildButton('Cancel', kcPrimaryColor),
                verticalSpaceMedium,
                buildButton('Reschedule', kcPrimaryColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailTile(String value, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          // Define the button tap action here if needed
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontFamily: 'Poppins',
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
