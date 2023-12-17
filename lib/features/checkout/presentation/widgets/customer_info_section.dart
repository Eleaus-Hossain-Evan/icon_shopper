import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class CustomerInfoSection extends HookConsumerWidget {
  const CustomerInfoSection({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
  });

  final ValueNotifier<String> name;
  final ValueNotifier<String> phone;
  final ValueNotifier<String> address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gap16,
        "Customer Information".text.xl2.semiBold.makeCentered(),
        gap14,
        ContainerBGWhiteSlideFromRight(
          bgColor: AppColors.bg100,
          borderRadius: radius0,
          padding: paddingV20,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: crossStart,
                children: [
                  name.value.text.make(),
                  gap2,
                  "Phone: ${phone.value}".text.make(),
                  gap2,
                  "Address: ${address.value}".text.make(),
                ],
              ).px16().expand(),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: EditCustomerInfoWidget(
                        name: name.value,
                        phone: phone.value,
                        address: address.value,
                        onTapOk: (nameVal, phoneVal, addressVal) {
                          log('name: $nameVal');
                          log('phone: $phoneVal');
                          log('address: $addressVal');
                          name.value = nameVal;
                          phone.value = phoneVal;
                          address.value = addressVal;
                        },
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ).card.make().px20(),
      ],
    );
  }
}

class EditCustomerInfoWidget extends HookConsumerWidget {
  const EditCustomerInfoWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.onTapOk,
  });

  final String name;
  final String phone;
  final String address;
  final void Function(String, String, String) onTapOk;

  @override
  Widget build(BuildContext context, ref) {
    final nameController = useTextEditingController(text: name);
    final phoneController = useTextEditingController(text: phone);
    final addressController = useTextEditingController(text: address);
    return ColoredBox(
      color: AppColors.bg100,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            gap24,
            KTextFormField2(
              controller: nameController,
              hintText: 'Name',
              contentPadding: paddingH20,
            ),
            gap16,
            KTextFormField2(
              controller: phoneController,
              hintText: 'Phone',
              contentPadding: paddingH20,
            ),
            gap16,
            KTextFormField2(
              controller: addressController,
              hintText: 'Address',
              contentPadding: paddingH20,
              maxLines: null,
              containerPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
            gap24,
            KOutlinedButton(
              onPressed: () {
                onTapOk.call(nameController.text, phoneController.text,
                    addressController.text);
                Navigator.pop(context);
              },
              child: 'Ok'.text.make(),
            ).px64()
          ],
        ),
      ),
    );
  }
}
