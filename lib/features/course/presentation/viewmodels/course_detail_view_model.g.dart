// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailViewModelHash() =>
    r'223eabb5bcc91a42e8965746292e45c8cc23ba4a';

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

abstract class _$CourseDetailViewModel
    extends BuildlessAutoDisposeNotifier<CourseDetailState> {
  late final String courseId;

  CourseDetailState build(
    String courseId,
  );
}

/// See also [CourseDetailViewModel].
@ProviderFor(CourseDetailViewModel)
const courseDetailViewModelProvider = CourseDetailViewModelFamily();

/// See also [CourseDetailViewModel].
class CourseDetailViewModelFamily extends Family<CourseDetailState> {
  /// See also [CourseDetailViewModel].
  const CourseDetailViewModelFamily();

  /// See also [CourseDetailViewModel].
  CourseDetailViewModelProvider call(
    String courseId,
  ) {
    return CourseDetailViewModelProvider(
      courseId,
    );
  }

  @override
  CourseDetailViewModelProvider getProviderOverride(
    covariant CourseDetailViewModelProvider provider,
  ) {
    return call(
      provider.courseId,
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
  String? get name => r'courseDetailViewModelProvider';
}

/// See also [CourseDetailViewModel].
class CourseDetailViewModelProvider extends AutoDisposeNotifierProviderImpl<
    CourseDetailViewModel, CourseDetailState> {
  /// See also [CourseDetailViewModel].
  CourseDetailViewModelProvider(
    String courseId,
  ) : this._internal(
          () => CourseDetailViewModel()..courseId = courseId,
          from: courseDetailViewModelProvider,
          name: r'courseDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailViewModelHash,
          dependencies: CourseDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailViewModelFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  CourseDetailViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final String courseId;

  @override
  CourseDetailState runNotifierBuild(
    covariant CourseDetailViewModel notifier,
  ) {
    return notifier.build(
      courseId,
    );
  }

  @override
  Override overrideWith(CourseDetailViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailViewModelProvider._internal(
        () => create()..courseId = courseId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CourseDetailViewModel, CourseDetailState>
      createElement() {
    return _CourseDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailViewModelProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CourseDetailViewModelRef
    on AutoDisposeNotifierProviderRef<CourseDetailState> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _CourseDetailViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<CourseDetailViewModel,
        CourseDetailState> with CourseDetailViewModelRef {
  _CourseDetailViewModelProviderElement(super.provider);

  @override
  String get courseId => (origin as CourseDetailViewModelProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
