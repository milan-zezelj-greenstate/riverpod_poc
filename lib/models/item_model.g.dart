// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getItemFutureHash() => r'1cc25d57e79b244883a5d7a3d19b24767819d59c';

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
String _$itemsAsyncHash() => r'732e8538cf8485ff529677f11afc5df564567ad7';

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
