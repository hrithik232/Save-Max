// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source is governed by a BSD-style license that can
// be found in the LICENSE file.

import Cocoa
import FlutterMacOS

public class ConnectivityPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private let connectivityProvider: ConnectivityProvider
  private var eventSink: FlutterEventSink?

  init(connectivityProvider: ConnectivityProvider) {
    self.connectivityProvider = connectivityProvider
    super.init()
    self.connectivityProvider.connectivityUpdateHandler = connectivityUpdateHandler
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "dev.fluttercommunity.plus/connectivity",
      binaryMessenger: registrar.messenger)

    let streamChannel = FlutterEventChannel(
      name: "dev.fluttercommunity.plus/connectivity_status",
      binaryMessenger: registrar.messenger)

    let connectivityProvider: ConnectivityProvider
    if #available(macOS 10.14, *) {
      connectivityProvider = PathMonitorConnectivityProvider()
    } else {
      connectivityProvider = ReachabilityConnectivityProvider()
    }

    let instance = ConnectivityPlugin(connectivityProvider: connectivityProvider)
    streamChannel.setStreamHandler(instance)

    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "check":
      result(statusFrom(connectivityType: connectivityProvider.currentConnectivityType))
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func statusFrom(connectivityType: ConnectivityType) -> String {
    switch connectivityType {
    case .wifi:
      return "wifi"
    case .cellular:
      return "mobile"
    case .wiredEthernet:
      return "ethernet"
    case .none:
      return "none"
    }
  }

  public func onListen(
    withArguments _: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    eventSink = events
    connectivityProvider.start()
    connectivityUpdateHandler(connectivityType: connectivityProvider.currentConnectivityType)
    return nil
  }

  private func connectivityUpdateHandler(connectivityType: ConnectivityType) {
    eventSink?(statusFrom(connectivityType: connectivityType))
  }

  public func onCancel(withArguments _: Any?) -> FlutterError? {
    connectivityProvider.stop()
    eventSink = nil
    return nil
  }
}
