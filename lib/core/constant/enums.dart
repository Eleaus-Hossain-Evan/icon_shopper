enum ProductInfoSectionEnum { description, guideLine, sizeChart }

enum PaymentMethod { cashOnDelivery, onlinePayment }

enum DeliveryStatus {
  newOrder(1, "New order"),
  pending(2, "Pending"),
  pendingPayment(3, "Pending payment"),
  confirm(4, "Confirm"),
  hold(5, "Hold"),
  processing(6, "Processing"),
  sendToCourier(7, "Send to courier"),
  assignToRider(8, "Assign to rider"),
  delivered(9, "Delivered"),
  returns(10, "Return"),
  exchange(11, "Exchange"),
  cancel(12, "Cancel");

  final int data;
  final String text;
  const DeliveryStatus(this.data, this.text);

  getFromData(int data) =>
      DeliveryStatus.values.firstWhere((element) => element.data == data);
}
