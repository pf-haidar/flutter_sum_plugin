
import 'flutter_sum_plugin_platform_interface.dart';

class FlutterSumPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterSumPluginPlatform.instance.getPlatformVersion();
  }

  Future<int?> calculateSum(int a, int b) {
    return FlutterSumPluginPlatform.instance.calculateSum(a, b);
  }
}
