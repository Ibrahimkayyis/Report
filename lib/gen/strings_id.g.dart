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
	@override String get knowledge_base_title => 'Knowledge Base';
	@override String get knowledge_base_subtitle => 'Pelajari dan cari solusi yang Anda butuhkan';
	@override String get search_here => 'Cari di sini';
	@override String get faq_how_to_create_ticket => 'Bagaimana cara membuat tiket baru?';
	@override String get faq_how_to_check_ticket_status => 'Bagaimana cara mengecek status tiket saya?';
	@override String get faq_guide_contact_support => 'Bagaimana panduan untuk menghubungi support langsung?';
	@override String get faq_guide_reset_password => 'Bagaimana panduan untuk reset password?';
	@override String get faq_how_long_ticket_processing => 'Berapa lama tiket biasanya ditangani?';
	@override String get faq_what_to_do_no_response => 'Apa yang harus dilakukan jika tiket belum mendapat respon?';
	@override String get check_report_status_title => 'Pelacakan Laporan';
	@override String get check_report_status_subtitle => 'Lacak status laporan Anda';
	@override String get report_id_label => 'ID Laporan';
	@override String get report_id_hint => 'Masukkan ID laporan Anda';
	@override String get pin_label => 'PIN';
	@override String get pin_hint => 'Masukkan PIN Anda';
	@override String get search_button => 'Cari';
	@override String get error_empty_fields => 'Harap isi semua kolom terlebih dahulu';
	@override String get searching_report_status => 'Mencari status laporan...';
	@override String get service_request_success_title => 'Permohonan Anda Telah Berhasil Dikirim';
	@override String get service_request_success_description => 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';
	@override String get service_type_request => 'Pengajuan layanan';
	@override String get request_type => 'Jenis Permohonan';
	@override String get downloading_ticket => 'Mengunduh tiket...';
	@override String get create_new_request => 'Buat pengajuan baru';
	@override String get edit_profile => 'Edit Profil';
	@override String get change_password => 'Ubah Kata Sandi';
	@override String get language => 'Bahasa';
	@override String get theme => 'Tema';
	@override String get faq => 'FAQ';
	@override String get about_us => 'Tentang Kami';
	@override String get helpdesk_title => 'Helpdesk';
	@override String get helpdesk_intro_text => 'Kami akan mengalihkan Anda ke helpdesk OPD yang ingin Anda hubungi';
	@override String get select_opd => 'Pilih OPD';
	@override String get helpdesk_empty_chat => 'Mulai percakapan dengan Helpdesk...';
	@override String get write_message => 'Tulis pesan';
	@override String get report_found_title => 'Laporan Ditemukan';
	@override String get your_report_label => 'Laporan Anda: ';
	@override String get ticket_label => 'ID Tiket: ';
	@override String get status_label => 'Status: ';
	@override String get service_type_label => 'Jenis Layanan: ';
	@override String get destination_opd_label => 'OPD Tujuan: ';
	@override String get back_button => 'Kembali';
	@override String get my_profile => 'Profil Saya';
	@override String get employee => 'Pegawai';
	@override String get personal_info => 'Info Pribadi';
	@override String get work_info => 'Info Pekerjaan';
	@override String get edit => 'Ubah';
	@override String get birth_date => 'Tanggal Lahir';
	@override String get phone_number => 'Nomor Telepon';
	@override String get address => 'Alamat';
	@override String get employee_id => 'Nomor Induk Pegawai';
	@override String get hire_date => 'Tanggal Penerimaan';
	@override String get position => 'Jabatan';
	@override String get division => 'Divisi';
	@override String get theme_settings_title => 'Tampilan';
	@override String get theme_preference => 'Preferensi';
	@override String get theme_preference_subtitle => 'Pilih preferensi tampilan Anda';
	@override String get system => 'Sistem';
	@override String get light => 'Terang';
	@override String get dark => 'Gelap';
	@override String get font_size => 'Ukuran Font';
	@override String get font_size_subtitle => 'Pilih ukuran font yang Anda inginkan';
	@override String get save => 'Simpan';
	@override late final _TranslationsAppErrorsId errors = _TranslationsAppErrorsId._(_root);
	@override late final _TranslationsAppDialogId dialog = _TranslationsAppDialogId._(_root);
	@override late final _TranslationsAppNotificationsId notifications = _TranslationsAppNotificationsId._(_root);
	@override late final _TranslationsAppReportActivityId report_activity = _TranslationsAppReportActivityId._(_root);
	@override late final _TranslationsAppQrId qr = _TranslationsAppQrId._(_root);
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

