import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/models/item_model.dart';

class HomeScreenAsyncNotifier extends ConsumerWidget {
  const HomeScreenAsyncNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    AsyncValue<List<Item>> items = ref.watch(itemsAsyncProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod POC Async Notifier"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                switch (items) {
                  AsyncData(:final value) => Expanded(
                      child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Text(
                                    "Name: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(child: Text(value[index].name)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Text(
                                    "Description: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Text(
                                      value[index].description,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  AsyncError() =>
                    const Text('Oops, something unexpected happened'),
                  _ => Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          Expanded(
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                },
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
                          ref.read(itemsAsyncProvider.notifier).addItem(
                              const Item(
                                  name: "Novi item", description: "ASD"));
                        },
                        child: const Text("Add"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("Remove"),
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
