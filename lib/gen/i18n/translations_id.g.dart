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
	late final TranslationsWidgetsId widgets = TranslationsWidgetsId.internal(_root);
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

	/// id: 'Kirim'
	String get submit_report_button => 'Kirim';

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

	/// id: 'Data Aset'
	String get asset_data_title => 'Data Aset';

	/// id: 'Pilih Perangkat'
	String get select_device_label => 'Pilih Perangkat';

	/// id: 'Pilih Sistem'
	String get select_system_label => 'Pilih Sistem';

	/// id: 'Pilih Jenis Akses'
	String get select_access_type_label => 'Pilih Jenis Akses';

	/// id: 'Pilih Jenis Perangkat'
	String get select_device_type_label => 'Pilih Jenis Perangkat';

	/// id: 'Jumlah Perangkat'
	String get device_count_label => 'Jumlah Perangkat';

	/// id: 'Masukkan jumlah'
	String get device_count_hint => 'Masukkan jumlah';

	/// id: 'ID Aset'
	String get asset_id_label => 'ID Aset';

	/// id: 'Nama Aset'
	String get asset_name_label => 'Nama Aset';

	/// id: 'Lokasi Aset'
	String get asset_location_label => 'Lokasi Aset';

	/// id: 'Permintaan Reset Password'
	String get service_reset_password_title => 'Permintaan Reset Password';

	/// id: 'Permintaan Akses Sistem'
	String get service_system_access_title => 'Permintaan Akses Sistem';

	/// id: 'Permintaan Perangkat Baru'
	String get service_device_request_title => 'Permintaan Perangkat Baru';

	/// id: 'Apa alasan Anda melakukan reset password ?'
	String get service_reset_password_problem_label => 'Apa alasan Anda melakukan reset password ?';

	/// id: 'Jelaskan dengan rinci terkait masalah tersebut agar kami dapat menindaklanjuti sesuai prosedur keamanan!'
	String get service_reset_password_problem_hint => 'Jelaskan dengan rinci terkait masalah tersebut agar kami dapat menindaklanjuti sesuai prosedur keamanan!';

	/// id: 'Apa alasan Anda mengajukan permohonan akses?'
	String get service_system_access_problem_label => 'Apa alasan Anda mengajukan permohonan akses?';

	/// id: 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!'
	String get service_system_access_problem_hint => 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';

	/// id: 'Apa alasan Anda mengajukan permohonan permintaan perangkat?'
	String get service_device_request_problem_label => 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';

	/// id: 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!'
	String get service_device_request_problem_hint => 'Jelaskan dengan rinci terkait hal ini agar kami dapat menindaklanjuti sesuai prosedur keamanan!';

	/// id: 'Prioritas Permintaan'
	String get service_reset_password_priority_label => 'Prioritas Permintaan';

	/// id: 'Prioritas Akses'
	String get service_system_access_priority_label => 'Prioritas Akses';

	/// id: 'Prioritas Permintaan'
	String get service_device_request_priority_label => 'Prioritas Permintaan';

	/// id: 'Lampiran File'
	String get attach_file_label => 'Lampiran File';

	/// id: 'Informasi Tambahan'
	String get additional_info_label => 'Informasi Tambahan';

	/// id: 'Aktivitas'
	String get activity => 'Aktivitas';

	/// id: 'Notifikasi'
	String get notification => 'Notifikasi';

	/// id: 'Knowledge Base'
	String get knowledge_base_title => 'Knowledge Base';

	/// id: 'Pelajari dan cari solusi yang Anda butuhkan'
	String get knowledge_base_subtitle => 'Pelajari dan cari solusi yang Anda butuhkan';

	/// id: 'Cari di sini'
	String get search_here => 'Cari di sini';

	/// id: 'Bagaimana cara membuat tiket baru?'
	String get faq_how_to_create_ticket => 'Bagaimana cara membuat tiket baru?';

	/// id: 'Bagaimana cara mengecek status tiket saya?'
	String get faq_how_to_check_ticket_status => 'Bagaimana cara mengecek status tiket saya?';

	/// id: 'Bagaimana panduan untuk menghubungi support langsung?'
	String get faq_guide_contact_support => 'Bagaimana panduan untuk menghubungi support langsung?';

	/// id: 'Bagaimana panduan untuk reset password?'
	String get faq_guide_reset_password => 'Bagaimana panduan untuk reset password?';

	/// id: 'Berapa lama tiket biasanya ditangani?'
	String get faq_how_long_ticket_processing => 'Berapa lama tiket biasanya ditangani?';

	/// id: 'Apa yang harus dilakukan jika tiket belum mendapat respon?'
	String get faq_what_to_do_no_response => 'Apa yang harus dilakukan jika tiket belum mendapat respon?';

	/// id: 'Pelacakan Laporan'
	String get check_report_status_title => 'Pelacakan Laporan';

	/// id: 'Lacak status laporan Anda'
	String get check_report_status_subtitle => 'Lacak status laporan Anda';

	/// id: 'ID Laporan'
	String get report_id_label => 'ID Laporan';

	/// id: 'Masukkan ID laporan Anda'
	String get report_id_hint => 'Masukkan ID laporan Anda';

	/// id: 'PIN'
	String get pin_label => 'PIN';

	/// id: 'Masukkan PIN Anda'
	String get pin_hint => 'Masukkan PIN Anda';

	/// id: 'Cari'
	String get search_button => 'Cari';

	/// id: 'Harap isi semua kolom terlebih dahulu'
	String get error_empty_fields => 'Harap isi semua kolom terlebih dahulu';

	/// id: 'Mencari status laporan...'
	String get searching_report_status => 'Mencari status laporan...';

	/// id: 'Permohonan Anda Telah Berhasil Dikirim'
	String get service_request_success_title => 'Permohonan Anda Telah Berhasil Dikirim';

	/// id: 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.'
	String get service_request_success_description => 'Terima kasih atas laporan Anda. Laporan telah tercatat, kami akan menindaklanjuti sesuai prosedur dalam waktu yang ditentukan. Silakan pantau perkembangan laporan melalui menu Cek Status Layanan.';

	/// id: 'Pengajuan layanan'
	String get service_type_request => 'Pengajuan layanan';

	/// id: 'Jenis Permohonan'
	String get request_type => 'Jenis Permohonan';

	/// id: 'Mengunduh tiket...'
	String get downloading_ticket => 'Mengunduh tiket...';

	/// id: 'Buat pengajuan baru'
	String get create_new_request => 'Buat pengajuan baru';

	/// id: 'Edit Profil'
	String get edit_profile => 'Edit Profil';

	/// id: 'Ubah Kata Sandi'
	String get change_password => 'Ubah Kata Sandi';

	/// id: 'Bahasa'
	String get language => 'Bahasa';

	/// id: 'Tema'
	String get theme => 'Tema';

	/// id: 'FAQ'
	String get faq => 'FAQ';

	/// id: 'Tentang Kami'
	String get about_us => 'Tentang Kami';

	/// id: 'Helpdesk'
	String get helpdesk_title => 'Helpdesk';

	/// id: 'Kami akan mengalihkan Anda ke helpdesk OPD yang ingin Anda hubungi'
	String get helpdesk_intro_text => 'Kami akan mengalihkan Anda ke helpdesk OPD yang ingin Anda hubungi';

	/// id: 'Pilih OPD'
	String get select_opd => 'Pilih OPD';

	/// id: 'Mulai percakapan dengan Helpdesk...'
	String get helpdesk_empty_chat => 'Mulai percakapan dengan Helpdesk...';

	/// id: 'Tulis pesan'
	String get write_message => 'Tulis pesan';

	/// id: 'Laporan Ditemukan'
	String get report_found_title => 'Laporan Ditemukan';

	/// id: 'Laporan Anda: '
	String get your_report_label => 'Laporan Anda: ';

	/// id: 'ID Tiket: '
	String get ticket_label => 'ID Tiket: ';

	/// id: 'Status: '
	String get status_label => 'Status: ';

	/// id: 'Jenis Layanan: '
	String get service_type_label => 'Jenis Layanan: ';

	/// id: 'OPD Tujuan: '
	String get destination_opd_label => 'OPD Tujuan: ';

	/// id: 'Kembali'
	String get back_button => 'Kembali';

	/// id: 'Profil Saya'
	String get my_profile => 'Profil Saya';

	/// id: 'Pegawai'
	String get employee => 'Pegawai';

	/// id: 'Info Pribadi'
	String get personal_info => 'Info Pribadi';

	/// id: 'Info Pekerjaan'
	String get work_info => 'Info Pekerjaan';

	/// id: 'Ubah'
	String get edit => 'Ubah';

	/// id: 'Tanggal Lahir'
	String get birth_date => 'Tanggal Lahir';

	/// id: 'Nomor Telepon'
	String get phone_number => 'Nomor Telepon';

	/// id: 'Alamat'
	String get address => 'Alamat';

	/// id: 'Nomor Induk Pegawai'
	String get employee_id => 'Nomor Induk Pegawai';

	/// id: 'Tanggal Penerimaan'
	String get hire_date => 'Tanggal Penerimaan';

	/// id: 'Jabatan'
	String get position => 'Jabatan';

	/// id: 'Divisi'
	String get division => 'Divisi';

	/// id: 'Tampilan'
	String get theme_settings_title => 'Tampilan';

	/// id: 'Preferensi'
	String get theme_preference => 'Preferensi';

	/// id: 'Pilih preferensi tampilan Anda'
	String get theme_preference_subtitle => 'Pilih preferensi tampilan Anda';

	/// id: 'Sistem'
	String get system => 'Sistem';

	/// id: 'Terang'
	String get light => 'Terang';

	/// id: 'Gelap'
	String get dark => 'Gelap';

	/// id: 'Ukuran Font'
	String get font_size => 'Ukuran Font';

	/// id: 'Pilih ukuran font yang Anda inginkan'
	String get font_size_subtitle => 'Pilih ukuran font yang Anda inginkan';

	/// id: 'Simpan'
	String get save => 'Simpan';

	/// id: 'Konfirmasi Keluar'
	String get confirm_logout_title => 'Konfirmasi Keluar';

	/// id: 'Apakah Anda yakin ingin keluar dari akun ini?'
	String get confirm_logout_message => 'Apakah Anda yakin ingin keluar dari akun ini?';

	/// id: 'Tidak Ada Data Yang Tersedia'
	String get no_data_available => 'Tidak Ada Data Yang Tersedia';

	/// id: 'Unggah lampiran sebagai bukti'
	String get upload_dialog_title => 'Unggah lampiran sebagai bukti';

	/// id: 'Kirim dalam format pdf'
	String get upload_dialog_subtitle => 'Kirim dalam format pdf';

	/// id: 'Pilih file atau Pindahkan kesini'
	String get upload_dialog_choose_file => 'Pilih file atau Pindahkan kesini';

	/// id: 'Format file pdf, ukuran maksimal 1 MB'
	String get upload_dialog_file_format => 'Format file pdf, ukuran maksimal 1 MB';

	/// id: 'tunggu'
	String get upload_dialog_status_waiting => 'tunggu';

	/// id: 'selesai'
	String get upload_dialog_status_complete => 'selesai';

	/// id: 'Batalkan'
	String get upload_dialog_cancel => 'Batalkan';

	/// id: 'Unggah'
	String get upload_dialog_upload => 'Unggah';

	/// id: 'Pengguna Tidak Dikenal'
	String get unknown_user => 'Pengguna Tidak Dikenal';

	/// id: 'Edit Profil'
	String get edit_profile_title => 'Edit Profil';

	/// id: 'Konfirmasi'
	String get confirmation_title => 'Konfirmasi';

	/// id: 'Apakah Anda yakin ingin menyimpan perubahan?'
	String get confirmation_save_changes => 'Apakah Anda yakin ingin menyimpan perubahan?';

	/// id: 'Nomor telepon tidak boleh kosong'
	String get validation_phone_required => 'Nomor telepon tidak boleh kosong';

	/// id: 'Format nomor telepon tidak valid'
	String get validation_phone_format => 'Format nomor telepon tidak valid';

	/// id: 'tidak boleh kosong'
	String get validation_required => 'tidak boleh kosong';

	/// id: 'Profil berhasil diperbarui'
	String get profile_updated_success => 'Profil berhasil diperbarui';

	/// id: 'Kesalahan'
	String get error => 'Kesalahan';

	/// id: 'Berhasil'
	String get success => 'Berhasil';

	/// id: 'Galeri'
	String get gallery => 'Galeri';

	/// id: 'Kamera'
	String get camera => 'Kamera';

	/// id: 'Draft berhasil disimpan'
	String get draft_saved => 'Draft berhasil disimpan';

	/// id: 'Mengirim laporan...'
	String get sending_report => 'Mengirim laporan...';

	/// id: 'OK'
	String get ok => 'OK';

	/// id: 'Status'
	String get status => 'Status';

	/// id: 'Detail Tiket'
	String get ticket_detail => 'Detail Tiket';

	/// id: 'Halaman detail tiket (placeholder)'
	String get ticket_detail_placeholder => 'Halaman detail tiket (placeholder)';

	/// id: 'Detail Tiket'
	String get ticket_detail_title => 'Detail Tiket';

	/// id: 'Pengirim'
	String get ticket_sender => 'Pengirim';

	/// id: 'ID Laporan'
	String get ticket_report_id => 'ID Laporan';

	/// id: 'Prioritas'
	String get ticket_priority => 'Prioritas';

	/// id: 'Perbarui Status'
	String get ticket_update_status => 'Perbarui Status';

	/// id: 'Judul Pelaporan'
	String get ticket_report_title => 'Judul Pelaporan';

	/// id: 'Kategori Aset'
	String get ticket_asset_category => 'Kategori Aset';

	/// id: 'Jenis Aset'
	String get ticket_asset_type => 'Jenis Aset';

	/// id: 'Bentuk Aset'
	String get ticket_asset_form => 'Bentuk Aset';

	/// id: 'Data Aset'
	String get ticket_asset_data => 'Data Aset';

	/// id: 'Lokasi Kejadian'
	String get ticket_incident_location => 'Lokasi Kejadian';

	/// id: 'Tanggal Mulai'
	String get ticket_start_date => 'Tanggal Mulai';

	/// id: 'Tanggal Selesai'
	String get ticket_end_date => 'Tanggal Selesai';

	/// id: 'Rincian Masalah'
	String get ticket_problem_detail => 'Rincian Masalah';

	/// id: 'Lampiran File'
	String get ticket_attachments => 'Lampiran File';

	/// id: 'Penyelesaian yang Diharapkan'
	String get ticket_expected_solution => 'Penyelesaian yang Diharapkan';

	/// id: 'Draft'
	String get status_draft => 'Draft';

	/// id: 'Diproses'
	String get status_in_progress => 'Diproses';

	/// id: 'Selesai'
	String get status_completed => 'Selesai';

	/// id: 'Batal'
	String get button_cancel => 'Batal';

	/// id: 'Simpan Draft'
	String get button_save_draft => 'Simpan Draft';

	/// id: 'Perbarui'
	String get button_update => 'Perbarui';

	/// id: 'Draft berhasil disimpan'
	String get message_draft_saved => 'Draft berhasil disimpan';

	/// id: 'Status berhasil diperbarui'
	String get message_status_updated => 'Status berhasil diperbarui';

	/// id: 'Judul Pelaporan'
	String get report_title_label => 'Judul Pelaporan';

	/// id: 'Ketik disini'
	String get report_title_hint => 'Ketik disini';

	/// id: 'Kategori Pelaporan'
	String get category_label => 'Kategori Pelaporan';

	/// id: 'Kategori Layanan'
	String get category_label_service => 'Kategori Layanan';

	/// id: 'Jenis Aset'
	String get asset_type_label => 'Jenis Aset';

	/// id: 'Bentuk Aset'
	String get asset_form_label => 'Bentuk Aset';

	/// id: 'Data Aset'
	String get asset_data_label => 'Data Aset';

	/// id: 'Lokasi Kejadian'
	String get location_label => 'Lokasi Kejadian';

	/// id: 'Ketik disini'
	String get location_hint => 'Ketik disini';

	/// id: 'Penyelesaian yang Diharapkan'
	String get expected_solution_label => 'Penyelesaian yang Diharapkan';

	/// id: 'Ketik disini...'
	String get expected_solution_hint => 'Ketik disini...';

	/// id: 'Rincian Permintaan'
	String get problem_label => 'Rincian Permintaan';

	/// id: 'Jelaskan secara singkat masalah atau kebutuhan Anda...'
	String get problem_hint => 'Jelaskan secara singkat masalah atau kebutuhan Anda...';

	/// id: 'Cari nama OPD...'
	String get search_opd_hint => 'Cari nama OPD...';

	/// id: 'Data Aset'
	String get data_asset_label => 'Data Aset';

	/// id: 'Nomor Seri'
	String get serial_number_label => 'Nomor Seri';

	/// id: 'Kategori Aset'
	String get asset_category_label => 'Kategori Aset';

	/// id: 'Sub-Kategori Aset'
	String get asset_subcategory_label => 'Sub-Kategori Aset';

	/// id: 'Pilih data aset'
	String get data_asset_hint => 'Pilih data aset';

	/// id: 'Pilih nomor seri aset'
	String get serial_number_hint => 'Pilih nomor seri aset';

	/// id: ''
	String get asset_category_hint => '';

	/// id: ''
	String get asset_subcategory_hint => '';

	/// id: ''
	String get asset_type_hint => '';

	/// id: 'Judul Pengajuan'
	String get request_title_label => 'Judul Pengajuan';

	/// id: 'Ketik disini'
	String get request_title_hint => 'Ketik disini';

	/// id: 'Lokasi Pelayanan'
	String get service_location_label => 'Lokasi Pelayanan';

	/// id: 'Ketik disini'
	String get service_location_hint => 'Ketik disini';

	/// id: 'Rincian Pengajuan Pelayanan'
	String get service_description_label => 'Rincian Pengajuan Pelayanan';

	/// id: 'Jelaskan lebih rinci terkait alasan pengajuan tersebut agar kami dapat lebih memahami pengajuan ini!'
	String get service_description_hint => 'Jelaskan lebih rinci terkait alasan pengajuan tersebut agar kami dapat lebih memahami pengajuan ini!';

	/// id: 'Foto profil berhasil diperbarui'
	String get photo_updated_success => 'Foto profil berhasil diperbarui';

	/// id: 'Gagal memperbarui foto profil'
	String get photo_updated_failed => 'Gagal memperbarui foto profil';

	/// id: 'Gagal!'
	String get failed => 'Gagal!';

	/// id: 'Lupa Password?'
	String get forgot_password_title => 'Lupa Password?';

	/// id: 'Tenang saja! Masukkan alamat Email yang terhubung, kami akan mengirimkan intruksi untuk reset password'
	String get forgot_password_subtitle => 'Tenang saja! Masukkan alamat Email yang terhubung, kami akan mengirimkan intruksi untuk reset password';

	/// id: 'Alamat email'
	String get email_address => 'Alamat email';

	/// id: 'Kirim'
	String get send_button => 'Kirim';

	/// id: 'Cek Emailmu'
	String get verify_otp_title => 'Cek Emailmu';

	/// id: 'Kami telah mengirimkan 4 digit kode ke '
	String get verify_otp_subtitle_prefix => 'Kami telah mengirimkan 4 digit kode ke ';

	/// id: 'Tidak menerima Kode? '
	String get otp_not_received => 'Tidak menerima Kode? ';

	/// id: 'Kirim ulang'
	String get resend_otp => 'Kirim ulang';

	/// id: 'Verifikasi'
	String get verify_button => 'Verifikasi';

	/// id: 'Kode OTP telah dikirim ulang'
	String get otp_resent => 'Kode OTP telah dikirim ulang';

	/// id: 'Perbarui Kata Sandi'
	String get reset_password_title => 'Perbarui Kata Sandi';

	/// id: 'Kata sandi baru'
	String get new_password_label => 'Kata sandi baru';

	/// id: 'Kata sandi konfirmasi'
	String get confirm_password_label => 'Kata sandi konfirmasi';

	/// id: 'Perbarui Kata Sandi'
	String get reset_password_button => 'Perbarui Kata Sandi';

	/// id: 'Kata sandi tidak cocok'
	String get password_mismatch => 'Kata sandi tidak cocok';

	/// id: 'Kata sandi berhasil diperbarui!'
	String get password_reset_success_title => 'Kata sandi berhasil diperbarui!';

	/// id: 'Silakan login dengan kata sandi baru Anda'
	String get password_reset_success_message => 'Silakan login dengan kata sandi baru Anda';

	late final TranslationsAppValidationId validation = TranslationsAppValidationId.internal(_root);
	late final TranslationsAppErrorsId errors = TranslationsAppErrorsId.internal(_root);
	late final TranslationsAppDialogId dialog = TranslationsAppDialogId.internal(_root);
	late final TranslationsAppNotificationsId notifications = TranslationsAppNotificationsId.internal(_root);
	late final TranslationsAppReportActivityId report_activity = TranslationsAppReportActivityId.internal(_root);
	late final TranslationsAppQrId qr = TranslationsAppQrId.internal(_root);
	late final TranslationsAppDashboardId dashboard = TranslationsAppDashboardId.internal(_root);
	late final TranslationsAppRfcId rfc = TranslationsAppRfcId.internal(_root);
	late final TranslationsAppRatingId rating = TranslationsAppRatingId.internal(_root);
	late final TranslationsAppRatingDetailId rating_detail = TranslationsAppRatingDetailId.internal(_root);
	late final TranslationsAppOnboardingId onboarding = TranslationsAppOnboardingId.internal(_root);
	late final TranslationsAppMasyarakatId masyarakat = TranslationsAppMasyarakatId.internal(_root);
}

