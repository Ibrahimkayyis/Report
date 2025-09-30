///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEn app = _TranslationsAppEn._(_root);
}

// Path: app
class _TranslationsAppEn extends TranslationsAppId {
	_TranslationsAppEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'REPORT';
	@override String get login => 'Login';
	@override String get logout => 'Logout';
	@override String get welcome => 'Welcome';
	@override String get please_login_or_register => 'Please login or register';
	@override String get register => 'Register';
	@override String get email => 'Email';
	@override String get password => 'Password';
	@override String get phone => 'Phone';
	@override String get dont_have_account => 'Don\'t have an account?';
	@override String get sign_up_here => 'Sign up here';
	@override String get forgot_password => 'Forgot password?';
	@override String get LOGIN_SUCCESS => 'Login success';
	@override String get name => 'Name';
	@override String get repeat_password => 'Repeat password';
	@override String get create_account => 'Create Account';
	@override String get already_have_account => 'Already have an account?';
	@override String get first_name => 'First Name';
	@override String get last_name => 'Last Name';
	@override String get required_field => 'This field is required';
	@override String get confirm_password => 'Confirm Password';
	@override String get password_requirements => 'Password must be at least 8 characters';
	@override String get show_password => 'Show Password';
	@override String get use_email_to_continue => 'Use your email to continue';
	@override String get invalid_email => 'Invalid email address';
	@override String get passwords_do_not_match => 'Passwords do not match';
	@override String get password_too_short => 'Password is too short';
	@override String get register_success => 'Registration successful, please login';
	@override String get go_to_login => 'Go to Login';
	@override String get logged_out => 'You have been logged out';
	@override String get home => 'Home';
	@override String get logout_confirmation => 'Are you sure you want to logout?';
	@override String get logout_message => 'You will need to login again to access your account.';
	@override String get cancel => 'Cancel';
	@override String get confirm => 'Confirm';
	@override String get search_placeholder => 'Search here';
	@override String get online_reporting => 'Online Reporting';
	@override String get online_reporting_subtitle => 'Report problems and issues here!';
	@override String get create_report => 'Create Report';
	@override String get service_request => 'Service Request';
	@override String get service_request_subtitle => 'Submit the services you need here!';
	@override String get create_request => 'Create Request';
	@override String get services => 'Services';
	@override String get knowledge_base => 'Knowledge Base';
	@override String get check_report_status => 'Check Report Status';
	@override String get report_history => 'Report History';
	@override String get no_report_history => 'No report history to display';
	@override String get profile => 'Profile';
	@override String get qr_code => 'QR Code';
	@override String get reports => 'Reports';
	@override String get online_reporting_title => 'Online Reporting';
	@override String get select_opd_subtitle => 'Select your destination OPD';
	@override String get opd_dinas_pendidikan => 'Education Department';
	@override String get opd_dinas_perpustakaan => 'Library and Archives Department';
	@override String get opd_dinas_kesehatan => 'Health Department';
	@override String get opd_dinas_komunikasi_informatika => 'Communication and Information Technology Department';
	@override String get opd_dinas_perhubungan => 'Transportation Department';
	@override String get opd_dinas_lingkungan_hidup => 'Environmental Department';
	@override String get opd_dinas_sosial => 'Social Affairs Department';
	@override String get opd_dinas_kependudukan_pencatatan_sipil => 'Population and Civil Registration Department';
	@override String get opd_dinas_sda_bina_marga => 'Water Resources and Highways Department';
	@override String get opd_dinas_koperasi_ukm => 'Cooperatives and Small Medium Enterprises Department';
	@override String get opd_dinas_perumahan_kawasan => 'Housing and Settlement Department';
	@override String get opd_dinas_penanaman_modal => 'Investment and One Stop Service Department';
	@override String get opd_dinas_pemadam_kebakaran => 'Fire and Rescue Department';
	@override String get opd_dinas_kebudayaan_pariwisata => 'Culture, Youth and Sports Tourism Department';
	@override String get opd_dinas_perindustrian_tenaga_kerja => 'Industry and Labor Department';
	@override String get opd_satpol_pp => 'Civil Service Police Unit';
	@override String get opd_dinas_ketahanan_pangan => 'Food Security and Agriculture Department';
	@override String get opd_dinas_pengendalian_penduduk => 'Population Control and Family Planning Department';
	@override String get send_report_to => 'Send report to';
	@override String get reporter_name => 'Name';
	@override String get reporter_nip => 'NIP';
	@override String get reporter_division => 'Division';
	@override String get report_reason_question => 'What is the reason for your report?';
	@override String get select_one => 'Select one';
	@override String get report_category_hardware => 'Hardware';
	@override String get report_category_software => 'Software & Applications';
	@override String get report_category_network => 'Network & Connectivity';
	@override String get report_category_email => 'Email & Communication';
	@override String get report_category_security => 'Security';
	@override String get report_category_other => 'Other Issues';
	@override String get problem_description_question => 'Can you provide details about this issue?';
	@override String get problem_description_hint => 'Explain in more detail about the problem so we can better understand your issue!';
	@override String get priority_level_title => 'Report priority level';
	@override String get priority_level_subtitle => 'Select the urgency level of your report so we can prioritize handling according to the impact of the issue!';
	@override String get priority_high => 'High';
	@override String get priority_medium => 'Medium';
	@override String get priority_low => 'Low';
	@override String get attach_file_title => 'Attach file';
	@override String get attach_file_subtitle => 'Attach screenshots, images, or related documents to help us understand your issue better!';
	@override String get attach_file_button => 'Attach File';
	@override String get additional_info_title => 'Additional Information';
	@override String get additional_info_subtitle => 'Add additional details that might help us understand the issue or your request!';
	@override String get additional_info_hint => 'Type here...';
	@override String get cancel_button => 'Cancel';
	@override String get save_draft_button => 'Save Draft';
	@override String get submit_report_button => 'Submit Report';
	@override String get report_success_title => 'Your Report Has Been Successfully Submitted';
	@override String get report_success_description => 'Thank you for your report. The report has been recorded, we will follow it up according to the procedure within the specified time. Please track report progress through the Service Status Check menu.';
	@override String get check_report_with => 'Check report with:';
	@override String get ticket_number => 'Ticket No.';
	@override String get pin => 'PIN';
	@override String get service_type => 'Service Type:';
	@override String get service_type_reporting => 'Online Reporting';
	@override String get destination_opd => 'Destination OPD:';
	@override String get download_ticket => 'Download ticket';
	@override String get check_service_status => 'Check service status';
	@override String get create_new_report => 'Create new report';
	@override String get back_to_home => 'Back to home';
	@override late final _TranslationsAppErrorsEn errors = _TranslationsAppErrorsEn._(_root);
}

// Path: app.errors
class _TranslationsAppErrorsEn extends TranslationsAppErrorsId {
	_TranslationsAppErrorsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get invalid_credentials => 'Invalid email or password';
	@override String get server_error => 'Server error occurred';
	@override String get network_error => 'Network error, please check your connection';
	@override String get validation_error => 'Validation error';
	@override String get not_found => 'Endpoint not found or server is offline';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
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
			case 'app.errors.invalid_credentials': return 'Invalid email or password';
			case 'app.errors.server_error': return 'Server error occurred';
			case 'app.errors.network_error': return 'Network error, please check your connection';
			case 'app.errors.validation_error': return 'Validation error';
			case 'app.errors.not_found': return 'Endpoint not found or server is offline';
			default: return null;
		}
	}
}

