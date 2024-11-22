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
                // Define action when icon is tapped
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                            borderRadius: BorderRadius.circular(8.0),
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
                          Text('See all', style: TextStyle(fontSize: 14, color: kcPrimaryColor)),
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
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                                      backgroundImage: AssetImage('assets/images/man.png'),
                                    ),
                                    SizedBox(height: 8.0),
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
                    // Continue with rest of the widgets as required
                  ],
                ),
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

                  // Cleaner selection
                  Row(
                    children: [
                      Checkbox(
                        value: isIndividualCleaner,
                        onChanged: (value) {
                          setState(() {
                            isIndividualCleaner = value!;
                          });
                        },
                        activeColor: kcPrimaryColor,
                      ),
                      Text(
                        "Individual cleaner",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 20),
                      Checkbox(
                        value: !isIndividualCleaner,
                        onChanged: (value) {
                          setState(() {
                            isIndividualCleaner = !value!;
                          });
                        },
                        activeColor: kcPrimaryColor,
                      ),
                      Text(
                        "Cleaning crew",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Number of cleaners
                  Text(
                    "How many Numbers of Cleaners*",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            label: Text("${index + 1}"),
                            selected: selectedCleaners == index + 1,
                            onSelected: (selected) {
                              setState(() {
                                selectedCleaners = index + 1;
                              });
                            },
                            selectedColor: kcPrimaryColor,
                            backgroundColor: Colors.grey[300],
                            labelStyle: TextStyle(
                              color: selectedCleaners == index + 1
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
                  SvgPicture.asset(
                    'assets/images/clean.svg',
                    height: 150, // Adjust height as needed
                    fit: BoxFit.contain,
                  ),
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
                  showBottomSheetCheck(context);// Close this bottom sheet
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
              SizedBox(height: 16),
              Text(
                'Check List Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              _buildSectionTitle('General Areas (Living Room, 3 Bedrooms)'),
              _buildChecklistRow(['Dusting', 'Vacuuming & Sweeping']),
              _buildChecklistRow(['Mopping', 'Doors & Handles']),
              _buildChecklistRow(['Mirrors & Glass Surfaces', 'Windows']),
              SizedBox(height: 20),
              _buildSectionTitle('Kitchen'),
              _buildChecklistRow(['Counters & Surfaces', 'Appliances']),
              _buildChecklistRow(['Cabinets & Drawers', 'Flooring']),
              SizedBox(height: 20),
              _buildSectionTitle('Bathrooms'),
              _buildChecklistRow(['Sink & Counter', 'Toilet']),
              _buildChecklistRow(['Shower/Bathtub', 'Mirrors & Glass Surfaces']),
              _buildChecklistRow(['Cabinets & Drawers', 'Flooring']),
              SizedBox(height: 30),
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
                          showBottomSheetCost(context); // Close the bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimaryColor, // Replace with your primary color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
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
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: kcPrimaryColor), // Replace with your primary color
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
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
}

// Helper method to build section titles
Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

// Helper method to build a row of checklist items
Widget _buildChecklistRow(List<String> items) {
  return Row(
    children: items.map((item) {
      return Expanded(
        child: CheckboxListTile(
          value: false,
          onChanged: (bool? value) {},
          title: Text(item, style: TextStyle(fontSize: 14)),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
        ),
      );
    }).toList(),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Basic Cleaning: \$80\n(includes bedrooms, bathrooms, and common areas)',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Next Cleaning:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'October 15, 2024',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Occurrence',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

