import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_sum_plugin_platform_interface.dart';

/// An implementation of [FlutterSumPluginPlatform] that uses method channels.
class MethodChannelFlutterSumPlugin extends FlutterSumPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_sum_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> calculateSum(int a, int b) async {
    final result =
        await methodChannel.invokeMethod<int>('calcSum', {"a": a, "b": b});
    return result;
  }
}
