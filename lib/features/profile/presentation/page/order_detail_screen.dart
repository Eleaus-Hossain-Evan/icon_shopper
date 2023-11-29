import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../domain/model/order_model.dart';

class OrderDetailScreen extends HookConsumerWidget {
  static const route = '/order-detail';

  const OrderDetailScreen({
    super.key,
    required this.model,
  });

  final OrderModel model;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getDeliveryStatus() {
      return switch (model.delivery_status) {
        "1" => "New order",
        "2" => "Pending",
        "3" => "Pending payment",
        "4" => "Confirm",
        "5" => "Hold",
        "6" => "Processing",
        "7" => "Send to courier",
        "8" => "Assign to rider",
        "9" => "Delivered",
        "10" => "Return",
        "11" => "Exchange",
        "12" => "Cancel",
        _ => "",
      };
    }

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'OrderDetail',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerBGWhiteSlideFromRight(
              borderColor: context.colors.secondaryContainer.withOpacity(.2),
              bgColor: AppColors.bg200,
              margin: paddingH22,
              child: Column(
                children: [
                  ExpansionTile(
                    title: "Order Details".text.bold.xl.make(),
                    tilePadding: padding0,
                    initiallyExpanded: true,
                    children: [
                      InnerBoxRowItem(
                        title: "Invoice No",
                        value: model.invoice_no,
                      ),
                      gap6,
                      InnerBoxRowItem(
                        title: "Order Date",
                        value: model.sale_date,
                      ),
                      gap6,
                      InnerBoxRowItem(
                        title: "Total",
                        value: model.grand_total.toString(),
                      ),
                      gap12,
                    ],
                  ),
                  ExpansionTile(
                    title: "Shipping Address".text.bold.xl.make(),
                    tilePadding: padding0,
                    children: [
                      model.information.text.make(),
                      gap12,
                    ],
                  ),
                ],
              ),
            ),
            gap16,
            ContainerBGWhiteSlideFromRight(
              borderColor: context.colors.secondaryContainer.withOpacity(.2),
              bgColor: AppColors.bg200,
              margin: paddingH22,
              padding: padding0,
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  gap20,
                  "Order #${model.invoice_no}".text.make().px20(),
                  gap12,
                  const Divider(),
                  KListViewSeparated(
                    separator: const Divider(
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      final item = model.sale_product_list[index];
                      return ListTile(
                        // leading: Image.network(
                        //   item.image,
                        //   width: 80.w,
                        //   height: 80.w,
                        //   fit: BoxFit.cover,
                        // ),
                        title: item.product.product_name.text.bold.sm.make(),
                        subtitle:
                            "${AppStrings.tkSymbol}${item.net_unit_price} X ${item.qty}"
                                .text
                                .make(),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            item.unit.unit_name.text.make(),
                            "${item.total}${AppStrings.tkSymbol}"
                                .text
                                .lg
                                .bold
                                .make(),
                          ],
                        ),
                      );
                    },
                    itemCount: model.sale_product_list.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InnerBoxRowItem extends StatelessWidget {
  const InnerBoxRowItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title ".text.make(),
        value.text.make(),
      ],
    );
  }
}
