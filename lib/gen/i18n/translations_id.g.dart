///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsId = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppId app = TranslationsAppId.internal(_root);
}

// Path: app
class TranslationsAppId {
	TranslationsAppId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'REPORT'
	String get title => 'REPORT';

	/// id: 'Selamat datang'
	String get welcome => 'Selamat datang';

	/// id: 'Masuk'
	String get login => 'Masuk';

	/// id: 'Keluar'
	String get logout => 'Keluar';

	/// id: 'masuk atau daftar '
	String get please_login_or_register => 'masuk atau daftar ';

	/// id: 'Daftar'
	String get register => 'Daftar';

	/// id: 'Email'
	String get email => 'Email';

	/// id: 'Kata sandi'
	String get password => 'Kata sandi';

	/// id: 'Nomor telepon'
	String get phone => 'Nomor telepon';

	/// id: 'Belum punya akun?'
	String get dont_have_account => 'Belum punya akun?';

	/// id: 'Daftar di sini'
	String get sign_up_here => 'Daftar di sini';

	/// id: 'Lupa kata sandi?'
	String get forgot_password => 'Lupa kata sandi?';

	/// id: 'Berhasil masuk'
	String get LOGIN_SUCCESS => 'Berhasil masuk';

	/// id: 'Nama'
	String get name => 'Nama';

	/// id: 'Ulangi kata sandi'
	String get repeat_password => 'Ulangi kata sandi';

	/// id: 'Buat Akun'
	String get create_account => 'Buat Akun';

	/// id: 'Sudah punya akun?'
	String get already_have_account => 'Sudah punya akun?';

	/// id: 'Nama depan'
	String get first_name => 'Nama depan';

	/// id: 'Nama belakang'
	String get last_name => 'Nama belakang';

	/// id: 'Kolom ini wajib diisi'
	String get required_field => 'Kolom ini wajib diisi';

	/// id: 'Konfirmasi kata sandi'
	String get confirm_password => 'Konfirmasi kata sandi';

	/// id: 'Kata sandi harus terdiri dari minimal 8 karakter'
	String get password_requirements => 'Kata sandi harus terdiri dari minimal 8 karakter';

	/// id: 'Tampilkan kata sandi'
	String get show_password => 'Tampilkan kata sandi';

	/// id: 'Gunakan email untuk melanjutkan'
	String get use_email_to_continue => 'Gunakan email untuk melanjutkan';

	/// id: 'Alamat email tidak valid'
	String get invalid_email => 'Alamat email tidak valid';

	/// id: 'Kata sandi tidak cocok'
	String get passwords_do_not_match => 'Kata sandi tidak cocok';

	/// id: 'Kata sandi terlalu pendek'
	String get password_too_short => 'Kata sandi terlalu pendek';

	/// id: 'Pendaftaran berhasil, silakan masuk'
	String get register_success => 'Pendaftaran berhasil, silakan masuk';

	/// id: 'Pergi ke halaman masuk'
	String get go_to_login => 'Pergi ke halaman masuk';

	/// id: 'Anda telah keluar'
	String get logged_out => 'Anda telah keluar';

	/// id: 'Beranda'
	String get home => 'Beranda';

	/// id: 'Apakah Anda yakin ingin keluar?'
	String get logout_confirmation => 'Apakah Anda yakin ingin keluar?';

	/// id: 'Anda harus masuk kembali untuk mengakses akun Anda.'
	String get logout_message => 'Anda harus masuk kembali untuk mengakses akun Anda.';

	/// id: 'Batal'
	String get cancel => 'Batal';

	/// id: 'Konfirmasi'
	String get confirm => 'Konfirmasi';

	/// id: 'QR Code'
	String get qr_code => 'QR Code';

	/// id: 'Profil'
	String get profile => 'Profil';

	/// id: 'Cari disini'
	String get search_placeholder => 'Cari disini';

	/// id: 'Lapor Online'
	String get online_reporting => 'Lapor Online';

	/// id: 'Laporkan persoalan dan permasalahan Anda disini!'
	String get online_reporting_subtitle => 'Laporkan persoalan dan permasalahan Anda disini!';

	/// id: 'Buat Laporan'
	String get create_report => 'Buat Laporan';

	/// id: 'Permintaan Layanan'
	String get service_request => 'Permintaan Layanan';

	/// id: 'Ajukan pelayanan yang Anda perlukan disini!'
	String get service_request_subtitle => 'Ajukan pelayanan yang Anda perlukan disini!';

	/// id: 'Buat Pengajuan'
	String get create_request => 'Buat Pengajuan';

	/// id: 'Layanan'
	String get services => 'Layanan';

	/// id: 'Knowledge Base'
	String get knowledge_base => 'Knowledge Base';

