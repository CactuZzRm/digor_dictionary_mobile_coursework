// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchHash() => r'dd828af59148cf97badd85866a2daa854570ee6c';

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

typedef SearchRef = FutureProviderRef<List<WordModel>>;

/// See also [search].
@ProviderFor(search)
const searchProvider = SearchFamily();

/// See also [search].
class SearchFamily extends Family<AsyncValue<List<WordModel>>> {
  /// See also [search].
  const SearchFamily();

  /// See also [search].
  SearchProvider call({
    required String text,
  }) {
    return SearchProvider(
      text: text,
    );
  }

  @override
  SearchProvider getProviderOverride(
    covariant SearchProvider provider,
  ) {
    return call(
      text: provider.text,
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
  String? get name => r'searchProvider';
}

/// See also [search].
class SearchProvider extends FutureProvider<List<WordModel>> {
  /// See also [search].
  SearchProvider({
    required this.text,
  }) : super.internal(
          (ref) => search(
            ref,
            text: text,
          ),
          from: searchProvider,
          name: r'searchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchHash,
          dependencies: SearchFamily._dependencies,
          allTransitiveDependencies: SearchFamily._allTransitiveDependencies,
        );

  final String text;

  @override
  bool operator ==(Object other) {
    return other is SearchProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$searchModeHash() => r'1c91d31bb9716066339bfbb95c261aba19cc2f33';

/// See also [SearchMode].
@ProviderFor(SearchMode)
final searchModeProvider =
    AsyncNotifierProvider<SearchMode, LanguageMode>.internal(
  SearchMode.new,
  name: r'searchModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchMode = AsyncNotifier<LanguageMode>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
