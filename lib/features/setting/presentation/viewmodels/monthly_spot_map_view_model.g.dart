// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_spot_map_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthlySpotMapViewModelHash() =>
    r'210f7b783bba53bfab56f5cb550dfd3df6d23b12';

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

abstract class _$MonthlySpotMapViewModel
    extends BuildlessAutoDisposeNotifier<MonthlySpotMapState> {
  late final List<SpotMonthResponse> spots;

  MonthlySpotMapState build({
    required List<SpotMonthResponse> spots,
  });
}

/// See also [MonthlySpotMapViewModel].
@ProviderFor(MonthlySpotMapViewModel)
const monthlySpotMapViewModelProvider = MonthlySpotMapViewModelFamily();

/// See also [MonthlySpotMapViewModel].
class MonthlySpotMapViewModelFamily extends Family<MonthlySpotMapState> {
  /// See also [MonthlySpotMapViewModel].
  const MonthlySpotMapViewModelFamily();

  /// See also [MonthlySpotMapViewModel].
  MonthlySpotMapViewModelProvider call({
    required List<SpotMonthResponse> spots,
  }) {
    return MonthlySpotMapViewModelProvider(
      spots: spots,
    );
  }

  @override
  MonthlySpotMapViewModelProvider getProviderOverride(
    covariant MonthlySpotMapViewModelProvider provider,
  ) {
    return call(
      spots: provider.spots,
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
  String? get name => r'monthlySpotMapViewModelProvider';
}

/// See also [MonthlySpotMapViewModel].
class MonthlySpotMapViewModelProvider extends AutoDisposeNotifierProviderImpl<
    MonthlySpotMapViewModel, MonthlySpotMapState> {
  /// See also [MonthlySpotMapViewModel].
  MonthlySpotMapViewModelProvider({
    required List<SpotMonthResponse> spots,
  }) : this._internal(
          () => MonthlySpotMapViewModel()..spots = spots,
          from: monthlySpotMapViewModelProvider,
          name: r'monthlySpotMapViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monthlySpotMapViewModelHash,
          dependencies: MonthlySpotMapViewModelFamily._dependencies,
          allTransitiveDependencies:
              MonthlySpotMapViewModelFamily._allTransitiveDependencies,
          spots: spots,
        );

  MonthlySpotMapViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.spots,
  }) : super.internal();

  final List<SpotMonthResponse> spots;

  @override
  MonthlySpotMapState runNotifierBuild(
    covariant MonthlySpotMapViewModel notifier,
  ) {
    return notifier.build(
      spots: spots,
    );
  }

  @override
  Override overrideWith(MonthlySpotMapViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MonthlySpotMapViewModelProvider._internal(
        () => create()..spots = spots,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        spots: spots,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MonthlySpotMapViewModel,
      MonthlySpotMapState> createElement() {
    return _MonthlySpotMapViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MonthlySpotMapViewModelProvider && other.spots == spots;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, spots.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MonthlySpotMapViewModelRef
    on AutoDisposeNotifierProviderRef<MonthlySpotMapState> {
  /// The parameter `spots` of this provider.
  List<SpotMonthResponse> get spots;
}

class _MonthlySpotMapViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<MonthlySpotMapViewModel,
        MonthlySpotMapState> with MonthlySpotMapViewModelRef {
  _MonthlySpotMapViewModelProviderElement(super.provider);

  @override
  List<SpotMonthResponse> get spots =>
      (origin as MonthlySpotMapViewModelProvider).spots;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