// Path: widgets
class TranslationsWidgetsId {
	TranslationsWidgetsId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsWidgetsErrorId error = TranslationsWidgetsErrorId.internal(_root);
	late final TranslationsWidgetsEmptyId empty = TranslationsWidgetsEmptyId.internal(_root);
}

// Path: app.validation
class TranslationsAppValidationId {
	TranslationsAppValidationId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Judul pelaporan wajib diisi'
	String get title_required => 'Judul pelaporan wajib diisi';

	/// id: 'Jenis aset wajib dipilih'
	String get asset_type_required => 'Jenis aset wajib dipilih';

	/// id: 'Bentuk aset wajib dipilih'
	String get asset_form_required => 'Bentuk aset wajib dipilih';

	/// id: 'Data aset wajib dipilih'
	String get asset_data_required => 'Data aset wajib dipilih';

	/// id: 'Lokasi kejadian wajib diisi'
	String get location_required => 'Lokasi kejadian wajib diisi';

	/// id: 'Penyelesaian yang diharapkan wajib diisi'
	String get expected_solution_required => 'Penyelesaian yang diharapkan wajib diisi';

	/// id: 'Kategori laporan harus dipilih'
	String get category_required => 'Kategori laporan harus dipilih';

	/// id: 'Deskripsi masalah harus diisi'
	String get description_required => 'Deskripsi masalah harus diisi';

