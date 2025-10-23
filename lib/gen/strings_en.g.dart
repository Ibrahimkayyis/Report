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

	/// en: 'Submit'
	String get submit_report_button => 'Submit';

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

	/// en: 'Asset Information'
	String get asset_data_title => 'Asset Information';

	/// en: 'Select Device'
	String get select_device_label => 'Select Device';

	/// en: 'Select System'
	String get select_system_label => 'Select System';

	/// en: 'Select Access Type'
	String get select_access_type_label => 'Select Access Type';

	/// en: 'Select Device Type'
	String get select_device_type_label => 'Select Device Type';

	/// en: 'Number of Devices'
	String get device_count_label => 'Number of Devices';

	/// en: 'Enter quantity'
	String get device_count_hint => 'Enter quantity';

	/// en: 'Asset ID'
	String get asset_id_label => 'Asset ID';

	/// en: 'Asset Name'
	String get asset_name_label => 'Asset Name';

	/// en: 'Asset Location'
	String get asset_location_label => 'Asset Location';

	/// en: 'Password Reset Request'
	String get service_reset_password_title => 'Password Reset Request';

	/// en: 'System Access Request'
	String get service_system_access_title => 'System Access Request';

	/// en: 'Device Request'
	String get service_device_request_title => 'Device Request';

	/// en: 'What is your reason for resetting your password?'
	String get service_reset_password_problem_label => 'What is your reason for resetting your password?';

	/// en: 'Please explain the issue in detail so that we can follow up in accordance with security procedures!'
	String get service_reset_password_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';

	/// en: 'What is your reason for requesting access?'
	String get service_system_access_problem_label => 'What is your reason for requesting access?';

	/// en: 'Please explain the issue in detail so that we can follow up in accordance with security procedures!'
	String get service_system_access_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';

	/// en: 'Apa alasan Anda mengajukan permohonan permintaan perangkat?'
	String get service_device_request_problem_label => 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';

	/// en: 'Please explain the issue in detail so that we can follow up in accordance with security procedures!'
	String get service_device_request_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';

	/// en: 'Request Priority'
	String get service_reset_password_priority_label => 'Request Priority';

	/// en: 'Access Priority'
	String get service_system_access_priority_label => 'Access Priority';

	/// en: 'Device Request Priority'
	String get service_device_request_priority_label => 'Device Request Priority';

	/// en: 'Attach File'
	String get attach_file_label => 'Attach File';

	/// en: 'Additional Information'
	String get additional_info_label => 'Additional Information';

	/// en: 'Activity'
	String get activity => 'Activity';

	/// en: 'Notification'
	String get notification => 'Notification';

	/// en: 'Knowledge Base'
	String get knowledge_base_title => 'Knowledge Base';

	/// en: 'Learn and find the solutions you need'
	String get knowledge_base_subtitle => 'Learn and find the solutions you need';

	/// en: 'Search here'
	String get search_here => 'Search here';

	/// en: 'How to create a new ticket?'
	String get faq_how_to_create_ticket => 'How to create a new ticket?';

	/// en: 'How to check my ticket status?'
	String get faq_how_to_check_ticket_status => 'How to check my ticket status?';

	/// en: 'Guide to contact direct support?'
	String get faq_guide_contact_support => 'Guide to contact direct support?';

	/// en: 'Guide to reset password?'
	String get faq_guide_reset_password => 'Guide to reset password?';

	/// en: 'How long does ticket processing usually take?'
	String get faq_how_long_ticket_processing => 'How long does ticket processing usually take?';

	/// en: 'What to do if the ticket hasn't received a response?'
	String get faq_what_to_do_no_response => 'What to do if the ticket hasn\'t received a response?';

	/// en: 'Report Tracking'
	String get check_report_status_title => 'Report Tracking';

	/// en: 'Track the status of your report'
	String get check_report_status_subtitle => 'Track the status of your report';

	/// en: 'Report ID'
	String get report_id_label => 'Report ID';

	/// en: 'Enter your report ID'
	String get report_id_hint => 'Enter your report ID';

	/// en: 'PIN'
	String get pin_label => 'PIN';

	/// en: 'Enter your PIN'
	String get pin_hint => 'Enter your PIN';

	/// en: 'Search'
	String get search_button => 'Search';

	/// en: 'Please fill in all fields first'
	String get error_empty_fields => 'Please fill in all fields first';

	/// en: 'Searching report status...'
	String get searching_report_status => 'Searching report status...';

	/// en: 'Your Request Has Been Successfully Submitted'
	String get service_request_success_title => 'Your Request Has Been Successfully Submitted';

	/// en: 'Thank you for your submission. Your request has been recorded, and we will follow up according to procedure within the specified time. Please monitor progress through the Service Status menu.'
	String get service_request_success_description => 'Thank you for your submission. Your request has been recorded, and we will follow up according to procedure within the specified time. Please monitor progress through the Service Status menu.';

	/// en: 'Service Request'
	String get service_type_request => 'Service Request';

	/// en: 'Request Type'
	String get request_type => 'Request Type';

	/// en: 'Downloading ticket...'
	String get downloading_ticket => 'Downloading ticket...';

	/// en: 'Create new request'
	String get create_new_request => 'Create new request';

	/// en: 'Edit Profile'
	String get edit_profile => 'Edit Profile';

	/// en: 'Change Password'
	String get change_password => 'Change Password';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'FAQ'
	String get faq => 'FAQ';

	/// en: 'About Us'
	String get about_us => 'About Us';

	/// en: 'Helpdesk'
	String get helpdesk_title => 'Helpdesk';

	/// en: 'How can we assist you today? Start a conversation with our helpdesk team for support and inquiries.'
	String get helpdesk_intro_text => 'How can we assist you today? Start a conversation with our helpdesk team for support and inquiries.';

	/// en: 'Select OPD'
	String get select_opd => 'Select OPD';

	/// en: 'No messages yet. Start the conversation now!'
	String get helpdesk_empty_chat => 'No messages yet. Start the conversation now!';

	/// en: 'Write your message...'
	String get write_message => 'Write your message...';

	/// en: 'Report Found'
	String get report_found_title => 'Report Found';

	/// en: 'Your Report: '
	String get your_report_label => 'Your Report: ';

	/// en: 'Ticket ID: '
	String get ticket_label => 'Ticket ID: ';

	/// en: 'Status: '
	String get status_label => 'Status: ';

	/// en: 'Service Type: '
	String get service_type_label => 'Service Type: ';

	/// en: 'Destination OPD: '
	String get destination_opd_label => 'Destination OPD: ';

	/// en: 'Back'
	String get back_button => 'Back';

	/// en: 'My Profile'
	String get my_profile => 'My Profile';

	/// en: 'Employee'
	String get employee => 'Employee';

	/// en: 'Personal Info'
	String get personal_info => 'Personal Info';

	/// en: 'Work Info'
	String get work_info => 'Work Info';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Birth Date'
	String get birth_date => 'Birth Date';

	/// en: 'Phone Number'
	String get phone_number => 'Phone Number';

	/// en: 'Address'
	String get address => 'Address';

	/// en: 'Employee ID'
	String get employee_id => 'Employee ID';

	/// en: 'Hire Date'
	String get hire_date => 'Hire Date';

	/// en: 'Position'
	String get position => 'Position';

	/// en: 'Division'
	String get division => 'Division';

	/// en: 'Appearance'
	String get theme_settings_title => 'Appearance';

	/// en: 'Preference'
	String get theme_preference => 'Preference';

	/// en: 'Choose your display preference'
	String get theme_preference_subtitle => 'Choose your display preference';

	/// en: 'System'
	String get system => 'System';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'Font Size'
	String get font_size => 'Font Size';

	/// en: 'Choose your preferred font size'
	String get font_size_subtitle => 'Choose your preferred font size';

	/// en: 'Save'
	String get save => 'Save';

	late final TranslationsAppErrorsEn errors = TranslationsAppErrorsEn._(_root);
	late final TranslationsAppDialogEn dialog = TranslationsAppDialogEn._(_root);
	late final TranslationsAppNotificationsEn notifications = TranslationsAppNotificationsEn._(_root);
	late final TranslationsAppReportActivityEn report_activity = TranslationsAppReportActivityEn._(_root);
	late final TranslationsAppQrEn qr = TranslationsAppQrEn._(_root);
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

