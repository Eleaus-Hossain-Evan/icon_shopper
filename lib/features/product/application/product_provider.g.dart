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

String _$getProductDetailsHash() => r'18497571f6279b30b96f44db43aa3b7a6013b2c3';

abstract class _$GetProductDetails
    extends BuildlessAutoDisposeAsyncNotifier<ProductResponse> {
  late final String slug;

  FutureOr<ProductResponse> build(
    String slug,
  );
}

/// See also [GetProductDetails].
@ProviderFor(GetProductDetails)
const getProductDetailsProvider = GetProductDetailsFamily();

/// See also [GetProductDetails].
class GetProductDetailsFamily extends Family<AsyncValue<ProductResponse>> {
  /// See also [GetProductDetails].
  const GetProductDetailsFamily();

  /// See also [GetProductDetails].
  GetProductDetailsProvider call(
    String slug,
  ) {
    return GetProductDetailsProvider(
      slug,
    );
  }

  @override
  GetProductDetailsProvider getProviderOverride(
    covariant GetProductDetailsProvider provider,
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
  String? get name => r'getProductDetailsProvider';
}

/// See also [GetProductDetails].
class GetProductDetailsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    GetProductDetails, ProductResponse> {
  /// See also [GetProductDetails].
  GetProductDetailsProvider(
    String slug,
  ) : this._internal(
          () => GetProductDetails()..slug = slug,
          from: getProductDetailsProvider,
          name: r'getProductDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductDetailsHash,
          dependencies: GetProductDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetProductDetailsFamily._allTransitiveDependencies,
          slug: slug,
        );

  GetProductDetailsProvider._internal(
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
    covariant GetProductDetails notifier,
  ) {
    return notifier.build(
      slug,
    );
  }

  @override
  Override overrideWith(GetProductDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetProductDetailsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GetProductDetails, ProductResponse>
      createElement() {
    return _GetProductDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductDetailsProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductDetailsRef
    on AutoDisposeAsyncNotifierProviderRef<ProductResponse> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _GetProductDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetProductDetails,
        ProductResponse> with GetProductDetailsRef {
  _GetProductDetailsProviderElement(super.provider);

  @override
  String get slug => (origin as GetProductDetailsProvider).slug;
}

String _$currentProductHash() => r'a0675242c06d1baa726e2cbf2f71e96f0af6c56b';

/// See also [CurrentProduct].
@ProviderFor(CurrentProduct)
final currentProductProvider =
    AutoDisposeNotifierProvider<CurrentProduct, ProductModel>.internal(
  CurrentProduct.new,
  name: r'currentProductProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProductHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentProduct = AutoDisposeNotifier<ProductModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