	/// id: 'Deskripsi masalah minimal 20 karakter'
	String get description_min_length => 'Deskripsi masalah minimal 20 karakter';

	/// id: 'Data aset wajib diisi'
	String get data_asset_required => 'Data aset wajib diisi';

	/// id: 'Nomor seri wajib diisi'
	String get serial_number_required => 'Nomor seri wajib diisi';

	/// id: 'Kategori aset wajib diisi'
	String get asset_category_required => 'Kategori aset wajib diisi';

	/// id: 'Sub-kategori aset wajib diisi'
	String get asset_subcategory_required => 'Sub-kategori aset wajib diisi';

	/// id: 'Judul pengajuan wajib diisi'
	String get request_title_required => 'Judul pengajuan wajib diisi';

	/// id: 'Lokasi pelayanan wajib diisi'
	String get service_location_required => 'Lokasi pelayanan wajib diisi';

	/// id: 'Rincian pengajuan pelayanan wajib diisi'
	String get service_description_required => 'Rincian pengajuan pelayanan wajib diisi';

	/// id: 'OPD Asal'
	String get opd_origin_label => 'OPD Asal';

	/// id: 'Pilih OPD'
	String get opd_origin_hint => 'Pilih OPD';

	/// id: 'Data Aset'
	String get data_asset_label => 'Data Aset';

	/// id: 'Pilih data aset'
	String get data_asset_hint => 'Pilih data aset';

	/// id: 'Nomor Seri'
	String get serial_number_label => 'Nomor Seri';

	/// id: 'Pilih nomor seri aset'
	String get serial_number_hint => 'Pilih nomor seri aset';

	/// id: 'Kategori Aset'
	String get asset_category => 'Kategori Aset';

	/// id: 'Terisi otomatis'
	String get asset_category_hint => 'Terisi otomatis';

	/// id: 'Sub-Kategori Aset'
	String get asset_subcategory_label => 'Sub-Kategori Aset';

	/// id: 'Terisi otomatis'
	String get asset_subcategory_hint => 'Terisi otomatis';

	/// id: 'Jenis Aset'
	String get asset_type_label => 'Jenis Aset';

	/// id: 'Terisi otomatis'
	String get asset_type_hint => 'Terisi otomatis';

	/// id: 'Estimasi Waktu'
	String get time_estimate_label => 'Estimasi Waktu';

	/// id: 'Pilih estimasi waktu'
	String get time_estimate_hint => 'Pilih estimasi waktu';

	/// id: 'Estimasi Biaya'
	String get cost_estimate_label => 'Estimasi Biaya';

	/// id: 'Pilih estimasi biaya'
	String get cost_estimate_hint => 'Pilih estimasi biaya';
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

// Path: app.dialog
class TranslationsAppDialogId {
	TranslationsAppDialogId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Apakah Anda yakin ingin mengirim?'
	String get confirm_submit_title => 'Apakah Anda yakin ingin mengirim?';

	/// id: 'Cek kembali inputan Anda sebelum mengirim!'
	String get confirm_submit_message => 'Cek kembali inputan Anda sebelum mengirim!';

	/// id: 'Ya, saya yakin!'
	String get confirm_yes => 'Ya, saya yakin!';

	/// id: 'Batalkan'
	String get cancel => 'Batalkan';

	/// id: 'Data tidak ditemukan!'
	String get data_not_found_title => 'Data tidak ditemukan!';

	/// id: 'Cek kembali inputan Anda'
	String get data_not_found_message => 'Cek kembali inputan Anda';

	/// id: 'Oke'
	String get ok => 'Oke';

	/// id: 'Batalkan Laporan?'
	String get cancel_report_title => 'Batalkan Laporan?';

	/// id: 'Data yang telah Anda isi akan hilang. Apakah Anda yakin?'
	String get cancel_report_message => 'Data yang telah Anda isi akan hilang. Apakah Anda yakin?';

	/// id: 'Lanjutkan Mengisi'
	String get continue_filling => 'Lanjutkan Mengisi';

	/// id: 'Batalkan'
	String get cancel_report => 'Batalkan';

	/// id: 'Form Belum Lengkap'
	String get incomplete_form_title => 'Form Belum Lengkap';

	/// id: 'Batalkan Permintaan?'
	String get cancel_request_title => 'Batalkan Permintaan?';

	/// id: 'Anda yakin ingin membatalkan pengisian formulir ini?'
	String get cancel_request_message => 'Anda yakin ingin membatalkan pengisian formulir ini?';

	/// id: 'Batalkan'
	String get cancel_request => 'Batalkan';

	/// id: 'Apakah Anda yakin ingin kembali?'
	String get back_confirmation_title => 'Apakah Anda yakin ingin kembali?';

	/// id: 'Data yang Anda inputkan tidak akan tersimpan!'
	String get back_confirmation_message => 'Data yang Anda inputkan tidak akan tersimpan!';

	/// id: 'Ya, saya yakin!'
	String get back_confirmation_confirm => 'Ya, saya yakin!';

	/// id: 'Batalkan'
	String get back_confirmation_cancel => 'Batalkan';

	/// id: 'Laporan berhasil terkirim!'
	String get report_success_title => 'Laporan berhasil terkirim!';

	/// id: 'Oke'
	String get report_success_button => 'Oke';

	/// id: 'Gagal mengirim: {message}'
	String get report_error_message => 'Gagal mengirim: {message}';

	/// id: 'Konfirmasi Pembaruan'
	String get confirm_update_title => 'Konfirmasi Pembaruan';

	/// id: 'Apakah Anda yakin ingin memperbarui status tiket?'
	String get confirm_update_message => 'Apakah Anda yakin ingin memperbarui status tiket?';

	/// id: 'Pembaruan Berhasil'
	String get update_success_title => 'Pembaruan Berhasil';
}

// Path: app.notifications
class TranslationsAppNotificationsId {
	TranslationsAppNotificationsId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Notifikasi'
	String get title => 'Notifikasi';

	/// id: 'Cari notifikasi...'
	String get search_placeholder => 'Cari notifikasi...';

	/// id: 'Tandai semua dibaca'
	String get mark_all_as_read => 'Tandai semua dibaca';

	/// id: 'Filter'
	String get filter => 'Filter';

	/// id: 'Jenis'
	String get type => 'Jenis';

	/// id: 'Analitik'
	String get analytics => 'Analitik';

	/// id: 'Tiket Baru Ditugaskan'
	String get new_ticket_assigned => 'Tiket Baru Ditugaskan';

	/// id: 'Pesan Baru'
	String get new_message => 'Pesan Baru';

	/// id: 'Pembaruan Tim'
	String get team_update => 'Pembaruan Tim';

	/// id: 'Status Tiket Diperbarui'
	String get ticket_status_update => 'Status Tiket Diperbarui';

	/// id: 'Tiket Baru Dibuat'
	String get new_ticket_created => 'Tiket Baru Dibuat';

	/// id: '{time} yang lalu'
	String get time_ago => '{time} yang lalu';

	/// id: 'Semua'
	String get filter_all => 'Semua';

	/// id: 'Sudah Dibaca'
	String get filter_read => 'Sudah Dibaca';

	/// id: 'Belum Dibaca'
	String get filter_unread => 'Belum Dibaca';

	/// id: 'Semua Jenis'
	String get type_all => 'Semua Jenis';

	/// id: 'Tiket'
	String get type_ticket => 'Tiket';

	/// id: 'Pesan'
	String get type_message => 'Pesan';

