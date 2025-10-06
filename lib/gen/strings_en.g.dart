///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
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
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'REPORT'
	String get title => 'REPORT';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Welcome'
	String get welcome => 'Welcome';

	/// en: 'Please login or register'
	String get please_login_or_register => 'Please login or register';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Phone'
	String get phone => 'Phone';

	/// en: 'Don't have an account?'
	String get dont_have_account => 'Don\'t have an account?';

	/// en: 'Sign up here'
	String get sign_up_here => 'Sign up here';

	/// en: 'Forgot password?'
	String get forgot_password => 'Forgot password?';

	/// en: 'Login success'
	String get LOGIN_SUCCESS => 'Login success';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Repeat password'
	String get repeat_password => 'Repeat password';

	/// en: 'Create Account'
	String get create_account => 'Create Account';

	/// en: 'Already have an account?'
	String get already_have_account => 'Already have an account?';

	/// en: 'First Name'
	String get first_name => 'First Name';

	/// en: 'Last Name'
	String get last_name => 'Last Name';

	/// en: 'This field is required'
	String get required_field => 'This field is required';

	/// en: 'Confirm Password'
	String get confirm_password => 'Confirm Password';

	/// en: 'Password must be at least 8 characters'
	String get password_requirements => 'Password must be at least 8 characters';

	/// en: 'Show Password'
	String get show_password => 'Show Password';

	/// en: 'Use your email to continue'
	String get use_email_to_continue => 'Use your email to continue';

	/// en: 'Invalid email address'
	String get invalid_email => 'Invalid email address';

	/// en: 'Passwords do not match'
	String get passwords_do_not_match => 'Passwords do not match';

	/// en: 'Password is too short'
	String get password_too_short => 'Password is too short';

	/// en: 'Registration successful, please login'
	String get register_success => 'Registration successful, please login';

	/// en: 'Go to Login'
	String get go_to_login => 'Go to Login';

	/// en: 'You have been logged out'
	String get logged_out => 'You have been logged out';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Are you sure you want to logout?'
	String get logout_confirmation => 'Are you sure you want to logout?';

	/// en: 'You will need to login again to access your account.'
	String get logout_message => 'You will need to login again to access your account.';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Search here'
	String get search_placeholder => 'Search here';

	/// en: 'Online Reporting'
	String get online_reporting => 'Online Reporting';

	/// en: 'Report problems and issues here!'
	String get online_reporting_subtitle => 'Report problems and issues here!';

	/// en: 'Create Report'
	String get create_report => 'Create Report';

	/// en: 'Service Request'
	String get service_request => 'Service Request';

	/// en: 'Submit the services you need here!'
	String get service_request_subtitle => 'Submit the services you need here!';

	/// en: 'Create Request'
	String get create_request => 'Create Request';

	/// en: 'Services'
	String get services => 'Services';

	/// en: 'Knowledge Base'
	String get knowledge_base => 'Knowledge Base';

	/// en: 'Check Report Status'
	String get check_report_status => 'Check Report Status';

	/// en: 'Report History'
	String get report_history => 'Report History';

	/// en: 'No report history to display'
	String get no_report_history => 'No report history to display';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'QR Code'
	String get qr_code => 'QR Code';

	/// en: 'Reports'
	String get reports => 'Reports';

	/// en: 'Online Reporting'
	String get online_reporting_title => 'Online Reporting';

	/// en: 'Select your destination OPD'
	String get select_opd_subtitle => 'Select your destination OPD';

	/// en: 'Education Department'
	String get opd_dinas_pendidikan => 'Education Department';

	/// en: 'Library and Archives Department'
	String get opd_dinas_perpustakaan => 'Library and Archives Department';

	/// en: 'Health Department'
	String get opd_dinas_kesehatan => 'Health Department';

	/// en: 'Communication and Information Technology Department'
	String get opd_dinas_komunikasi_informatika => 'Communication and Information Technology Department';

	/// en: 'Transportation Department'
	String get opd_dinas_perhubungan => 'Transportation Department';

	/// en: 'Environmental Department'
	String get opd_dinas_lingkungan_hidup => 'Environmental Department';

	/// en: 'Social Affairs Department'
	String get opd_dinas_sosial => 'Social Affairs Department';

	/// en: 'Population and Civil Registration Department'
	String get opd_dinas_kependudukan_pencatatan_sipil => 'Population and Civil Registration Department';

	/// en: 'Water Resources and Highways Department'
	String get opd_dinas_sda_bina_marga => 'Water Resources and Highways Department';

	/// en: 'Cooperatives and Small Medium Enterprises Department'
	String get opd_dinas_koperasi_ukm => 'Cooperatives and Small Medium Enterprises Department';

	/// en: 'Housing and Settlement Department'
	String get opd_dinas_perumahan_kawasan => 'Housing and Settlement Department';

	/// en: 'Investment and One Stop Service Department'
	String get opd_dinas_penanaman_modal => 'Investment and One Stop Service Department';

	/// en: 'Fire and Rescue Department'
	String get opd_dinas_pemadam_kebakaran => 'Fire and Rescue Department';

	/// en: 'Culture, Youth and Sports Tourism Department'
	String get opd_dinas_kebudayaan_pariwisata => 'Culture, Youth and Sports Tourism Department';

	/// en: 'Industry and Labor Department'
	String get opd_dinas_perindustrian_tenaga_kerja => 'Industry and Labor Department';

	/// en: 'Civil Service Police Unit'
	String get opd_satpol_pp => 'Civil Service Police Unit';

	/// en: 'Food Security and Agriculture Department'
	String get opd_dinas_ketahanan_pangan => 'Food Security and Agriculture Department';

	/// en: 'Population Control and Family Planning Department'
	String get opd_dinas_pengendalian_penduduk => 'Population Control and Family Planning Department';

	/// en: 'Send report to'
	String get send_report_to => 'Send report to';

	/// en: 'Name'
	String get reporter_name => 'Name';

	/// en: 'NIP'
	String get reporter_nip => 'NIP';

	/// en: 'Division'
	String get reporter_division => 'Division';

	/// en: 'What is the reason for your report?'
	String get report_reason_question => 'What is the reason for your report?';

	/// en: 'Select one'
	String get select_one => 'Select one';

	/// en: 'Hardware'
	String get report_category_hardware => 'Hardware';

	/// en: 'Software & Applications'
	String get report_category_software => 'Software & Applications';

	/// en: 'Network & Connectivity'
	String get report_category_network => 'Network & Connectivity';

	/// en: 'Email & Communication'
	String get report_category_email => 'Email & Communication';

	/// en: 'Security'
	String get report_category_security => 'Security';

	/// en: 'Other Issues'
	String get report_category_other => 'Other Issues';

	/// en: 'Can you provide details about this issue?'
	String get problem_description_question => 'Can you provide details about this issue?';

	/// en: 'Explain in more detail about the problem so we can better understand your issue!'
	String get problem_description_hint => 'Explain in more detail about the problem so we can better understand your issue!';

	/// en: 'Report priority level'
	String get priority_level_title => 'Report priority level';

	/// en: 'Select the urgency level of your report so we can prioritize handling according to the impact of the issue!'
	String get priority_level_subtitle => 'Select the urgency level of your report so we can prioritize handling according to the impact of the issue!';

	/// en: 'High'
	String get priority_high => 'High';

	/// en: 'Medium'
	String get priority_medium => 'Medium';

	/// en: 'Low'
	String get priority_low => 'Low';

	/// en: 'Attach file'
	String get attach_file_title => 'Attach file';

	/// en: 'Attach screenshots, images, or related documents to help us understand your issue better!'
	String get attach_file_subtitle => 'Attach screenshots, images, or related documents to help us understand your issue better!';

	/// en: 'Attach File'
	String get attach_file_button => 'Attach File';

	/// en: 'Additional Information'
	String get additional_info_title => 'Additional Information';

	/// en: 'Add additional details that might help us understand the issue or your request!'
	String get additional_info_subtitle => 'Add additional details that might help us understand the issue or your request!';

	/// en: 'Type here...'
	String get additional_info_hint => 'Type here...';

	/// en: 'Cancel'
	String get cancel_button => 'Cancel';

	/// en: 'Save Draft'
	String get save_draft_button => 'Save Draft';

	/// en: 'Submit Report'
	String get submit_report_button => 'Submit Report';

	/// en: 'Your Report Has Been Successfully Submitted'
	String get report_success_title => 'Your Report Has Been Successfully Submitted';

	/// en: 'Thank you for your report. The report has been recorded, we will follow it up according to the procedure within the specified time. Please track report progress through the Service Status Check menu.'
	String get report_success_description => 'Thank you for your report. The report has been recorded, we will follow it up according to the procedure within the specified time. Please track report progress through the Service Status Check menu.';

	/// en: 'Check report with:'
	String get check_report_with => 'Check report with:';

	/// en: 'Ticket No.'
	String get ticket_number => 'Ticket No.';

	/// en: 'PIN'
	String get pin => 'PIN';

	/// en: 'Service Type:'
	String get service_type => 'Service Type:';

	/// en: 'Online Reporting'
	String get service_type_reporting => 'Online Reporting';

	/// en: 'Destination OPD:'
	String get destination_opd => 'Destination OPD:';

	/// en: 'Download ticket'
	String get download_ticket => 'Download ticket';

	/// en: 'Check service status'
	String get check_service_status => 'Check service status';

	/// en: 'Create new report'
	String get create_new_report => 'Create new report';

	/// en: 'Back to home'
	String get back_to_home => 'Back to home';

	/// en: 'Service Request'
	String get service_request_title => 'Service Request';

	/// en: 'Select the request you need'
	String get service_request_select_subtitle => 'Select the request you need';

	/// en: 'Reset Password'
	String get service_reset_password => 'Reset Password';

	/// en: 'Request to reset your account password'
	String get service_reset_password_desc => 'Request to reset your account password';

	/// en: 'System Access'
	String get service_system_access => 'System Access';

	/// en: 'Request access to applications or systems'
	String get service_system_access_desc => 'Request access to applications or systems';

	/// en: 'Device Request'
	String get service_device_request => 'Device Request';

	/// en: 'Request work equipment or devices'
	String get service_device_request_desc => 'Request work equipment or devices';

	late final TranslationsAppErrorsEn errors = TranslationsAppErrorsEn._(_root);
}

