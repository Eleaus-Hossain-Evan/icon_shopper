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

String _$allProductHash() => r'bdcd29a3ab3f2cc70aecef031174a42d6cee2593';

/// See also [allProduct].
@ProviderFor(allProduct)
const allProductProvider = AllProductFamily();

/// See also [allProduct].
class AllProductFamily extends Family<AsyncValue<List>> {
  /// See also [allProduct].
  const AllProductFamily();

  /// See also [allProduct].
  AllProductProvider call({
    int page = 1,
  }) {
    return AllProductProvider(
      page: page,
    );
  }

  @override
  AllProductProvider getProviderOverride(
    covariant AllProductProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'allProductProvider';
}

/// See also [allProduct].
class AllProductProvider extends AutoDisposeFutureProvider<List> {
  /// See also [allProduct].
  AllProductProvider({
    int page = 1,
  }) : this._internal(
          (ref) => allProduct(
            ref as AllProductRef,
            page: page,
          ),
          from: allProductProvider,
          name: r'allProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allProductHash,
          dependencies: AllProductFamily._dependencies,
          allTransitiveDependencies:
              AllProductFamily._allTransitiveDependencies,
          page: page,
        );

  AllProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List> Function(AllProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllProductProvider._internal(
        (ref) => create(ref as AllProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List> createElement() {
    return _AllProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllProductProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllProductRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `page` of this provider.
  int get page;
}

class _AllProductProviderElement extends AutoDisposeFutureProviderElement<List>
    with AllProductRef {
  _AllProductProviderElement(super.provider);

  @override
  int get page => (origin as AllProductProvider).page;
}

String _$productNotifierHash() => r'd3c5fd7d1a7e4842e5c1f02dc48f9e85bafbaf5b';

/// See also [ProductNotifier].
@ProviderFor(ProductNotifier)
final productNotifierProvider =
    AutoDisposeNotifierProvider<ProductNotifier, ProductModel>.internal(
  ProductNotifier.new,
  name: r'productNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductNotifier = AutoDisposeNotifier<ProductModel>;
String _$productStockHash() => r'242d1af8d45a841b72891e7e552a963c5c368dce';

/// See also [ProductStock].
@ProviderFor(ProductStock)
final productStockProvider = AutoDisposeAsyncNotifierProvider<ProductStock,
    List<ProductStockModel>>.internal(
  ProductStock.new,
  name: r'productStockProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productStockHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductStock = AutoDisposeAsyncNotifier<List<ProductStockModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
