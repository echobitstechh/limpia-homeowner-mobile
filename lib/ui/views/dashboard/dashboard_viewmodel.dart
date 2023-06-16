import 'package:afriprize/app/app.locator.dart';
import 'package:afriprize/app/app.logger.dart';
import 'package:afriprize/core/data/models/product.dart';
import 'package:afriprize/core/data/repositories/repository.dart';
import 'package:afriprize/core/network/api_response.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  final repo = locator<Repository>();
  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<Product> productList = [];
  List<Product> sellingFast = [];

  void changeSelected(int i) {
    selectedIndex = i;
    rebuildUi();
  }

  void getProducts() async {
    setBusyForObject(productList, true);

    try {
      ApiResponse res = await repo.getProducts();
      if (res.statusCode == 200) {
        productList = (res.data["products"] as List)
            .map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        rebuildUi();
      }
    } catch (e) {
      log.e(e);
    }

    setBusyForObject(productList, false);
  }

  void getSellingFast() async {
    setBusyForObject(sellingFast, true);

    try {
      ApiResponse res = await repo.getSellingFast();
      if (res.statusCode == 200) {
        sellingFast = (res.data["products"] as List)
            .map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        rebuildUi();
      }
    } catch (e) {
      log.e(e);
    }

    setBusyForObject(sellingFast, false);
  }
}