// Path: app.dialog
class TranslationsAppDialogEn {
	TranslationsAppDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Are you sure you want to submit?'
	String get confirm_submit_title => 'Are you sure you want to submit?';

	/// en: 'Please double-check your input before submitting!'
	String get confirm_submit_message => 'Please double-check your input before submitting!';

	/// en: 'Yes, I'm sure!'
	String get confirm_yes => 'Yes, I\'m sure!';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Data not found!'
	String get data_not_found_title => 'Data not found!';

	/// en: 'Please check your input again'
	String get data_not_found_message => 'Please check your input again';

	/// en: 'OK'
	String get ok => 'OK';
}

// Path: app.notifications
class TranslationsAppNotificationsEn {
	TranslationsAppNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'Search notifications...'
	String get search_placeholder => 'Search notifications...';

	/// en: 'Mark all as read'
	String get mark_all_as_read => 'Mark all as read';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Type'
	String get type => 'Type';

	/// en: 'Analytics'
	String get analytics => 'Analytics';

	/// en: 'New Ticket Assigned'
	String get new_ticket_assigned => 'New Ticket Assigned';

	/// en: 'New Message'
	String get new_message => 'New Message';

	/// en: 'Team Update'
	String get team_update => 'Team Update';

	/// en: 'Ticket Status Update'
	String get ticket_status_update => 'Ticket Status Update';

