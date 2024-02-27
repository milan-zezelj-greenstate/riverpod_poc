// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getItemFutureHash() => r'd109f9cf95a13efd8d3c905044102824ec2c16a5';

/// See also [getItemFuture].
@ProviderFor(getItemFuture)
final getItemFutureProvider = AutoDisposeFutureProvider<List<Item>>.internal(
  getItemFuture,
  name: r'getItemFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getItemFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetItemFutureRef = AutoDisposeFutureProviderRef<List<Item>>;
String _$itemsHash() => r'99d7919053fb94fddd86216c41da9dff11ba7508';

/// See also [Items].
@ProviderFor(Items)
final itemsProvider = AutoDisposeNotifierProvider<Items, List<Item>>.internal(
  Items.new,
  name: r'itemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Items = AutoDisposeNotifier<List<Item>>;
String _$itemsAsyncHash() => r'01775ec7db92dcacee2248629c46683091d4ecf3';

/// See also [ItemsAsync].
@ProviderFor(ItemsAsync)
final itemsAsyncProvider =
    AutoDisposeAsyncNotifierProvider<ItemsAsync, List<Item>>.internal(
  ItemsAsync.new,
  name: r'itemsAsyncProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemsAsyncHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsAsync = AutoDisposeAsyncNotifier<List<Item>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
