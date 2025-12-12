import 'dart:async';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:timos_customer_2025/const/const.dart';

class SignalRService {
  static final SignalRService _instance = SignalRService._internal();
  late HubConnection _hubConnection;

  // Biến Instance
  String? currentConnectionId;
  String? _currentTripIdLichXe; // Lưu ID nhóm hiện tại để tự động join lại
  final box = GetStorage();

  // Stream Controller để thông báo sự kiện đến UI/Controller khác
  final StreamController<Map<String, dynamic>> _seatsSelectedController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get onSeatsSelected => _seatsSelectedController.stream;

  factory SignalRService() => _instance;

  SignalRService._internal() {
    log("🧩 Khởi tạo SignalRService");
    _createHubConnection();
  }

  // Phương thức Khởi tạo HubConnection
  Future<void> _createHubConnection() async {
    log("🔗 Tạo kết nối SignalR với URL: ${Const.urlWebSocket}");

    _hubConnection = HubConnectionBuilder()
        .withUrl(Const.urlWebSocket,
      options: HttpConnectionOptions(
        transport: HttpTransportType.WebSockets,

        // QUAN TRỌNG: Đảm bảo đọc token MỚI NHẤT cho mỗi lần kết nối/reconnect
        accessTokenFactory: () async {
          final accessToken = box.read(Const.ACCESS_TOKEN);
          return accessToken ?? '';
        },
        skipNegotiation: true,
      ),
    )
        .withAutomaticReconnect()
        .build();

    // ------------------------------------
    // Xử lý trạng thái kết nối
    // ------------------------------------

    // 🔄 Khi đang reconnect
    _hubConnection.onreconnecting(({Exception? error}) {
      log("🔄 SignalR đang reconnecting: $error");
    });

    // ✅ Khi đã reconnect thành công
    _hubConnection.onreconnected(({String? connectionId}) {
      log("✅ SignalR reconnected với connectionId: $connectionId");

      // 1. Cập nhật ID
      currentConnectionId = connectionId;

      // 2. Đăng ký lại Listener
      _registerEventHandlers();

      // 3. THAM GIA LẠI NHÓM NẾU ĐANG THEO DÕI
      if (_currentTripIdLichXe != null) {
        log("🔄 Rejoining group: $_currentTripIdLichXe");
        _joinTripGroup(_currentTripIdLichXe!);
      }
    });

    // ❌ Khi bị ngắt kết nối hoàn toàn
    _hubConnection.onclose(({Exception? error}) {
      log("❌ SignalR bị ngắt kết nối: $error");
    });
  }

  // ------------------------------------
  // Quản lý Kết nối
  // ------------------------------------

  /// Bắt đầu kết nối SignalR
  Future<void> startConnection() async {
    try {
      if (_hubConnection.state == HubConnectionState.Connected) {
        log("⚡ SignalR đã kết nối.");
      } else {
        await _hubConnection.start();
        log("✅ SignalR Connected!");
        currentConnectionId = _hubConnection.connectionId;
      }

      // Đăng ký/Đăng ký lại sự kiện sau khi chắc chắn kết nối được thiết lập
      _registerEventHandlers();

      // Auto Join Group nếu có thông tin chuyến đi đã lưu
      if (_currentTripIdLichXe != null) {
        log("🔄 Auto-joining group sau khi Start: $_currentTripIdLichXe");
        await _joinTripGroup(_currentTripIdLichXe!);
      }

    } catch (e) {
      log("🚨 Lỗi khi kết nối SignalR: $e");
    }
  }

  /// Ngắt kết nối
  Future<void> stopConnection() async {
    try {
      if (_hubConnection.state != HubConnectionState.Disconnected) {
        await _hubConnection.stop();
        log("🛑 SignalR Disconnected");
        // Đóng stream khi service không còn cần thiết (tùy thuộc vào lifecycle app)
        // await _seatsSelectedController.close();
      } else {
        log("🔌 SignalR đã ở trạng thái Disconnected.");
      }
    } catch (e) {
      log("🚨 Lỗi khi ngắt kết nối SignalR: $e");
    }
  }

