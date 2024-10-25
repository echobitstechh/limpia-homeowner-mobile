import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

  final List<Profile> profiles = [
    Profile(
      name: 'SQFT: 2500',
      description: 'Address: 8 Magodo, Califona USA',
      date: '22 Oct, 2024',
      price: '\$50',
      profileImage: 'assets/images/man.png',
    ),
    Profile(
      name: 'SQFT: 2500',
      description: 'Address: 8 Magodo, Califona USA',
      date: '20 Oct, 2024',
      price: '\$60',
      profileImage: 'assets/images/man.png',
    ),
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
                horizontalSpaceSmall,
                GestureDetector(
                  onTap: () {
                    // Define the action when the icon is tapped
                  },
                  child: Icon(
                    Icons.add_circle_outline_outlined,
                    size: 25,
                    color: kcPrimaryColor,
                  ),
                ),
                horizontalSpaceSmall,
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
            child: Padding(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/man.png'),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AMRAH SALI',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Cleaner',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.location_on,
                              color: Colors.white70),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white70,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(10.0),
                                color: Colors.green,
                              ),
                              child: const Text(
                                "Current work:",
                                style: TextStyle(
                                    fontSize: 16, color: kcWhiteColor),
                              ),
                            ),
                          ),
                          horizontalSpaceSmall,
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.circular(10.0),
                                color: Colors.orange,
                              ),
                              child: const Text(
                                "Edit job",
                                style: TextStyle(
                                    fontSize: 16, color: kcWhiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      const Row(
                        children: [
                          Text(
                            "Address:",
                            style: TextStyle(
                                fontSize: 16, color: kcWhiteColor),
                          ),
                          Text(
                            "8 Magodo, Califona USA",
                            style: TextStyle(
                                fontSize: 16, color: kcWhiteColor),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sunday, 12 June",
                            style: TextStyle(
                                fontSize: 16, color: kcWhiteColor),
                          ),
                          Text(
                            "11:00 - 12:00 AM",
                            style: TextStyle(
                                fontSize: 16, color: kcWhiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SegmentedTabControl(
                      splashColor: Colors
                          .transparent, // Remove splash color if desired
                      indicatorDecoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: kcPrimaryColor,
                              width: 3), // Active tab bottom border
                        ),
                      ),
                      tabTextColor: Colors.black45,
                      selectedTabTextColor:
                          kcPrimaryColor, // Color for active tab text

                      tabs: [
                        SegmentTab(
                          backgroundColor: Colors.transparent,
                          label: 'Bookings',
                        ),
                        SegmentTab(
                          backgroundColor: Colors.transparent,
                          label: 'Active bookings',
                        ),
                        SegmentTab(
                          backgroundColor: Colors.transparent,
                          label: 'Combo jobs',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: profiles.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final profile = profiles[index];
                            return Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            width: 60,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    profile.profileImage),
                                                fit: BoxFit.cover,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 3,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profile.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 3),
                                              Text(
                                                profile.description,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              verticalSpaceTiny,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 12.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color:
                                                              Colors.green),
                                                      child: const Text(
                                                        "Accept:",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                kcWhiteColor),
                                                      ),
                                                    ),
                                                  ),
                                                  horizontalSpaceSmall,
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 12.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors.red),
                                                      child: const Text(
                                                        "Reject",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                kcWhiteColor),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              profile.date,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              profile.price,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
  final String date;
  final String price;
  final String profileImage;

  Profile({
    required this.name,
    required this.description,
    required this.date,
    required this.price,
    required this.profileImage,
  });
}