// Path: app.dialog
class _TranslationsAppDialogId implements TranslationsAppDialogEn {
	_TranslationsAppDialogId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get confirm_submit_title => 'Apakah Anda yakin ingin mengirim?';
	@override String get confirm_submit_message => 'Cek kembali inputan Anda sebelum mengirim!';
	@override String get confirm_yes => 'Ya, saya yakin!';
	@override String get cancel => 'Batalkan';
	@override String get data_not_found_title => 'Data tidak ditemukan!';
	@override String get data_not_found_message => 'Cek kembali inputan Anda';
	@override String get ok => 'Oke';
}

// Path: app.notifications
class _TranslationsAppNotificationsId implements TranslationsAppNotificationsEn {
	_TranslationsAppNotificationsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifikasi';
	@override String get search_placeholder => 'Cari notifikasi...';
	@override String get mark_all_as_read => 'Tandai semua dibaca';
	@override String get filter => 'Filter';
	@override String get type => 'Jenis';
	@override String get analytics => 'Analitik';
	@override String get new_ticket_assigned => 'Tiket Baru Ditugaskan';
	@override String get new_message => 'Pesan Baru';
	@override String get team_update => 'Pembaruan Tim';
	@override String get ticket_status_update => 'Status Tiket Diperbarui';
	@override String get new_ticket_created => 'Tiket Baru Dibuat';
	@override String get time_ago => '{time} yang lalu';
	@override String get filter_all => 'Semua';
	@override String get filter_read => 'Sudah Dibaca';
	@override String get filter_unread => 'Belum Dibaca';
	@override String get type_all => 'Semua Jenis';
	@override String get type_ticket => 'Tiket';
	@override String get type_message => 'Pesan';
	@override String get type_update => 'Pembaruan';
}

// Path: app.report_activity
class _TranslationsAppReportActivityId implements TranslationsAppReportActivityEn {
	_TranslationsAppReportActivityId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Riwayat Aktivitas';
	@override String get search_placeholder => 'Cari laporan...';
	@override String get filter => 'Status';
	@override String get filter_all => 'Semua';
	@override String get filter_open => 'Dibuka';
	@override String get filter_in_progress => 'Sedang diproses';
	@override String get filter_resolved => 'Selesai';
	@override String get filter_closed => 'Ditutup';
	@override String get type => 'Jenis';
	@override String get type_incident => 'Insiden';
	@override String get type_service_request => 'Permintaan Layanan';
	@override String get no_reports => 'Belum ada laporan.';
}

