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

	/// en: 'Logout Confirmation'
	String get confirm_logout_title => 'Logout Confirmation';

	/// en: 'Are you sure you want to logout from this account?'
	String get confirm_logout_message => 'Are you sure you want to logout from this account?';

	/// en: 'No Data Available'
	String get no_data_available => 'No Data Available';

	/// en: 'Upload attachments as evidence'
	String get upload_dialog_title => 'Upload attachments as evidence';

	/// en: 'Send in pdf format'
	String get upload_dialog_subtitle => 'Send in pdf format';

	/// en: 'Choose file or Move here'
	String get upload_dialog_choose_file => 'Choose file or Move here';

	/// en: 'Pdf file format, maximum size 1 MB'
	String get upload_dialog_file_format => 'Pdf file format, maximum size 1 MB';

	/// en: 'waiting'
	String get upload_dialog_status_waiting => 'waiting';

	/// en: 'complete'
	String get upload_dialog_status_complete => 'complete';

	/// en: 'Cancel'
	String get upload_dialog_cancel => 'Cancel';

	/// en: 'Upload'
	String get upload_dialog_upload => 'Upload';

	/// en: 'Unknown User'
	String get unknown_user => 'Unknown User';

	/// en: 'Edit Profile'
	String get edit_profile_title => 'Edit Profile';

	/// en: 'Confirmation'
	String get confirmation_title => 'Confirmation';

	/// en: 'Are you sure you want to save changes?'
	String get confirmation_save_changes => 'Are you sure you want to save changes?';

	/// en: 'Phone number is required'
	String get validation_phone_required => 'Phone number is required';

	/// en: 'Invalid phone number format'
	String get validation_phone_format => 'Invalid phone number format';

	/// en: 'is required'
	String get validation_required => 'is required';

	/// en: 'Profile updated successfully'
	String get profile_updated_success => 'Profile updated successfully';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Gallery'
	String get gallery => 'Gallery';

	/// en: 'Camera'
	String get camera => 'Camera';

	/// en: 'Draft saved successfully'
	String get draft_saved => 'Draft saved successfully';

	/// en: 'Sending report...'
	String get sending_report => 'Sending report...';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Ticket Detail'
	String get ticket_detail => 'Ticket Detail';

	/// en: 'Ticket detail page (placeholder)'
	String get ticket_detail_placeholder => 'Ticket detail page (placeholder)';

	/// en: 'Ticket Detail'
	String get ticket_detail_title => 'Ticket Detail';

	/// en: 'Sender'
	String get ticket_sender => 'Sender';

	/// en: 'Report ID'
	String get ticket_report_id => 'Report ID';

	/// en: 'Priority'
	String get ticket_priority => 'Priority';

	/// en: 'Update Status'
	String get ticket_update_status => 'Update Status';

	/// en: 'Report Title'
	String get ticket_report_title => 'Report Title';

	/// en: 'Asset Category'
	String get ticket_asset_category => 'Asset Category';

	/// en: 'Asset Type'
	String get ticket_asset_type => 'Asset Type';

	/// en: 'Asset Form'
	String get ticket_asset_form => 'Asset Form';

	/// en: 'Asset Data'
	String get ticket_asset_data => 'Asset Data';

	/// en: 'Incident Location'
	String get ticket_incident_location => 'Incident Location';

	/// en: 'Start Date'
	String get ticket_start_date => 'Start Date';

	/// en: 'End Date'
	String get ticket_end_date => 'End Date';

	/// en: 'Problem Details'
	String get ticket_problem_detail => 'Problem Details';

	/// en: 'Attachments'
	String get ticket_attachments => 'Attachments';

	/// en: 'Expected Resolution'
	String get ticket_expected_solution => 'Expected Resolution';

	/// en: 'Draft'
	String get status_draft => 'Draft';

	/// en: 'In Progress'
	String get status_in_progress => 'In Progress';

	/// en: 'Completed'
	String get status_completed => 'Completed';

	/// en: 'Cancel'
	String get button_cancel => 'Cancel';

	/// en: 'Save Draft'
	String get button_save_draft => 'Save Draft';

	/// en: 'Update'
	String get button_update => 'Update';

	/// en: 'Draft saved successfully'
	String get message_draft_saved => 'Draft saved successfully';

	/// en: 'Status updated successfully'
	String get message_status_updated => 'Status updated successfully';

	/// en: 'Report Title'
	String get report_title_label => 'Report Title';

	/// en: 'Enter here'
	String get report_title_hint => 'Enter here';

	/// en: 'Report Category'
	String get category_label => 'Report Category';

	/// en: 'Service Category'
	String get category_label_service => 'Service Category';

	/// en: 'Asset Type'
	String get asset_type_label => 'Asset Type';

	/// en: 'Asset Form'
	String get asset_form_label => 'Asset Form';

	/// en: 'Asset Data'
	String get asset_data_label => 'Asset Data';

	/// en: 'Incident Location'
	String get location_label => 'Incident Location';

	/// en: 'Enter here'
	String get location_hint => 'Enter here';

	/// en: 'Expected Solution'
	String get expected_solution_label => 'Expected Solution';

	/// en: 'Enter here...'
	String get expected_solution_hint => 'Enter here...';

	/// en: 'Rincian Permintaan'
	String get problem_label => 'Rincian Permintaan';

	/// en: 'Jelaskan secara singkat masalah atau kebutuhan Anda...'
	String get problem_hint => 'Jelaskan secara singkat masalah atau kebutuhan Anda...';

	/// en: 'Search OPD name...'
	String get search_opd_hint => 'Search OPD name...';

	/// en: 'Data Asset'
	String get data_asset_label => 'Data Asset';

	/// en: 'Serial Number'
	String get serial_number_label => 'Serial Number';

	/// en: 'Asset Category'
	String get asset_category_label => 'Asset Category';

	/// en: 'Sub-Category Asset'
	String get asset_subcategory_label => 'Sub-Category Asset';

	/// en: 'Select data asset'
	String get data_asset_hint => 'Select data asset';

	/// en: 'Select serial number'
	String get serial_number_hint => 'Select serial number';

	/// en: ''
	String get asset_category_hint => '';

	/// en: ''
	String get asset_subcategory_hint => '';

	/// en: ''
	String get asset_type_hint => '';

	/// en: 'Request Title'
	String get request_title_label => 'Request Title';

	/// en: 'Enter request title'
	String get request_title_hint => 'Enter request title';

	/// en: 'Service Location'
	String get service_location_label => 'Service Location';

	/// en: 'Enter service location'
	String get service_location_hint => 'Enter service location';

	/// en: 'Service Request Details'
	String get service_description_label => 'Service Request Details';

	/// en: 'Explain your service request in detail so we can better understand your needs!'
	String get service_description_hint => 'Explain your service request in detail so we can better understand your needs!';

	/// en: 'Foto profil berhasil diperbarui'
	String get photo_updated_success => 'Foto profil berhasil diperbarui';

	/// en: 'Gagal memperbarui foto profil'
	String get photo_updated_failed => 'Gagal memperbarui foto profil';

	/// en: 'Gagal!'
	String get failed => 'Gagal!';

	late final TranslationsAppValidationEn validation = TranslationsAppValidationEn._(_root);
	late final TranslationsAppErrorsEn errors = TranslationsAppErrorsEn._(_root);
	late final TranslationsAppDialogEn dialog = TranslationsAppDialogEn._(_root);
	late final TranslationsAppNotificationsEn notifications = TranslationsAppNotificationsEn._(_root);
	late final TranslationsAppReportActivityEn report_activity = TranslationsAppReportActivityEn._(_root);
	late final TranslationsAppQrEn qr = TranslationsAppQrEn._(_root);
	late final TranslationsAppDashboardEn dashboard = TranslationsAppDashboardEn._(_root);
	late final TranslationsAppRfcEn rfc = TranslationsAppRfcEn._(_root);
	late final TranslationsAppRatingEn rating = TranslationsAppRatingEn._(_root);
	late final TranslationsAppRatingDetailEn rating_detail = TranslationsAppRatingDetailEn._(_root);
	late final TranslationsAppOnboardingEn onboarding = TranslationsAppOnboardingEn._(_root);
	late final TranslationsAppMasyarakatEn masyarakat = TranslationsAppMasyarakatEn._(_root);
}

