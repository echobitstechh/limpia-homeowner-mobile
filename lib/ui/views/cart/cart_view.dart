import 'package:afriprize/app/app.locator.dart';
import 'package:afriprize/core/data/models/cart_item.dart';
import 'package:afriprize/state.dart';
import 'package:afriprize/ui/common/app_colors.dart';
import 'package:afriprize/ui/common/ui_helpers.dart';
import 'package:afriprize/ui/components/submit_button.dart';
import 'package:afriprize/ui/views/cart/checkout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/data/models/order_info.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "My Carts",
          style: TextStyle(
            color: kcBlackColor,
          ),
        ),
        actions: [
          viewModel.itemsToDelete.isNotEmpty
              ? InkWell(
                  onTap: () {
                    viewModel.clearCart();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ValueListenableBuilder<List<CartItem>>(
            valueListenable: cart,
            builder: (context, value, child) => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: value.length,
              itemBuilder: (context, index) {
                CartItem item = value[index];
                return GestureDetector(
                  onTap: () {
                    viewModel.addRemoveDelete(item);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFFE5E5E5).withOpacity(0.4),
                            offset: const Offset(8.8, 8.8),
                            blurRadius: 8.8)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: item.product!.pictures!.isEmpty
                                    ? null
                                    : DecorationImage(
                                        image: NetworkImage(item
                                            .product!.pictures![0].location!),
                                      ),
                              ),
                            ),
                            horizontalSpaceMedium,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(item.product!.productName ?? ""),
                                Text(item.product!.productName ?? ""),
                                verticalSpaceTiny,
                                Text(
                                  "N${item.product!.productPrice! * item.quantity!}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            viewModel.itemsToDelete.contains(item)
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      color: kcSecondaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        color: kcWhiteColor,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: kcLightGrey),
                                    ),
                                  ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kcLightGrey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Text("${item.quantity!}"),
                                horizontalSpaceSmall,
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kcLightGrey),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sub-total",
                style: TextStyle(
                  fontSize: 16,
                  color: kcMediumGrey,
                ),
              ),
              Text(
                "N${viewModel.getSubTotal()}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          verticalSpaceSmall,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery-Fee",
                style: TextStyle(
                  fontSize: 16,
                  color: kcMediumGrey,
                ),
              ),
              Text(
                "N0",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          verticalSpaceSmall,
          const Divider(
            thickness: 2,
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    fontSize: 16,
                    color: kcBlackColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "N${viewModel.getSubTotal()}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          verticalSpaceLarge,
          SubmitButton(
            isLoading: viewModel.isBusy,
            label: "Checkout",
            submit: viewModel.checkout,
            color: kcPrimaryColor,
            boldText: true,
          )
        ],
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
