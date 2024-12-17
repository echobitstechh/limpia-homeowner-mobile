import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limpia/app/app.locator.dart';
import 'package:limpia/app/app.logger.dart';
import 'package:limpia/core/data/models/cart_item.dart';
import 'package:limpia/core/data/models/product.dart';
import 'package:limpia/core/data/models/raffle_cart_item.dart';
import 'package:limpia/core/data/repositories/repository.dart';
import 'package:limpia/core/network/api_response.dart';
import 'package:limpia/core/utils/local_store_dir.dart';
import 'package:limpia/core/utils/local_stotage.dart';
import 'package:limpia/state.dart';
import 'package:limpia/ui/common/app_colors.dart';
import 'package:multi_date_picker/multi_date_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:video_player/video_player.dart';

import '../../../core/data/models/Booking.dart';
import '../../../core/data/models/app_notification.dart';
import '../../../core/data/models/profile.dart';
import '../../../core/data/models/project.dart';





enum BookingResult { success, failure }

enum AvailabilityTime { morning, afternoon, evening }
enum AvailabilityDay { weekdays, weekends }



class DashboardViewModel extends BaseViewModel {
  final repo = locator<Repository>();
  final bool _isDataLoaded = false;
  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<Booking> bookings = [];

  bool isSpecificDateSelected = false;
  final snackBar = locator<SnackbarService>();

  int selectedRooms = 1;
  double selectedBathrooms = 0;
  bool isIndividualCleaner = true;
  int selectedCleaners = 1;

  final Set<String> selectedDaysHomeOwner = {};
  final Set<String> selectedTimesHomeOwner = {};

  List<DateTime> selectedDates = [];
  List<AvailabilityDay> selectedDays = [];
  List<AvailabilityTime> selectedTimes = [];

  final List<String> cleaningType = [
    'Regular cleaning ',
    'Standard cleaning',
    'Deep cleaning ',
    'moving cleaning ',
    'Hybrid cleaning '
  ];

  List<String> imagePaths = [
    'assets/images/image-clean.png',
    'assets/images/image-clean.png',
    'assets/images/image-clean.png',
    'assets/images/image-clean.png',
    'assets/images/image-clean.png',
  ];

  final List<String> generalAreas = [
    "Dusting",
    "Vacuuming & Sweeping",
    "Moping",
    "Doors & Handle",
    "Mirrors & glass all surface",
    "Windows",
  ];
  final List<String> kitchen = [
    "Counters & surfaces",
    "Appliances",
    "Cabinet & Drawers",
    "Flooring",
  ];
  final List<String> bathrooms = [
    "Glass surface",
    "Toilet",
    "Shower/Bathtub",
    "Sink & Counters",
    "Cabinets & Drawers",
    "Flooring (Bathrooms)",
  ];


  void showMultiDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Dates',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite, // Make the dialog take up available width
            height: 400.0, // Set a fixed height to avoid intrinsic dimensions
            child: MultiDatePicker(
              calendarStartDate: DateTime.now(),
              calendarEndDate: DateTime(2100),
              enableMultiSelect: true,
              onDateSelected: (List<DateTime> dates) {

                isSpecificDateSelected = true;
                selectedDates = dates;
                selectedDays.clear();
                selectedTimes.clear();
                notifyListeners();
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }


  @override
  void initialise() {
    init();
  }


  void changeSelected(int i) {
    selectedIndex = i;
    rebuildUi();
  }


  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }



  Future<void> init() async {
    setBusy(true);
    getBookings();
    setBusy(false);
    notifyListeners();
  }


  // Future<void> loadRaffles() async {
  //
  //   if (raffleList.isEmpty) {
  //     setBusy(true);
  //     notifyListeners();
  //   }
  //
  //   dynamic storedRaffle = await locator<LocalStorage>().fetch(LocalStorageDir.raffle);
  //   if (storedRaffle != null) {
  //     // Extracting and filtering only active raffles
  //     raffleList = List<Map<String, dynamic>>.from(storedRaffle)
  //         .map((e) => Raffle.fromJson(Map<String, dynamic>.from(e)))
  //         .where((raffle) => raffle.status == "ACTIVE")
  //         .toList();
  //     notifyListeners();
  //   }
  //
  //   await getRaffles();
  //   setBusy(false);
  //   notifyListeners();
  //
  // }


  Future<void> refreshData() async {
    setBusy(true);
    notifyListeners();
    getResourceList();
    setBusy(false);
    notifyListeners();
  }

  void getResourceList(){
    getBookings();
  }

  Future<void> getBookings() async {
    setBusy(true);
    notifyListeners();
    try {
      ApiResponse res = await repo.getBookings();
      if (res.statusCode == 200) {
        if (res.data != null && res.data["bookings"] != null) {
          bookings = (res.data["bookings"] as List)
              .map((e) {
            final booking = Booking.fromJson(Map<String, dynamic>.from(e));
            return booking;
          })
              .toList();


          List<Map<String, dynamic>> storedBookings =
          bookings.map((e) => e.toJson()).toList();
          locator<LocalStorage>().save(LocalStorageDir.bookings, storedBookings);

          notifyListeners();
        }
        rebuildUi();
      }
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      notifyListeners();
    }
    print('Booking list is: $bookings');
  }


  Future<BookingResult> createBooking() async {
    setBusy(true);


    try {
      ApiResponse res = await repo.createBooking({
        "date": selectedDaysHomeOwner,
        "time": selectedTimesHomeOwner,
        "cleaningType": cleaningType,
        "numberOfRooms": selectedRooms.toString(),
        "numberOfBathrooms": selectedBathrooms,
        "numberOfCleaners": selectedCleaners,
        "checklistKitchen": kitchen,
        "checklistBathrooms": bathrooms,
      });
      if (res.statusCode == 201) {
        print('login response: ${res.data['homeowner']}');
        userLoggedIn.value = true;
        snackBar.showSnackbar(message: res.data["message"]);
        setBusy(false);
        return BookingResult.success;
      } else {
        setBusy(false);

        if (res.data["message"] is String) {
          snackBar.showSnackbar(message: res.data["message"]);
          return BookingResult.failure; // Return failure since it's an error message
        }
        else if (res.data["message"] is List<String>) {
          snackBar.showSnackbar(message: res.data["message"].join('\n'));
          return BookingResult.failure; // Return failure since it's an error message
        }
        else if (res.data["message"] is List) {
          snackBar.showSnackbar(message: res.data["message"].join('\n'));
          return BookingResult.failure; // Return failure since it's an error message
        } else {
          // Handle unexpected data type (e.g., it's not a string or list)
          snackBar.showSnackbar(message: "Unexpected response format");
          return BookingResult.failure;
        }

      }
    } catch (e) {
      log.e(e);
      setBusy(false);
      return BookingResult.failure;

   }
  }


  void onEnd() {
    print('onEnd');
    //TODO SEND USER NOTIFICATION OF AVAILABILITY OF PRODUCT
    notifyListeners();
  }

}