// Path: app.errors
class TranslationsAppErrorsEn {
	TranslationsAppErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Invalid email or password'
	String get invalid_credentials => 'Invalid email or password';

	/// en: 'Server error occurred'
	String get server_error => 'Server error occurred';

	/// en: 'Network error, please check your connection'
	String get network_error => 'Network error, please check your connection';

	/// en: 'Validation error'
	String get validation_error => 'Validation error';

	/// en: 'Endpoint not found or server is offline'
	String get not_found => 'Endpoint not found or server is offline';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'REPORT';
			case 'app.login': return 'Login';
			case 'app.logout': return 'Logout';
			case 'app.welcome': return 'Welcome';
			case 'app.please_login_or_register': return 'Please login or register';
			case 'app.register': return 'Register';
			case 'app.email': return 'Email';
			case 'app.password': return 'Password';
			case 'app.phone': return 'Phone';
			case 'app.dont_have_account': return 'Don\'t have an account?';
			case 'app.sign_up_here': return 'Sign up here';
			case 'app.forgot_password': return 'Forgot password?';
			case 'app.LOGIN_SUCCESS': return 'Login success';
			case 'app.name': return 'Name';
			case 'app.repeat_password': return 'Repeat password';
			case 'app.create_account': return 'Create Account';
			case 'app.already_have_account': return 'Already have an account?';
			case 'app.first_name': return 'First Name';
			case 'app.last_name': return 'Last Name';
			case 'app.required_field': return 'This field is required';
			case 'app.confirm_password': return 'Confirm Password';
			case 'app.password_requirements': return 'Password must be at least 8 characters';
			case 'app.show_password': return 'Show Password';
			case 'app.use_email_to_continue': return 'Use your email to continue';
			case 'app.invalid_email': return 'Invalid email address';
			case 'app.passwords_do_not_match': return 'Passwords do not match';
			case 'app.password_too_short': return 'Password is too short';
			case 'app.register_success': return 'Registration successful, please login';
			case 'app.go_to_login': return 'Go to Login';
			case 'app.logged_out': return 'You have been logged out';
			case 'app.home': return 'Home';
			case 'app.logout_confirmation': return 'Are you sure you want to logout?';
			case 'app.logout_message': return 'You will need to login again to access your account.';
			case 'app.cancel': return 'Cancel';
			case 'app.confirm': return 'Confirm';
			case 'app.search_placeholder': return 'Search here';
			case 'app.online_reporting': return 'Online Reporting';
			case 'app.online_reporting_subtitle': return 'Report problems and issues here!';
			case 'app.create_report': return 'Create Report';
			case 'app.service_request': return 'Service Request';
			case 'app.service_request_subtitle': return 'Submit the services you need here!';
			case 'app.create_request': return 'Create Request';
			case 'app.services': return 'Services';
			case 'app.knowledge_base': return 'Knowledge Base';
			case 'app.check_report_status': return 'Check Report Status';
			case 'app.report_history': return 'Report History';
			case 'app.no_report_history': return 'No report history to display';
			case 'app.profile': return 'Profile';
			case 'app.qr_code': return 'QR Code';
			case 'app.reports': return 'Reports';
			case 'app.online_reporting_title': return 'Online Reporting';
			case 'app.select_opd_subtitle': return 'Select your destination OPD';
			case 'app.opd_dinas_pendidikan': return 'Education Department';
			case 'app.opd_dinas_perpustakaan': return 'Library and Archives Department';
			case 'app.opd_dinas_kesehatan': return 'Health Department';
			case 'app.opd_dinas_komunikasi_informatika': return 'Communication and Information Technology Department';
			case 'app.opd_dinas_perhubungan': return 'Transportation Department';
			case 'app.opd_dinas_lingkungan_hidup': return 'Environmental Department';
			case 'app.opd_dinas_sosial': return 'Social Affairs Department';
			case 'app.opd_dinas_kependudukan_pencatatan_sipil': return 'Population and Civil Registration Department';
			case 'app.opd_dinas_sda_bina_marga': return 'Water Resources and Highways Department';
			case 'app.opd_dinas_koperasi_ukm': return 'Cooperatives and Small Medium Enterprises Department';
			case 'app.opd_dinas_perumahan_kawasan': return 'Housing and Settlement Department';
			case 'app.opd_dinas_penanaman_modal': return 'Investment and One Stop Service Department';
			case 'app.opd_dinas_pemadam_kebakaran': return 'Fire and Rescue Department';
			case 'app.opd_dinas_kebudayaan_pariwisata': return 'Culture, Youth and Sports Tourism Department';
			case 'app.opd_dinas_perindustrian_tenaga_kerja': return 'Industry and Labor Department';
			case 'app.opd_satpol_pp': return 'Civil Service Police Unit';
			case 'app.opd_dinas_ketahanan_pangan': return 'Food Security and Agriculture Department';
			case 'app.opd_dinas_pengendalian_penduduk': return 'Population Control and Family Planning Department';
			case 'app.send_report_to': return 'Send report to';
			case 'app.reporter_name': return 'Name';
			case 'app.reporter_nip': return 'NIP';
			case 'app.reporter_division': return 'Division';
			case 'app.report_reason_question': return 'What is the reason for your report?';
			case 'app.select_one': return 'Select one';
			case 'app.report_category_hardware': return 'Hardware';
			case 'app.report_category_software': return 'Software & Applications';
			case 'app.report_category_network': return 'Network & Connectivity';
			case 'app.report_category_email': return 'Email & Communication';
			case 'app.report_category_security': return 'Security';
			case 'app.report_category_other': return 'Other Issues';
			case 'app.problem_description_question': return 'Can you provide details about this issue?';
			case 'app.problem_description_hint': return 'Explain in more detail about the problem so we can better understand your issue!';
			case 'app.priority_level_title': return 'Report priority level';
			case 'app.priority_level_subtitle': return 'Select the urgency level of your report so we can prioritize handling according to the impact of the issue!';
			case 'app.priority_high': return 'High';
			case 'app.priority_medium': return 'Medium';
			case 'app.priority_low': return 'Low';
			case 'app.attach_file_title': return 'Attach file';
			case 'app.attach_file_subtitle': return 'Attach screenshots, images, or related documents to help us understand your issue better!';
			case 'app.attach_file_button': return 'Attach File';
			case 'app.additional_info_title': return 'Additional Information';
			case 'app.additional_info_subtitle': return 'Add additional details that might help us understand the issue or your request!';
			case 'app.additional_info_hint': return 'Type here...';
			case 'app.cancel_button': return 'Cancel';
			case 'app.save_draft_button': return 'Save Draft';
			case 'app.submit_report_button': return 'Submit Report';
			case 'app.report_success_title': return 'Your Report Has Been Successfully Submitted';
			case 'app.report_success_description': return 'Thank you for your report. The report has been recorded, we will follow it up according to the procedure within the specified time. Please track report progress through the Service Status Check menu.';
			case 'app.check_report_with': return 'Check report with:';
			case 'app.ticket_number': return 'Ticket No.';
			case 'app.pin': return 'PIN';
			case 'app.service_type': return 'Service Type:';
			case 'app.service_type_reporting': return 'Online Reporting';
			case 'app.destination_opd': return 'Destination OPD:';
			case 'app.download_ticket': return 'Download ticket';
			case 'app.check_service_status': return 'Check service status';
			case 'app.create_new_report': return 'Create new report';
			case 'app.back_to_home': return 'Back to home';
			case 'app.service_request_title': return 'Service Request';
			case 'app.service_request_select_subtitle': return 'Select the request you need';
			case 'app.service_reset_password': return 'Reset Password';
			case 'app.service_reset_password_desc': return 'Request to reset your account password';
			case 'app.service_system_access': return 'System Access';
			case 'app.service_system_access_desc': return 'Request access to applications or systems';
			case 'app.service_device_request': return 'Device Request';
			case 'app.service_device_request_desc': return 'Request work equipment or devices';
			case 'app.errors.invalid_credentials': return 'Invalid email or password';
			case 'app.errors.server_error': return 'Server error occurred';
			case 'app.errors.network_error': return 'Network error, please check your connection';
			case 'app.errors.validation_error': return 'Validation error';
			case 'app.errors.not_found': return 'Endpoint not found or server is offline';
			default: return null;
		}
	}
}

