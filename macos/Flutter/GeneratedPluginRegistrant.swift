//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import firebase_auth
import firebase_core
import firebase_remote_config
import geolocator_apple
import in_app_purchase_storekit
import location
import package_info_plus
import shared_preferences_foundation
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FLTFirebaseRemoteConfigPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseRemoteConfigPlugin"))
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  InAppPurchasePlugin.register(with: registry.registrar(forPlugin: "InAppPurchasePlugin"))
  LocationPlugin.register(with: registry.registrar(forPlugin: "LocationPlugin"))
  FLTPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlusPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
