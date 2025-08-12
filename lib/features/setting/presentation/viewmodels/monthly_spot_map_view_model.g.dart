// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_spot_map_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$monthlySpotMapViewModelHash() =>
    r'9c7eb46e14437a78e6e8865d9114aa3f54fc580c';

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
  late final int? initialSelectedPlaceId;

  MonthlySpotMapState build({
    required List<SpotMonthResponse> spots,
    int? initialSelectedPlaceId,
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
    int? initialSelectedPlaceId,
  }) {
    return MonthlySpotMapViewModelProvider(
      spots: spots,
      initialSelectedPlaceId: initialSelectedPlaceId,
    );
  }

  @override
  MonthlySpotMapViewModelProvider getProviderOverride(
    covariant MonthlySpotMapViewModelProvider provider,
  ) {
    return call(
      spots: provider.spots,
      initialSelectedPlaceId: provider.initialSelectedPlaceId,
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
    int? initialSelectedPlaceId,
  }) : this._internal(
          () => MonthlySpotMapViewModel()
            ..spots = spots
            ..initialSelectedPlaceId = initialSelectedPlaceId,
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
          initialSelectedPlaceId: initialSelectedPlaceId,
        );

  MonthlySpotMapViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.spots,
    required this.initialSelectedPlaceId,
  }) : super.internal();

  final List<SpotMonthResponse> spots;
  final int? initialSelectedPlaceId;

  @override
  MonthlySpotMapState runNotifierBuild(
    covariant MonthlySpotMapViewModel notifier,
  ) {
    return notifier.build(
      spots: spots,
      initialSelectedPlaceId: initialSelectedPlaceId,
    );
  }

  @override
  Override overrideWith(MonthlySpotMapViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MonthlySpotMapViewModelProvider._internal(
        () => create()
          ..spots = spots
          ..initialSelectedPlaceId = initialSelectedPlaceId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        spots: spots,
        initialSelectedPlaceId: initialSelectedPlaceId,
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
    return other is MonthlySpotMapViewModelProvider &&
        other.spots == spots &&
        other.initialSelectedPlaceId == initialSelectedPlaceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, spots.hashCode);
    hash = _SystemHash.combine(hash, initialSelectedPlaceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MonthlySpotMapViewModelRef
    on AutoDisposeNotifierProviderRef<MonthlySpotMapState> {
  /// The parameter `spots` of this provider.
  List<SpotMonthResponse> get spots;

  /// The parameter `initialSelectedPlaceId` of this provider.
  int? get initialSelectedPlaceId;
}

class _MonthlySpotMapViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<MonthlySpotMapViewModel,
        MonthlySpotMapState> with MonthlySpotMapViewModelRef {
  _MonthlySpotMapViewModelProviderElement(super.provider);

  @override
  List<SpotMonthResponse> get spots =>
      (origin as MonthlySpotMapViewModelProvider).spots;
  @override
  int? get initialSelectedPlaceId =>
      (origin as MonthlySpotMapViewModelProvider).initialSelectedPlaceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
