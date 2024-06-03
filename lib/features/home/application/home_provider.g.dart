// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCampaignHash() => r'fb19f06997d12b9473cf33c75730158345c30d25';

/// See also [getCampaign].
@ProviderFor(getCampaign)
final getCampaignProvider =
    AutoDisposeFutureProvider<IList<CampaignModel>>.internal(
  getCampaign,
  name: r'getCampaignProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCampaignHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCampaignRef = AutoDisposeFutureProviderRef<IList<CampaignModel>>;
String _$campaignDetailHash() => r'87abfa3e6c36125a029a7706a29a62dec0609b51';

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

/// See also [campaignDetail].
@ProviderFor(campaignDetail)
const campaignDetailProvider = CampaignDetailFamily();

/// See also [campaignDetail].
class CampaignDetailFamily extends Family<AsyncValue<CampaignListResponse>> {
  /// See also [campaignDetail].
  const CampaignDetailFamily();

  /// See also [campaignDetail].
  CampaignDetailProvider call({
    required String slug,
  }) {
    return CampaignDetailProvider(
      slug: slug,
    );
  }

  @override
  CampaignDetailProvider getProviderOverride(
    covariant CampaignDetailProvider provider,
  ) {
    return call(
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
  String? get name => r'campaignDetailProvider';
}

/// See also [campaignDetail].
class CampaignDetailProvider
    extends AutoDisposeFutureProvider<CampaignListResponse> {
  /// See also [campaignDetail].
  CampaignDetailProvider({
    required String slug,
  }) : this._internal(
          (ref) => campaignDetail(
            ref as CampaignDetailRef,
            slug: slug,
          ),
          from: campaignDetailProvider,
          name: r'campaignDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$campaignDetailHash,
          dependencies: CampaignDetailFamily._dependencies,
          allTransitiveDependencies:
              CampaignDetailFamily._allTransitiveDependencies,
          slug: slug,
        );

  CampaignDetailProvider._internal(
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
  Override overrideWith(
    FutureOr<CampaignListResponse> Function(CampaignDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CampaignDetailProvider._internal(
        (ref) => create(ref as CampaignDetailRef),
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
  AutoDisposeFutureProviderElement<CampaignListResponse> createElement() {
    return _CampaignDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CampaignDetailProvider && other.slug == slug;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slug.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CampaignDetailRef on AutoDisposeFutureProviderRef<CampaignListResponse> {
  /// The parameter `slug` of this provider.
  String get slug;
}

class _CampaignDetailProviderElement
    extends AutoDisposeFutureProviderElement<CampaignListResponse>
    with CampaignDetailRef {
  _CampaignDetailProviderElement(super.provider);

  @override
  String get slug => (origin as CampaignDetailProvider).slug;
}

String _$searchProductHash() => r'2a43d5e25556f2b5b6861fd4d336b7d9235ebad6';

abstract class _$SearchProduct
    extends BuildlessAutoDisposeAsyncNotifier<PaginatedProductResponse> {
  late final String query;
  late final int page;

  FutureOr<PaginatedProductResponse> build(
    String query, {
    int page = 1,
  });
}

/// See also [SearchProduct].
@ProviderFor(SearchProduct)
const searchProductProvider = SearchProductFamily();

/// See also [SearchProduct].
class SearchProductFamily extends Family<AsyncValue<PaginatedProductResponse>> {
  /// See also [SearchProduct].
  const SearchProductFamily();

  /// See also [SearchProduct].
  SearchProductProvider call(
    String query, {
    int page = 1,
  }) {
    return SearchProductProvider(
      query,
      page: page,
    );
  }

  @override
  SearchProductProvider getProviderOverride(
    covariant SearchProductProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchProductProvider';
}

/// See also [SearchProduct].
class SearchProductProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchProduct, PaginatedProductResponse> {
  /// See also [SearchProduct].
  SearchProductProvider(
    String query, {
    int page = 1,
  }) : this._internal(
          () => SearchProduct()
            ..query = query
            ..page = page,
          from: searchProductProvider,
          name: r'searchProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchProductHash,
          dependencies: SearchProductFamily._dependencies,
          allTransitiveDependencies:
              SearchProductFamily._allTransitiveDependencies,
          query: query,
          page: page,
        );

  SearchProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.page,
  }) : super.internal();

  final String query;
  final int page;

  @override
  FutureOr<PaginatedProductResponse> runNotifierBuild(
    covariant SearchProduct notifier,
  ) {
    return notifier.build(
      query,
      page: page,
    );
  }

  @override
  Override overrideWith(SearchProduct Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchProductProvider._internal(
        () => create()
          ..query = query
          ..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchProduct,
      PaginatedProductResponse> createElement() {
    return _SearchProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProductProvider &&
        other.query == query &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchProductRef
    on AutoDisposeAsyncNotifierProviderRef<PaginatedProductResponse> {
  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `page` of this provider.
  int get page;
}

class _SearchProductProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchProduct,
        PaginatedProductResponse> with SearchProductRef {
  _SearchProductProviderElement(super.provider);

  @override
  String get query => (origin as SearchProductProvider).query;
  @override
  int get page => (origin as SearchProductProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
