import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_sum_plugin/flutter_sum_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterSumPlugin = FlutterSumPlugin();

  int _a = 0;
  int _b = 0;
  int _sum = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await _flutterSumPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> _calculateSum() async {
    try {
      final sum = await _flutterSumPlugin.calculateSum(_a, _b);
      print(sum);
      setState(() {
        _sum = sum!;
      });
    } on PlatformException {
      setState(() {
        _sum = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Soma: $_sum',
                  style: const TextStyle(fontSize: 30),
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _a = int.tryParse(value) ?? 0;
                      });
                    }),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _b = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _calculateSum,
                  child: const Text('Somar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