	/// en: 'New Ticket Created'
	String get new_ticket_created => 'New Ticket Created';

	/// en: '{time} ago'
	String get time_ago => '{time} ago';

	/// en: 'All'
	String get filter_all => 'All';

	/// en: 'Read'
	String get filter_read => 'Read';

	/// en: 'Unread'
	String get filter_unread => 'Unread';

	/// en: 'All Types'
	String get type_all => 'All Types';

	/// en: 'Ticket'
	String get type_ticket => 'Ticket';

	/// en: 'Message'
	String get type_message => 'Message';

	/// en: 'Update'
	String get type_update => 'Update';
}

// Path: app.report_activity
class TranslationsAppReportActivityEn {
	TranslationsAppReportActivityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Activity History'
	String get title => 'Activity History';

	/// en: 'Search reports...'
	String get search_placeholder => 'Search reports...';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'All'
	String get filter_all => 'All';

	/// en: 'Open'
	String get filter_open => 'Open';

	/// en: 'In Progress'
	String get filter_in_progress => 'In Progress';

	/// en: 'Resolved'
	String get filter_resolved => 'Resolved';

	/// en: 'Closed'
	String get filter_closed => 'Closed';

	/// en: 'Type'
	String get type => 'Type';

	/// en: 'Incident'
	String get type_incident => 'Incident';

	/// en: 'Service Request'
	String get type_service_request => 'Service Request';

	/// en: 'No reports yet.'
	String get no_reports => 'No reports yet.';
}

// Path: app.qr
class TranslationsAppQrEn {
	TranslationsAppQrEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'QR Code Scanner'
	String get title => 'QR Code Scanner';

	/// en: 'Align the QR code within the frame to scan automatically.'
	String get instruction => 'Align the QR code within the frame to scan automatically.';

	/// en: 'Flash'
	String get flash => 'Flash';

	/// en: 'Switch'
	String get switch_camera => 'Switch';

	/// en: 'Result'
	String get result_label => 'Result';

	/// en: 'Go to Link'
	String get go_to_link => 'Go to Link';

	/// en: 'View Full Text'
	String get view_full_text => 'View Full Text';

	/// en: 'Scan Again'
	String get scan_again => 'Scan Again';

	/// en: 'Detail Aset'
	String get asset_detail_title => 'Detail Aset';

	/// en: 'QR Code Preview'
	String get qr_preview_label => 'QR Code Preview';

	/// en: 'Asset ID'
	String get asset_id => 'Asset ID';

	/// en: 'Asset Name'
	String get asset_name => 'Asset Name';

	/// en: 'Asset Location'
	String get asset_location => 'Asset Location';

	/// en: 'Asset Status'
	String get asset_status => 'Asset Status';

	/// en: 'Asset Type'
	String get asset_type => 'Asset Type';

	/// en: 'Create Report Based on This Asset'
	String get create_report_based_on_asset => 'Create Report Based on This Asset';

	/// en: 'Invalid QR data. Please scan a valid asset QR code.'
	String get invalid_qr_message => 'Invalid QR data. Please scan a valid asset QR code.';

