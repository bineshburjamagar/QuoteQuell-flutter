// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getQuotesHash() => r'b13db8b7fd37b49d25416e695483f2ac17e15de0';

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

/// See also [getQuotes].
@ProviderFor(getQuotes)
const getQuotesProvider = GetQuotesFamily();

/// See also [getQuotes].
class GetQuotesFamily extends Family<AsyncValue<QuotesModelMeta>> {
  /// See also [getQuotes].
  const GetQuotesFamily();

  /// See also [getQuotes].
  GetQuotesProvider call({
    required int pageNumber,
  }) {
    return GetQuotesProvider(
      pageNumber: pageNumber,
    );
  }

  @override
  GetQuotesProvider getProviderOverride(
    covariant GetQuotesProvider provider,
  ) {
    return call(
      pageNumber: provider.pageNumber,
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
  String? get name => r'getQuotesProvider';
}

/// See also [getQuotes].
class GetQuotesProvider extends AutoDisposeFutureProvider<QuotesModelMeta> {
  /// See also [getQuotes].
  GetQuotesProvider({
    required int pageNumber,
  }) : this._internal(
          (ref) => getQuotes(
            ref as GetQuotesRef,
            pageNumber: pageNumber,
          ),
          from: getQuotesProvider,
          name: r'getQuotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getQuotesHash,
          dependencies: GetQuotesFamily._dependencies,
          allTransitiveDependencies: GetQuotesFamily._allTransitiveDependencies,
          pageNumber: pageNumber,
        );

  GetQuotesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageNumber,
  }) : super.internal();

  final int pageNumber;

  @override
  Override overrideWith(
    FutureOr<QuotesModelMeta> Function(GetQuotesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetQuotesProvider._internal(
        (ref) => create(ref as GetQuotesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageNumber: pageNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QuotesModelMeta> createElement() {
    return _GetQuotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetQuotesProvider && other.pageNumber == pageNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetQuotesRef on AutoDisposeFutureProviderRef<QuotesModelMeta> {
  /// The parameter `pageNumber` of this provider.
  int get pageNumber;
}

class _GetQuotesProviderElement
    extends AutoDisposeFutureProviderElement<QuotesModelMeta>
    with GetQuotesRef {
  _GetQuotesProviderElement(super.provider);

  @override
  int get pageNumber => (origin as GetQuotesProvider).pageNumber;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
