enum ProductInfoSectionEnum { description, guideLine, sizeChart }

enum ShippingMethod {
  inside("Inside Dhaka city: 65৳", 65.0),
  urgent("Urgent: 250৳", 250),
  pickShowroom("Pick From Showroom", 0);

  final String value;
  final double price;

  const ShippingMethod(this.value, this.price);
}

enum PaymentMethod { cashOnDelivery, bKash }
