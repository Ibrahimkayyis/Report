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
			case 'app.errors.invalid_credentials': return 'Invalid email or password';
			case 'app.errors.server_error': return 'Server error occurred';
			case 'app.errors.network_error': return 'Network error, please check your connection';
			case 'app.errors.validation_error': return 'Validation error';
			case 'app.errors.not_found': return 'Endpoint not found or server is offline';
			default: return null;
		}
	}
}

