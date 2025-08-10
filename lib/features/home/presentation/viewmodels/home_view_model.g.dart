// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

<<<<<<<< HEAD:lib/features/home/presentation/viewmodels/home_view_model.g.dart
String _$homeViewModelHash() => r'f567ce24867f100e5372af16e51030701b393e2d';
========
String _$splashViewModelHash() => r'df3b8d0839db194b74ae722765f0bd095f2d3fc4';
>>>>>>>> feature/#36:lib/features/splash/presentation/viewmodels/splash_view_model.g.dart

///날씨 상태 Ui따로 고려
///
/// Copied from [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeNotifierProvider<HomeViewModel, HomeState>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeNotifier<HomeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
