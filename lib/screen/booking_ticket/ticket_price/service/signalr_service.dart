import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:timos_customer_2025/const/const.dart';

class SignalRService {
  static final SignalRService _instance = SignalRService._internal();
  late HubConnection _hubConnection;

  factory SignalRService() => _instance;
  final box = GetStorage();

  SignalRService._internal() {
    log("🧩 Khởi tạo SignalRService");
    _createHubConnection();
  }

  Future<void> _createHubConnection() async {
    log("🔗 Tạo kết nối SignalR với URL: ${Const.urlWebSocket}");
    final accessToken = box.read(Const.ACCESS_TOKEN);
    print("Các token khi kết nối SignalR: $accessToken");


    _hubConnection = HubConnectionBuilder()
        .withUrl(Const.urlWebSocket,
      options: HttpConnectionOptions(
        transport: HttpTransportType.WebSockets,
        accessTokenFactory: () async => "${accessToken ?? ''}",
        skipNegotiation: true, // quan trọng
      ),
    )
        .withAutomaticReconnect()
        // .configureLogging(Logger()) // mức log cao nhất
        .build();

    // 🔄 Khi đang reconnect
    _hubConnection.onreconnecting(({Exception? error}) {
      log("🔄 SignalR đang reconnecting: $error");
    });

    // ✅ Khi đã reconnect thành công
    _hubConnection.onreconnected(({String? connectionId}) {
      log("✅ SignalR reconnected với connectionId: $connectionId");
    });

    // ❌ Khi bị ngắt kết nối hoàn toàn
    _hubConnection.onclose(({Exception? error}) {
      log("❌ SignalR bị ngắt kết nối: $error");
    });

  }


  /// Bắt đầu kết nối SignalR
  Future<void> startConnection() async {
    try {
      if (_hubConnection.state == HubConnectionState.Connected) {
        log("⚡ SignalR đã kết nối.");
        return;
      }

      await _hubConnection.start();
      log("✅ SignalR Connected!");
      _registerEventHandlers();
    } catch (e) {
      log("🚨 Lỗi khi kết nối SignalR: $e");
    }
  }

  /// Đăng ký các sự kiện từ server
  void _registerEventHandlers() {
    log("📡 Đăng ký các sự kiện SignalR...");

    // Khi người khác chọn ghế
    _hubConnection.on('SeatsSelected', (args) {
      if (args != null && args.isNotEmpty) {
        final data = args[0];
        log("🪑 SeatsSelected event: $data");
        // TODO: xử lý dữ liệu nếu cần
      }
    });

    // Khi người khác bỏ chọn ghế
    _hubConnection.on('SeatsDeselected', (args) {
      if (args != null && args.isNotEmpty) {
        final data = args[0];
        log("🪑 SeatsDeselected event: $data");
      }
    });

    // Danh sách ghế hiện tại
    _hubConnection.on('CurrentSeatSelections', (args) {
      if (args != null && args.isNotEmpty) {
        final seats = args[0];
        log("📋 CurrentSeatSelections event: $seats");
      }
    });

    // Thông báo lỗi
    _hubConnection.on('Error', (args) {
      if (args != null && args.isNotEmpty) {
        final error = args[0];
        log("⚠️ Lỗi SignalR: $error");
      }
    });
  }

  /// Lắng nghe sự kiện động theo key (ví dụ ticket updates)
  void listenTicketUpdates(Function(String) onTicketClaimed, {required String key}) {
    _hubConnection.on(key, (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        String ticketId = arguments[0] as String;
        log("🎟️ Nhận event $key: $ticketId");
        onTicketClaimed(ticketId);
      }
    });
  }

  /// Gửi dữ liệu lên server
  Future<void> send(String method, {List<Object>? args}) async {
    try {
      if (isConnected()) {
        await _hubConnection.invoke(method, args: args ?? []);
        log("📤 Đã gửi method '$method' với args: $args");
      } else {
        log("🚫 Không thể gửi '$method' vì SignalR chưa kết nối.");
      }
    } catch (e) {
      log("❗ Lỗi khi gửi dữ liệu SignalR: $e");
    }
  }

  /// Ngắt kết nối
  Future<void> stopConnection() async {
    try {
      if (_hubConnection.state != HubConnectionState.Disconnected) {
        await _hubConnection.stop();
        log("🛑 SignalR Disconnected");
      } else {
        log("🔌 SignalR đã ở trạng thái Disconnected.");
      }
    } catch (e) {
      log("🚨 Lỗi khi ngắt kết nối SignalR: $e");
    }
  }

  /// Khởi động lại kết nối
  Future<void> restartConnection() async {
    try {
      log("🔁 Restarting SignalR...");
      if (_hubConnection.state != HubConnectionState.Disconnected) {
        await _hubConnection.stop();
      }

      _createHubConnection();
      await startConnection();
      log("✅ SignalR restarted thành công.");
    } catch (e) {
      log("🚨 Lỗi khi restart SignalR: $e");
    }
  }

  /// Kiểm tra trạng thái kết nối
  bool isConnected() {
    log("🔍 Trạng thái kết nối hiện tại: ${_hubConnection.state}");
    return _hubConnection.state == HubConnectionState.Connected;
  }
}
