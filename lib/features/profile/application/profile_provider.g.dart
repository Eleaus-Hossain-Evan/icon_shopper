// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileHash() => r'77539c8dd961ed1ade729196e36e70974986e498';

/// See also [Profile].
@ProviderFor(Profile)
final profileProvider = AutoDisposeNotifierProvider<Profile, void>.internal(
  Profile.new,
  name: r'profileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Profile = AutoDisposeNotifier<void>;
String _$contactInfoHash() => r'41b64b18ed9e61d2c6322d8caf311160e73739f5';

/// See also [ContactInfo].
@ProviderFor(ContactInfo)
final contactInfoProvider =
    AutoDisposeAsyncNotifierProvider<ContactInfo, ContactInfoModel>.internal(
  ContactInfo.new,
  name: r'contactInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$contactInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContactInfo = AutoDisposeAsyncNotifier<ContactInfoModel>;
String _$getPolicyHash() => r'b3b92c0fbaed9d57284aec2c46b5d855d869e188';

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

abstract class _$GetPolicy
    extends BuildlessAutoDisposeAsyncNotifier<PolicyModel> {
  late final String url;

  FutureOr<PolicyModel> build({
    required String url,
  });
}

/// See also [GetPolicy].
@ProviderFor(GetPolicy)
const getPolicyProvider = GetPolicyFamily();

/// See also [GetPolicy].
class GetPolicyFamily extends Family<AsyncValue<PolicyModel>> {
  /// See also [GetPolicy].
  const GetPolicyFamily();

  /// See also [GetPolicy].
  GetPolicyProvider call({
    required String url,
  }) {
    return GetPolicyProvider(
      url: url,
    );
  }

  @override
  GetPolicyProvider getProviderOverride(
    covariant GetPolicyProvider provider,
  ) {
    return call(
      url: provider.url,
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
  String? get name => r'getPolicyProvider';
}

/// See also [GetPolicy].
class GetPolicyProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetPolicy, PolicyModel> {
  /// See also [GetPolicy].
  GetPolicyProvider({
    required String url,
  }) : this._internal(
          () => GetPolicy()..url = url,
          from: getPolicyProvider,
          name: r'getPolicyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPolicyHash,
          dependencies: GetPolicyFamily._dependencies,
          allTransitiveDependencies: GetPolicyFamily._allTransitiveDependencies,
          url: url,
        );

  GetPolicyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  FutureOr<PolicyModel> runNotifierBuild(
    covariant GetPolicy notifier,
  ) {
    return notifier.build(
      url: url,
    );
  }

  @override
  Override overrideWith(GetPolicy Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetPolicyProvider._internal(
        () => create()..url = url,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetPolicy, PolicyModel>
      createElement() {
    return _GetPolicyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPolicyProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPolicyRef on AutoDisposeAsyncNotifierProviderRef<PolicyModel> {
  /// The parameter `url` of this provider.
  String get url;
}

class _GetPolicyProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetPolicy, PolicyModel>
    with GetPolicyRef {
  _GetPolicyProviderElement(super.provider);

  @override
  String get url => (origin as GetPolicyProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