// Path: app.validation
class TranslationsAppValidationEn {
	TranslationsAppValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Report title is required'
	String get title_required => 'Report title is required';

	/// en: 'Asset type is required'
	String get asset_type_required => 'Asset type is required';

	/// en: 'Asset form is required'
	String get asset_form_required => 'Asset form is required';

	/// en: 'Asset data is required'
	String get asset_data_required => 'Asset data is required';

	/// en: 'Incident location is required'
	String get location_required => 'Incident location is required';

	/// en: 'Expected solution is required'
	String get expected_solution_required => 'Expected solution is required';

	/// en: 'Report category must be selected'
	String get category_required => 'Report category must be selected';

	/// en: 'Problem description is required'
	String get description_required => 'Problem description is required';

	/// en: 'Problem description must be at least 20 characters'
	String get description_min_length => 'Problem description must be at least 20 characters';

	/// en: 'Data asset is required'
	String get data_asset_required => 'Data asset is required';

	/// en: 'Serial number is required'
	String get serial_number_required => 'Serial number is required';

	/// en: 'Asset category is required'
	String get asset_category_required => 'Asset category is required';

	/// en: 'Sub-category asset is required'
	String get asset_subcategory_required => 'Sub-category asset is required';

	/// en: 'Request title is required'
	String get request_title_required => 'Request title is required';

	/// en: 'Service location is required'
	String get service_location_required => 'Service location is required';

	/// en: 'Service request details are required'
	String get service_description_required => 'Service request details are required';
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

	/// en: 'Cancel Report?'
	String get cancel_report_title => 'Cancel Report?';

	/// en: 'The data you entered will be lost. Are you sure?'
	String get cancel_report_message => 'The data you entered will be lost. Are you sure?';

	/// en: 'Continue Filling'
	String get continue_filling => 'Continue Filling';

	/// en: 'Cancel'
	String get cancel_report => 'Cancel';

	/// en: 'Incomplete Form'
	String get incomplete_form_title => 'Incomplete Form';

	/// en: 'Batalkan Permintaan?'
	String get cancel_request_title => 'Batalkan Permintaan?';

	/// en: 'Anda yakin ingin membatalkan pengisian formulir ini?'
	String get cancel_request_message => 'Anda yakin ingin membatalkan pengisian formulir ini?';

	/// en: 'Batalkan'
	String get cancel_request => 'Batalkan';
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

// Path: app.dashboard
class TranslationsAppDashboardEn {
	TranslationsAppDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dashboard'
	String get title => 'Dashboard';

	/// en: 'Incoming Tickets'
	String get ticket_masuk => 'Incoming Tickets';

	/// en: 'incoming tickets'
	String get ticket_masuk_desc => 'incoming tickets';

	/// en: 'Processing'
	String get proses => 'Processing';

	/// en: 'tickets being processed'
	String get proses_desc => 'tickets being processed';

	/// en: 'Deadline'
	String get deadline => 'Deadline';

	/// en: 'tickets approaching deadline'
	String get deadline_desc => 'tickets approaching deadline';

	/// en: 'Reopen'
	String get reopen => 'Reopen';

	/// en: 'reopened tickets'
	String get reopen_desc => 'reopened tickets';

	/// en: 'Reporting'
	String get pelaporan => 'Reporting';

