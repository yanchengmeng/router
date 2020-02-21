import 'dart:async';
import 'package:flutter/services.dart';

class RouterWifiInfo {
  static const MethodChannel _channel =
      const MethodChannel('router_wifi_info');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<WifiInfoWrapper> get wifiDetails async {
    final Map<dynamic, dynamic> data = await _channel.invokeMethod('getWifiDetails');

    WifiInfoWrapper wifiWrapper = new WifiInfoWrapper.withMap(data);
    return wifiWrapper;
  }
}
class WifiInfoWrapper {
  String _ip = "missing";
  String _gateway = "missing";
  String _networkId = "missing";
  String _routerIp = "unknown";
  String _dns1 = "";

  WifiInfoWrapper();

  WifiInfoWrapper.withMap(Map<dynamic, dynamic> info) {
    if (info == null) {
      return;
    }

    this._ip = info["IP"];
    this._gateway = info["GATEWAY"];
    this._networkId = info["NETWORKID"];
    this._routerIp = info["ROUTERIP"];
    this._dns1 = info["DNS1"];
  }

  String get gateway => _gateway;
  String get ipAddress => _ip;
  String get networkId => _networkId;
  String get routerIp => _routerIp;
  String get dns1 => _dns1;
}
