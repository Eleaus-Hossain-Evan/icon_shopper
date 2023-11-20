enum ProductInfoSectionEnum { description, guideLine, sizeChart }

enum ShippingMethod {
  inside("Inside Dhaka (৳ 60)", 65.0),
  outside("Outside Dhaka (৳ 120)", 120);

  final String value;
  final double price;

  const ShippingMethod(this.value, this.price);
}

enum PaymentMethod { cashOnDelivery, onlinePayment }
