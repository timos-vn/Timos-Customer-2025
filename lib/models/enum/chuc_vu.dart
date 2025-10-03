enum ChucVu {
  dieuHanhTrungChuyen(2, 'Điều hành trung chuyển'),
  dieuHanh(5, 'Điều hành'),
  adminLimousine(6, 'Admin Limousine'),
  laiXeLimousine(7, 'Lái xe Limousine'),
  quanLyTaiXeVangLai(15, 'Quản lý tài xế vãng lai');

  const ChucVu(this.value, this.displayName);
  
  final int value;
  final String displayName;
  
  static ChucVu? fromValue(int value) {
    for (ChucVu role in ChucVu.values) {
      if (role.value == value) {
        return role;
      }
    }
    return null;
  }
  
  bool get isManager => this == ChucVu.quanLyTaiXeVangLai;
  bool get isAdmin => this == ChucVu.quanLyTaiXeVangLai || this == ChucVu.adminLimousine;
  bool get isDriver => this == ChucVu.laiXeLimousine;
  bool get isDispatcher => this == ChucVu.dieuHanh || this == ChucVu.dieuHanhTrungChuyen;
}