// Path: app.qr
class _TranslationsAppQrId implements TranslationsAppQrEn {
	_TranslationsAppQrId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pemindai Kode QR';
	@override String get instruction => 'Arahkan kode QR ke dalam bingkai untuk memindai otomatis.';
	@override String get flash => 'Lampu';
	@override String get switch_camera => 'Kamera';
	@override String get result_label => 'Hasil';
	@override String get go_to_link => 'Buka Tautan';
	@override String get view_full_text => 'Lihat Teks Lengkap';
	@override String get scan_again => 'Pindai Lagi';
	@override String get asset_detail_title => 'Detail Aset';
	@override String get qr_preview_label => 'Pratinjau QR Code';
	@override String get asset_id => 'ID Aset';
	@override String get asset_name => 'Nama Aset';
	@override String get asset_location => 'Lokasi Aset';
	@override String get asset_status => 'Status Aset';
	@override String get asset_type => 'Jenis Aset';
	@override String get create_report_based_on_asset => 'Buat Laporan Berdasarkan Aset Ini';
	@override String get invalid_qr_message => 'Data QR tidak valid. Silakan pindai kode aset yang benar.';
	@override String get processing => 'Memproses data aset...';
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
			case 'app.knowledge_base_title': return 'Knowledge Base';
			case 'app.knowledge_base_subtitle': return 'Pelajari dan cari solusi yang Anda butuhkan';
			case 'app.search_here': return 'Cari di sini';
			case 'app.faq_how_to_create_ticket': return 'Bagaimana cara membuat tiket baru?';
			case 'app.faq_how_to_check_ticket_status': return 'Bagaimana cara mengecek status tiket saya?';
			case 'app.faq_guide_contact_support': return 'Bagaimana panduan untuk menghubungi support langsung?';
			case 'app.faq_guide_reset_password': return 'Bagaimana panduan untuk reset password?';
			case 'app.faq_how_long_ticket_processing': return 'Berapa lama tiket biasanya ditangani?';
			case 'app.faq_what_to_do_no_response': return 'Apa yang harus dilakukan jika tiket belum mendapat respon?';
			case 'app.check_report_status_title': return 'Pelacakan Laporan';
			case 'app.check_report_status_subtitle': return 'Lacak status laporan Anda';
			case 'app.report_id_label': return 'ID Laporan';
			case 'app.report_id_hint': return 'Masukkan ID laporan Anda';
			case 'app.pin_label': return 'PIN';
			case 'app.pin_hint': return 'Masukkan PIN Anda';
			case 'app.search_button': return 'Cari';
			case 'app.error_empty_fields': return 'Harap isi semua kolom terlebih dahulu';
			case 'app.searching_report_status': return 'Mencari status laporan...';
			case 'app.service_request_success_title': return 'Permohonan Anda Telah Berhasil Dikirim';
			case 'app.service_request_success_description': return 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';
			case 'app.service_type_request': return 'Pengajuan layanan';
			case 'app.request_type': return 'Jenis Permohonan';
			case 'app.downloading_ticket': return 'Mengunduh tiket...';
			case 'app.create_new_request': return 'Buat pengajuan baru';
			case 'app.edit_profile': return 'Edit Profil';
			case 'app.change_password': return 'Ubah Kata Sandi';
			case 'app.language': return 'Bahasa';
			case 'app.theme': return 'Tema';
			case 'app.faq': return 'FAQ';
			case 'app.about_us': return 'Tentang Kami';
			case 'app.helpdesk_title': return 'Helpdesk';
			case 'app.helpdesk_intro_text': return 'Kami akan mengalihkan Anda ke helpdesk OPD yang ingin Anda hubungi';
			case 'app.select_opd': return 'Pilih OPD';
			case 'app.helpdesk_empty_chat': return 'Mulai percakapan dengan Helpdesk...';
			case 'app.write_message': return 'Tulis pesan';
			case 'app.report_found_title': return 'Laporan Ditemukan';
			case 'app.your_report_label': return 'Laporan Anda: ';
			case 'app.ticket_label': return 'ID Tiket: ';
			case 'app.status_label': return 'Status: ';
			case 'app.service_type_label': return 'Jenis Layanan: ';
			case 'app.destination_opd_label': return 'OPD Tujuan: ';
			case 'app.back_button': return 'Kembali';
			case 'app.my_profile': return 'Profil Saya';
			case 'app.employee': return 'Pegawai';
			case 'app.personal_info': return 'Info Pribadi';
			case 'app.work_info': return 'Info Pekerjaan';
			case 'app.edit': return 'Ubah';
			case 'app.birth_date': return 'Tanggal Lahir';
			case 'app.phone_number': return 'Nomor Telepon';
			case 'app.address': return 'Alamat';
			case 'app.employee_id': return 'Nomor Induk Pegawai';
			case 'app.hire_date': return 'Tanggal Penerimaan';
			case 'app.position': return 'Jabatan';
			case 'app.division': return 'Divisi';
			case 'app.theme_settings_title': return 'Tampilan';
			case 'app.theme_preference': return 'Preferensi';
			case 'app.theme_preference_subtitle': return 'Pilih preferensi tampilan Anda';
			case 'app.system': return 'Sistem';
			case 'app.light': return 'Terang';
			case 'app.dark': return 'Gelap';
			case 'app.font_size': return 'Ukuran Font';
			case 'app.font_size_subtitle': return 'Pilih ukuran font yang Anda inginkan';
			case 'app.save': return 'Simpan';
			case 'app.errors.invalid_credentials': return 'Email atau kata sandi salah';
			case 'app.errors.server_error': return 'Terjadi kesalahan server';
			case 'app.errors.network_error': return 'Jaringan bermasalah, periksa koneksi Anda';
			case 'app.errors.validation_error': return 'Kesalahan validasi';
			case 'app.errors.not_found': return 'Endpoint tidak ditemukan atau server sedang offline';
			case 'app.dialog.confirm_submit_title': return 'Apakah Anda yakin ingin mengirim?';
			case 'app.dialog.confirm_submit_message': return 'Cek kembali inputan Anda sebelum mengirim!';
			case 'app.dialog.confirm_yes': return 'Ya, saya yakin!';
			case 'app.dialog.cancel': return 'Batalkan';
			case 'app.dialog.data_not_found_title': return 'Data tidak ditemukan!';
			case 'app.dialog.data_not_found_message': return 'Cek kembali inputan Anda';
			case 'app.dialog.ok': return 'Oke';
			case 'app.notifications.title': return 'Notifikasi';
			case 'app.notifications.search_placeholder': return 'Cari notifikasi...';
			case 'app.notifications.mark_all_as_read': return 'Tandai semua dibaca';
			case 'app.notifications.filter': return 'Filter';
			case 'app.notifications.type': return 'Jenis';
			case 'app.notifications.analytics': return 'Analitik';
			case 'app.notifications.new_ticket_assigned': return 'Tiket Baru Ditugaskan';
			case 'app.notifications.new_message': return 'Pesan Baru';
			case 'app.notifications.team_update': return 'Pembaruan Tim';
			case 'app.notifications.ticket_status_update': return 'Status Tiket Diperbarui';
			case 'app.notifications.new_ticket_created': return 'Tiket Baru Dibuat';
			case 'app.notifications.time_ago': return '{time} yang lalu';
			case 'app.notifications.filter_all': return 'Semua';
			case 'app.notifications.filter_read': return 'Sudah Dibaca';
			case 'app.notifications.filter_unread': return 'Belum Dibaca';
			case 'app.notifications.type_all': return 'Semua Jenis';
			case 'app.notifications.type_ticket': return 'Tiket';
			case 'app.notifications.type_message': return 'Pesan';
			case 'app.notifications.type_update': return 'Pembaruan';
			case 'app.report_activity.title': return 'Riwayat Aktivitas';
			case 'app.report_activity.search_placeholder': return 'Cari laporan...';
			case 'app.report_activity.filter': return 'Status';
			case 'app.report_activity.filter_all': return 'Semua';
			case 'app.report_activity.filter_open': return 'Dibuka';
			case 'app.report_activity.filter_in_progress': return 'Sedang diproses';
			case 'app.report_activity.filter_resolved': return 'Selesai';
			case 'app.report_activity.filter_closed': return 'Ditutup';
			case 'app.report_activity.type': return 'Jenis';
			case 'app.report_activity.type_incident': return 'Insiden';
			case 'app.report_activity.type_service_request': return 'Permintaan Layanan';
			case 'app.report_activity.no_reports': return 'Belum ada laporan.';
			case 'app.qr.title': return 'Pemindai Kode QR';
			case 'app.qr.instruction': return 'Arahkan kode QR ke dalam bingkai untuk memindai otomatis.';
			case 'app.qr.flash': return 'Lampu';
			case 'app.qr.switch_camera': return 'Kamera';
			case 'app.qr.result_label': return 'Hasil';
			case 'app.qr.go_to_link': return 'Buka Tautan';
			case 'app.qr.view_full_text': return 'Lihat Teks Lengkap';
			case 'app.qr.scan_again': return 'Pindai Lagi';
			case 'app.qr.asset_detail_title': return 'Detail Aset';
			case 'app.qr.qr_preview_label': return 'Pratinjau QR Code';
			case 'app.qr.asset_id': return 'ID Aset';
			case 'app.qr.asset_name': return 'Nama Aset';
			case 'app.qr.asset_location': return 'Lokasi Aset';
			case 'app.qr.asset_status': return 'Status Aset';
			case 'app.qr.asset_type': return 'Jenis Aset';
			case 'app.qr.create_report_based_on_asset': return 'Buat Laporan Berdasarkan Aset Ini';
			case 'app.qr.invalid_qr_message': return 'Data QR tidak valid. Silakan pindai kode aset yang benar.';
			case 'app.qr.processing': return 'Memproses data aset...';
			default: return null;
		}
	}
}

