import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import 'dashboard_viewmodel.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

  final List<Profile> profiles = [
    Profile(
      name: 'SQFT: 2500',
      rating: '5 starts',
      description: 'Address: 8 Magodo, Califona USA',
      date: '22 Oct, 2024',
      price: '\$50',
      profileImage: 'assets/images/man.png',
    ),
    Profile(
      name: 'SQFT: 2500',
      rating: '5 starts',
      description: 'Address: 8 Magodo, Califona USA',
      date: '20 Oct, 2024',
      price: '\$60',
      profileImage: 'assets/images/man.png',
    ),
  ];

  final List<String> names = [
    'Regular cleaning ',
    'Standard cleaning',
    'Deeep cleaning ',
    'moving cleaning ',
    'Hybrid cleaning '
  ];

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/limpiar_purple.png",
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                  width: 8), // Adds some space between the images if needed
              SvgPicture.asset(
                "assets/images/Limpiador.svg",
                height: 20,
                fit: BoxFit.fitHeight,
                color: kcPrimaryColor,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 16.0), // Adds padding to actions
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Define the action when the icon is tapped
                  },
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 25,
                    color: kcPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              await viewModel.refreshData();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: kcPrimaryColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: const Text(
                                          '40% OFF',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: kcWhiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'On First Cleaning Service',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: kcWhiteColor),
                                          softWrap: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: kcBlackColor,
                                            backgroundColor: kcWhiteColor,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 24.0),
                                            textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: Text("Get Discount"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/woman.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    height: 150,
                                    width: 130,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(fontSize: 14, color: kcPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(names.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              viewModel.selectedIndex = index;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: viewModel.selectedIndex == index
                                    ? Colors.white
                                    : kcPrimaryColor.withOpacity(0.7),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                children: [
                                  // Circular image holder
                                  CircleAvatar(
                                    radius: 40, // Adjust size as needed
                                    backgroundImage:
                                        AssetImage('assets/images/image.png'),
                                  ),
                                  SizedBox(
                                      height:
                                          8.0), // Space between image and text
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                        color: viewModel.selectedIndex == index
                                            ? kcPrimaryColor
                                            : Colors.white,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bookings',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Book now',
                  style: TextStyle(fontSize: 14, color: kcPrimaryColor),
                ),
              ],
            ),
          ),
          Column(
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
                              child: Image.asset(
                                  'assets/images/analysis.png'
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          color: Colors.yellow),
                                      child: const Text(
                                        "processing",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: kcWhiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Pairing in progress",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "You'll be notified once complete",
                                  style: TextStyle(
                                      fontSize: 16, ),
                                ),
                                verticalSpaceTiny,
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
                              child: Image.asset(
                                  'assets/images/janitor.png'
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Marvin Tracy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    horizontalSpaceLarge,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              color: Colors.green),
                                          child: const Text(
                                            "Accepted",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: kcWhiteColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                verticalSpaceSmall,
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
                                verticalSpaceSmall,
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Experience: 5 years in residential and commercial cleaning",
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),
                                    ),
                                    Text(
                                      "\$120",
                                      style: TextStyle(fontSize: 12, color: Colors.purple),
                                    ),
                                  ],
                                ),
                                verticalSpaceSmall,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on, // Use a location icon
                                      size: 16, // Adjust icon size as needed
                                      color: Colors.blueGrey, // Set the icon color
                                    ),
                                    SizedBox(width: 4), // Add some spacing between the icon and the text
                                    Expanded(
                                      child: Text(
                                        "Location: California",
                                        style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on, // Choose an icon that represents tracking
                                          size: 16, // Adjust icon size as needed
                                          color: Colors.blue, // Set the icon color to match the text
                                        ),
                                        SizedBox(width: 4), // Add some spacing between the icon and the text
                                        Text(
                                          "Track cleaner",
                                          style: TextStyle(fontSize: 12, color: Colors.blue),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                                verticalSpaceSmall,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Expected Time: Feb 27, 10:00AM",
                                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
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
        ],
      ),
    );
  }

  @override
  void onDispose(DashboardViewModel viewModel) {
    viewModel.dispose();
  }

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}

class Profile {
  final String name;
  final String description;
  final String rating;
  final String date;
  final String price;
  final String profileImage;

  Profile({
    required this.name,
    required this.description,
    required this.rating,
    required this.date,
    required this.price,
    required this.profileImage,
  });
}
