import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/models/notifier.dart';

class HomeScreenMNotifier extends ConsumerWidget {
  const HomeScreenMNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    List<Item> items = ref.watch(getSortedListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod POC Notifier"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Text("Sorted:"),
                ElevatedButton(
                  onPressed: () {
                    ref.read(listSortTypeProvider.notifier).toggleState();
                  },
                  child: Text(
                      ref.watch(listSortTypeProvider) == ItemSortType.normal
                          ? "A-Z"
                          : "Z-A"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                "Name: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Expanded(
                                child: Text(items[index].name),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                "Description: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Expanded(
                                child: Text(
                                  items[index].description,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(itemsProvider.notifier).addItem(Item(
                              name: nameController.text,
                              description: descriptionController.text));
                        },
                        child: const Text("Add"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(itemsProvider.notifier)
                              .removeItem(nameController.text);
                        },
                        child: const Text("Remove"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
