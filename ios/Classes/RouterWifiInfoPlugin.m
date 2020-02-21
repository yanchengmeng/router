#import "RouterWifiInfoPlugin.h"
#import "WifiInfoWrapper.h"

@implementation RouterWifiInfoPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"router_wifi_info" binaryMessenger:[registrar messenger]];

    RouterWifiInfoPlugin *instance = [[RouterWifiInfoPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"getWifiDetails"]) {
        result([self wifiDetails]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (NSDictionary *)wifiDetails {
    WifiInfoWrapper *wifiInfo = [[WifiInfoWrapper alloc] init];
    NSMutableDictionary<NSString *, id> *data = [NSMutableDictionary dictionary];
    data[@"IP"] = wifiInfo.address;
    data[@"GATEWAY"] = wifiInfo.gateway;
    data[@"NETWORKID"] = wifiInfo.deviceIP;
    data[@"ROUTERIP"] = wifiInfo.gateway;
    data[@"DNS1"] = wifiInfo.gateway;
    return data;
}

@end
