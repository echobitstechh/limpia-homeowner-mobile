import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';

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
              children: [
                CircleAvatar(
                  radius: 70, // Adjust size as needed
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your image asset
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'John Abraham',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                        const Icon(Icons.chat_bubble_outline, color: Colors.blue),
                        const SizedBox(width: 16),
                        const Icon(Icons.phone, color: Colors.blue),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating:",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        SizedBox(width: 4), // Add some space between text and stars
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            Icon(Icons.star_half, color: Colors.amber, size: 16),
                          ],
                        ),
                        SizedBox(width: 4), // Space between stars and the rating text
                        Text(
                          "(4.8/5)", // Display the rating value if needed
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),
            const Text(
              'Experience: 5 years in residential and commercial cleaning',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),

            Text('Bookings status'),
            verticalSpaceSmall,

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'details',
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
                buildDetailTile('\$50 per hour', 'Price', Icons.attach_money),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildActionButton(context, 'Renotify', kcPrimaryColor),
                verticalSpaceSmall,
                buildActionButton(context, 'Cancel', kcPrimaryColor),
                verticalSpaceSmall,
                buildActionButton(context, 'Reschedule', kcPrimaryColor),
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

  Widget buildActionButton(BuildContext context, String label, Color color) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color),
      ),
    );
  }
}
