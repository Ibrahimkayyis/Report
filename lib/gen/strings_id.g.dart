///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
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
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppId app = _TranslationsAppId._(_root);
}

// Path: app
class _TranslationsAppId implements TranslationsAppEn {
	_TranslationsAppId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'REPORT';
	@override String get welcome => 'Selamat datang';
	@override String get login => 'Masuk';
	@override String get logout => 'Keluar';
	@override String get please_login_or_register => 'masuk atau daftar ';
	@override String get register => 'Daftar';
	@override String get email => 'Email';
	@override String get password => 'Kata sandi';
	@override String get phone => 'Nomor telepon';
	@override String get dont_have_account => 'Belum punya akun?';
	@override String get sign_up_here => 'Daftar di sini';
	@override String get forgot_password => 'Lupa kata sandi?';
	@override String get LOGIN_SUCCESS => 'Berhasil masuk';
	@override String get name => 'Nama';
	@override String get repeat_password => 'Ulangi kata sandi';
	@override String get create_account => 'Buat Akun';
	@override String get already_have_account => 'Sudah punya akun?';
	@override String get first_name => 'Nama depan';
	@override String get last_name => 'Nama belakang';
	@override String get required_field => 'Kolom ini wajib diisi';
	@override String get confirm_password => 'Konfirmasi kata sandi';
	@override String get password_requirements => 'Kata sandi harus terdiri dari minimal 8 karakter';
	@override String get show_password => 'Tampilkan kata sandi';
	@override String get use_email_to_continue => 'Gunakan email untuk melanjutkan';
	@override String get invalid_email => 'Alamat email tidak valid';
	@override String get passwords_do_not_match => 'Kata sandi tidak cocok';
	@override String get password_too_short => 'Kata sandi terlalu pendek';
	@override String get register_success => 'Pendaftaran berhasil, silakan masuk';
	@override String get go_to_login => 'Pergi ke halaman masuk';
	@override String get logged_out => 'Anda telah keluar';
	@override String get home => 'Beranda';
	@override String get logout_confirmation => 'Apakah Anda yakin ingin keluar?';
	@override String get logout_message => 'Anda harus masuk kembali untuk mengakses akun Anda.';
	@override String get cancel => 'Batal';
	@override String get confirm => 'Konfirmasi';
	@override String get qr_code => 'QR Code';
	@override String get profile => 'Profil';
	@override String get search_placeholder => 'Cari laporan, lokasi, atau kata kunci...';
	@override String get online_reporting => 'Lapor Online';
	@override String get online_reporting_subtitle => 'Lapor segera dan pantau statusnya';
	@override String get create_report => 'Buat Laporan';
	@override String get service_request => 'Permintaan Layanan';
	@override String get service_request_subtitle => 'Minta bantuan teknis atau layanan';
	@override String get create_request => 'Buat Permintaan';
	@override String get services => 'Layanan';
	@override String get knowledge_base => 'Basis Pengetahuan';
	@override String get check_report_status => 'Cek Status Laporan';
	@override String get report_history => 'Riwayat Laporan';
	@override String get no_report_history => 'Belum ada riwayat laporan.';
	@override late final _TranslationsAppErrorsId errors = _TranslationsAppErrorsId._(_root);
}

// Path: app.errors
class _TranslationsAppErrorsId implements TranslationsAppErrorsEn {
	_TranslationsAppErrorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get invalid_credentials => 'Email atau kata sandi salah';
	@override String get server_error => 'Terjadi kesalahan server';
	@override String get network_error => 'Jaringan bermasalah, periksa koneksi Anda';
	@override String get validation_error => 'Kesalahan validasi';
	@override String get not_found => 'Endpoint tidak ditemukan atau server sedang offline';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsId {
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
			case 'app.search_placeholder': return 'Cari laporan, lokasi, atau kata kunci...';
			case 'app.online_reporting': return 'Lapor Online';
			case 'app.online_reporting_subtitle': return 'Lapor segera dan pantau statusnya';
			case 'app.create_report': return 'Buat Laporan';
			case 'app.service_request': return 'Permintaan Layanan';
			case 'app.service_request_subtitle': return 'Minta bantuan teknis atau layanan';
			case 'app.create_request': return 'Buat Permintaan';
			case 'app.services': return 'Layanan';
			case 'app.knowledge_base': return 'Basis Pengetahuan';
			case 'app.check_report_status': return 'Cek Status Laporan';
			case 'app.report_history': return 'Riwayat Laporan';
			case 'app.no_report_history': return 'Belum ada riwayat laporan.';
			case 'app.errors.invalid_credentials': return 'Email atau kata sandi salah';
			case 'app.errors.server_error': return 'Terjadi kesalahan server';
			case 'app.errors.network_error': return 'Jaringan bermasalah, periksa koneksi Anda';
			case 'app.errors.validation_error': return 'Kesalahan validasi';
			case 'app.errors.not_found': return 'Endpoint tidak ditemukan atau server sedang offline';
			default: return null;
		}
	}
}