	/// id: 'Cek Status Laporan'
	String get check_report_status => 'Cek Status Laporan';

	/// id: 'Riwayat Laporan'
	String get report_history => 'Riwayat Laporan';

	/// id: 'Belum ada riwayat laporan.'
	String get no_report_history => 'Belum ada riwayat laporan.';

	/// id: 'Laporan'
	String get reports => 'Laporan';

	late final TranslationsAppErrorsId errors = TranslationsAppErrorsId.internal(_root);
}

// Path: app.errors
class TranslationsAppErrorsId {
	TranslationsAppErrorsId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Email atau kata sandi salah'
	String get invalid_credentials => 'Email atau kata sandi salah';

	/// id: 'Terjadi kesalahan server'
	String get server_error => 'Terjadi kesalahan server';

	/// id: 'Jaringan bermasalah, periksa koneksi Anda'
	String get network_error => 'Jaringan bermasalah, periksa koneksi Anda';

	/// id: 'Kesalahan validasi'
	String get validation_error => 'Kesalahan validasi';

	/// id: 'Endpoint tidak ditemukan atau server sedang offline'
	String get not_found => 'Endpoint tidak ditemukan atau server sedang offline';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'REPORT';
			case 'app.welcome': return 'Selamat datang';
			case 'app.login': return 'Masuk';
			case 'app.logout': return 'Keluar';
			case 'app.please_login_or_register': return 'masuk atau daftar ';
			case 'app.register': return 'Daftar';
			case 'app.email': return 'Email';
			case 'app.password': return 'Kata sandi';
			case 'app.phone': return 'Nomor telepon';
			case 'app.dont_have_account': return 'Belum punya akun?';
			case 'app.sign_up_here': return 'Daftar di sini';
			case 'app.forgot_password': return 'Lupa kata sandi?';
			case 'app.LOGIN_SUCCESS': return 'Berhasil masuk';
			case 'app.name': return 'Nama';
			case 'app.repeat_password': return 'Ulangi kata sandi';
			case 'app.create_account': return 'Buat Akun';
			case 'app.already_have_account': return 'Sudah punya akun?';
			case 'app.first_name': return 'Nama depan';
			case 'app.last_name': return 'Nama belakang';
			case 'app.required_field': return 'Kolom ini wajib diisi';
			case 'app.confirm_password': return 'Konfirmasi kata sandi';
			case 'app.password_requirements': return 'Kata sandi harus terdiri dari minimal 8 karakter';
			case 'app.show_password': return 'Tampilkan kata sandi';
			case 'app.use_email_to_continue': return 'Gunakan email untuk melanjutkan';
			case 'app.invalid_email': return 'Alamat email tidak valid';
			case 'app.passwords_do_not_match': return 'Kata sandi tidak cocok';
			case 'app.password_too_short': return 'Kata sandi terlalu pendek';
			case 'app.register_success': return 'Pendaftaran berhasil, silakan masuk';
			case 'app.go_to_login': return 'Pergi ke halaman masuk';
			case 'app.logged_out': return 'Anda telah keluar';
			case 'app.home': return 'Beranda';
			case 'app.logout_confirmation': return 'Apakah Anda yakin ingin keluar?';
			case 'app.logout_message': return 'Anda harus masuk kembali untuk mengakses akun Anda.';
			case 'app.cancel': return 'Batal';
			case 'app.confirm': return 'Konfirmasi';
			case 'app.qr_code': return 'QR Code';
			case 'app.profile': return 'Profil';
			case 'app.search_placeholder': return 'Cari disini';
			case 'app.online_reporting': return 'Lapor Online';
			case 'app.online_reporting_subtitle': return 'Laporkan persoalan dan permasalahan Anda disini!';
			case 'app.create_report': return 'Buat Laporan';
			case 'app.service_request': return 'Permintaan Layanan';
			case 'app.service_request_subtitle': return 'Ajukan pelayanan yang Anda perlukan disini!';
			case 'app.create_request': return 'Buat Pengajuan';
			case 'app.services': return 'Layanan';
			case 'app.knowledge_base': return 'Knowledge Base';
			case 'app.check_report_status': return 'Cek Status Laporan';
			case 'app.report_history': return 'Riwayat Laporan';
			case 'app.no_report_history': return 'Belum ada riwayat laporan.';
			case 'app.reports': return 'Laporan';
			case 'app.errors.invalid_credentials': return 'Email atau kata sandi salah';
			case 'app.errors.server_error': return 'Terjadi kesalahan server';
			case 'app.errors.network_error': return 'Jaringan bermasalah, periksa koneksi Anda';
			case 'app.errors.validation_error': return 'Kesalahan validasi';
			case 'app.errors.not_found': return 'Endpoint tidak ditemukan atau server sedang offline';
			default: return null;
		}
	}
}

