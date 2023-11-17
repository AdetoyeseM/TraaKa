import 'package:ably_flutter/ably_flutter.dart' as ably;

ably.Realtime? realtimeInstance;
ably.RealtimeChannel? orderStatusChannel;

class AblyRequest {
  createAblyRealtimeInstance() async {
    var clientOptions = ably.ClientOptions.fromKey(
        "4L6vCw.XxedjA:7pKy0A9tpL27O0Ek-74hvxvqh7YWaI4iAl8WIqNc5sU");
    try {
      realtimeInstance = ably.Realtime(options: clientOptions);
      orderStatusChannel =
          realtimeInstance!.channels.get('order_status_channel');
      realtimeInstance!.connection
          .on(ably.ConnectionEvent.connected)
          .listen((ably.ConnectionStateChange stateChange) async {});
    } catch (error) {
      rethrow;
    }
  }

  

  updateOrderStatus(String newStatus) {
    orderStatusChannel!
        .publish(name: "order_status", data: {"status": newStatus});
  }
}
