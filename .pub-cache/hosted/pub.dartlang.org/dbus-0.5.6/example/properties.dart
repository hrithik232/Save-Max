import 'package:dbus/dbus.dart';

void main() async {
  var client = DBusClient.system();
  var object = DBusRemoteObject(client, 'org.freedesktop.NetworkManager',
      DBusObjectPath('/org/freedesktop/NetworkManager'));

  var properties =
      await object.getAllProperties('org.freedesktop.NetworkManager');
  properties.forEach((name, value) {
    print('$name: ${value.toNative()}');
  });

  print('');
  print('Hardware addresses:');
  var devicePaths = (properties['Devices'] as DBusArray)
      .children
      .map((v) => v as DBusObjectPath);
  for (var path in devicePaths) {
    var device =
        DBusRemoteObject(client, 'org.freedesktop.NetworkManager', path);
    var address = await device.getProperty(
        'org.freedesktop.NetworkManager.Device', 'HwAddress');
    print('${address.toNative()}');
  }

  object.propertiesChanged.listen((signal) {
    signal.changedProperties.forEach((name, value) {
      print('$name: ${value.toNative()}');
    });
  });
}