	/// id: 'Pembaruan'
	String get type_update => 'Pembaruan';
}

// Path: app.report_activity
class TranslationsAppReportActivityId {
	TranslationsAppReportActivityId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Riwayat Aktivitas'
	String get title => 'Riwayat Aktivitas';

	/// id: 'Cari laporan...'
	String get search_placeholder => 'Cari laporan...';

	/// id: 'Status'
	String get filter => 'Status';

	/// id: 'Semua'
	String get filter_all => 'Semua';

	/// id: 'Dibuka'
	String get filter_open => 'Dibuka';

	/// id: 'Sedang diproses'
	String get filter_in_progress => 'Sedang diproses';

	/// id: 'Selesai'
	String get filter_resolved => 'Selesai';

	/// id: 'Ditutup'
	String get filter_closed => 'Ditutup';

	/// id: 'Jenis'
	String get type => 'Jenis';

	/// id: 'Insiden'
	String get type_incident => 'Insiden';

	/// id: 'Permintaan Layanan'
	String get type_service_request => 'Permintaan Layanan';

	/// id: 'Belum ada laporan.'
	String get no_reports => 'Belum ada laporan.';
}

// Path: app.qr
class TranslationsAppQrId {
	TranslationsAppQrId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Pemindai Kode QR'
	String get title => 'Pemindai Kode QR';

	/// id: 'Arahkan kode QR ke dalam bingkai untuk memindai otomatis.'
	String get instruction => 'Arahkan kode QR ke dalam bingkai untuk memindai otomatis.';

	/// id: 'Lampu'
	String get flash => 'Lampu';

	/// id: 'Kamera'
	String get switch_camera => 'Kamera';

	/// id: 'Hasil'
	String get result_label => 'Hasil';

	/// id: 'Buka Tautan'
	String get go_to_link => 'Buka Tautan';

	/// id: 'Lihat Teks Lengkap'
	String get view_full_text => 'Lihat Teks Lengkap';

	/// id: 'Pindai Lagi'
	String get scan_again => 'Pindai Lagi';

	/// id: 'Detail Aset'
	String get asset_detail_title => 'Detail Aset';

	/// id: 'Pratinjau QR Code'
	String get qr_preview_label => 'Pratinjau QR Code';

	/// id: 'ID Aset'
	String get asset_id => 'ID Aset';

	/// id: 'Nama Aset'
	String get asset_name => 'Nama Aset';

	/// id: 'Lokasi Aset'
	String get asset_location => 'Lokasi Aset';

	/// id: 'Status Aset'
	String get asset_status => 'Status Aset';

	/// id: 'Jenis Aset'
	String get asset_type => 'Jenis Aset';

	/// id: 'Buat Laporan Berdasarkan Aset Ini'
	String get create_report_based_on_asset => 'Buat Laporan Berdasarkan Aset Ini';

	/// id: 'Data QR tidak valid. Silakan pindai kode aset yang benar.'
	String get invalid_qr_message => 'Data QR tidak valid. Silakan pindai kode aset yang benar.';

	/// id: 'Memproses data aset...'
	String get processing => 'Memproses data aset...';
}

// Path: app.dashboard
class TranslationsAppDashboardId {
	TranslationsAppDashboardId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Dashboard'
	String get title => 'Dashboard';

	/// id: 'Tiket Masuk'
	String get ticket_masuk => 'Tiket Masuk';

	/// id: 'tiket yang masuk'
	String get ticket_masuk_desc => 'tiket yang masuk';

	/// id: 'Proses'
	String get proses => 'Proses';

	/// id: 'tiket yang sedang diproses'
	String get proses_desc => 'tiket yang sedang diproses';

	/// id: 'Deadline'
	String get deadline => 'Deadline';

	/// id: 'tiket yang mendekati deadline'
	String get deadline_desc => 'tiket yang mendekati deadline';

	/// id: 'Reopen'
	String get reopen => 'Reopen';

	/// id: 'tiket yang dibuka kembali'
	String get reopen_desc => 'tiket yang dibuka kembali';

	/// id: 'Pelaporan'
	String get pelaporan => 'Pelaporan';

	/// id: 'Pelayanan'
	String get pelayanan => 'Pelayanan';

	/// id: 'Filter pencarian'
	String get filter_pCarian => 'Filter pencarian';

	/// id: 'Kategori'
	String get kategori => 'Kategori';

	/// id: 'Jenis'
	String get jenis => 'Jenis';

	/// id: 'Bentuk'
	String get bentuk => 'Bentuk';

	/// id: 'Pengirim'
	String get pengirim => 'Pengirim';

	/// id: 'Tanggal masuk'
	String get tanggal_masuk => 'Tanggal masuk';

	/// id: 'Lampiran'
	String get lampiran => 'Lampiran';

	/// id: 'Aksi'
	String get aksi => 'Aksi';

	/// id: 'Menampilkan data 1 sampai 10 dari 15 data'
	String get showing_data => 'Menampilkan data 1 sampai 10 dari 15 data';

	/// id: 'Pelaporan'
	String get reportTab => 'Pelaporan';

	/// id: 'Pelayanan'
	String get serviceTab => 'Pelayanan';

	/// id: 'Muat Ulang'
	String get refresh => 'Muat Ulang';

	/// id: 'Filter pencarian'
	String get filterTitle => 'Filter pencarian';

	/// id: 'Kategori'
	String get category => 'Kategori';

	/// id: 'Bentuk'
	String get form => 'Bentuk';

	/// id: 'Jenis'
	String get type => 'Jenis';

	/// id: 'Status'
	String get status => 'Status';

	/// id: 'Pilih kategori'
	String get selectCategory => 'Pilih kategori';

	/// id: 'Pilih bentuk'
	String get selectForm => 'Pilih bentuk';

	/// id: 'Pilih jenis'
	String get selectType => 'Pilih jenis';

	/// id: 'Pilih status'
	String get selectStatus => 'Pilih status';

	/// id: 'Kategori'
	String get ticket_category => 'Kategori';

	/// id: 'Jenis'
	String get ticket_type => 'Jenis';

	/// id: 'Bentuk'
	String get ticket_form => 'Bentuk';

	/// id: 'Lampiran'
	String get ticket_attachment => 'Lampiran';

	/// id: 'Lihat'
	String get view => 'Lihat';

	/// id: 'Edit'
	String get edit => 'Edit';

	/// id: 'Menampilkan data'
	String get pagination_info => 'Menampilkan data';

	/// id: 'sampai'
	String get to => 'sampai';

	/// id: 'dari'
	String get of_total => 'dari';

	/// id: 'data'
	String get data_label => 'data';

	/// id: 'Tiket Masuk'
	String get ticket_incoming => 'Tiket Masuk';

	/// id: 'tiket yang masuk'
	String get ticket_incoming_desc => 'tiket yang masuk';

	/// id: 'Proses'
	String get in_progress => 'Proses';

	/// id: 'tiket yang sedang diproses'
	String get in_progress_desc => 'tiket yang sedang diproses';

	/// id: 'Dashboard'
	String get menu_dashboard => 'Dashboard';

	/// id: 'Tiket Saya'
	String get menu_my_tickets => 'Tiket Saya';

	/// id: 'Riwayat'
	String get menu_history => 'Riwayat';

	/// id: 'Pengaturan'
	String get menu_settings => 'Pengaturan';

	/// id: 'Bantuan'
	String get menu_help => 'Bantuan';

	/// id: 'Tentang'
	String get menu_about => 'Tentang';

	/// id: 'Filter pencarian'
	String get filter_pencarian => 'Filter pencarian';

	/// id: 'Knowledge Base'
	String get menu_knowledge_base => 'Knowledge Base';
}

// Path: app.rfc
class TranslationsAppRfcId {
	TranslationsAppRfcId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Request for Change'
	String get rfc_title => 'Request for Change';

	/// id: 'Tambah'
	String get rfc_add_button => 'Tambah';

	/// id: 'Draft'
	String get rfc_tab_draft => 'Draft';

	/// id: 'Diajukan'
	String get rfc_tab_submitted => 'Diajukan';

	/// id: 'Dokumen'
	String get rfc_document => 'Dokumen';

	/// id: 'Tanggal Kirim'
	String get rfc_date_sent => 'Tanggal Kirim';

	/// id: 'Status'
	String get rfc_status => 'Status';

	/// id: 'Aksi'
	String get rfc_action => 'Aksi';

	/// id: 'Draft'
	String get rfc_status_draft => 'Draft';

	/// id: 'Menunggu Review'
	String get rfc_status_waiting_review => 'Menunggu Review';

	/// id: 'Disetujui'
	String get rfc_status_approved => 'Disetujui';

	/// id: 'Ditolak'
	String get rfc_status_rejected => 'Ditolak';

	/// id: 'Menampilkan data {current} sampai {to} dari {total} data'
	String get rfc_pagination_info => 'Menampilkan data {current} sampai {to} dari {total} data';

	/// id: 'Panduan Cek Status'
	String get rfc_document_status_check => 'Panduan Cek Status';

	/// id: 'Belum ada RFC yang tersedia.'
	String get rfc_no_data => 'Belum ada RFC yang tersedia.';

	/// id: 'Form Request for Change'
	String get rfc_form_title => 'Form Request for Change';

	/// id: 'Judul Pengajuan'
	String get submission_title => 'Judul Pengajuan';

	/// id: 'Ketik disini'
	String get submission_title_hint => 'Ketik disini';

	/// id: 'Nama Pemohon'
	String get applicant_name => 'Nama Pemohon';

	/// id: 'Ketik disini'
	String get applicant_name_hint => 'Ketik disini';

	/// id: 'Nomor HP'
	String get phone_number => 'Nomor HP';

	/// id: 'Ketik disini'
	String get phone_number_hint => 'Ketik disini';

	/// id: 'Nama Aset'
	String get asset_name => 'Nama Aset';

	/// id: 'Pilih aset'
	String get asset_name_hint => 'Pilih aset';

	/// id: 'Deskripsi'
	String get description => 'Deskripsi';

	/// id: 'Ketik disini'
	String get description_hint => 'Ketik disini';

	/// id: 'Alasan Perubahan'
	String get change_reason => 'Alasan Perubahan';

	/// id: 'Ketik disini'
	String get change_reason_hint => 'Ketik disini';

