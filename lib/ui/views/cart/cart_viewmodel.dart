import 'package:afriprize/app/app.locator.dart';
import 'package:afriprize/app/app.logger.dart';
import 'package:afriprize/core/data/models/cart_item.dart';
import 'package:afriprize/core/data/repositories/repository.dart';
import 'package:afriprize/core/network/api_response.dart';
import 'package:afriprize/state.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/data/models/order_info.dart';

class CartViewModel extends BaseViewModel {
  final repo = locator<Repository>();
  final snackBar = locator<SnackbarService>();
  final log = getLogger("CartViewModel");
  List<CartItem> itemsToDelete = [];

  void addRemoveDelete(CartItem item) {
    itemsToDelete.contains(item)
        ? itemsToDelete.remove(item)
        : itemsToDelete.add(item);
    rebuildUi();
  }

  void clearCart() {
    for (var element in itemsToDelete) {
      cart.value.remove(element);
    }
    rebuildUi();
  }

  int getSubTotal() {
    int total = 0;

    for (var element in cart.value) {
      total = total + (element.product!.productPrice! * element.quantity!);
    }

    return total;
  }

  Future<List<OrderInfo>?> checkout() async {
    if (cart.value.isEmpty) {
      return null;
    }
    setBusy(true);
    try {
      List<OrderInfo> infoList = [];
      for (var element in cart.value) {
        OrderInfo? info = await getOrderInfo(element);
        if (info != null) {
          infoList.add(info);
        }
      }
      setBusy(false);
      return infoList;
    } catch (e) {
      log.e(e);
      setBusy(false);
      return null;
    }
  }

  Future<OrderInfo?> getOrderInfo(CartItem item) async {
    try {
      ApiResponse res = await repo.saveOrder({
        "product": item.product!.id,
        "quantity": item.quantity,
      });
      if (res.statusCode == 200) {
        return OrderInfo.fromJson(
            Map<String, dynamic>.from(res.data["orderInfo"]));
      } else {
        return null;
      }
    } catch (e) {
      log.e(e);
      return null;
    }
  }
}
