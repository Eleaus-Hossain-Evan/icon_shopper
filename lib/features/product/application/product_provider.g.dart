// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryWiseProductHash() =>
    r'18972811e4628ed2abbaee45b552f8d4394e4232';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryWiseProduct].
@ProviderFor(categoryWiseProduct)
const categoryWiseProductProvider = CategoryWiseProductFamily();

/// See also [categoryWiseProduct].
class CategoryWiseProductFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [categoryWiseProduct].
  const CategoryWiseProductFamily();

  /// See also [categoryWiseProduct].
  CategoryWiseProductProvider call({
    int page = 1,
    required String slug,
  }) {
    return CategoryWiseProductProvider(
      page: page,
      slug: slug,
    );
  }

  @override
  CategoryWiseProductProvider getProviderOverride(
    covariant CategoryWiseProductProvider provider,
  ) {
    return call(
      page: provider.page,
      slug: provider.slug,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryWiseProductProvider';
}

/// See also [categoryWiseProduct].
class CategoryWiseProductProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [categoryWiseProduct].
  CategoryWiseProductProvider({
    int page = 1,
    required String slug,
  }) : this._internal(
          (ref) => categoryWiseProduct(
            ref as CategoryWiseProductRef,
            page: page,
            slug: slug,
          ),
          from: categoryWiseProductProvider,
          name: r'categoryWiseProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryWiseProductHash,
          dependencies: CategoryWiseProductFamily._dependencies,
          allTransitiveDependencies:
              CategoryWiseProductFamily._allTransitiveDependencies,
          page: page,
          slug: slug,
        );

  CategoryWiseProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.slug,
  }) : super.internal();

  final int page;
  final String slug;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(CategoryWiseProductRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryWiseProductProvider._internal(
        (ref) => create(ref as CategoryWiseProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        slug: slug,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _CategoryWiseProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryWiseProductProvider &&
        other.page == page &&
        other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryWiseProductRef
    on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `slug` of this provider.
  String get slug;
}

class _CategoryWiseProductProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with CategoryWiseProductRef {
  _CategoryWiseProductProviderElement(super.provider);

  @override
  int get page => (origin as CategoryWiseProductProvider).page;
  @override
  String get slug => (origin as CategoryWiseProductProvider).slug;
}

String _$productDetailsHash() => r'c5b6e365e55f7688c265ece6750ddcaba391cb47';

abstract class _$ProductDetails
    extends BuildlessAutoDisposeAsyncNotifier<ProductResponse> {
  late final String slug;

  FutureOr<ProductResponse> build(
    String slug,
  );
}

/// See also [ProductDetails].
@ProviderFor(ProductDetails)
const productDetailsProvider = ProductDetailsFamily();

/// See also [ProductDetails].
class ProductDetailsFamily extends Family<AsyncValue<ProductResponse>> {
  /// See also [ProductDetails].
  const ProductDetailsFamily();

  /// See also [ProductDetails].
  ProductDetailsProvider call(
    String slug,
  ) {
    return ProductDetailsProvider(
      slug,
    );
  }

  @override
  ProductDetailsProvider getProviderOverride(
    covariant ProductDetailsProvider provider,
  ) {
    return call(
      provider.slug,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailsProvider';
}

/// See also [ProductDetails].
class ProductDetailsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProductDetails, ProductResponse> {
  /// See also [ProductDetails].
  ProductDetailsProvider(
    String slug,
  ) : this._internal(
          () => ProductDetails()..slug = slug,
          from: productDetailsProvider,
          name: r'productDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDetailsHash,
          dependencies: ProductDetailsFamily._dependencies,
          allTransitiveDependencies:
              ProductDetailsFamily._allTransitiveDependencies,
          slug: slug,
        );

  ProductDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slug,
  }) : super.internal();

  final String slug;

  @override
  FutureOr<ProductResponse> runNotifierBuild(
    covariant ProductDetails notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(ProductDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailsProvider._internal(
        () => create()..slug = slug,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slug: slug,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductDetails, ProductResponse>
      createElement() {
    return _ProductDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailsProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductDetailsRef
    on AutoDisposeAsyncNotifierProviderRef<ProductResponse> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _ProductDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductDetails,
        ProductResponse> with ProductDetailsRef {
  _ProductDetailsProviderElement(super.provider);

  @override
  String get slug => (origin as ProductDetailsProvider).slug;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
