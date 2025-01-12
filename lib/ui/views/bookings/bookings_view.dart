import 'package:flutter/material.dart';
import 'package:limpia/ui/common/app_colors.dart';

import 'booked_view.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            backgroundColor: kcPrimaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Background logo image
                  Align(
                    alignment: Alignment.centerRight, // Align the image to the right
                    child: Opacity(
                      opacity: 0.8, // Control opacity here
                      child: Image.asset(
                        'assets/images/bg_logo.png', // Replace with your image path
                        height: 200, // Set your desired height
                        width: 300,  // Set your desired width
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 40.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/limpia.png',
                              width: 180,
                              height: 50,
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications),
                              onPressed: () {},
                              color: Colors.white,
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // "Today" section
              _buildSectionTitle("Today"),
              Material(
                color: Colors.transparent, // Set to transparent or any background color you like
                child: InkWell(
                  onTap: () {
                    // Navigate to the BookedView page when the card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookedView()),
                    );
                  },

                  child: _buildCard(
                    title: "Basic Cleaning",
                    description: "Includes bedrooms, bathrooms, and common areas",
                    price: "\$80",
                    date: "October 15, 2024",
                  ),
                ),
              ),
              // "History" section
              _buildSectionTitle("History"),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Define the action when the "Deep Cleaning" card is tapped
                    print("Deep Cleaning card clicked");
                  },
                  child: _buildCard(
                    title: "Deep Cleaning",
                    description: "Includes bedrooms, bathrooms, and common areas",
                    price: "\$80",
                    date: "October 15, 2024",
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Define the action when the second "Basic Cleaning" card is tapped
                    print("Second Basic Cleaning card clicked");
                  },
                  child: _buildCard(
                    title: "Basic Cleaning",
                    description: "Includes bedrooms, bathrooms, and common areas",
                    price: "\$80",
                    date: "October 15, 2024",
                  ),
                ),
              ),
              // Add more clickable cards as needed
            ]),
          ),

        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if (title == "History")
            TextButton(
              onPressed: () {
                // Handle view all action
              },
              child: Text("View all"),
            ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String price,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