	/// id: 'Pengerjaan awal'
	String get start_date => 'Pengerjaan awal';

	/// id: '15-09-2025'
	String get start_date_hint => '15-09-2025';

	/// id: 'Sampai'
	String get end_date => 'Sampai';

	/// id: '16-09-2025'
	String get end_date_hint => '16-09-2025';

	/// id: 'Aset Terdampak'
	String get affected_asset => 'Aset Terdampak';

	/// id: 'Pilih aset'
	String get affected_asset_hint => 'Pilih aset';

	/// id: 'Estimasi Biaya'
	String get cost_estimate => 'Estimasi Biaya';

	/// id: 'Dampak Perubahan'
	String get change_impact => 'Dampak Perubahan';

	/// id: 'Ketik disini'
	String get change_impact_hint => 'Ketik disini';

	/// id: 'Dampak Jika Tidak Dilakukan Perubahan'
	String get no_change_impact => 'Dampak Jika Tidak Dilakukan Perubahan';

	/// id: 'Ketik disini'
	String get no_change_impact_hint => 'Ketik disini';

	/// id: 'Batalkan'
	String get button_cancel => 'Batalkan';

	/// id: 'Simpan draft'
	String get button_save_draft => 'Simpan draft';

	/// id: 'Kirim'
	String get button_submit => 'Kirim';

	/// id: 'Field ini wajib diisi'
	String get validation_required => 'Field ini wajib diisi';

	/// id: 'Nomor HP tidak valid'
	String get validation_phone_invalid => 'Nomor HP tidak valid';

	/// id: 'Silakan pilih nama aset'
	String get validation_asset_required => 'Silakan pilih nama aset';

	/// id: 'Silakan pilih rentang tanggal'
	String get validation_date_required => 'Silakan pilih rentang tanggal';

	/// id: 'Silakan pilih aset terdampak'
	String get validation_affected_asset_required => 'Silakan pilih aset terdampak';

	/// id: 'Draft berhasil disimpan'
	String get message_draft_saved => 'Draft berhasil disimpan';

	/// id: 'RFC berhasil dikirim'
	String get message_submit_success => 'RFC berhasil dikirim';

	/// id: 'OPD Asal'
	String get opd_origin_label => 'OPD Asal';

	/// id: 'Pilih OPD'
	String get opd_origin_hint => 'Pilih OPD';

	/// id: 'Data Aset'
	String get data_asset_label => 'Data Aset';

	/// id: 'Pilih data aset'
	String get data_asset_hint => 'Pilih data aset';

	/// id: 'Nomor Seri'
	String get serial_number_label => 'Nomor Seri';

	/// id: 'Pilih nomor seri aset'
	String get serial_number_hint => 'Pilih nomor seri aset';

	/// id: 'Kategori Aset'
	String get asset_category => 'Kategori Aset';

	/// id: 'Terisi otomatis'
	String get asset_category_hint => 'Terisi otomatis';

	/// id: 'Sub-Kategori Aset'
	String get asset_subcategory_label => 'Sub-Kategori Aset';

	/// id: 'Terisi otomatis'
	String get asset_subcategory_hint => 'Terisi otomatis';

	/// id: 'Jenis Aset'
	String get asset_type_label => 'Jenis Aset';

	/// id: 'Terisi otomatis'
	String get asset_type_hint => 'Terisi otomatis';

	/// id: 'Estimasi Waktu'
	String get time_estimate_label => 'Estimasi Waktu';

	/// id: 'Pilih estimasi waktu'
	String get time_estimate_hint => 'Pilih estimasi waktu';

	/// id: 'Estimasi Biaya'
	String get cost_estimate_label => 'Estimasi Biaya';

	/// id: 'Pilih estimasi biaya'
	String get cost_estimate_hint => 'Pilih estimasi biaya';

	/// id: 'OPD asal wajib dipilih'
	String get validation_opd_required => 'OPD asal wajib dipilih';

	/// id: 'Data aset wajib dipilih'
	String get validation_data_asset_required => 'Data aset wajib dipilih';

	/// id: 'Nomor seri wajib dipilih'
	String get validation_serial_number_required => 'Nomor seri wajib dipilih';

	/// id: 'Kategori aset wajib diisi'
	String get validation_category_required => 'Kategori aset wajib diisi';

	/// id: 'Sub-kategori aset wajib diisi'
	String get validation_subcategory_required => 'Sub-kategori aset wajib diisi';

	/// id: 'Jenis aset wajib diisi'
	String get validation_asset_type_required => 'Jenis aset wajib diisi';

	/// id: 'Estimasi waktu wajib dipilih'
	String get validation_time_estimate_required => 'Estimasi waktu wajib dipilih';

	/// id: 'Estimasi biaya wajib dipilih'
	String get validation_cost_estimate_required => 'Estimasi biaya wajib dipilih';

	/// id: 'Deskripsi minimal 20 karakter'
	String get validation_description_min_length => 'Deskripsi minimal 20 karakter';

	/// id: 'Batalkan Pengajuan RFC?'
	String get dialog_cancel_title => 'Batalkan Pengajuan RFC?';

	/// id: 'Apakah Anda yakin ingin membatalkan? Semua data yang diisi akan hilang.'
	String get dialog_cancel_message => 'Apakah Anda yakin ingin membatalkan? Semua data yang diisi akan hilang.';

	/// id: 'Lanjutkan Mengisi'
	String get dialog_continue => 'Lanjutkan Mengisi';

	/// id: 'Ya, Batalkan'
	String get dialog_cancel_confirm => 'Ya, Batalkan';

	/// id: 'Kirim RFC?'
	String get dialog_submit_title => 'Kirim RFC?';

	/// id: 'Apakah Anda yakin ingin mengirim Request for Change ini?'
	String get dialog_submit_message => 'Apakah Anda yakin ingin mengirim Request for Change ini?';

	/// id: 'Ya, Kirim'
	String get dialog_submit_confirm => 'Ya, Kirim';

	/// id: 'RFC Submitted Successfully'
	String get dialog_report_success_title => 'RFC Submitted Successfully';

	/// id: 'OK'
	String get dialog_report_success_button => 'OK';
}

// Path: app.rating
class TranslationsAppRatingId {
	TranslationsAppRatingId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Rating'
	String get rating_title => 'Rating';

	/// id: 'Rating Kepuasan'
	String get page_title => 'Rating Kepuasan';

	/// id: 'Muat Ulang'
	String get refresh => 'Muat Ulang';

	/// id: 'Detail Rating Tiket'
	String get detail_title => 'Detail Rating Tiket';

	/// id: 'Kembali'
	String get back_button => 'Kembali';

	/// id: 'Pelaporan'
	String get tab_reporting => 'Pelaporan';

	/// id: 'Pelayanan'
	String get tab_service => 'Pelayanan';

	/// id: 'Filter pencarian'
	String get filter_search => 'Filter pencarian';

	/// id: 'Kategori'
	String get filter_category => 'Kategori';

	/// id: 'Bentuk'
	String get filter_form => 'Bentuk';

	/// id: 'Jenis'
	String get filter_type => 'Jenis';

	/// id: 'Rating'
	String get filter_rating => 'Rating';

	/// id: 'Tidak ada data'
	String get no_data => 'Tidak ada data';

	/// id: 'Menampilkan data {start} sampai {end} dari {total} data'
	String get pagination_info => 'Menampilkan data {start} sampai {end} dari {total} data';
}

// Path: app.rating_detail
class TranslationsAppRatingDetailId {
	TranslationsAppRatingDetailId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Rating'
	String get page_title => 'Rating';

	/// id: 'Pengirim'
	String get sender_label => 'Pengirim';

	/// id: 'ID Tiket'
	String get ticket_id_label => 'ID Tiket';

	/// id: 'Rating Kepuasan Pelayanan Kami'
	String get satisfaction_rating_label => 'Rating Kepuasan Pelayanan Kami';

	/// id: 'Komentar'
	String get comment_label => 'Komentar';

	/// id: 'Kemudahan Penggunaan'
	String get ease_of_use => 'Kemudahan Penggunaan';

	/// id: 'Kecepatan Penanganan'
	String get response_speed => 'Kecepatan Penanganan';

	/// id: 'Kualitas Penyelesaian'
	String get solution_quality => 'Kualitas Penyelesaian';

	/// id: 'Kembali'
	String get button_cancel => 'Kembali';
}

// Path: app.onboarding
class TranslationsAppOnboardingId {
	TranslationsAppOnboardingId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Lewati'
	String get skip => 'Lewati';

	/// id: 'Mulai'
	String get start => 'Mulai';

	late final TranslationsAppOnboardingPage1Id page1 = TranslationsAppOnboardingPage1Id.internal(_root);
	late final TranslationsAppOnboardingPage2Id page2 = TranslationsAppOnboardingPage2Id.internal(_root);
	late final TranslationsAppOnboardingPage3Id page3 = TranslationsAppOnboardingPage3Id.internal(_root);
}

// Path: app.masyarakat
class TranslationsAppMasyarakatId {
	TranslationsAppMasyarakatId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Apa yang ingin Anda laporkan?'
	String get what_to_report => 'Apa yang ingin Anda laporkan?';

	/// id: 'Tuliskan deskripsi lengkap mengenai permasalahan Anda...'
	String get report_hint => 'Tuliskan deskripsi lengkap mengenai permasalahan Anda...';

	/// id: 'Lampiran (Opsional)'
	String get attach_file_label => 'Lampiran (Opsional)';

	/// id: 'Unggah foto atau dokumen pendukung (maks 2 file)'
	String get attach_file_subtitle => 'Unggah foto atau dokumen pendukung (maks 2 file)';

	/// id: 'Nama Lengkap'
	String get name_label => 'Nama Lengkap';

	/// id: 'NIK'
	String get nik_label => 'NIK';

	/// id: 'Email'
	String get email_label => 'Email';

	/// id: 'Deskripsi laporan wajib diisi.'
	String get validation_description_required => 'Deskripsi laporan wajib diisi.';

	/// id: 'Deskripsi harus terdiri dari minimal 20 karakter.'
	String get validation_description_min_length => 'Deskripsi harus terdiri dari minimal 20 karakter.';

	/// id: 'Form tidak valid, periksa kembali input Anda.'
	String get validation_error_message => 'Form tidak valid, periksa kembali input Anda.';