	/// en: 'Service'
	String get pelayanan => 'Service';

	/// en: 'Search filter'
	String get filter_pencarian => 'Search filter';

	/// en: 'Category'
	String get kategori => 'Category';

	/// en: 'Type'
	String get jenis => 'Type';

	/// en: 'Form'
	String get bentuk => 'Form';

	/// en: 'Sender'
	String get pengirim => 'Sender';

	/// en: 'Entry Date'
	String get tanggal_masuk => 'Entry Date';

	/// en: 'Attachments'
	String get lampiran => 'Attachments';

	/// en: 'Action'
	String get aksi => 'Action';

	/// en: 'Showing data 1 to 10 of 15 data'
	String get showing_data => 'Showing data 1 to 10 of 15 data';

	/// en: 'Report'
	String get reportTab => 'Report';

	/// en: 'Service'
	String get serviceTab => 'Service';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Search Filter'
	String get filterTitle => 'Search Filter';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Form'
	String get form => 'Form';

	/// en: 'Type'
	String get type => 'Type';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Select category'
	String get selectCategory => 'Select category';

	/// en: 'Select form'
	String get selectForm => 'Select form';

	/// en: 'Select type'
	String get selectType => 'Select type';

	/// en: 'Select status'
	String get selectStatus => 'Select status';

	/// en: 'Category'
	String get ticket_category => 'Category';

	/// en: 'Type'
	String get ticket_type => 'Type';

	/// en: 'Form'
	String get ticket_form => 'Form';

	/// en: 'Attachment'
	String get ticket_attachment => 'Attachment';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Showing data'
	String get pagination_info => 'Showing data';

	/// en: 'to'
	String get to => 'to';

	/// en: 'of'
	String get of_total => 'of';

	/// en: 'entries'
	String get data_label => 'entries';

	/// en: 'Incoming Tickets'
	String get ticket_incoming => 'Incoming Tickets';

	/// en: 'Incoming tickets'
	String get ticket_incoming_desc => 'Incoming tickets';

	/// en: 'Processing'
	String get in_progress => 'Processing';

	/// en: 'Ticket in process'
	String get in_progress_desc => 'Ticket in process';

	/// en: 'Dashboard'
	String get menu_dashboard => 'Dashboard';

	/// en: 'My Tickets'
	String get menu_my_tickets => 'My Tickets';

	/// en: 'History'
	String get menu_history => 'History';

	/// en: 'Settings'
	String get menu_settings => 'Settings';

	/// en: 'Help'
	String get menu_help => 'Help';

	/// en: 'About'
	String get menu_about => 'About';

	/// en: 'Knowledge Base'
	String get menu_knowledge_base => 'Knowledge Base';
}

// Path: app.rfc
class TranslationsAppRfcEn {
	TranslationsAppRfcEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request for Change'
	String get rfc_title => 'Request for Change';

	/// en: 'Add'
	String get rfc_add_button => 'Add';

	/// en: 'Draft'
	String get rfc_tab_draft => 'Draft';

	/// en: 'Submitted'
	String get rfc_tab_submitted => 'Submitted';

	/// en: 'Document'
	String get rfc_document => 'Document';

	/// en: 'Date Sent'
	String get rfc_date_sent => 'Date Sent';

	/// en: 'Status'
	String get rfc_status => 'Status';

	/// en: 'Action'
	String get rfc_action => 'Action';

	/// en: 'Draft'
	String get rfc_status_draft => 'Draft';

	/// en: 'Waiting Review'
	String get rfc_status_waiting_review => 'Waiting Review';

	/// en: 'Approved'
	String get rfc_status_approved => 'Approved';

	/// en: 'Rejected'
	String get rfc_status_rejected => 'Rejected';

	/// en: 'Showing data {current} to {to} of {total} data'
	String get rfc_pagination_info => 'Showing data {current} to {to} of {total} data';

	/// en: 'Status Check Document'
	String get rfc_document_status_check => 'Status Check Document';

	/// en: 'No RFC documents available.'
	String get rfc_no_data => 'No RFC documents available.';

	/// en: 'Request for Change Form'
	String get rfc_form_title => 'Request for Change Form';

	/// en: 'Submission Title'
	String get submission_title => 'Submission Title';

	/// en: 'Enter here'
	String get submission_title_hint => 'Enter here';

	/// en: 'Applicant Name'
	String get applicant_name => 'Applicant Name';

	/// en: 'Enter here'
	String get applicant_name_hint => 'Enter here';

	/// en: 'Phone Number'
	String get phone_number => 'Phone Number';

	/// en: 'Enter here'
	String get phone_number_hint => 'Enter here';

	/// en: 'Asset Name'
	String get asset_name => 'Asset Name';

	/// en: 'Select asset'
	String get asset_name_hint => 'Select asset';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Enter here'
	String get description_hint => 'Enter here';

	/// en: 'Change Reason'
	String get change_reason => 'Change Reason';

	/// en: 'Enter here'
	String get change_reason_hint => 'Enter here';

	/// en: 'Start Date'
	String get start_date => 'Start Date';

	/// en: '15-09-2025'
	String get start_date_hint => '15-09-2025';

	/// en: 'End Date'
	String get end_date => 'End Date';

	/// en: '16-09-2025'
	String get end_date_hint => '16-09-2025';

	/// en: 'Affected Asset'
	String get affected_asset => 'Affected Asset';

	/// en: 'Select asset'
	String get affected_asset_hint => 'Select asset';

	/// en: 'Cost Estimate'
	String get cost_estimate => 'Cost Estimate';

	/// en: 'Change Impact'
	String get change_impact => 'Change Impact';

	/// en: 'Enter here'
	String get change_impact_hint => 'Enter here';

	/// en: 'Impact If Change Not Made'
	String get no_change_impact => 'Impact If Change Not Made';

