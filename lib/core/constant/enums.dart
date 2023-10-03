enum ParcelMaterialType { regular, fragile, liquid, none }

enum DistrictArea {
  inside("642e4713912a102364a618e1"),
  subside("63cfd08ade135f30482f5783");

  final String id;
  const DistrictArea(this.id);
}

enum ParcelRegularStatus {
  all,
  pending,
  hold,
  pickup,
  shipping,
  shipped,
  dropoff,
  // partial,
  returns,
  cancel,
  returnEnd,
}

enum PaymentTab { payment, history }

enum SearchBy { bySerialId, byPhone }