	/// id: 'Laporan berhasil dikirim (placeholder).'
	String get submit_success_placeholder => 'Laporan berhasil dikirim (placeholder).';

	/// id: 'Draft berhasil disimpan (placeholder).'
	String get draft_saved_placeholder => 'Draft berhasil disimpan (placeholder).';

	/// id: 'Batalkan Laporan?'
	String get cancel_confirmation_title => 'Batalkan Laporan?';

	/// id: 'Perubahan yang belum disimpan akan hilang. Anda yakin ingin keluar?'
	String get cancel_confirmation_message => 'Perubahan yang belum disimpan akan hilang. Anda yakin ingin keluar?';

	/// id: 'Tidak'
	String get cancel_no => 'Tidak';

	/// id: 'Ya'
	String get cancel_yes => 'Ya';
}

// Path: widgets.error
class TranslationsWidgetsErrorId {
	TranslationsWidgetsErrorId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Koneksi Terputus'
	String get network_title => 'Koneksi Terputus';

	/// id: 'Periksa koneksi internet Anda dan coba lagi.'
	String get network_message => 'Periksa koneksi internet Anda dan coba lagi.';

	/// id: 'Gangguan Server'
	String get server_title => 'Gangguan Server';

	/// id: 'Server sedang sibuk atau bermasalah.'
	String get server_message => 'Server sedang sibuk atau bermasalah.';

	/// id: 'Terjadi Kesalahan'
	String get general_title => 'Terjadi Kesalahan';

	/// id: 'Terjadi kesalahan yang tidak terduga.'
	String get general_message => 'Terjadi kesalahan yang tidak terduga.';

	/// id: 'Coba Lagi'
	String get retry => 'Coba Lagi';
}

// Path: widgets.empty
class TranslationsWidgetsEmptyId {
	TranslationsWidgetsEmptyId.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Belum Ada Data'
	String get list_title => 'Belum Ada Data';

	/// id: 'Saat ini belum ada data untuk ditampilkan.'
	String get list_message => 'Saat ini belum ada data untuk ditampilkan.';

	/// id: 'Pencarian Tidak Ditemukan'
	String get search_title => 'Pencarian Tidak Ditemukan';

	/// id: 'Tidak ada hasil untuk kata kunci tersebut.'
	String get search_message => 'Tidak ada hasil untuk kata kunci tersebut.';

	/// id: 'Tidak Ada Notifikasi'
	String get notification_title => 'Tidak Ada Notifikasi';

	/// id: 'Anda belum memiliki notifikasi.'
	String get notification_message => 'Anda belum memiliki notifikasi.';

	/// id: 'Muat Ulang'
	String get refresh => 'Muat Ulang';
}

// Path: app.onboarding.page1
class TranslationsAppOnboardingPage1Id {
	TranslationsAppOnboardingPage1Id.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Satu Aplikasi, Semua Layanan'
	String get title => 'Satu Aplikasi, Semua Layanan';

	/// id: 'Kelola pengaduan, permintaan layanan, dan komunikasi dengan OPD dalam satu platform terpadu.'
	String get body => 'Kelola pengaduan, permintaan layanan, dan komunikasi dengan OPD dalam satu platform terpadu.';
}

// Path: app.onboarding.page2
class TranslationsAppOnboardingPage2Id {
	TranslationsAppOnboardingPage2Id.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Tools Khusus Teknisi'
	String get title => 'Tools Khusus Teknisi';

	/// id: 'Akses tiket masuk, update progres, dan monitoring SLA langsung dari aplikasi.'
	String get body => 'Akses tiket masuk, update progres, dan monitoring SLA langsung dari aplikasi.';
}

// Path: app.onboarding.page3
class TranslationsAppOnboardingPage3Id {
	TranslationsAppOnboardingPage3Id.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// id: 'Helpdesk Lebih Cepat'
	String get title => 'Helpdesk Lebih Cepat';

