// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placeDetailViewModelHash() =>
    r'a43c762f04d9191894a045e78fef718d0c033f0b';

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

abstract class _$PlaceDetailViewModel
    extends BuildlessAutoDisposeNotifier<PlaceDetailState> {
  late final String placeId;

  PlaceDetailState build(
    String placeId,
  );
}

/// See also [PlaceDetailViewModel].
@ProviderFor(PlaceDetailViewModel)
const placeDetailViewModelProvider = PlaceDetailViewModelFamily();

/// See also [PlaceDetailViewModel].
class PlaceDetailViewModelFamily extends Family<PlaceDetailState> {
  /// See also [PlaceDetailViewModel].
  const PlaceDetailViewModelFamily();

  /// See also [PlaceDetailViewModel].
  PlaceDetailViewModelProvider call(
    String placeId,
  ) {
    return PlaceDetailViewModelProvider(
      placeId,
    );
  }

  @override
  PlaceDetailViewModelProvider getProviderOverride(
    covariant PlaceDetailViewModelProvider provider,
  ) {
    return call(
      provider.placeId,
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
  String? get name => r'placeDetailViewModelProvider';
}

/// See also [PlaceDetailViewModel].
class PlaceDetailViewModelProvider extends AutoDisposeNotifierProviderImpl<
    PlaceDetailViewModel, PlaceDetailState> {
  /// See also [PlaceDetailViewModel].
  PlaceDetailViewModelProvider(
    String placeId,
  ) : this._internal(
          () => PlaceDetailViewModel()..placeId = placeId,
          from: placeDetailViewModelProvider,
          name: r'placeDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$placeDetailViewModelHash,
          dependencies: PlaceDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              PlaceDetailViewModelFamily._allTransitiveDependencies,
          placeId: placeId,
        );

  PlaceDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.placeId,
  }) : super.internal();

  final String placeId;

  @override
  PlaceDetailState runNotifierBuild(
    covariant PlaceDetailViewModel notifier,
  ) {
    return notifier.build(
      placeId,
    );
  }

  @override
  Override overrideWith(PlaceDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlaceDetailViewModelProvider._internal(
        () => create()..placeId = placeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        placeId: placeId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PlaceDetailViewModel, PlaceDetailState>
      createElement() {
    return _PlaceDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceDetailViewModelProvider && other.placeId == placeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, placeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlaceDetailViewModelRef
    on AutoDisposeNotifierProviderRef<PlaceDetailState> {
  /// The parameter `placeId` of this provider.
  String get placeId;
}

class _PlaceDetailViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<PlaceDetailViewModel,
        PlaceDetailState> with PlaceDetailViewModelRef {
  _PlaceDetailViewModelProviderElement(super.provider);

  @override
  String get placeId => (origin as PlaceDetailViewModelProvider).placeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
