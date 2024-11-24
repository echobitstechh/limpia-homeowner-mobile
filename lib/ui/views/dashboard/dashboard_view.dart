import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:limpia/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import '../draws/booked_view.dart';
import '../draws/draws_view.dart';
import '../payment/payment_view.dart';
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First Card: Pairing in Progress
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/analysis.png', // Ensure path is correct
                          height: 60,
                          width: 60,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.image_not_supported,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pairing in progress...',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "You'll be notified once complete",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600] ?? Colors.grey, // Fallback color
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[300] ?? Colors.orange, // Fallback color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: const Text(
                            'Processing',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Second Card: Cleaner Details
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/janitor.png', // Ensure path is correct
                              ),
                              onBackgroundImageError: (error, stackTrace) => Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Marvin Tracy',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Text(
                                        'Rating: ',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                                      const Icon(Icons.star_half, color: Colors.yellow, size: 16),
                                      const Text(
                                        ' (4.8/5)',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[300] ?? Colors.green, // Fallback color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              child: const Text(
                                'Accepted',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Experience: 5 years in residential and commercial \ncleaning',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$120',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: kcPrimaryColor,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  'Location: California',
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.lightBlueAccent, size: 16),
                                Text(
                                  'Location: California',
                                  style: TextStyle(fontSize: 14, color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Expected Time: Feb 27, 10:00AM',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )

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
    // viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}

void showCustomBottomSheet(BuildContext context) {
  int selectedRooms = 1; // Default selected room number
  double selectedBathrooms = 0; // Default selected bathroom count
  bool isIndividualCleaner = true;
  int selectedCleaners = 1;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
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

                  // Title
                  Text(
                    "Tell Us about the home.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kcPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Number of rooms
                  Text(
                    "Numbers of rooms*",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ChoiceChip(
                          label: Text("${index + 1}"),
                          selected: selectedRooms == index + 1,
                          onSelected: (selected) {
                            setState(() {
                              selectedRooms = index + 1;
                            });
                          },
                          selectedColor: kcPrimaryColor,
                          backgroundColor: Colors.grey[300],
                          labelStyle: TextStyle(
                            color: selectedRooms == index + 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),

                  // Number of bathrooms
                  Text(
                    "Numbers of bathrooms*",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        selectedBathrooms.toInt().toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kcPrimaryColor,
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: selectedBathrooms,
                          min: 0,
                          max: 6,
                          divisions: 6,
                          activeColor: kcPrimaryColor,
                          inactiveColor: Colors.grey[300],
                          onChanged: (value) {
                            setState(() {
                              selectedBathrooms = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Next button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: kcWhiteColor,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 14, color: kcPrimaryColor),
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
                  // Drag handle
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

                  // Centered title
                  Center(
                    child: Text(
                      "What type of cleaning?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Cleaning SVG image
                  Image.asset('assets/images/image 93.png'),
                  SizedBox(height: 20),

                  // Cleaning types row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Regular Cleaner
                        buildCleaningTypeCard(
                          'assets/images/image.png',
                          'Regular Cleaner',
                        ),
                        // Standard Cleaner
                        buildCleaningTypeCard(
                          'assets/images/image.png',
                          'Standard Cleaning',
                        ),
                        // Deep Cleaner
                        buildCleaningTypeCard(
                          'assets/images/image.png',
                          'Deep Cleaning',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Next button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showBottomSheetDatePicker(context); // Close the bottom sheet
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: kcWhiteColor, // Adjust to your primary color
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 14, color: kcPrimaryColor),
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

// Helper function for cleaning type cards
Widget buildCleaningTypeCard(String imagePath, String title) {
  return Container(
    width: 100, // Adjust width for consistent sizing
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30, // Adjust size as needed
          backgroundColor: Colors.white,
          child: Image.asset(
            imagePath, // Replace with your image asset
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    ),
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
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          bool isDefaultPayment = false;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
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
                  const SizedBox(height: 16),
                  const Text(
                    'Check List Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'General Areas (Living Room, 3 Bedrooms)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Dusting"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Vacuuming & Sweeping"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Mooping"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Doors & Handle"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Mirrors & glass all surface"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Windows"),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                      'Kitchen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,)
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Counters  & surfaces"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Appliances"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Cabinet & Drawers"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Flooring"),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                      'Bathrooms',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,)
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Sink & Counters"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Toilet"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Shower/Bathtub"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Mirrors & Glass surface"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Checkbox(
                            value: isDefaultPayment,
                            activeColor: kcPrimaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onChanged: (value) {
                              setState(() {
                                isDefaultPayment = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                      const Text("Cabinets & Drawers"),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Checkbox(
                                value: isDefaultPayment,
                                activeColor: kcPrimaryColor,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isDefaultPayment = value ?? false;
                                  });
                                },
                              );
                            },
                          ),
                          const Text("Flooring"),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showBottomSheetCost(context); // Ensure `showBottomSheetCost` is defined
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kcPrimaryColor, // Replace with your primary color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text(
                              "Proceed",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: kcPrimaryColor), // Replace with your primary color
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              "Edit Booking",
                              style: TextStyle(fontSize: 16, color: kcPrimaryColor), // Replace with your primary color
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
    },
  );
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

Widget _buildChecklistRow(List<String> items) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: items
        .map((item) => Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          item,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ))
        .toList(),
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
                    Navigator.pop(context); // Close the current bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentView()), // Navigate to the BookedView screen
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcWhiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Next",
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