	/// en: 'Enter here'
	String get no_change_impact_hint => 'Enter here';

	/// en: 'Cancel'
	String get button_cancel => 'Cancel';

	/// en: 'Save Draft'
	String get button_save_draft => 'Save Draft';

	/// en: 'Submit'
	String get button_submit => 'Submit';

	/// en: 'This field is required'
	String get validation_required => 'This field is required';

	/// en: 'Phone number is invalid'
	String get validation_phone_invalid => 'Phone number is invalid';

	/// en: 'Please select asset name'
	String get validation_asset_required => 'Please select asset name';

	/// en: 'Please select date range'
	String get validation_date_required => 'Please select date range';

	/// en: 'Please select affected asset'
	String get validation_affected_asset_required => 'Please select affected asset';

	/// en: 'Draft saved successfully'
	String get message_draft_saved => 'Draft saved successfully';

	/// en: 'RFC submitted successfully'
	String get message_submit_success => 'RFC submitted successfully';

	/// en: 'OPD Origin'
	String get opd_origin_label => 'OPD Origin';

	/// en: 'Select OPD'
	String get opd_origin_hint => 'Select OPD';

	/// en: 'Asset Data'
	String get data_asset_label => 'Asset Data';

	/// en: 'Select asset data'
	String get data_asset_hint => 'Select asset data';

	/// en: 'Serial Number'
	String get serial_number_label => 'Serial Number';

	/// en: 'Select serial number'
	String get serial_number_hint => 'Select serial number';

	/// en: 'Asset Category'
	String get asset_category => 'Asset Category';

	/// en: 'Auto-filled'
	String get asset_category_hint => 'Auto-filled';

	/// en: 'Asset Sub-Category'
	String get asset_subcategory_label => 'Asset Sub-Category';

	/// en: 'Auto-filled'
	String get asset_subcategory_hint => 'Auto-filled';

	/// en: 'Asset Type'
	String get asset_type_label => 'Asset Type';

	/// en: 'Auto-filled'
	String get asset_type_hint => 'Auto-filled';

	/// en: 'Time Estimate'
	String get time_estimate_label => 'Time Estimate';

	/// en: 'Select time estimate'
	String get time_estimate_hint => 'Select time estimate';

	/// en: 'Cost Estimate'
	String get cost_estimate_label => 'Cost Estimate';

	/// en: 'Select cost estimate'
	String get cost_estimate_hint => 'Select cost estimate';

	/// en: 'OPD origin is required'
	String get validation_opd_required => 'OPD origin is required';

	/// en: 'Asset data is required'
	String get validation_data_asset_required => 'Asset data is required';

	/// en: 'Serial number is required'
	String get validation_serial_number_required => 'Serial number is required';

	/// en: 'Asset category is required'
	String get validation_category_required => 'Asset category is required';

	/// en: 'Asset sub-category is required'
	String get validation_subcategory_required => 'Asset sub-category is required';

	/// en: 'Asset type is required'
	String get validation_asset_type_required => 'Asset type is required';

	/// en: 'Time estimate is required'
	String get validation_time_estimate_required => 'Time estimate is required';

	/// en: 'Cost estimate is required'
	String get validation_cost_estimate_required => 'Cost estimate is required';

	/// en: 'Description must be at least 20'
	String get validation_description_min_length => 'Description must be at least 20';

	/// en: 'Cancel RFC Submission?'
	String get dialog_cancel_title => 'Cancel RFC Submission?';

	/// en: 'Are you sure you want to cancel? All entered data will be lost.'
	String get dialog_cancel_message => 'Are you sure you want to cancel? All entered data will be lost.';

	/// en: 'Continue Filling'
	String get dialog_continue => 'Continue Filling';

	/// en: 'Yes, Cancel'
	String get dialog_cancel_confirm => 'Yes, Cancel';

	/// en: 'Submit RFC?'
	String get dialog_submit_title => 'Submit RFC?';

	/// en: 'Are you sure you want to submit this Request for Change?'
	String get dialog_submit_message => 'Are you sure you want to submit this Request for Change?';

	/// en: 'Yes, Submit'
	String get dialog_submit_confirm => 'Yes, Submit';
}

// Path: app.rating
class TranslationsAppRatingEn {
	TranslationsAppRatingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rating'
	String get rating_title => 'Rating';

	/// en: 'Satisfaction Rating'
	String get page_title => 'Satisfaction Rating';

	/// en: 'Ticket Rating Detail'
	String get detail_title => 'Ticket Rating Detail';

	/// en: 'Back'
	String get back_button => 'Back';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Reporting'
	String get tab_reporting => 'Reporting';

	/// en: 'Service'
	String get tab_service => 'Service';

	/// en: 'Search Filter'
	String get filter_search => 'Search Filter';

	/// en: 'Category'
	String get filter_category => 'Category';

	/// en: 'Form'
	String get filter_form => 'Form';

	/// en: 'Type'
	String get filter_type => 'Type';

	/// en: 'Rating'
	String get filter_rating => 'Rating';

	/// en: 'No data available'
	String get no_data => 'No data available';

	/// en: 'Showing data {start} to {end} of {total} data'
	String get pagination_info => 'Showing data {start} to {end} of {total} data';
}

// Path: app.rating_detail
class TranslationsAppRatingDetailEn {
	TranslationsAppRatingDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Rating'
	String get page_title => 'Rating';

	/// en: 'Sender'
	String get sender_label => 'Sender';

	/// en: 'Ticket ID'
	String get ticket_id_label => 'Ticket ID';

	/// en: 'Our Service Satisfaction Rating'
	String get satisfaction_rating_label => 'Our Service Satisfaction Rating';

	/// en: 'Comment'
	String get comment_label => 'Comment';

	/// en: 'Ease of Use'
	String get ease_of_use => 'Ease of Use';

