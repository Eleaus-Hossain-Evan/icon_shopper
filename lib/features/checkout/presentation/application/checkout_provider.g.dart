// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartProductHash() => r'309b35ed4806580443d81c48fe42a1360d700900';

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
String _$checkoutHash() => r'3c7ae03828886545a1e702b1901ed90ca3fbaa52';

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
