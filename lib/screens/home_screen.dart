import 'package:flutter/material.dart';
import 'package:riverpod_poc/screens/home_screen_async_notifier.dart';
import 'package:riverpod_poc/screens/home_screen_future.dart';
import 'package:riverpod_poc/screens/home_screen_notifier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod POC"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreenFuture(),
                  ),
                );
              },
              child: Text("FutureProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreenMNotifier(),
                  ),
                );
              },
              child: Text("NotifierBuilder"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreenAsyncNotifier(),
                  ),
                );
              },
              child: Text("AsuncNotifier"),
            )
          ],
        ),
      ),
    );
  }
}