	/// en: 'Response Speed'
	String get response_speed => 'Response Speed';

	/// en: 'Solution Quality'
	String get solution_quality => 'Solution Quality';

	/// en: 'Back'
	String get button_cancel => 'Back';
}

// Path: app.onboarding
class TranslationsAppOnboardingEn {
	TranslationsAppOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Start'
	String get start => 'Start';

	late final TranslationsAppOnboardingPage1En page1 = TranslationsAppOnboardingPage1En._(_root);
	late final TranslationsAppOnboardingPage2En page2 = TranslationsAppOnboardingPage2En._(_root);
	late final TranslationsAppOnboardingPage3En page3 = TranslationsAppOnboardingPage3En._(_root);
}

// Path: app.masyarakat
class TranslationsAppMasyarakatEn {
	TranslationsAppMasyarakatEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What do you want to report?'
	String get what_to_report => 'What do you want to report?';

	/// en: 'Describe your issue in detail...'
	String get report_hint => 'Describe your issue in detail...';

	/// en: 'Attachments (Optional)'
	String get attach_file_label => 'Attachments (Optional)';

	/// en: 'Upload supporting photos or documents (max 2 files)'
	String get attach_file_subtitle => 'Upload supporting photos or documents (max 2 files)';

	/// en: 'Full Name'
	String get name_label => 'Full Name';

	/// en: 'National ID Number'
	String get nik_label => 'National ID Number';

	/// en: 'Email'
	String get email_label => 'Email';

	/// en: 'Report description is required.'
	String get validation_description_required => 'Report description is required.';

	/// en: 'Description must contain at least 20 characters.'
	String get validation_description_min_length => 'Description must contain at least 20 characters.';

	/// en: 'The form is invalid. Please check your inputs.'
	String get validation_error_message => 'The form is invalid. Please check your inputs.';

	/// en: 'Report submitted successfully (placeholder).'
	String get submit_success_placeholder => 'Report submitted successfully (placeholder).';

	/// en: 'Draft saved successfully (placeholder).'
	String get draft_saved_placeholder => 'Draft saved successfully (placeholder).';

	/// en: 'Cancel Report?'
	String get cancel_confirmation_title => 'Cancel Report?';

	/// en: 'Unsaved changes will be lost. Are you sure you want to exit?'
	String get cancel_confirmation_message => 'Unsaved changes will be lost. Are you sure you want to exit?';

	/// en: 'No'
	String get cancel_no => 'No';

	/// en: 'Yes'
	String get cancel_yes => 'Yes';
}

// Path: app.onboarding.page1
class TranslationsAppOnboardingPage1En {
	TranslationsAppOnboardingPage1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'One App for All Services'
	String get title => 'One App for All Services';

	/// en: 'Manage complaints, service requests, and communicate with agencies through a unified platform.'
	String get body => 'Manage complaints, service requests, and communicate with agencies through a unified platform.';
}

// Path: app.onboarding.page2
class TranslationsAppOnboardingPage2En {
	TranslationsAppOnboardingPage2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Technician Tools'
	String get title => 'Technician Tools';

	/// en: 'Access tickets, update progress, and monitor SLAs directly from the app.'
	String get body => 'Access tickets, update progress, and monitor SLAs directly from the app.';
}

// Path: app.onboarding.page3
class TranslationsAppOnboardingPage3En {
	TranslationsAppOnboardingPage3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Faster Helpdesk'
	String get title => 'Faster Helpdesk';