	/// en: 'Processing Asset Data...'
	String get processing => 'Processing Asset Data...';
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
			case 'app.submit_report_button': return 'Submit';
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
			case 'app.asset_data_title': return 'Asset Information';
			case 'app.select_device_label': return 'Select Device';
			case 'app.select_system_label': return 'Select System';
			case 'app.select_access_type_label': return 'Select Access Type';
			case 'app.select_device_type_label': return 'Select Device Type';
			case 'app.device_count_label': return 'Number of Devices';
			case 'app.device_count_hint': return 'Enter quantity';
			case 'app.asset_id_label': return 'Asset ID';
			case 'app.asset_name_label': return 'Asset Name';
			case 'app.asset_location_label': return 'Asset Location';
			case 'app.service_reset_password_title': return 'Password Reset Request';
			case 'app.service_system_access_title': return 'System Access Request';
			case 'app.service_device_request_title': return 'Device Request';
			case 'app.service_reset_password_problem_label': return 'What is your reason for resetting your password?';
			case 'app.service_reset_password_problem_hint': return 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
			case 'app.service_system_access_problem_label': return 'What is your reason for requesting access?';
			case 'app.service_system_access_problem_hint': return 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
			case 'app.service_device_request_problem_label': return 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';
			case 'app.service_device_request_problem_hint': return 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
			case 'app.service_reset_password_priority_label': return 'Request Priority';
			case 'app.service_system_access_priority_label': return 'Access Priority';
			case 'app.service_device_request_priority_label': return 'Device Request Priority';
			case 'app.attach_file_label': return 'Attach File';
			case 'app.additional_info_label': return 'Additional Information';
			case 'app.activity': return 'Activity';
			case 'app.notification': return 'Notification';
			case 'app.knowledge_base_title': return 'Knowledge Base';
			case 'app.knowledge_base_subtitle': return 'Learn and find the solutions you need';
			case 'app.search_here': return 'Search here';
			case 'app.faq_how_to_create_ticket': return 'How to create a new ticket?';
			case 'app.faq_how_to_check_ticket_status': return 'How to check my ticket status?';
			case 'app.faq_guide_contact_support': return 'Guide to contact direct support?';
			case 'app.faq_guide_reset_password': return 'Guide to reset password?';
			case 'app.faq_how_long_ticket_processing': return 'How long does ticket processing usually take?';
			case 'app.faq_what_to_do_no_response': return 'What to do if the ticket hasn\'t received a response?';
			case 'app.check_report_status_title': return 'Report Tracking';
			case 'app.check_report_status_subtitle': return 'Track the status of your report';
			case 'app.report_id_label': return 'Report ID';
			case 'app.report_id_hint': return 'Enter your report ID';
			case 'app.pin_label': return 'PIN';
			case 'app.pin_hint': return 'Enter your PIN';
			case 'app.search_button': return 'Search';
			case 'app.error_empty_fields': return 'Please fill in all fields first';
			case 'app.searching_report_status': return 'Searching report status...';
			case 'app.service_request_success_title': return 'Your Request Has Been Successfully Submitted';
			case 'app.service_request_success_description': return 'Thank you for your submission. Your request has been recorded, and we will follow up according to procedure within the specified time. Please monitor progress through the Service Status menu.';
			case 'app.service_type_request': return 'Service Request';
			case 'app.request_type': return 'Request Type';
			case 'app.downloading_ticket': return 'Downloading ticket...';
			case 'app.create_new_request': return 'Create new request';
			case 'app.edit_profile': return 'Edit Profile';
			case 'app.change_password': return 'Change Password';
			case 'app.language': return 'Language';
			case 'app.theme': return 'Theme';
			case 'app.faq': return 'FAQ';
			case 'app.about_us': return 'About Us';
			case 'app.helpdesk_title': return 'Helpdesk';
			case 'app.helpdesk_intro_text': return 'How can we assist you today? Start a conversation with our helpdesk team for support and inquiries.';
			case 'app.select_opd': return 'Select OPD';
			case 'app.helpdesk_empty_chat': return 'No messages yet. Start the conversation now!';
			case 'app.write_message': return 'Write your message...';
			case 'app.report_found_title': return 'Report Found';
			case 'app.your_report_label': return 'Your Report: ';
			case 'app.ticket_label': return 'Ticket ID: ';
			case 'app.status_label': return 'Status: ';
			case 'app.service_type_label': return 'Service Type: ';
			case 'app.destination_opd_label': return 'Destination OPD: ';
			case 'app.back_button': return 'Back';
			case 'app.my_profile': return 'My Profile';
			case 'app.employee': return 'Employee';
			case 'app.personal_info': return 'Personal Info';
			case 'app.work_info': return 'Work Info';
			case 'app.edit': return 'Edit';
			case 'app.birth_date': return 'Birth Date';
			case 'app.phone_number': return 'Phone Number';
			case 'app.address': return 'Address';
			case 'app.employee_id': return 'Employee ID';
			case 'app.hire_date': return 'Hire Date';
			case 'app.position': return 'Position';
			case 'app.division': return 'Division';
			case 'app.theme_settings_title': return 'Appearance';
			case 'app.theme_preference': return 'Preference';
			case 'app.theme_preference_subtitle': return 'Choose your display preference';
			case 'app.system': return 'System';
			case 'app.light': return 'Light';
			case 'app.dark': return 'Dark';
			case 'app.font_size': return 'Font Size';
			case 'app.font_size_subtitle': return 'Choose your preferred font size';
			case 'app.save': return 'Save';
			case 'app.errors.invalid_credentials': return 'Invalid email or password';
			case 'app.errors.server_error': return 'Server error occurred';
			case 'app.errors.network_error': return 'Network error, please check your connection';
			case 'app.errors.validation_error': return 'Validation error';
			case 'app.errors.not_found': return 'Endpoint not found or server is offline';
			case 'app.dialog.confirm_submit_title': return 'Are you sure you want to submit?';
			case 'app.dialog.confirm_submit_message': return 'Please double-check your input before submitting!';
			case 'app.dialog.confirm_yes': return 'Yes, I\'m sure!';
			case 'app.dialog.cancel': return 'Cancel';
			case 'app.dialog.data_not_found_title': return 'Data not found!';
			case 'app.dialog.data_not_found_message': return 'Please check your input again';
			case 'app.dialog.ok': return 'OK';
			case 'app.notifications.title': return 'Notifications';
			case 'app.notifications.search_placeholder': return 'Search notifications...';
			case 'app.notifications.mark_all_as_read': return 'Mark all as read';
			case 'app.notifications.filter': return 'Filter';
			case 'app.notifications.type': return 'Type';
			case 'app.notifications.analytics': return 'Analytics';
			case 'app.notifications.new_ticket_assigned': return 'New Ticket Assigned';
			case 'app.notifications.new_message': return 'New Message';
			case 'app.notifications.team_update': return 'Team Update';
			case 'app.notifications.ticket_status_update': return 'Ticket Status Update';
			case 'app.notifications.new_ticket_created': return 'New Ticket Created';
			case 'app.notifications.time_ago': return '{time} ago';
			case 'app.notifications.filter_all': return 'All';
			case 'app.notifications.filter_read': return 'Read';
			case 'app.notifications.filter_unread': return 'Unread';
			case 'app.notifications.type_all': return 'All Types';
			case 'app.notifications.type_ticket': return 'Ticket';
			case 'app.notifications.type_message': return 'Message';
			case 'app.notifications.type_update': return 'Update';
			case 'app.report_activity.title': return 'Activity History';
			case 'app.report_activity.search_placeholder': return 'Search reports...';
			case 'app.report_activity.filter': return 'Filter';
			case 'app.report_activity.filter_all': return 'All';
			case 'app.report_activity.filter_open': return 'Open';
			case 'app.report_activity.filter_in_progress': return 'In Progress';
			case 'app.report_activity.filter_resolved': return 'Resolved';
			case 'app.report_activity.filter_closed': return 'Closed';
			case 'app.report_activity.type': return 'Type';
			case 'app.report_activity.type_incident': return 'Incident';
			case 'app.report_activity.type_service_request': return 'Service Request';
			case 'app.report_activity.no_reports': return 'No reports yet.';
			case 'app.qr.title': return 'QR Code Scanner';
			case 'app.qr.instruction': return 'Align the QR code within the frame to scan automatically.';
			case 'app.qr.flash': return 'Flash';
			case 'app.qr.switch_camera': return 'Switch';
			case 'app.qr.result_label': return 'Result';
			case 'app.qr.go_to_link': return 'Go to Link';
			case 'app.qr.view_full_text': return 'View Full Text';
			case 'app.qr.scan_again': return 'Scan Again';
			case 'app.qr.asset_detail_title': return 'Detail Aset';
			case 'app.qr.qr_preview_label': return 'QR Code Preview';
			case 'app.qr.asset_id': return 'Asset ID';
			case 'app.qr.asset_name': return 'Asset Name';
			case 'app.qr.asset_location': return 'Asset Location';
			case 'app.qr.asset_status': return 'Asset Status';
			case 'app.qr.asset_type': return 'Asset Type';
			case 'app.qr.create_report_based_on_asset': return 'Create Report Based on This Asset';
			case 'app.qr.invalid_qr_message': return 'Invalid QR data. Please scan a valid asset QR code.';
			case 'app.qr.processing': return 'Processing Asset Data...';
			default: return null;
		}
	}
}

