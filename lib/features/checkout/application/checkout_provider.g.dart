// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDeliveryChargeHash() => r'fc285127ab5937ac39c68067bb6faa7c97f70e21';

/// See also [getDeliveryCharge].
@ProviderFor(getDeliveryCharge)
final getDeliveryChargeProvider =
    AutoDisposeFutureProvider<IList<DeliveryChargeModel>>.internal(
  getDeliveryCharge,
  name: r'getDeliveryChargeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getDeliveryChargeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDeliveryChargeRef
    = AutoDisposeFutureProviderRef<IList<DeliveryChargeModel>>;
String _$cartProductHash() => r'374714ee6341964d4b037bba1a1824c46c1b1dc2';

/// See also [CartProduct].
@ProviderFor(CartProduct)
final cartProductProvider =
    NotifierProvider<CartProduct, IList<CartProductModel>>.internal(
  CartProduct.new,
  name: r'cartProductProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartProduct = Notifier<IList<CartProductModel>>;
String _$checkoutHash() => r'685ebe8e363f9b3f45a4c9cee2d7eeb9e5e78818';

/// See also [Checkout].
@ProviderFor(Checkout)
final checkoutProvider =
    AutoDisposeAsyncNotifierProvider<Checkout, void>.internal(
  Checkout.new,
  name: r'checkoutProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checkoutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Checkout = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