	/// en: 'Use chat to communicate directly with operators and technicians.'
	String get body => 'Use chat to communicate directly with operators and technicians.';
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
			case 'app.confirm_logout_title': return 'Logout Confirmation';
			case 'app.confirm_logout_message': return 'Are you sure you want to logout from this account?';
			case 'app.no_data_available': return 'No Data Available';
			case 'app.upload_dialog_title': return 'Upload attachments as evidence';
			case 'app.upload_dialog_subtitle': return 'Send in pdf format';
			case 'app.upload_dialog_choose_file': return 'Choose file or Move here';
			case 'app.upload_dialog_file_format': return 'Pdf file format, maximum size 1 MB';
			case 'app.upload_dialog_status_waiting': return 'waiting';
			case 'app.upload_dialog_status_complete': return 'complete';
			case 'app.upload_dialog_cancel': return 'Cancel';
			case 'app.upload_dialog_upload': return 'Upload';
			case 'app.unknown_user': return 'Unknown User';
			case 'app.edit_profile_title': return 'Edit Profile';
			case 'app.confirmation_title': return 'Confirmation';
			case 'app.confirmation_save_changes': return 'Are you sure you want to save changes?';
			case 'app.validation_phone_required': return 'Phone number is required';
			case 'app.validation_phone_format': return 'Invalid phone number format';
			case 'app.validation_required': return 'is required';
			case 'app.profile_updated_success': return 'Profile updated successfully';
			case 'app.error': return 'Error';
			case 'app.success': return 'Success';
			case 'app.gallery': return 'Gallery';
			case 'app.camera': return 'Camera';
			case 'app.draft_saved': return 'Draft saved successfully';
			case 'app.sending_report': return 'Sending report...';
			case 'app.ok': return 'OK';
			case 'app.status': return 'Status';
			case 'app.ticket_detail': return 'Ticket Detail';
			case 'app.ticket_detail_placeholder': return 'Ticket detail page (placeholder)';
			case 'app.ticket_detail_title': return 'Ticket Detail';
			case 'app.ticket_sender': return 'Sender';
			case 'app.ticket_report_id': return 'Report ID';
			case 'app.ticket_priority': return 'Priority';
			case 'app.ticket_update_status': return 'Update Status';
			case 'app.ticket_report_title': return 'Report Title';
			case 'app.ticket_asset_category': return 'Asset Category';
			case 'app.ticket_asset_type': return 'Asset Type';
			case 'app.ticket_asset_form': return 'Asset Form';
			case 'app.ticket_asset_data': return 'Asset Data';
			case 'app.ticket_incident_location': return 'Incident Location';
			case 'app.ticket_start_date': return 'Start Date';
			case 'app.ticket_end_date': return 'End Date';
			case 'app.ticket_problem_detail': return 'Problem Details';
			case 'app.ticket_attachments': return 'Attachments';
			case 'app.ticket_expected_solution': return 'Expected Resolution';
			case 'app.status_draft': return 'Draft';
			case 'app.status_in_progress': return 'In Progress';
			case 'app.status_completed': return 'Completed';
			case 'app.button_cancel': return 'Cancel';
			case 'app.button_save_draft': return 'Save Draft';
			case 'app.button_update': return 'Update';
			case 'app.message_draft_saved': return 'Draft saved successfully';
			case 'app.message_status_updated': return 'Status updated successfully';
			case 'app.report_title_label': return 'Report Title';
			case 'app.report_title_hint': return 'Enter here';
			case 'app.category_label': return 'Report Category';
			case 'app.category_label_service': return 'Service Category';
			case 'app.asset_type_label': return 'Asset Type';
			case 'app.asset_form_label': return 'Asset Form';
			case 'app.asset_data_label': return 'Asset Data';
			case 'app.location_label': return 'Incident Location';
			case 'app.location_hint': return 'Enter here';
			case 'app.expected_solution_label': return 'Expected Solution';
			case 'app.expected_solution_hint': return 'Enter here...';
			case 'app.problem_label': return 'Rincian Permintaan';
			case 'app.problem_hint': return 'Jelaskan secara singkat masalah atau kebutuhan Anda...';
			case 'app.search_opd_hint': return 'Search OPD name...';
			case 'app.data_asset_label': return 'Data Asset';
			case 'app.serial_number_label': return 'Serial Number';
			case 'app.asset_category_label': return 'Asset Category';
			case 'app.asset_subcategory_label': return 'Sub-Category Asset';
			case 'app.data_asset_hint': return 'Select data asset';
			case 'app.serial_number_hint': return 'Select serial number';
			case 'app.asset_category_hint': return '';
			case 'app.asset_subcategory_hint': return '';
			case 'app.asset_type_hint': return '';
			case 'app.request_title_label': return 'Request Title';
			case 'app.request_title_hint': return 'Enter request title';
			case 'app.service_location_label': return 'Service Location';
			case 'app.service_location_hint': return 'Enter service location';
			case 'app.service_description_label': return 'Service Request Details';
			case 'app.service_description_hint': return 'Explain your service request in detail so we can better understand your needs!';
			case 'app.photo_updated_success': return 'Foto profil berhasil diperbarui';
			case 'app.photo_updated_failed': return 'Gagal memperbarui foto profil';
			case 'app.failed': return 'Gagal!';
			case 'app.validation.title_required': return 'Report title is required';
			case 'app.validation.asset_type_required': return 'Asset type is required';
			case 'app.validation.asset_form_required': return 'Asset form is required';
			case 'app.validation.asset_data_required': return 'Asset data is required';
			case 'app.validation.location_required': return 'Incident location is required';
			case 'app.validation.expected_solution_required': return 'Expected solution is required';
			case 'app.validation.category_required': return 'Report category must be selected';
			case 'app.validation.description_required': return 'Problem description is required';
			case 'app.validation.description_min_length': return 'Problem description must be at least 20 characters';
			case 'app.validation.data_asset_required': return 'Data asset is required';
			case 'app.validation.serial_number_required': return 'Serial number is required';
			case 'app.validation.asset_category_required': return 'Asset category is required';
			case 'app.validation.asset_subcategory_required': return 'Sub-category asset is required';
			case 'app.validation.request_title_required': return 'Request title is required';
			case 'app.validation.service_location_required': return 'Service location is required';
			case 'app.validation.service_description_required': return 'Service request details are required';
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
			case 'app.dialog.cancel_report_title': return 'Cancel Report?';
			case 'app.dialog.cancel_report_message': return 'The data you entered will be lost. Are you sure?';
			case 'app.dialog.continue_filling': return 'Continue Filling';
			case 'app.dialog.cancel_report': return 'Cancel';
			case 'app.dialog.incomplete_form_title': return 'Incomplete Form';
			case 'app.dialog.cancel_request_title': return 'Batalkan Permintaan?';
			case 'app.dialog.cancel_request_message': return 'Anda yakin ingin membatalkan pengisian formulir ini?';
			case 'app.dialog.cancel_request': return 'Batalkan';
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
			case 'app.dashboard.title': return 'Dashboard';
			case 'app.dashboard.ticket_masuk': return 'Incoming Tickets';
			case 'app.dashboard.ticket_masuk_desc': return 'incoming tickets';
			case 'app.dashboard.proses': return 'Processing';
			case 'app.dashboard.proses_desc': return 'tickets being processed';
			case 'app.dashboard.deadline': return 'Deadline';
			case 'app.dashboard.deadline_desc': return 'tickets approaching deadline';
			case 'app.dashboard.reopen': return 'Reopen';
			case 'app.dashboard.reopen_desc': return 'reopened tickets';
			case 'app.dashboard.pelaporan': return 'Reporting';
			case 'app.dashboard.pelayanan': return 'Service';
			case 'app.dashboard.filter_pencarian': return 'Search filter';
			case 'app.dashboard.kategori': return 'Category';
			case 'app.dashboard.jenis': return 'Type';
			case 'app.dashboard.bentuk': return 'Form';
			case 'app.dashboard.pengirim': return 'Sender';
			case 'app.dashboard.tanggal_masuk': return 'Entry Date';
			case 'app.dashboard.lampiran': return 'Attachments';
			case 'app.dashboard.aksi': return 'Action';
			case 'app.dashboard.showing_data': return 'Showing data 1 to 10 of 15 data';
			case 'app.dashboard.reportTab': return 'Report';
			case 'app.dashboard.serviceTab': return 'Service';
			case 'app.dashboard.refresh': return 'Refresh';
			case 'app.dashboard.filterTitle': return 'Search Filter';
			case 'app.dashboard.category': return 'Category';
			case 'app.dashboard.form': return 'Form';
			case 'app.dashboard.type': return 'Type';
			case 'app.dashboard.status': return 'Status';
			case 'app.dashboard.selectCategory': return 'Select category';
			case 'app.dashboard.selectForm': return 'Select form';
			case 'app.dashboard.selectType': return 'Select type';
			case 'app.dashboard.selectStatus': return 'Select status';
			case 'app.dashboard.ticket_category': return 'Category';
			case 'app.dashboard.ticket_type': return 'Type';
			case 'app.dashboard.ticket_form': return 'Form';
			case 'app.dashboard.ticket_attachment': return 'Attachment';
			case 'app.dashboard.view': return 'View';
			case 'app.dashboard.edit': return 'Edit';
			case 'app.dashboard.pagination_info': return 'Showing data';
			case 'app.dashboard.to': return 'to';
			case 'app.dashboard.of_total': return 'of';
			case 'app.dashboard.data_label': return 'entries';
			case 'app.dashboard.ticket_incoming': return 'Incoming Tickets';
			case 'app.dashboard.ticket_incoming_desc': return 'Incoming tickets';
			case 'app.dashboard.in_progress': return 'Processing';
			case 'app.dashboard.in_progress_desc': return 'Ticket in process';
			case 'app.dashboard.menu_dashboard': return 'Dashboard';
			case 'app.dashboard.menu_my_tickets': return 'My Tickets';
			case 'app.dashboard.menu_history': return 'History';
			case 'app.dashboard.menu_settings': return 'Settings';
			case 'app.dashboard.menu_help': return 'Help';
			case 'app.dashboard.menu_about': return 'About';
			case 'app.dashboard.menu_knowledge_base': return 'Knowledge Base';
			case 'app.rfc.rfc_title': return 'Request for Change';
			case 'app.rfc.rfc_add_button': return 'Add';
			case 'app.rfc.rfc_tab_draft': return 'Draft';
			case 'app.rfc.rfc_tab_submitted': return 'Submitted';
			case 'app.rfc.rfc_document': return 'Document';
			case 'app.rfc.rfc_date_sent': return 'Date Sent';
			case 'app.rfc.rfc_status': return 'Status';
			case 'app.rfc.rfc_action': return 'Action';
			case 'app.rfc.rfc_status_draft': return 'Draft';
			case 'app.rfc.rfc_status_waiting_review': return 'Waiting Review';
			case 'app.rfc.rfc_status_approved': return 'Approved';
			case 'app.rfc.rfc_status_rejected': return 'Rejected';
			case 'app.rfc.rfc_pagination_info': return 'Showing data {current} to {to} of {total} data';
			case 'app.rfc.rfc_document_status_check': return 'Status Check Document';
			case 'app.rfc.rfc_no_data': return 'No RFC documents available.';
			case 'app.rfc.rfc_form_title': return 'Request for Change Form';
			case 'app.rfc.submission_title': return 'Submission Title';
			case 'app.rfc.submission_title_hint': return 'Enter here';
			case 'app.rfc.applicant_name': return 'Applicant Name';
			case 'app.rfc.applicant_name_hint': return 'Enter here';
			case 'app.rfc.phone_number': return 'Phone Number';
			case 'app.rfc.phone_number_hint': return 'Enter here';
			case 'app.rfc.asset_name': return 'Asset Name';
			case 'app.rfc.asset_name_hint': return 'Select asset';
			case 'app.rfc.description': return 'Description';
			case 'app.rfc.description_hint': return 'Enter here';
			case 'app.rfc.change_reason': return 'Change Reason';
			case 'app.rfc.change_reason_hint': return 'Enter here';
			case 'app.rfc.start_date': return 'Start Date';
			case 'app.rfc.start_date_hint': return '15-09-2025';
			case 'app.rfc.end_date': return 'End Date';
			case 'app.rfc.end_date_hint': return '16-09-2025';
			case 'app.rfc.affected_asset': return 'Affected Asset';
			case 'app.rfc.affected_asset_hint': return 'Select asset';
			case 'app.rfc.cost_estimate': return 'Cost Estimate';
			case 'app.rfc.change_impact': return 'Change Impact';
			case 'app.rfc.change_impact_hint': return 'Enter here';
			case 'app.rfc.no_change_impact': return 'Impact If Change Not Made';
			case 'app.rfc.no_change_impact_hint': return 'Enter here';
			case 'app.rfc.button_cancel': return 'Cancel';
			case 'app.rfc.button_save_draft': return 'Save Draft';
			case 'app.rfc.button_submit': return 'Submit';
			case 'app.rfc.validation_required': return 'This field is required';
			case 'app.rfc.validation_phone_invalid': return 'Phone number is invalid';
			case 'app.rfc.validation_asset_required': return 'Please select asset name';
			case 'app.rfc.validation_date_required': return 'Please select date range';
			case 'app.rfc.validation_affected_asset_required': return 'Please select affected asset';
			case 'app.rfc.message_draft_saved': return 'Draft saved successfully';
			case 'app.rfc.message_submit_success': return 'RFC submitted successfully';
			case 'app.rfc.opd_origin_label': return 'OPD Origin';
			case 'app.rfc.opd_origin_hint': return 'Select OPD';
			case 'app.rfc.data_asset_label': return 'Asset Data';
			case 'app.rfc.data_asset_hint': return 'Select asset data';
			case 'app.rfc.serial_number_label': return 'Serial Number';
			case 'app.rfc.serial_number_hint': return 'Select serial number';
			case 'app.rfc.asset_category': return 'Asset Category';
			case 'app.rfc.asset_category_hint': return 'Auto-filled';
			case 'app.rfc.asset_subcategory_label': return 'Asset Sub-Category';
			case 'app.rfc.asset_subcategory_hint': return 'Auto-filled';
			case 'app.rfc.asset_type_label': return 'Asset Type';
			case 'app.rfc.asset_type_hint': return 'Auto-filled';
			case 'app.rfc.time_estimate_label': return 'Time Estimate';
			case 'app.rfc.time_estimate_hint': return 'Select time estimate';
			case 'app.rfc.cost_estimate_label': return 'Cost Estimate';
			case 'app.rfc.cost_estimate_hint': return 'Select cost estimate';
			case 'app.rfc.validation_opd_required': return 'OPD origin is required';
			case 'app.rfc.validation_data_asset_required': return 'Asset data is required';
			case 'app.rfc.validation_serial_number_required': return 'Serial number is required';
			case 'app.rfc.validation_category_required': return 'Asset category is required';
			case 'app.rfc.validation_subcategory_required': return 'Asset sub-category is required';
			case 'app.rfc.validation_asset_type_required': return 'Asset type is required';
			case 'app.rfc.validation_time_estimate_required': return 'Time estimate is required';
			case 'app.rfc.validation_cost_estimate_required': return 'Cost estimate is required';
			case 'app.rfc.validation_description_min_length': return 'Description must be at least 20';
			case 'app.rfc.dialog_cancel_title': return 'Cancel RFC Submission?';
			case 'app.rfc.dialog_cancel_message': return 'Are you sure you want to cancel? All entered data will be lost.';
			case 'app.rfc.dialog_continue': return 'Continue Filling';
			case 'app.rfc.dialog_cancel_confirm': return 'Yes, Cancel';
			case 'app.rfc.dialog_submit_title': return 'Submit RFC?';
			case 'app.rfc.dialog_submit_message': return 'Are you sure you want to submit this Request for Change?';
			case 'app.rfc.dialog_submit_confirm': return 'Yes, Submit';
			case 'app.rating.rating_title': return 'Rating';
			case 'app.rating.page_title': return 'Satisfaction Rating';
			case 'app.rating.detail_title': return 'Ticket Rating Detail';
			case 'app.rating.back_button': return 'Back';
			case 'app.rating.refresh': return 'Refresh';
			case 'app.rating.tab_reporting': return 'Reporting';
			case 'app.rating.tab_service': return 'Service';
			case 'app.rating.filter_search': return 'Search Filter';
			case 'app.rating.filter_category': return 'Category';
			case 'app.rating.filter_form': return 'Form';
			case 'app.rating.filter_type': return 'Type';
			case 'app.rating.filter_rating': return 'Rating';
			case 'app.rating.no_data': return 'No data available';
			case 'app.rating.pagination_info': return 'Showing data {start} to {end} of {total} data';
			case 'app.rating_detail.page_title': return 'Rating';
			case 'app.rating_detail.sender_label': return 'Sender';
			case 'app.rating_detail.ticket_id_label': return 'Ticket ID';
			case 'app.rating_detail.satisfaction_rating_label': return 'Our Service Satisfaction Rating';
			case 'app.rating_detail.comment_label': return 'Comment';
			case 'app.rating_detail.ease_of_use': return 'Ease of Use';
			case 'app.rating_detail.response_speed': return 'Response Speed';
			case 'app.rating_detail.solution_quality': return 'Solution Quality';
			case 'app.rating_detail.button_cancel': return 'Back';
			case 'app.onboarding.skip': return 'Skip';
			case 'app.onboarding.start': return 'Start';
			case 'app.onboarding.page1.title': return 'One App for All Services';
			case 'app.onboarding.page1.body': return 'Manage complaints, service requests, and communicate with agencies through a unified platform.';
			case 'app.onboarding.page2.title': return 'Technician Tools';
			case 'app.onboarding.page2.body': return 'Access tickets, update progress, and monitor SLAs directly from the app.';
			case 'app.onboarding.page3.title': return 'Faster Helpdesk';
			case 'app.onboarding.page3.body': return 'Use chat to communicate directly with operators and technicians.';
			case 'app.masyarakat.what_to_report': return 'What do you want to report?';
			case 'app.masyarakat.report_hint': return 'Describe your issue in detail...';
			case 'app.masyarakat.attach_file_label': return 'Attachments (Optional)';
			case 'app.masyarakat.attach_file_subtitle': return 'Upload supporting photos or documents (max 2 files)';
			case 'app.masyarakat.name_label': return 'Full Name';
			case 'app.masyarakat.nik_label': return 'National ID Number';
			case 'app.masyarakat.email_label': return 'Email';
			case 'app.masyarakat.validation_description_required': return 'Report description is required.';
			case 'app.masyarakat.validation_description_min_length': return 'Description must contain at least 20 characters.';
			case 'app.masyarakat.validation_error_message': return 'The form is invalid. Please check your inputs.';
			case 'app.masyarakat.submit_success_placeholder': return 'Report submitted successfully (placeholder).';
			case 'app.masyarakat.draft_saved_placeholder': return 'Draft saved successfully (placeholder).';
			case 'app.masyarakat.cancel_confirmation_title': return 'Cancel Report?';
			case 'app.masyarakat.cancel_confirmation_message': return 'Unsaved changes will be lost. Are you sure you want to exit?';
			case 'app.masyarakat.cancel_no': return 'No';
			case 'app.masyarakat.cancel_yes': return 'Yes';
			default: return null;
		}
	}
}

