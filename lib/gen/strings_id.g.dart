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
			default: return null;
		}
	}
}

