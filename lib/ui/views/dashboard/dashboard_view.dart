import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import '../draws/booked_view.dart';
import 'dashboard_viewmodel.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

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
              SizedBox(width: 8),
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
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                _showTopSheet(context);
              },
              child: Icon(
                Icons.notifications_active_outlined,
                size: 25,
                color: kcPrimaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          '40% OFF',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: kcWhiteColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          'On First Cleaning Service',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: kcWhiteColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: kcBlackColor,
                                          backgroundColor: kcWhiteColor,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 24.0),
                                          textStyle: TextStyle(
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
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/images/woman.png",
                                      height: 150,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add Categories Section here
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Categories', style: TextStyle(fontSize: 16)),
                          Text('See all',
                              style: TextStyle(
                                  fontSize: 14, color: kcPrimaryColor)),
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
                                showCustomBottomSheet(context);
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
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          AssetImage('assets/images/man.png'),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          color:
                                              viewModel.selectedIndex == index
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bookings', style: TextStyle(fontSize: 16)),
                          GestureDetector(
                            onTap: () {
                              //showBtbSheet(context);
                            },
                            child: Text('Book Now',
                                style: TextStyle(
                                    fontSize: 14, color: kcPrimaryColor)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTopSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: Offset(0, 4), // Shadow position
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: ClipOval(
                              child: Container(
                                color: Colors.grey[200],
                                child: SvgPicture.asset(
                                  'assets/images/calender.svg',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              '🔔Cleaner Accepted',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Today, 10:00 AM'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: Offset(0, 4), // Shadow position
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: ClipOval(
                              child: Container(
                                color: Colors.grey[
                                    200], // Background color for the circular shape
                                child: SvgPicture.asset(
                                  'assets/images/book.svg',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              '🔔 Your cleaning service has been canceled',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Tomorrow, 9:00 AM'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 2,
                                offset: Offset(0, 4), // Shadow position
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: ClipOval(
                              child: Container(
                                color: Colors.grey[
                                    200], // Background color for the circular shape
                                child: SvgPicture.asset(
                                  'assets/images/cancel.svg',
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              '🔔Cleaner Booked',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('Yesterday, 2:00 PM'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showBtbSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height *
              0.6, // Adjust height to 40% of screen
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Booking Accepted',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service :',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Basic Cleaning',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Next cleaning:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Nov 24, 2024',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Occurrence:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'one time',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Additional Info:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the BookedView page when the card is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BookedView()),
                              );
                            },
                            child: Text(
                              'View cleaner',
                              style: TextStyle(
                                  fontSize: 14, color: kcPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Button Row
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for Re-notify
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                double.infinity, 40), // Equal width and height
                            side: BorderSide(
                                color: Colors.grey), // Add border line
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.white, // White background
                            foregroundColor: Colors.black, // Black text color
                          ),
                          child: Text('Re-notify'),
                        ),
                        SizedBox(height: 10), // Space between buttons
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for Cancel
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                double.infinity, 40), // Equal width and height
                            side: BorderSide(
                                color: Colors.grey), // Add border line
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.white, // White background
                            foregroundColor: Colors.black, // Black text color
                          ),
                          child: Text('Cancel'),
                        ),
                        SizedBox(height: 10), // Space between buttons
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for Reschedule
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                double.infinity, 40), // Equal width and height
                            side: BorderSide(
                                color: Colors.grey), // Add border line
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.white, // White background
                            foregroundColor: Colors.black, // Black text color
                          ),
                          child: Text('Reschedule'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
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

void showCustomBottomSheet(BuildContext context) {
  int selectedRooms = 0; // Default selected room number
  int selectedBathrooms = 0; // Default selected bathroom number
  bool isIndividualCleaner = true;
  bool isCleaningCrew = false;
  int selectedCleaners = 0;

  showModalBottomSheet(
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
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Tell Us about the home.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Numbers of rooms options
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Number of rooms*",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            label: Text(
                              "${index + 1}",
                              style: TextStyle(color: kcWhiteColor),
                            ),
                            selected: selectedRooms == index + 1,
                            onSelected: (selected) {
                              setState(() {
                                selectedRooms = index + 1;
                              });
                            },
                            selectedColor: kcPrimaryColor,
                            backgroundColor: Color(0xFFACA9DB),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(18), // Rounded corners
                            ),
                            labelStyle: TextStyle(
                              color: selectedRooms == index + 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Numbers of bathrooms options
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Number of bathrooms*",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            label: Text(
                              "${index + 1}",
                              style: TextStyle(color: kcWhiteColor),
                            ),
                            selected: selectedBathrooms == index + 1,
                            onSelected: (selected) {
                              setState(() {
                                selectedBathrooms = index + 1;
                              });
                            },
                            selectedColor: kcPrimaryColor,
                            backgroundColor: Color(0xFFACA9DB),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            labelStyle: TextStyle(
                              color: selectedRooms == index + 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Cleaner selection options
                  Row(
                    children: [
                      Checkbox(
                        value: isIndividualCleaner,
                        onChanged: (value) {
                          setState(() {
                            isIndividualCleaner = value!;
                            isCleaningCrew = !value;
                          });
                        },
                      ),
                      Text(
                        "Individual cleaner",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 20),
                      Checkbox(
                        value: isCleaningCrew,
                        onChanged: (value) {
                          setState(() {
                            isCleaningCrew = value!;
                            isIndividualCleaner = !value;
                          });
                        },
                      ),
                      Text(
                        "Cleaning crew",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Number of cleaners selection
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "How many Numbers of Cleaners*",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            label: Text(
                              "${index + 1}",
                              style: TextStyle(color: kcWhiteColor),
                            ),
                            selected: selectedCleaners == index + 1,
                            onSelected: (selected) {
                              setState(() {
                                selectedCleaners = index + 1;
                              });
                            },
                            selectedColor: kcPrimaryColor,
                            backgroundColor: Color(0xFFACA9DB),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            labelStyle: TextStyle(
                              color: selectedRooms == index + 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Next button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showBottomSheet(context); // Close the bottom sheet
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 12, color: kcPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
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
                children: [
                  // Cleaning type selection
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "What type of cleaning?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/images/cleaner.svg'),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.grey // Adjust the radius as needed
                                ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30, // Adjust size as needed
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/image.png'), // Replace with your image asset
                                ),
                              ),
                              verticalSpaceMassive,
                              Text('Standard Cleaner'),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.grey // Adjust the radius as needed
                                ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30, // Adjust size as needed
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/image.png'), // Replace with your image asset
                                ),
                              ),
                              verticalSpaceMassive,
                              Text('Move-in-out Cleaner'),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.grey // Adjust the radius as needed
                                ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30, // Adjust size as needed
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      'assets/images/image.png'), // Replace with your image asset
                                ),
                              ),
                              verticalSpaceMassive,
                              Text('Regular Cleaner'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Next button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showBottomSheetDatePicker(
                            context); // Close the bottom sheet
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 12, color: kcPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void showBottomSheetDatePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Date picker',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showBottomSheetCheck(context); // Close this bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 12, color: kcPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showBottomSheetCheck(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
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
              SizedBox(height: 10),
              Text(
                'Check List Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              // Your checklist items here...
              Text(
                'General Areas (Living Room, 3 Bedrooms)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Dusting'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Vacuuming & Sweeping'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Mopping'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Doors & Handles'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Mirrors & Glass Surfaces'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          value: true,
                          onChanged: (bool? value) {},
                          title: Text('Windows'),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kitchen',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Counters & Surfaces'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Appliances'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Cabinets & Drawers'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Flooring'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Sink & Counter'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Toilet'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Shower/bathtub'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Mirrors & Glass Surfaces'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Cabinets & Drawers'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (bool? value) {},
                              title: Text('Flooring'),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              // Add buttons at the bottom
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          showBottomSheetCost(
                              context); // Close the bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor, // Example color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Proceed",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Space between buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Edit Booking",
                          style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showBottomSheetCost(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top drag handle
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
              SizedBox(height: 20),

              // Header title
              Text(
                'Cost Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Service Details Box
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Basic Cleaning: \$80\n(includes bedrooms, bathrooms, and common areas)',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Next Cleaning:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'October 15, 2024',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Occurrence',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'One-time',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Price, Discount, Subtotal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price:', style: TextStyle(fontSize: 16)),
                  Text('\$120.00', style: TextStyle(fontSize: 16)),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Limpiar Day Discount:', style: TextStyle(fontSize: 16)),
                  Text('-\$20.00', style: TextStyle(fontSize: 16)),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Subtotal:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$100.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 8),

              // Promo Code Section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Promo code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Apply"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Coupons"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Best price assurance',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),

              // Next Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showBottomSheetSuccess(context);
                    // Trigger the next bottom sheet or action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showBottomSheetSuccess(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top drag handle
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
              SizedBox(height: 20),

              // Success Image from assets
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/success.png', // Path to your image
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Booking Completed Text
              Text(
                'Booking Completed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Subtitle Text
              Text(
                'Your booking for service has been successfully booked',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // View Booking Services Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle View Booking Services action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimaryColor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "View Booking Services",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10), // Space between buttons

              // Track Booking Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle Track Booking action here
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: kcPrimaryColor), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Track Booking",
                    style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
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
