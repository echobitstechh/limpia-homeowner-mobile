import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/data/models/product.dart';
import '../../../core/data/models/raffle_ticket.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';

class DrawsViewModel extends BaseViewModel {

  bool isDrawSelected = true;
  // Example data lists
  List<Raffle> raffleList = [];
  List<Winner> raffleWinnerList = [];
  List<DrawEvent> raffleDrawEvents = [];
  List<Raffle> filteredRaffle = [];
  String searchQuery = '';

  void togglePage(bool isDraw) {
    isDrawSelected = isDraw;
    notifyListeners(); // This ensures the UI rebuilds
  }


  Future<void> refreshData() async {
    setBusy(true); // Use this to show loading indicator
    getResourceList();
    setBusy(false); // Reset loading indicator after data is refreshed
  }

  void getResourceList(){

  }

  Future<void> init() async {
    setBusy(true);  // Show shimmer


    setBusy(false);  // Hide shimmer
  }









  void updateSearchQuery(String query) {
    searchQuery = query;
    if (searchQuery.isEmpty) {
      filteredRaffle = raffleList;
    } else {
      filteredRaffle = raffleList.where((service) {
        return service.name!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            service.description!.toLowerCase().contains(searchQuery.toLowerCase())
            ||
            service.formattedTicketPrice!.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

}
