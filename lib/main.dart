import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({
    super.key,
  });

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text('Count: ${c.count}')),
          TextButton(
              onPressed: () => Get.to(() => SecondPage()),
              child: const Text('Go to Second Page')),
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => c.reset(),
            child: const Icon(Icons.restart_alt),
          ),
          FloatingActionButton(
            onPressed: () => c.decrement(),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => c.increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text('Count: ${c.count}')),
          TextButton(
              onPressed: () => Get.back(),
              child: const Text('Go to First Page')),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
