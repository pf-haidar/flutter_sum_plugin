import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_sum_plugin_method_channel.dart';

abstract class FlutterSumPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterSumPluginPlatform.
  FlutterSumPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSumPluginPlatform _instance = MethodChannelFlutterSumPlugin();

  /// The default instance of [FlutterSumPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSumPlugin].
  static FlutterSumPluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSumPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterSumPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> calculateSum(int a, int b) {
    throw UnimplementedError('calculateSum() has not been implemented.');
  }


}
