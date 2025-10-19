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
	@override String get search_placeholder => 'Cari disini';
	@override String get online_reporting => 'Lapor Online';
	@override String get online_reporting_subtitle => 'Laporkan persoalan dan permasalahan Anda disini!';
	@override String get create_report => 'Buat Laporan';
	@override String get service_request => 'Permintaan Layanan';
	@override String get service_request_subtitle => 'Ajukan pelayanan yang Anda perlukan disini!';
	@override String get create_request => 'Buat Pengajuan';
	@override String get services => 'Layanan';
	@override String get knowledge_base => 'Knowledge Base';
	@override String get check_report_status => 'Cek Status Laporan';
	@override String get report_history => 'Riwayat Laporan';
	@override String get no_report_history => 'Belum ada riwayat laporan.';
	@override String get reports => 'Laporan';
	@override String get online_reporting_title => 'Laporan Online';
	@override String get select_opd_subtitle => 'Pilih OPD tujuan Anda';
	@override String get opd_dinas_pendidikan => 'Dinas Pendidikan';
	@override String get opd_dinas_perpustakaan => 'Dinas Perpustakaan dan Kearsipan';
	@override String get opd_dinas_kesehatan => 'Dinas Kesehatan';
	@override String get opd_dinas_komunikasi_informatika => 'Dinas Komunikasi dan Informatika';
	@override String get opd_dinas_perhubungan => 'Dinas Perhubungan';
	@override String get opd_dinas_lingkungan_hidup => 'Dinas Lingkungan Hidup';
	@override String get opd_dinas_sosial => 'Dinas Sosial';
	@override String get opd_dinas_kependudukan_pencatatan_sipil => 'Dinas Kependudukan dan Pencatatan Sipil';
	@override String get opd_dinas_sda_bina_marga => 'Dinas Sumber Daya Air dan Bina Marga';
	@override String get opd_dinas_koperasi_ukm => 'Dinas Koperasi, Usaha Kecil dan Menengah';
	@override String get opd_dinas_perumahan_kawasan => 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan';
	@override String get opd_dinas_penanaman_modal => 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu';
	@override String get opd_dinas_pemadam_kebakaran => 'Dinas Pemadam Kebakaran dan Penyelamatan';
	@override String get opd_dinas_kebudayaan_pariwisata => 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata';
	@override String get opd_dinas_perindustrian_tenaga_kerja => 'Dinas Perindustrian dan Tenaga Kerja';
	@override String get opd_satpol_pp => 'Satuan Polisi Pamong Praja';
	@override String get opd_dinas_ketahanan_pangan => 'Dinas Ketahanan Pangan dan Pertanian';
	@override String get opd_dinas_pengendalian_penduduk => 'Dinas Pengendalian Penduduk, Pemberdayaan Perempuan dan Perlindungan Anak';
	@override String get send_report_to => 'Kirim laporan ke';
	@override String get reporter_name => 'Nama';
	@override String get reporter_nip => 'NIP';
	@override String get reporter_division => 'Divisi';
	@override String get report_reason_question => 'Apa alasan Anda membuat laporan?';
	@override String get select_one => 'Pilih salah satu';
	@override String get report_category_hardware => 'Perangkat Keras';
	@override String get report_category_software => 'Perangkat Lunak & Aplikasi';
	@override String get report_category_network => 'Jaringan & Konektivitas';
	@override String get report_category_email => 'Email & Komunikasi';
	@override String get report_category_security => 'Keamanan';
	@override String get report_category_other => 'Permasalahan Lainnya';
	@override String get problem_description_question => 'Bisakah Anda memberikan kejelasan terkait masalah ini?';
	@override String get problem_description_hint => 'Jelaskan lebih rinci terkait masalah tersebut agar kami dapat lebih memahami masalah ini!';
	@override String get priority_level_title => 'Level prioritas laporan';
	@override String get priority_level_subtitle => 'Pilih tingkat urgensi laporan Anda agar kami dapat memprioritaskan penanganan sesuai dampak masalah!';
	@override String get priority_high => 'Tinggi';
	@override String get priority_medium => 'Sedang';
	@override String get priority_low => 'Rendah';
	@override String get attach_file_title => 'Tambahkan file';
	@override String get attach_file_subtitle => 'Lampirkan screenshot, foto, atau dokumen terkait untuk membantu kami memahami masalah Anda lebih cepat!';
	@override String get attach_file_button => 'Lampirkan File';
	@override String get additional_info_title => 'Informasi Tambahan';
	@override String get additional_info_subtitle => 'Tambahkan detail tambahan yang mungkin membantu kami dalam memahami masalah atau permintaan Anda!';
	@override String get additional_info_hint => 'Ketik disini...';
	@override String get cancel_button => 'Batalkan';
	@override String get save_draft_button => 'Simpan Draft';
	@override String get submit_report_button => 'Kirim';
	@override String get report_success_title => 'Laporan Anda Telah Berhasil Dikirim';
	@override String get report_success_description => 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';
	@override String get check_report_with => 'Cek laporan dengan ini:';
	@override String get ticket_number => 'No. Tiket';
	@override String get pin => 'PIN';
	@override String get service_type => 'Jenis Layanan:';
	@override String get service_type_reporting => 'Pelaporan Online';
	@override String get destination_opd => 'OPD Tujuan:';
	@override String get download_ticket => 'Unduh tiket';
	@override String get check_service_status => 'Cek status layanan';
	@override String get create_new_report => 'Buat laporan baru';
	@override String get back_to_home => 'Kembali ke beranda';
	@override String get service_request_title => 'Pengajuan Pelayanan';
	@override String get service_request_select_subtitle => 'Pilih permohonan yang Anda butuhkan';
	@override String get service_reset_password => 'Reset Password';
	@override String get service_reset_password_desc => 'Permintaan untuk mereset password akun Anda';
	@override String get service_system_access => 'Akses Sistem';
	@override String get service_system_access_desc => 'Permintaan akses ke aplikasi atau sistem';
	@override String get service_device_request => 'Permintaan Perangkat';
	@override String get service_device_request_desc => 'Permintaan peralatan atau perangkat kerja';
	@override String get asset_data_title => 'Data Aset';
	@override String get select_device_label => 'Pilih Perangkat';
	@override String get select_system_label => 'Pilih Sistem';
	@override String get select_access_type_label => 'Pilih Jenis Akses';
	@override String get select_device_type_label => 'Pilih Jenis Perangkat';
	@override String get device_count_label => 'Jumlah Perangkat';
	@override String get device_count_hint => 'Masukkan jumlah';
	@override String get asset_id_label => 'ID Aset';
	@override String get asset_name_label => 'Nama Aset';
	@override String get asset_location_label => 'Lokasi Aset';
	@override String get service_reset_password_title => 'Permintaan Reset Password';
	@override String get service_system_access_title => 'Permintaan Akses Sistem';
	@override String get service_device_request_title => 'Permintaan Perangkat Baru';
	@override String get service_reset_password_problem_label => 'Apa alasan Anda melakukan reset password ?';
	@override String get service_reset_password_problem_hint => 'Jelaskan dengan rinci terkait masalah tersebut agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
	@override String get service_system_access_problem_label => 'Apa alasan Anda mengajukan permohonan akses?';
	@override String get service_system_access_problem_hint => 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
	@override String get service_device_request_problem_label => 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';
	@override String get service_device_request_problem_hint => 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
	@override String get service_reset_password_priority_label => 'Prioritas Permintaan';
	@override String get service_system_access_priority_label => 'Prioritas Akses';
	@override String get service_device_request_priority_label => 'Prioritas Permintaan';
	@override String get attach_file_label => 'Lampiran File';
	@override String get additional_info_label => 'Informasi Tambahan';
	@override String get activity => 'Aktivitas';
	@override String get notification => 'Notifikasi';
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
			case 'app.online_reporting_title': return 'Laporan Online';
			case 'app.select_opd_subtitle': return 'Pilih OPD tujuan Anda';
			case 'app.opd_dinas_pendidikan': return 'Dinas Pendidikan';
			case 'app.opd_dinas_perpustakaan': return 'Dinas Perpustakaan dan Kearsipan';
			case 'app.opd_dinas_kesehatan': return 'Dinas Kesehatan';
			case 'app.opd_dinas_komunikasi_informatika': return 'Dinas Komunikasi dan Informatika';
			case 'app.opd_dinas_perhubungan': return 'Dinas Perhubungan';
			case 'app.opd_dinas_lingkungan_hidup': return 'Dinas Lingkungan Hidup';
			case 'app.opd_dinas_sosial': return 'Dinas Sosial';
			case 'app.opd_dinas_kependudukan_pencatatan_sipil': return 'Dinas Kependudukan dan Pencatatan Sipil';
			case 'app.opd_dinas_sda_bina_marga': return 'Dinas Sumber Daya Air dan Bina Marga';
			case 'app.opd_dinas_koperasi_ukm': return 'Dinas Koperasi, Usaha Kecil dan Menengah';
			case 'app.opd_dinas_perumahan_kawasan': return 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan';
			case 'app.opd_dinas_penanaman_modal': return 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu';
			case 'app.opd_dinas_pemadam_kebakaran': return 'Dinas Pemadam Kebakaran dan Penyelamatan';
			case 'app.opd_dinas_kebudayaan_pariwisata': return 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata';
			case 'app.opd_dinas_perindustrian_tenaga_kerja': return 'Dinas Perindustrian dan Tenaga Kerja';
			case 'app.opd_satpol_pp': return 'Satuan Polisi Pamong Praja';
			case 'app.opd_dinas_ketahanan_pangan': return 'Dinas Ketahanan Pangan dan Pertanian';
			case 'app.opd_dinas_pengendalian_penduduk': return 'Dinas Pengendalian Penduduk, Pemberdayaan Perempuan dan Perlindungan Anak';
			case 'app.send_report_to': return 'Kirim laporan ke';
			case 'app.reporter_name': return 'Nama';
			case 'app.reporter_nip': return 'NIP';
			case 'app.reporter_division': return 'Divisi';
			case 'app.report_reason_question': return 'Apa alasan Anda membuat laporan?';
			case 'app.select_one': return 'Pilih salah satu';
			case 'app.report_category_hardware': return 'Perangkat Keras';
			case 'app.report_category_software': return 'Perangkat Lunak & Aplikasi';
			case 'app.report_category_network': return 'Jaringan & Konektivitas';
			case 'app.report_category_email': return 'Email & Komunikasi';
			case 'app.report_category_security': return 'Keamanan';
			case 'app.report_category_other': return 'Permasalahan Lainnya';
			case 'app.problem_description_question': return 'Bisakah Anda memberikan kejelasan terkait masalah ini?';
			case 'app.problem_description_hint': return 'Jelaskan lebih rinci terkait masalah tersebut agar kami dapat lebih memahami masalah ini!';
			case 'app.priority_level_title': return 'Level prioritas laporan';
			case 'app.priority_level_subtitle': return 'Pilih tingkat urgensi laporan Anda agar kami dapat memprioritaskan penanganan sesuai dampak masalah!';
			case 'app.priority_high': return 'Tinggi';
			case 'app.priority_medium': return 'Sedang';
			case 'app.priority_low': return 'Rendah';
			case 'app.attach_file_title': return 'Tambahkan file';
			case 'app.attach_file_subtitle': return 'Lampirkan screenshot, foto, atau dokumen terkait untuk membantu kami memahami masalah Anda lebih cepat!';
			case 'app.attach_file_button': return 'Lampirkan File';
			case 'app.additional_info_title': return 'Informasi Tambahan';
			case 'app.additional_info_subtitle': return 'Tambahkan detail tambahan yang mungkin membantu kami dalam memahami masalah atau permintaan Anda!';
			case 'app.additional_info_hint': return 'Ketik disini...';
			case 'app.cancel_button': return 'Batalkan';
			case 'app.save_draft_button': return 'Simpan Draft';
			case 'app.submit_report_button': return 'Kirim';
			case 'app.report_success_title': return 'Laporan Anda Telah Berhasil Dikirim';
			case 'app.report_success_description': return 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';
			case 'app.check_report_with': return 'Cek laporan dengan ini:';
			case 'app.ticket_number': return 'No. Tiket';
			case 'app.pin': return 'PIN';
			case 'app.service_type': return 'Jenis Layanan:';
			case 'app.service_type_reporting': return 'Pelaporan Online';
			case 'app.destination_opd': return 'OPD Tujuan:';
			case 'app.download_ticket': return 'Unduh tiket';
			case 'app.check_service_status': return 'Cek status layanan';
			case 'app.create_new_report': return 'Buat laporan baru';
			case 'app.back_to_home': return 'Kembali ke beranda';
			case 'app.service_request_title': return 'Pengajuan Pelayanan';
			case 'app.service_request_select_subtitle': return 'Pilih permohonan yang Anda butuhkan';
			case 'app.service_reset_password': return 'Reset Password';
			case 'app.service_reset_password_desc': return 'Permintaan untuk mereset password akun Anda';
			case 'app.service_system_access': return 'Akses Sistem';
			case 'app.service_system_access_desc': return 'Permintaan akses ke aplikasi atau sistem';
			case 'app.service_device_request': return 'Permintaan Perangkat';
			case 'app.service_device_request_desc': return 'Permintaan peralatan atau perangkat kerja';
			case 'app.asset_data_title': return 'Data Aset';
			case 'app.select_device_label': return 'Pilih Perangkat';
			case 'app.select_system_label': return 'Pilih Sistem';
			case 'app.select_access_type_label': return 'Pilih Jenis Akses';
			case 'app.select_device_type_label': return 'Pilih Jenis Perangkat';
			case 'app.device_count_label': return 'Jumlah Perangkat';
			case 'app.device_count_hint': return 'Masukkan jumlah';
			case 'app.asset_id_label': return 'ID Aset';
			case 'app.asset_name_label': return 'Nama Aset';
			case 'app.asset_location_label': return 'Lokasi Aset';
			case 'app.service_reset_password_title': return 'Permintaan Reset Password';
			case 'app.service_system_access_title': return 'Permintaan Akses Sistem';
			case 'app.service_device_request_title': return 'Permintaan Perangkat Baru';
			case 'app.service_reset_password_problem_label': return 'Apa alasan Anda melakukan reset password ?';
			case 'app.service_reset_password_problem_hint': return 'Jelaskan dengan rinci terkait masalah tersebut agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
			case 'app.service_system_access_problem_label': return 'Apa alasan Anda mengajukan permohonan akses?';
			case 'app.service_system_access_problem_hint': return 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
			case 'app.service_device_request_problem_label': return 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';
			case 'app.service_device_request_problem_hint': return 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';
			case 'app.service_reset_password_priority_label': return 'Prioritas Permintaan';
			case 'app.service_system_access_priority_label': return 'Prioritas Akses';
			case 'app.service_device_request_priority_label': return 'Prioritas Permintaan';
			case 'app.attach_file_label': return 'Lampiran File';
			case 'app.additional_info_label': return 'Informasi Tambahan';
			case 'app.activity': return 'Aktivitas';
			case 'app.notification': return 'Notifikasi';
			case 'app.errors.invalid_credentials': return 'Email atau kata sandi salah';
			case 'app.errors.server_error': return 'Terjadi kesalahan server';
			case 'app.errors.network_error': return 'Jaringan bermasalah, periksa koneksi Anda';
			case 'app.errors.validation_error': return 'Kesalahan validasi';
			case 'app.errors.not_found': return 'Endpoint tidak ditemukan atau server sedang offline';
			default: return null;
		}
	}
}

