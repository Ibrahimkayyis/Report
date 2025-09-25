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
			default: return null;
		}
	}
}

