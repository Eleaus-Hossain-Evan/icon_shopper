import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timelines/timelines.dart';
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
    DeliveryStatus getFromData(int data) =>
        DeliveryStatus.values.firstWhere((element) => element.data == data);

    // List<int> getStatus(int data) {
    //   if (data == 1) {
    //     return [1, 2, 3];
    //   } else if (data == 12) {
    //     return [10, 11, 12];
    //   } else {
    //     return [
    //       data - 1,
    //       data,
    //       data + 1,
    //     ];
    //   }
    // }

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'OrderDetail',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //. Order Status & Address

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

            //. Order Details

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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    child: InnerBoxRowItem(
                      title: "Subtotal",
                      value: "${AppStrings.tkSymbol}${model.net_total}",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    child: InnerBoxRowItem(
                      title: "Delivery Charge",
                      value: "${AppStrings.tkSymbol}${model.shipping_cost}",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    child: InnerBoxRowItem(
                      title: "Discount",
                      value: "${AppStrings.tkSymbol}${model.total_discount}",
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 6.h,
                    ),
                    child: InnerBoxRowItem(
                      title: "Total",
                      value: "${AppStrings.tkSymbol}${model.grand_total}",
                      total: true,
                    ),
                  ),
                  gap8,
                ],
              ),
            ),
            gap16,

            //. Payment Details

            ContainerBGWhiteSlideFromRight(
              borderColor: context.colors.secondaryContainer.withOpacity(.2),
              bgColor: AppColors.bg200,
              margin: paddingH22,
              padding: padding0,
              child: Column(
                children: [
                  "Track Order".text.make().p20(),
                  const Divider(height: 1),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                    child: TimelineSection(
                      statusList: DeliveryStatus.values,
                      currentStatus: getFromData(model.delivery_status),
                    ),
                  ),
                  gap16,
                ],
              ),
            ),
            gap16,
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
    this.total = false,
  });

  final String title;
  final String value;
  final bool total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title "
            .text
            .textStyle(TextStyle(
              fontSize: total ? 16.sp : null,
              fontWeight: total ? FontWeight.bold : null,
            ))
            .make(),
        value.text
            .textStyle(TextStyle(
              fontSize: total ? 16.sp : null,
              fontWeight: total ? FontWeight.bold : null,
            ))
            .make(),
      ],
    );
  }
}

class TimelineSection extends HookConsumerWidget {
  const TimelineSection({
    super.key,
    required this.statusList,
    required this.currentStatus,
  });

  final List<DeliveryStatus> statusList;
  final DeliveryStatus currentStatus;

  @override
  Widget build(BuildContext context, ref) {
    final processIndex = statusList.indexOf(currentStatus);
    Color getColor(int index) {
      if (index == processIndex) {
        return const Color(0xff5ec792);
      } else if (index < processIndex) {
        return const Color(0xff5e6172);
      } else {
        return const Color(0xffd1d2d7);
      }
    }

    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        color: const Color(0xff989898),
        indicatorTheme: const IndicatorThemeData(
          position: 0,
          size: 20.0,
        ),
        connectorTheme: ConnectorThemeData(
          thickness: 2.5,
          space: 16.h,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: statusList.length,
        contentsBuilder: (_, index) {
          final item = statusList[index];
          final isCurrent = item == currentStatus;
          return Text(
            item.text,
            style: TextStyle(
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
              fontSize: isCurrent ? 14.sp : 12.sp,
              color: isCurrent
                  ? context.colors.secondary
                  : const Color(0xff989898),
            ),
          ).px16().pSymmetric(v: isCurrent ? 10.h : 6.h);
        },
        indicatorBuilder: (_, index) {
          if (index <= processIndex) {
            return DotIndicator(
              color: context.colors.secondary,
              position: .5,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 16.0,
              ),
            );
          } else {
            return const OutlinedDotIndicator(
              borderWidth: 2.5,
              position: .5,
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            if (index <= processIndex) {
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  color: context.colors.secondary,
                ),
              );
            } else {
              return SolidLineConnector(
                color: getColor(index),
              );
            }
          } else {
            return null;
          }
        },
      ),
    );
  }
}