  /// Kiểm tra trạng thái kết nối
  bool isConnected() {
    return _hubConnection.state == HubConnectionState.Connected;
  }

  // ------------------------------------
  // Xử lý Sự kiện Listener
  // ------------------------------------

  /// Đăng ký các sự kiện từ server
  void _registerEventHandlers() {
    log("📡 Đăng ký các sự kiện SignalR...");

    // 🛑 QUAN TRỌNG: Gỡ bỏ listeners cũ để tránh nhân bản (Duplicate)
    _hubConnection.off('SeatsSelected');
    _hubConnection.off('SeatsDeselected');

    // Khi người khác chọn ghế
    _hubConnection.on('SeatsSelected', (args) {
      log("Đang nhận sự kiện SeatsSelected với args: $args");

      if (args != null && args.isNotEmpty) {
        final data = args[0] as Map<String, dynamic>?;

        final connectionId = data?['ConnectionId'] ?? data?['connectionId'] ?? '';

        if (connectionId.isNotEmpty && connectionId != currentConnectionId) {
          log("SeatsSelected from another agent: $connectionId");
          // Gửi dữ liệu qua Stream để các Controller/Widget lắng nghe
          if (data != null) {
            _seatsSelectedController.add(data);
          }
        } else {
          log("SeatsSelected from self, ignoring");
        }
      }
    });

    // Khi người khác bỏ chọn ghế
    _hubConnection.on('SeatsDeselected', (args) {
      if (args != null && args.isNotEmpty) {
        final data = args[0];
        log("🪑 SeatsDeselected event: $data");
        // TODO: Xử lý hoặc đưa qua Stream nếu cần
      }
    });
  }

  // ------------------------------------
  // Quản lý Group (Nhóm)
  // ------------------------------------

  /// Phương thức nội bộ để gửi lệnh JoinTripGroup
  Future<void> _joinTripGroup(String idLichXeStr) async {
    if (_hubConnection.state != HubConnectionState.Connected) {
      log('🚫 Không thể JoinTripGroup vì SignalR chưa kết nối.');
      return;
    }

    try {
      await _hubConnection.invoke('JoinTripGroup', args: [idLichXeStr]);

      log('✅ [JoinTripGroup] Successfully joined group: $idLichXeStr');
    } catch (error) {
      log('❌ [JoinTripGroup] Failed to join group $idLichXeStr: $error');
    }
  }

  /// PUBLIC: Tham gia nhóm theo dõi ghế
  Future<void> joinSeatTracking({
    required String idLichXe,
  }) async {
    if (_hubConnection.state != HubConnectionState.Connected) {
      log('⚠️ SignalR chưa kết nối. Cố gắng khởi tạo kết nối...');
      await startConnection();
    }

    if (_hubConnection.state != HubConnectionState.Connected) {
      log('🚫 Không thể JoinTripGroup vì SignalR không thể kết nối.');
      return;
    }

    // Lưu ID hiện tại và gọi Join
    _currentTripIdLichXe = idLichXe;
    await _joinTripGroup(idLichXe);
  }

  /// PUBLIC: Gửi dữ liệu lên server
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

  /// Khởi động lại kết nối (Tái tạo HubConnection hoàn toàn)
  Future<void> restartConnection() async {
    try {
      log("🔁 Restarting SignalR...");
      if (_hubConnection.state != HubConnectionState.Disconnected) {
        await _hubConnection.stop();
      }

      // Tái tạo HubConnection mới
      await _createHubConnection();
      await startConnection();
      log("✅ SignalR restarted thành công.");
    } catch (e) {
      log("🚨 Lỗi khi restart SignalR: $e");
    }
  }
}
