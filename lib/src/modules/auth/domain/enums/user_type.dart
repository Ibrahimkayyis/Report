/// Enum untuk menentukan tipe user yang sedang login.
/// Digunakan untuk memilih endpoint API yang sesuai.
enum UserType {
  masyarakat, // Menggunakan API Service Desk
  employee    // Menggunakan API Trace App (Pegawai & Teknisi)
}