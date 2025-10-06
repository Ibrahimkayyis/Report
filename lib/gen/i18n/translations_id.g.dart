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

	/// id: 'Laporan Online'
	String get online_reporting_title => 'Laporan Online';

	/// id: 'Pilih OPD tujuan Anda'
	String get select_opd_subtitle => 'Pilih OPD tujuan Anda';

	/// id: 'Dinas Pendidikan'
	String get opd_dinas_pendidikan => 'Dinas Pendidikan';

	/// id: 'Dinas Perpustakaan dan Kearsipan'
	String get opd_dinas_perpustakaan => 'Dinas Perpustakaan dan Kearsipan';

	/// id: 'Dinas Kesehatan'
	String get opd_dinas_kesehatan => 'Dinas Kesehatan';

	/// id: 'Dinas Komunikasi dan Informatika'
	String get opd_dinas_komunikasi_informatika => 'Dinas Komunikasi dan Informatika';

	/// id: 'Dinas Perhubungan'
	String get opd_dinas_perhubungan => 'Dinas Perhubungan';

	/// id: 'Dinas Lingkungan Hidup'
	String get opd_dinas_lingkungan_hidup => 'Dinas Lingkungan Hidup';

	/// id: 'Dinas Sosial'
	String get opd_dinas_sosial => 'Dinas Sosial';

	/// id: 'Dinas Kependudukan dan Pencatatan Sipil'
	String get opd_dinas_kependudukan_pencatatan_sipil => 'Dinas Kependudukan dan Pencatatan Sipil';

	/// id: 'Dinas Sumber Daya Air dan Bina Marga'
	String get opd_dinas_sda_bina_marga => 'Dinas Sumber Daya Air dan Bina Marga';

	/// id: 'Dinas Koperasi, Usaha Kecil dan Menengah'
	String get opd_dinas_koperasi_ukm => 'Dinas Koperasi, Usaha Kecil dan Menengah';

	/// id: 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan'
	String get opd_dinas_perumahan_kawasan => 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan';

	/// id: 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu'
	String get opd_dinas_penanaman_modal => 'Dinas Penanaman Modal dan Pelayanan Terpadu Satu Pintu';

	/// id: 'Dinas Pemadam Kebakaran dan Penyelamatan'
	String get opd_dinas_pemadam_kebakaran => 'Dinas Pemadam Kebakaran dan Penyelamatan';

	/// id: 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata'
	String get opd_dinas_kebudayaan_pariwisata => 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata';

	/// id: 'Dinas Perindustrian dan Tenaga Kerja'
	String get opd_dinas_perindustrian_tenaga_kerja => 'Dinas Perindustrian dan Tenaga Kerja';

	/// id: 'Satuan Polisi Pamong Praja'
	String get opd_satpol_pp => 'Satuan Polisi Pamong Praja';

	/// id: 'Dinas Ketahanan Pangan dan Pertanian'
	String get opd_dinas_ketahanan_pangan => 'Dinas Ketahanan Pangan dan Pertanian';

	/// id: 'Dinas Pengendalian Penduduk, Pemberdayaan Perempuan dan Perlindungan Anak'
	String get opd_dinas_pengendalian_penduduk => 'Dinas Pengendalian Penduduk, Pemberdayaan Perempuan dan Perlindungan Anak';

	/// id: 'Kirim laporan ke'
	String get send_report_to => 'Kirim laporan ke';

	/// id: 'Nama'
	String get reporter_name => 'Nama';

	/// id: 'NIP'
	String get reporter_nip => 'NIP';

	/// id: 'Divisi'
	String get reporter_division => 'Divisi';

	/// id: 'Apa alasan Anda membuat laporan?'
	String get report_reason_question => 'Apa alasan Anda membuat laporan?';

	/// id: 'Pilih salah satu'
	String get select_one => 'Pilih salah satu';

	/// id: 'Perangkat Keras'
	String get report_category_hardware => 'Perangkat Keras';

	/// id: 'Perangkat Lunak & Aplikasi'
	String get report_category_software => 'Perangkat Lunak & Aplikasi';

	/// id: 'Jaringan & Konektivitas'
	String get report_category_network => 'Jaringan & Konektivitas';

	/// id: 'Email & Komunikasi'
	String get report_category_email => 'Email & Komunikasi';

	/// id: 'Keamanan'
	String get report_category_security => 'Keamanan';

	/// id: 'Permasalahan Lainnya'
	String get report_category_other => 'Permasalahan Lainnya';

	/// id: 'Bisakah Anda memberikan kejelasan terkait masalah ini?'
	String get problem_description_question => 'Bisakah Anda memberikan kejelasan terkait masalah ini?';

	/// id: 'Jelaskan lebih rinci terkait masalah tersebut agar kami dapat lebih memahami masalah ini!'
	String get problem_description_hint => 'Jelaskan lebih rinci terkait masalah tersebut agar kami dapat lebih memahami masalah ini!';

	/// id: 'Level prioritas laporan'
	String get priority_level_title => 'Level prioritas laporan';

	/// id: 'Pilih tingkat urgensi laporan Anda agar kami dapat memprioritaskan penanganan sesuai dampak masalah!'
	String get priority_level_subtitle => 'Pilih tingkat urgensi laporan Anda agar kami dapat memprioritaskan penanganan sesuai dampak masalah!';

	/// id: 'Tinggi'
	String get priority_high => 'Tinggi';

	/// id: 'Sedang'
	String get priority_medium => 'Sedang';

	/// id: 'Rendah'
	String get priority_low => 'Rendah';

	/// id: 'Tambahkan file'
	String get attach_file_title => 'Tambahkan file';

	/// id: 'Lampirkan screenshot, foto, atau dokumen terkait untuk membantu kami memahami masalah Anda lebih cepat!'
	String get attach_file_subtitle => 'Lampirkan screenshot, foto, atau dokumen terkait untuk membantu kami memahami masalah Anda lebih cepat!';

	/// id: 'Lampirkan File'
	String get attach_file_button => 'Lampirkan File';

	/// id: 'Informasi Tambahan'
	String get additional_info_title => 'Informasi Tambahan';

	/// id: 'Tambahkan detail tambahan yang mungkin membantu kami dalam memahami masalah atau permintaan Anda!'
	String get additional_info_subtitle => 'Tambahkan detail tambahan yang mungkin membantu kami dalam memahami masalah atau permintaan Anda!';

	/// id: 'Ketik disini...'
	String get additional_info_hint => 'Ketik disini...';

	/// id: 'Batalkan'
	String get cancel_button => 'Batalkan';

	/// id: 'Simpan Draft'
	String get save_draft_button => 'Simpan Draft';

	/// id: 'Kirim Laporan'
	String get submit_report_button => 'Kirim Laporan';

	/// id: 'Laporan Anda Telah Berhasil Dikirim'
	String get report_success_title => 'Laporan Anda Telah Berhasil Dikirim';

	/// id: 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.'
	String get report_success_description => 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';

	/// id: 'Cek laporan dengan ini:'
	String get check_report_with => 'Cek laporan dengan ini:';

	/// id: 'No. Tiket'
	String get ticket_number => 'No. Tiket';

	/// id: 'PIN'
	String get pin => 'PIN';

	/// id: 'Jenis Layanan:'
	String get service_type => 'Jenis Layanan:';

	/// id: 'Pelaporan Online'
	String get service_type_reporting => 'Pelaporan Online';

	/// id: 'OPD Tujuan:'
	String get destination_opd => 'OPD Tujuan:';

	/// id: 'Unduh tiket'
	String get download_ticket => 'Unduh tiket';

	/// id: 'Cek status layanan'
	String get check_service_status => 'Cek status layanan';

	/// id: 'Buat laporan baru'
	String get create_new_report => 'Buat laporan baru';

	/// id: 'Kembali ke beranda'
	String get back_to_home => 'Kembali ke beranda';

	/// id: 'Pengajuan Pelayanan'
	String get service_request_title => 'Pengajuan Pelayanan';

	/// id: 'Pilih permohonan yang Anda butuhkan'
	String get service_request_select_subtitle => 'Pilih permohonan yang Anda butuhkan';

	/// id: 'Reset Password'
	String get service_reset_password => 'Reset Password';

	/// id: 'Permintaan untuk mereset password akun Anda'
	String get service_reset_password_desc => 'Permintaan untuk mereset password akun Anda';

	/// id: 'Akses Sistem'
	String get service_system_access => 'Akses Sistem';

	/// id: 'Permintaan akses ke aplikasi atau sistem'
	String get service_system_access_desc => 'Permintaan akses ke aplikasi atau sistem';

	/// id: 'Permintaan Perangkat'
	String get service_device_request => 'Permintaan Perangkat';

	/// id: 'Permintaan peralatan atau perangkat kerja'
	String get service_device_request_desc => 'Permintaan peralatan atau perangkat kerja';

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
			case 'app.submit_report_button': return 'Kirim Laporan';
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
			case 'app.errors.invalid_credentials': return 'Email atau kata sandi salah';
			case 'app.errors.server_error': return 'Terjadi kesalahan server';
			case 'app.errors.network_error': return 'Jaringan bermasalah, periksa koneksi Anda';
			case 'app.errors.validation_error': return 'Kesalahan validasi';
			case 'app.errors.not_found': return 'Endpoint tidak ditemukan atau server sedang offline';
			default: return null;
		}
	}
}

