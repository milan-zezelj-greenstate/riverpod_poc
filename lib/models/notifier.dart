import 'package:riverpod_annotation/riverpod_annotation.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

part 'notifier.g.dart';

enum ItemSortType { normal, reverse }

class Item {
  final String name;
  final String description;

  const Item({required this.name, required this.description});

  Item.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"];
}

//NotifierProvider
@riverpod
class Items extends _$Items {
  @override
  List<Item> build() {
    return [];
  }

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeItem(String itemName) {
    state = [
      for (final item in state)
        if (item.name != itemName) item
    ];
  }
}

//NotifierProvider
@riverpod
class ListSortType extends _$ListSortType {
  @override
  ItemSortType build() {
    return ItemSortType.normal;
  }

  void toggleState() {
    state = state == ItemSortType.normal
        ? ItemSortType.reverse
        : ItemSortType.normal;
  }
}

@riverpod
List<Item> getSortedList(GetSortedListRef ref) {
  List<Item> items = ref.watch(itemsProvider);
  ItemSortType sortType = ref.watch(listSortTypeProvider);

  if (sortType == ItemSortType.normal) {
    items.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  } else {
    items.sort((a, b) {
      return b.name.toLowerCase().compareTo(a.name.toLowerCase());
    });
  }
  return items;
}

@riverpod
List<Item> getNormalSortedList(GetNormalSortedListRef ref) {
  List<Item> items = ref.watch(itemsProvider);

  items.sort((a, b) {
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  return items;
}

@riverpod
List<Item> getReverseSortedList(GetReverseSortedListRef ref) {
  List<Item> items = ref.watch(itemsProvider);

  items.sort((a, b) {
    return b.name.toLowerCase().compareTo(a.name.toLowerCase());
  });
  return items;
}