	/// id: 'Gunakan fitur chat untuk berkomunikasi langsung dengan operator dan teknisi.'
	String get body => 'Gunakan fitur chat untuk berkomunikasi langsung dengan operator dan teknisi.';
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
			case 'app.confirm_logout_title': return 'Konfirmasi Keluar';
			case 'app.confirm_logout_message': return 'Apakah Anda yakin ingin keluar dari akun ini?';
			case 'app.no_data_available': return 'Tidak Ada Data Yang Tersedia';
			case 'app.upload_dialog_title': return 'Unggah lampiran sebagai bukti';
			case 'app.upload_dialog_subtitle': return 'Kirim dalam format pdf';
			case 'app.upload_dialog_choose_file': return 'Pilih file atau Pindahkan kesini';
			case 'app.upload_dialog_file_format': return 'Format file pdf, ukuran maksimal 1 MB';
			case 'app.upload_dialog_status_waiting': return 'tunggu';
			case 'app.upload_dialog_status_complete': return 'selesai';
			case 'app.upload_dialog_cancel': return 'Batalkan';
			case 'app.upload_dialog_upload': return 'Unggah';
			case 'app.unknown_user': return 'Pengguna Tidak Dikenal';
			case 'app.edit_profile_title': return 'Edit Profil';
			case 'app.confirmation_title': return 'Konfirmasi';
			case 'app.confirmation_save_changes': return 'Apakah Anda yakin ingin menyimpan perubahan?';
			case 'app.validation_phone_required': return 'Nomor telepon tidak boleh kosong';
			case 'app.validation_phone_format': return 'Format nomor telepon tidak valid';
			case 'app.validation_required': return 'tidak boleh kosong';
			case 'app.profile_updated_success': return 'Profil berhasil diperbarui';
			case 'app.error': return 'Kesalahan';
			case 'app.success': return 'Berhasil';
			case 'app.gallery': return 'Galeri';
			case 'app.camera': return 'Kamera';
			case 'app.draft_saved': return 'Draft berhasil disimpan';
			case 'app.sending_report': return 'Mengirim laporan...';
			case 'app.ok': return 'OK';
			case 'app.status': return 'Status';
			case 'app.ticket_detail': return 'Detail Tiket';
			case 'app.ticket_detail_placeholder': return 'Halaman detail tiket (placeholder)';
			case 'app.ticket_detail_title': return 'Detail Tiket';
			case 'app.ticket_sender': return 'Pengirim';
			case 'app.ticket_report_id': return 'ID Laporan';
			case 'app.ticket_priority': return 'Prioritas';
			case 'app.ticket_update_status': return 'Perbarui Status';
			case 'app.ticket_report_title': return 'Judul Pelaporan';
			case 'app.ticket_asset_category': return 'Kategori Aset';
			case 'app.ticket_asset_type': return 'Jenis Aset';
			case 'app.ticket_asset_form': return 'Bentuk Aset';
			case 'app.ticket_asset_data': return 'Data Aset';
			case 'app.ticket_incident_location': return 'Lokasi Kejadian';
			case 'app.ticket_start_date': return 'Tanggal Mulai';
			case 'app.ticket_end_date': return 'Tanggal Selesai';
			case 'app.ticket_problem_detail': return 'Rincian Masalah';
			case 'app.ticket_attachments': return 'Lampiran File';
			case 'app.ticket_expected_solution': return 'Penyelesaian yang Diharapkan';
			case 'app.status_draft': return 'Draft';
			case 'app.status_in_progress': return 'Diproses';
			case 'app.status_completed': return 'Selesai';
			case 'app.button_cancel': return 'Batal';
			case 'app.button_save_draft': return 'Simpan Draft';
			case 'app.button_update': return 'Perbarui';
			case 'app.message_draft_saved': return 'Draft berhasil disimpan';
			case 'app.message_status_updated': return 'Status berhasil diperbarui';
			case 'app.report_title_label': return 'Judul Pelaporan';
			case 'app.report_title_hint': return 'Ketik disini';
			case 'app.category_label': return 'Kategori Pelaporan';
			case 'app.category_label_service': return 'Kategori Layanan';
			case 'app.asset_type_label': return 'Jenis Aset';
			case 'app.asset_form_label': return 'Bentuk Aset';
			case 'app.asset_data_label': return 'Data Aset';
			case 'app.location_label': return 'Lokasi Kejadian';
			case 'app.location_hint': return 'Ketik disini';
			case 'app.expected_solution_label': return 'Penyelesaian yang Diharapkan';
			case 'app.expected_solution_hint': return 'Ketik disini...';
			case 'app.problem_label': return 'Rincian Permintaan';
			case 'app.problem_hint': return 'Jelaskan secara singkat masalah atau kebutuhan Anda...';
			case 'app.search_opd_hint': return 'Cari nama OPD...';
			case 'app.data_asset_label': return 'Data Aset';
			case 'app.serial_number_label': return 'Nomor Seri';
			case 'app.asset_category_label': return 'Kategori Aset';
			case 'app.asset_subcategory_label': return 'Sub-Kategori Aset';
			case 'app.data_asset_hint': return 'Pilih data aset';
			case 'app.serial_number_hint': return 'Pilih nomor seri aset';
			case 'app.asset_category_hint': return '';
			case 'app.asset_subcategory_hint': return '';
			case 'app.asset_type_hint': return '';
			case 'app.request_title_label': return 'Judul Pengajuan';
			case 'app.request_title_hint': return 'Ketik disini';
			case 'app.service_location_label': return 'Lokasi Pelayanan';
			case 'app.service_location_hint': return 'Ketik disini';
			case 'app.service_description_label': return 'Rincian Pengajuan Pelayanan';
			case 'app.service_description_hint': return 'Jelaskan lebih rinci terkait alasan pengajuan tersebut agar kami dapat lebih memahami pengajuan ini!';
			case 'app.photo_updated_success': return 'Foto profil berhasil diperbarui';
			case 'app.photo_updated_failed': return 'Gagal memperbarui foto profil';
			case 'app.failed': return 'Gagal!';
			case 'app.forgot_password_title': return 'Lupa Password?';
			case 'app.forgot_password_subtitle': return 'Tenang saja! Masukkan alamat Email yang terhubung, kami akan mengirimkan intruksi untuk reset password';
			case 'app.email_address': return 'Alamat email';
			case 'app.send_button': return 'Kirim';
			case 'app.verify_otp_title': return 'Cek Emailmu';
			case 'app.verify_otp_subtitle_prefix': return 'Kami telah mengirimkan 4 digit kode ke ';
			case 'app.otp_not_received': return 'Tidak menerima Kode? ';
			case 'app.resend_otp': return 'Kirim ulang';
			case 'app.verify_button': return 'Verifikasi';
			case 'app.otp_resent': return 'Kode OTP telah dikirim ulang';
			case 'app.reset_password_title': return 'Perbarui Kata Sandi';
			case 'app.new_password_label': return 'Kata sandi baru';
			case 'app.confirm_password_label': return 'Kata sandi konfirmasi';
			case 'app.reset_password_button': return 'Perbarui Kata Sandi';
			case 'app.password_mismatch': return 'Kata sandi tidak cocok';
			case 'app.password_reset_success_title': return 'Kata sandi berhasil diperbarui!';
			case 'app.password_reset_success_message': return 'Silakan login dengan kata sandi baru Anda';
			case 'app.validation.title_required': return 'Judul pelaporan wajib diisi';
			case 'app.validation.asset_type_required': return 'Jenis aset wajib dipilih';
			case 'app.validation.asset_form_required': return 'Bentuk aset wajib dipilih';
			case 'app.validation.asset_data_required': return 'Data aset wajib dipilih';
			case 'app.validation.location_required': return 'Lokasi kejadian wajib diisi';
			case 'app.validation.expected_solution_required': return 'Penyelesaian yang diharapkan wajib diisi';
			case 'app.validation.category_required': return 'Kategori laporan harus dipilih';
			case 'app.validation.description_required': return 'Deskripsi masalah harus diisi';
			case 'app.validation.description_min_length': return 'Deskripsi masalah minimal 20 karakter';
			case 'app.validation.data_asset_required': return 'Data aset wajib diisi';
			case 'app.validation.serial_number_required': return 'Nomor seri wajib diisi';
			case 'app.validation.asset_category_required': return 'Kategori aset wajib diisi';
			case 'app.validation.asset_subcategory_required': return 'Sub-kategori aset wajib diisi';
			case 'app.validation.request_title_required': return 'Judul pengajuan wajib diisi';
			case 'app.validation.service_location_required': return 'Lokasi pelayanan wajib diisi';
			case 'app.validation.service_description_required': return 'Rincian pengajuan pelayanan wajib diisi';
			case 'app.validation.opd_origin_label': return 'OPD Asal';
			case 'app.validation.opd_origin_hint': return 'Pilih OPD';
			case 'app.validation.data_asset_label': return 'Data Aset';
			case 'app.validation.data_asset_hint': return 'Pilih data aset';
			case 'app.validation.serial_number_label': return 'Nomor Seri';
			case 'app.validation.serial_number_hint': return 'Pilih nomor seri aset';
			case 'app.validation.asset_category': return 'Kategori Aset';
			case 'app.validation.asset_category_hint': return 'Terisi otomatis';
			case 'app.validation.asset_subcategory_label': return 'Sub-Kategori Aset';
			case 'app.validation.asset_subcategory_hint': return 'Terisi otomatis';
			case 'app.validation.asset_type_label': return 'Jenis Aset';
			case 'app.validation.asset_type_hint': return 'Terisi otomatis';
			case 'app.validation.time_estimate_label': return 'Estimasi Waktu';
			case 'app.validation.time_estimate_hint': return 'Pilih estimasi waktu';
			case 'app.validation.cost_estimate_label': return 'Estimasi Biaya';
			case 'app.validation.cost_estimate_hint': return 'Pilih estimasi biaya';
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
			case 'app.dialog.cancel_report_title': return 'Batalkan Laporan?';
			case 'app.dialog.cancel_report_message': return 'Data yang telah Anda isi akan hilang. Apakah Anda yakin?';
			case 'app.dialog.continue_filling': return 'Lanjutkan Mengisi';
			case 'app.dialog.cancel_report': return 'Batalkan';
			case 'app.dialog.incomplete_form_title': return 'Form Belum Lengkap';
			case 'app.dialog.cancel_request_title': return 'Batalkan Permintaan?';
			case 'app.dialog.cancel_request_message': return 'Anda yakin ingin membatalkan pengisian formulir ini?';
			case 'app.dialog.cancel_request': return 'Batalkan';
			case 'app.dialog.back_confirmation_title': return 'Apakah Anda yakin ingin kembali?';
			case 'app.dialog.back_confirmation_message': return 'Data yang Anda inputkan tidak akan tersimpan!';
			case 'app.dialog.back_confirmation_confirm': return 'Ya, saya yakin!';
			case 'app.dialog.back_confirmation_cancel': return 'Batalkan';
			case 'app.dialog.report_success_title': return 'Laporan berhasil terkirim!';
			case 'app.dialog.report_success_button': return 'Oke';
			case 'app.dialog.report_error_message': return 'Gagal mengirim: {message}';
			case 'app.dialog.confirm_update_title': return 'Konfirmasi Pembaruan';
			case 'app.dialog.confirm_update_message': return 'Apakah Anda yakin ingin memperbarui status tiket?';
			case 'app.dialog.update_success_title': return 'Pembaruan Berhasil';
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
			case 'app.dashboard.title': return 'Dashboard';
			case 'app.dashboard.ticket_masuk': return 'Tiket Masuk';
			case 'app.dashboard.ticket_masuk_desc': return 'tiket yang masuk';
			case 'app.dashboard.proses': return 'Proses';
			case 'app.dashboard.proses_desc': return 'tiket yang sedang diproses';
			case 'app.dashboard.deadline': return 'Deadline';
			case 'app.dashboard.deadline_desc': return 'tiket yang mendekati deadline';
			case 'app.dashboard.reopen': return 'Reopen';
			case 'app.dashboard.reopen_desc': return 'tiket yang dibuka kembali';
			case 'app.dashboard.pelaporan': return 'Pelaporan';
			case 'app.dashboard.pelayanan': return 'Pelayanan';
			case 'app.dashboard.filter_pCarian': return 'Filter pencarian';
			case 'app.dashboard.kategori': return 'Kategori';
			case 'app.dashboard.jenis': return 'Jenis';
			case 'app.dashboard.bentuk': return 'Bentuk';
			case 'app.dashboard.pengirim': return 'Pengirim';
			case 'app.dashboard.tanggal_masuk': return 'Tanggal masuk';
			case 'app.dashboard.lampiran': return 'Lampiran';
			case 'app.dashboard.aksi': return 'Aksi';
			case 'app.dashboard.showing_data': return 'Menampilkan data 1 sampai 10 dari 15 data';
			case 'app.dashboard.reportTab': return 'Pelaporan';
			case 'app.dashboard.serviceTab': return 'Pelayanan';
			case 'app.dashboard.refresh': return 'Muat Ulang';
			case 'app.dashboard.filterTitle': return 'Filter pencarian';
			case 'app.dashboard.category': return 'Kategori';
			case 'app.dashboard.form': return 'Bentuk';
			case 'app.dashboard.type': return 'Jenis';
			case 'app.dashboard.status': return 'Status';
			case 'app.dashboard.selectCategory': return 'Pilih kategori';
			case 'app.dashboard.selectForm': return 'Pilih bentuk';
			case 'app.dashboard.selectType': return 'Pilih jenis';
			case 'app.dashboard.selectStatus': return 'Pilih status';
			case 'app.dashboard.ticket_category': return 'Kategori';
			case 'app.dashboard.ticket_type': return 'Jenis';
			case 'app.dashboard.ticket_form': return 'Bentuk';
			case 'app.dashboard.ticket_attachment': return 'Lampiran';
			case 'app.dashboard.view': return 'Lihat';
			case 'app.dashboard.edit': return 'Edit';
			case 'app.dashboard.pagination_info': return 'Menampilkan data';
			case 'app.dashboard.to': return 'sampai';
			case 'app.dashboard.of_total': return 'dari';
			case 'app.dashboard.data_label': return 'data';
			case 'app.dashboard.ticket_incoming': return 'Tiket Masuk';
			case 'app.dashboard.ticket_incoming_desc': return 'tiket yang masuk';
			case 'app.dashboard.in_progress': return 'Proses';
			case 'app.dashboard.in_progress_desc': return 'tiket yang sedang diproses';
			case 'app.dashboard.menu_dashboard': return 'Dashboard';
			case 'app.dashboard.menu_my_tickets': return 'Tiket Saya';
			case 'app.dashboard.menu_history': return 'Riwayat';
			case 'app.dashboard.menu_settings': return 'Pengaturan';
			case 'app.dashboard.menu_help': return 'Bantuan';
			case 'app.dashboard.menu_about': return 'Tentang';
			case 'app.dashboard.filter_pencarian': return 'Filter pencarian';
			case 'app.dashboard.menu_knowledge_base': return 'Knowledge Base';
			case 'app.rfc.rfc_title': return 'Request for Change';
			case 'app.rfc.rfc_add_button': return 'Tambah';
			case 'app.rfc.rfc_tab_draft': return 'Draft';
			case 'app.rfc.rfc_tab_submitted': return 'Diajukan';
			case 'app.rfc.rfc_document': return 'Dokumen';
			case 'app.rfc.rfc_date_sent': return 'Tanggal Kirim';
			case 'app.rfc.rfc_status': return 'Status';
			case 'app.rfc.rfc_action': return 'Aksi';
			case 'app.rfc.rfc_status_draft': return 'Draft';
			case 'app.rfc.rfc_status_waiting_review': return 'Menunggu Review';
			case 'app.rfc.rfc_status_approved': return 'Disetujui';
			case 'app.rfc.rfc_status_rejected': return 'Ditolak';
			case 'app.rfc.rfc_pagination_info': return 'Menampilkan data {current} sampai {to} dari {total} data';
			case 'app.rfc.rfc_document_status_check': return 'Panduan Cek Status';
			case 'app.rfc.rfc_no_data': return 'Belum ada RFC yang tersedia.';
			case 'app.rfc.rfc_form_title': return 'Form Request for Change';
			case 'app.rfc.submission_title': return 'Judul Pengajuan';
			case 'app.rfc.submission_title_hint': return 'Ketik disini';
			case 'app.rfc.applicant_name': return 'Nama Pemohon';
			case 'app.rfc.applicant_name_hint': return 'Ketik disini';
			case 'app.rfc.phone_number': return 'Nomor HP';
			case 'app.rfc.phone_number_hint': return 'Ketik disini';
			case 'app.rfc.asset_name': return 'Nama Aset';
			case 'app.rfc.asset_name_hint': return 'Pilih aset';
			case 'app.rfc.description': return 'Deskripsi';
			case 'app.rfc.description_hint': return 'Ketik disini';
			case 'app.rfc.change_reason': return 'Alasan Perubahan';
			case 'app.rfc.change_reason_hint': return 'Ketik disini';
			case 'app.rfc.start_date': return 'Pengerjaan awal';
			case 'app.rfc.start_date_hint': return '15-09-2025';
			case 'app.rfc.end_date': return 'Sampai';
			case 'app.rfc.end_date_hint': return '16-09-2025';
			case 'app.rfc.affected_asset': return 'Aset Terdampak';
			case 'app.rfc.affected_asset_hint': return 'Pilih aset';
			case 'app.rfc.cost_estimate': return 'Estimasi Biaya';
			case 'app.rfc.change_impact': return 'Dampak Perubahan';
			case 'app.rfc.change_impact_hint': return 'Ketik disini';
			case 'app.rfc.no_change_impact': return 'Dampak Jika Tidak Dilakukan Perubahan';
			case 'app.rfc.no_change_impact_hint': return 'Ketik disini';
			case 'app.rfc.button_cancel': return 'Batalkan';
			case 'app.rfc.button_save_draft': return 'Simpan draft';
			case 'app.rfc.button_submit': return 'Kirim';
			case 'app.rfc.validation_required': return 'Field ini wajib diisi';
			case 'app.rfc.validation_phone_invalid': return 'Nomor HP tidak valid';
			case 'app.rfc.validation_asset_required': return 'Silakan pilih nama aset';
			case 'app.rfc.validation_date_required': return 'Silakan pilih rentang tanggal';
			case 'app.rfc.validation_affected_asset_required': return 'Silakan pilih aset terdampak';
			case 'app.rfc.message_draft_saved': return 'Draft berhasil disimpan';
			case 'app.rfc.message_submit_success': return 'RFC berhasil dikirim';
			case 'app.rfc.opd_origin_label': return 'OPD Asal';
			case 'app.rfc.opd_origin_hint': return 'Pilih OPD';
			case 'app.rfc.data_asset_label': return 'Data Aset';
			case 'app.rfc.data_asset_hint': return 'Pilih data aset';
			case 'app.rfc.serial_number_label': return 'Nomor Seri';
			case 'app.rfc.serial_number_hint': return 'Pilih nomor seri aset';
			case 'app.rfc.asset_category': return 'Kategori Aset';
			case 'app.rfc.asset_category_hint': return 'Terisi otomatis';
			case 'app.rfc.asset_subcategory_label': return 'Sub-Kategori Aset';
			case 'app.rfc.asset_subcategory_hint': return 'Terisi otomatis';
			case 'app.rfc.asset_type_label': return 'Jenis Aset';
			case 'app.rfc.asset_type_hint': return 'Terisi otomatis';
			case 'app.rfc.time_estimate_label': return 'Estimasi Waktu';
			case 'app.rfc.time_estimate_hint': return 'Pilih estimasi waktu';
			case 'app.rfc.cost_estimate_label': return 'Estimasi Biaya';
			case 'app.rfc.cost_estimate_hint': return 'Pilih estimasi biaya';
			case 'app.rfc.validation_opd_required': return 'OPD asal wajib dipilih';
			case 'app.rfc.validation_data_asset_required': return 'Data aset wajib dipilih';
			case 'app.rfc.validation_serial_number_required': return 'Nomor seri wajib dipilih';
			case 'app.rfc.validation_category_required': return 'Kategori aset wajib diisi';
			case 'app.rfc.validation_subcategory_required': return 'Sub-kategori aset wajib diisi';
			case 'app.rfc.validation_asset_type_required': return 'Jenis aset wajib diisi';
			case 'app.rfc.validation_time_estimate_required': return 'Estimasi waktu wajib dipilih';
			case 'app.rfc.validation_cost_estimate_required': return 'Estimasi biaya wajib dipilih';
			case 'app.rfc.validation_description_min_length': return 'Deskripsi minimal 20 karakter';
			case 'app.rfc.dialog_cancel_title': return 'Batalkan Pengajuan RFC?';
			case 'app.rfc.dialog_cancel_message': return 'Apakah Anda yakin ingin membatalkan? Semua data yang diisi akan hilang.';
			case 'app.rfc.dialog_continue': return 'Lanjutkan Mengisi';
			case 'app.rfc.dialog_cancel_confirm': return 'Ya, Batalkan';
			case 'app.rfc.dialog_submit_title': return 'Kirim RFC?';
			case 'app.rfc.dialog_submit_message': return 'Apakah Anda yakin ingin mengirim Request for Change ini?';
			case 'app.rfc.dialog_submit_confirm': return 'Ya, Kirim';
			case 'app.rfc.dialog_report_success_title': return 'RFC Submitted Successfully';
			case 'app.rfc.dialog_report_success_button': return 'OK';
			case 'app.rating.rating_title': return 'Rating';
			case 'app.rating.page_title': return 'Rating Kepuasan';
			case 'app.rating.refresh': return 'Muat Ulang';
			case 'app.rating.detail_title': return 'Detail Rating Tiket';
			case 'app.rating.back_button': return 'Kembali';
			case 'app.rating.tab_reporting': return 'Pelaporan';
			case 'app.rating.tab_service': return 'Pelayanan';
			case 'app.rating.filter_search': return 'Filter pencarian';
			case 'app.rating.filter_category': return 'Kategori';
			case 'app.rating.filter_form': return 'Bentuk';
			case 'app.rating.filter_type': return 'Jenis';
			case 'app.rating.filter_rating': return 'Rating';
			case 'app.rating.no_data': return 'Tidak ada data';
			case 'app.rating.pagination_info': return 'Menampilkan data {start} sampai {end} dari {total} data';
			case 'app.rating_detail.page_title': return 'Rating';
			case 'app.rating_detail.sender_label': return 'Pengirim';
			case 'app.rating_detail.ticket_id_label': return 'ID Tiket';
			case 'app.rating_detail.satisfaction_rating_label': return 'Rating Kepuasan Pelayanan Kami';
			case 'app.rating_detail.comment_label': return 'Komentar';
			case 'app.rating_detail.ease_of_use': return 'Kemudahan Penggunaan';
			case 'app.rating_detail.response_speed': return 'Kecepatan Penanganan';
			case 'app.rating_detail.solution_quality': return 'Kualitas Penyelesaian';
			case 'app.rating_detail.button_cancel': return 'Kembali';
			case 'app.onboarding.skip': return 'Lewati';
			case 'app.onboarding.start': return 'Mulai';
			case 'app.onboarding.page1.title': return 'Satu Aplikasi, Semua Layanan';
			case 'app.onboarding.page1.body': return 'Kelola pengaduan, permintaan layanan, dan komunikasi dengan OPD dalam satu platform terpadu.';
			case 'app.onboarding.page2.title': return 'Tools Khusus Teknisi';
			case 'app.onboarding.page2.body': return 'Akses tiket masuk, update progres, dan monitoring SLA langsung dari aplikasi.';
			case 'app.onboarding.page3.title': return 'Helpdesk Lebih Cepat';
			case 'app.onboarding.page3.body': return 'Gunakan fitur chat untuk berkomunikasi langsung dengan operator dan teknisi.';
			case 'app.masyarakat.what_to_report': return 'Apa yang ingin Anda laporkan?';
			case 'app.masyarakat.report_hint': return 'Tuliskan deskripsi lengkap mengenai permasalahan Anda...';
			case 'app.masyarakat.attach_file_label': return 'Lampiran (Opsional)';
			case 'app.masyarakat.attach_file_subtitle': return 'Unggah foto atau dokumen pendukung (maks 2 file)';
			case 'app.masyarakat.name_label': return 'Nama Lengkap';
			case 'app.masyarakat.nik_label': return 'NIK';
			case 'app.masyarakat.email_label': return 'Email';
			case 'app.masyarakat.validation_description_required': return 'Deskripsi laporan wajib diisi.';
			case 'app.masyarakat.validation_description_min_length': return 'Deskripsi harus terdiri dari minimal 20 karakter.';
			case 'app.masyarakat.validation_error_message': return 'Form tidak valid, periksa kembali input Anda.';
			case 'app.masyarakat.submit_success_placeholder': return 'Laporan berhasil dikirim (placeholder).';
			case 'app.masyarakat.draft_saved_placeholder': return 'Draft berhasil disimpan (placeholder).';
			case 'app.masyarakat.cancel_confirmation_title': return 'Batalkan Laporan?';
			case 'app.masyarakat.cancel_confirmation_message': return 'Perubahan yang belum disimpan akan hilang. Anda yakin ingin keluar?';
			case 'app.masyarakat.cancel_no': return 'Tidak';
			case 'app.masyarakat.cancel_yes': return 'Ya';
			case 'widgets.error.network_title': return 'Koneksi Terputus';
			case 'widgets.error.network_message': return 'Periksa koneksi internet Anda dan coba lagi.';
			case 'widgets.error.server_title': return 'Gangguan Server';
			case 'widgets.error.server_message': return 'Server sedang sibuk atau bermasalah.';
			case 'widgets.error.general_title': return 'Terjadi Kesalahan';
			case 'widgets.error.general_message': return 'Terjadi kesalahan yang tidak terduga.';
			case 'widgets.error.retry': return 'Coba Lagi';
			case 'widgets.empty.list_title': return 'Belum Ada Data';
			case 'widgets.empty.list_message': return 'Saat ini belum ada data untuk ditampilkan.';
			case 'widgets.empty.search_title': return 'Pencarian Tidak Ditemukan';
			case 'widgets.empty.search_message': return 'Tidak ada hasil untuk kata kunci tersebut.';
			case 'widgets.empty.notification_title': return 'Tidak Ada Notifikasi';
			case 'widgets.empty.notification_message': return 'Anda belum memiliki notifikasi.';
			case 'widgets.empty.refresh': return 'Muat Ulang';
			default: return null;
		}
	}
}

