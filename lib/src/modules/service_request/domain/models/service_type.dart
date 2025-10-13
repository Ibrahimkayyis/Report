enum ServiceType {
  resetPassword,
  systemAccess,
  deviceRequest,
}

extension ServiceTypeExtension on ServiceType {
  String get title {
    switch (this) {
      case ServiceType.resetPassword:
        return 'Reset Password';
      case ServiceType.systemAccess:
        return 'Permohonan Akses Sistem';
      case ServiceType.deviceRequest:
        return 'Permintaan Perangkat';
    }
  }
}
