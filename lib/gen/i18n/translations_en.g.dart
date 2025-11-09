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
	@override String get submit_report_button => 'Submit';
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
	@override String get service_request_title => 'Service Request';
	@override String get service_request_select_subtitle => 'Select the request you need';
	@override String get service_reset_password => 'Reset Password';
	@override String get service_reset_password_desc => 'Request to reset your account password';
	@override String get service_system_access => 'System Access';
	@override String get service_system_access_desc => 'Request access to applications or systems';
	@override String get service_device_request => 'Device Request';
	@override String get service_device_request_desc => 'Request work equipment or devices';
	@override String get asset_data_title => 'Asset Information';
	@override String get select_device_label => 'Select Device';
	@override String get select_system_label => 'Select System';
	@override String get select_access_type_label => 'Select Access Type';
	@override String get select_device_type_label => 'Select Device Type';
	@override String get device_count_label => 'Number of Devices';
	@override String get device_count_hint => 'Enter quantity';
	@override String get asset_id_label => 'Asset ID';
	@override String get asset_name_label => 'Asset Name';
	@override String get asset_location_label => 'Asset Location';
	@override String get service_reset_password_title => 'Password Reset Request';
	@override String get service_system_access_title => 'System Access Request';
	@override String get service_device_request_title => 'Device Request';
	@override String get service_reset_password_problem_label => 'What is your reason for resetting your password?';
	@override String get service_reset_password_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
	@override String get service_system_access_problem_label => 'What is your reason for requesting access?';
	@override String get service_system_access_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
	@override String get service_device_request_problem_label => 'Apa alasan Anda mengajukan permohonan permintaan perangkat?';
	@override String get service_device_request_problem_hint => 'Please explain the issue in detail so that we can follow up in accordance with security procedures!';
	@override String get service_reset_password_priority_label => 'Request Priority';
	@override String get service_system_access_priority_label => 'Access Priority';
	@override String get service_device_request_priority_label => 'Device Request Priority';
	@override String get attach_file_label => 'Attach File';
	@override String get additional_info_label => 'Additional Information';
	@override String get activity => 'Activity';
	@override String get notification => 'Notification';
	@override String get knowledge_base_title => 'Knowledge Base';
	@override String get knowledge_base_subtitle => 'Learn and find the solutions you need';
	@override String get search_here => 'Search here';
	@override String get faq_how_to_create_ticket => 'How to create a new ticket?';
	@override String get faq_how_to_check_ticket_status => 'How to check my ticket status?';
	@override String get faq_guide_contact_support => 'Guide to contact direct support?';
	@override String get faq_guide_reset_password => 'Guide to reset password?';
	@override String get faq_how_long_ticket_processing => 'How long does ticket processing usually take?';
	@override String get faq_what_to_do_no_response => 'What to do if the ticket hasn\'t received a response?';
	@override String get check_report_status_title => 'Report Tracking';
	@override String get check_report_status_subtitle => 'Track the status of your report';
	@override String get report_id_label => 'Report ID';
	@override String get report_id_hint => 'Enter your report ID';
	@override String get pin_label => 'PIN';
	@override String get pin_hint => 'Enter your PIN';
	@override String get search_button => 'Search';
	@override String get error_empty_fields => 'Please fill in all fields first';
	@override String get searching_report_status => 'Searching report status...';
	@override String get service_request_success_title => 'Your Request Has Been Successfully Submitted';
	@override String get service_request_success_description => 'Thank you for your submission. Your request has been recorded, and we will follow up according to procedure within the specified time. Please monitor progress through the Service Status menu.';
	@override String get service_type_request => 'Service Request';
	@override String get request_type => 'Request Type';
	@override String get downloading_ticket => 'Downloading ticket...';
	@override String get create_new_request => 'Create new request';
	@override String get edit_profile => 'Edit Profile';
	@override String get change_password => 'Change Password';
	@override String get language => 'Language';
	@override String get theme => 'Theme';
	@override String get faq => 'FAQ';
	@override String get about_us => 'About Us';
	@override String get helpdesk_title => 'Helpdesk';
	@override String get helpdesk_intro_text => 'How can we assist you today? Start a conversation with our helpdesk team for support and inquiries.';
	@override String get select_opd => 'Select OPD';
	@override String get helpdesk_empty_chat => 'No messages yet. Start the conversation now!';
	@override String get write_message => 'Write your message...';
	@override String get report_found_title => 'Report Found';
	@override String get your_report_label => 'Your Report: ';
	@override String get ticket_label => 'Ticket ID: ';
	@override String get status_label => 'Status: ';
	@override String get service_type_label => 'Service Type: ';
	@override String get destination_opd_label => 'Destination OPD: ';
	@override String get back_button => 'Back';
	@override String get my_profile => 'My Profile';
	@override String get employee => 'Employee';
	@override String get personal_info => 'Personal Info';
	@override String get work_info => 'Work Info';
	@override String get edit => 'Edit';
	@override String get birth_date => 'Birth Date';
	@override String get phone_number => 'Phone Number';
	@override String get address => 'Address';
	@override String get employee_id => 'Employee ID';
	@override String get hire_date => 'Hire Date';
	@override String get position => 'Position';
	@override String get division => 'Division';
	@override String get theme_settings_title => 'Appearance';
	@override String get theme_preference => 'Preference';
	@override String get theme_preference_subtitle => 'Choose your display preference';
	@override String get system => 'System';
	@override String get light => 'Light';
	@override String get dark => 'Dark';
	@override String get font_size => 'Font Size';
	@override String get font_size_subtitle => 'Choose your preferred font size';
	@override String get save => 'Save';
	@override String get confirm_logout_title => 'Logout Confirmation';
	@override String get confirm_logout_message => 'Are you sure you want to logout from this account?';
	@override String get no_data_available => 'No Data Available';
	@override String get upload_dialog_title => 'Upload attachments as evidence';
	@override String get upload_dialog_subtitle => 'Send in pdf format';
	@override String get upload_dialog_choose_file => 'Choose file or Move here';
	@override String get upload_dialog_file_format => 'Pdf file format, maximum size 1 MB';
	@override String get upload_dialog_status_waiting => 'waiting';
	@override String get upload_dialog_status_complete => 'complete';
	@override String get upload_dialog_cancel => 'Cancel';
	@override String get upload_dialog_upload => 'Upload';
	@override String get unknown_user => 'Unknown User';
	@override String get edit_profile_title => 'Edit Profile';
	@override String get confirmation_title => 'Confirmation';
	@override String get confirmation_save_changes => 'Are you sure you want to save changes?';
	@override String get validation_phone_required => 'Phone number is required';
	@override String get validation_phone_format => 'Invalid phone number format';
	@override String get validation_required => 'is required';
	@override String get profile_updated_success => 'Profile updated successfully';
	@override String get error => 'Error';
	@override String get success => 'Success';
	@override String get gallery => 'Gallery';
	@override String get camera => 'Camera';
	@override String get draft_saved => 'Draft saved successfully';
	@override String get sending_report => 'Sending report...';
	@override String get ok => 'OK';
	@override String get status => 'Status';
	@override String get ticket_detail => 'Ticket Detail';
	@override String get ticket_detail_placeholder => 'Ticket detail page (placeholder)';
	@override String get ticket_detail_title => 'Ticket Detail';
	@override String get ticket_sender => 'Sender';
	@override String get ticket_report_id => 'Report ID';
	@override String get ticket_priority => 'Priority';
	@override String get ticket_update_status => 'Update Status';
	@override String get ticket_report_title => 'Report Title';
	@override String get ticket_asset_category => 'Asset Category';
	@override String get ticket_asset_type => 'Asset Type';
	@override String get ticket_asset_form => 'Asset Form';
	@override String get ticket_asset_data => 'Asset Data';
	@override String get ticket_incident_location => 'Incident Location';
	@override String get ticket_start_date => 'Start Date';
	@override String get ticket_end_date => 'End Date';
	@override String get ticket_problem_detail => 'Problem Details';
	@override String get ticket_attachments => 'Attachments';
	@override String get ticket_expected_solution => 'Expected Resolution';
	@override String get status_draft => 'Draft';
	@override String get status_in_progress => 'In Progress';
	@override String get status_completed => 'Completed';
	@override String get button_cancel => 'Cancel';
	@override String get button_save_draft => 'Save Draft';
	@override String get button_update => 'Update';
	@override String get message_draft_saved => 'Draft saved successfully';
	@override String get message_status_updated => 'Status updated successfully';
	@override String get report_title_label => 'Report Title';
	@override String get report_title_hint => 'Enter here';
	@override String get category_label => 'Report Category';
	@override String get category_label_service => 'Service Category';
	@override String get asset_type_label => 'Asset Type';
	@override String get asset_form_label => 'Asset Form';
	@override String get asset_data_label => 'Asset Data';
	@override String get location_label => 'Incident Location';
	@override String get location_hint => 'Enter here';
	@override String get expected_solution_label => 'Expected Solution';
	@override String get expected_solution_hint => 'Enter here...';
	@override String get request_title_label => 'Judul Permintaan';
	@override String get request_title_hint => 'Masukkan judul permintaan layanan';
	@override String get problem_label => 'Rincian Permintaan';
	@override String get problem_hint => 'Jelaskan secara singkat masalah atau kebutuhan Anda...';
	@override String get search_opd_hint => 'Search OPD name...';
	@override late final _TranslationsAppValidationEn validation = _TranslationsAppValidationEn._(_root);
	@override late final _TranslationsAppErrorsEn errors = _TranslationsAppErrorsEn._(_root);
	@override late final _TranslationsAppDialogEn dialog = _TranslationsAppDialogEn._(_root);
	@override late final _TranslationsAppNotificationsEn notifications = _TranslationsAppNotificationsEn._(_root);
	@override late final _TranslationsAppReportActivityEn report_activity = _TranslationsAppReportActivityEn._(_root);
	@override late final _TranslationsAppQrEn qr = _TranslationsAppQrEn._(_root);
	@override late final _TranslationsAppDashboardEn dashboard = _TranslationsAppDashboardEn._(_root);
	@override late final _TranslationsAppRfcEn rfc = _TranslationsAppRfcEn._(_root);
	@override late final _TranslationsAppRatingEn rating = _TranslationsAppRatingEn._(_root);
	@override late final _TranslationsAppRatingDetailEn rating_detail = _TranslationsAppRatingDetailEn._(_root);
}

// Path: app.validation
class _TranslationsAppValidationEn extends TranslationsAppValidationId {
	_TranslationsAppValidationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title_required => 'Report title is required';
	@override String get asset_type_required => 'Asset type is required';
	@override String get asset_form_required => 'Asset form is required';
	@override String get asset_data_required => 'Asset data is required';
	@override String get location_required => 'Incident location is required';
	@override String get expected_solution_required => 'Expected solution is required';
	@override String get category_required => 'Report category must be selected';
	@override String get description_required => 'Problem description is required';
	@override String get description_min_length => 'Problem description must be at least 20 characters';
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

// Path: app.dialog
class _TranslationsAppDialogEn extends TranslationsAppDialogId {
	_TranslationsAppDialogEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get confirm_submit_title => 'Are you sure you want to submit?';
	@override String get confirm_submit_message => 'Please double-check your input before submitting!';
	@override String get confirm_yes => 'Yes, I\'m sure!';
	@override String get cancel => 'Cancel';
	@override String get data_not_found_title => 'Data not found!';
	@override String get data_not_found_message => 'Please check your input again';
	@override String get ok => 'OK';
	@override String get cancel_report_title => 'Cancel Report?';
	@override String get cancel_report_message => 'The data you entered will be lost. Are you sure?';
	@override String get continue_filling => 'Continue Filling';
	@override String get cancel_report => 'Cancel';
	@override String get incomplete_form_title => 'Incomplete Form';
	@override String get cancel_request_title => 'Batalkan Permintaan?';
	@override String get cancel_request_message => 'Anda yakin ingin membatalkan pengisian formulir ini?';
	@override String get cancel_request => 'Batalkan';
}

// Path: app.notifications
class _TranslationsAppNotificationsEn extends TranslationsAppNotificationsId {
	_TranslationsAppNotificationsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notifications';
	@override String get search_placeholder => 'Search notifications...';
	@override String get mark_all_as_read => 'Mark all as read';
	@override String get filter => 'Filter';
	@override String get type => 'Type';
	@override String get analytics => 'Analytics';
	@override String get new_ticket_assigned => 'New Ticket Assigned';
	@override String get new_message => 'New Message';
	@override String get team_update => 'Team Update';
	@override String get ticket_status_update => 'Ticket Status Update';
	@override String get new_ticket_created => 'New Ticket Created';
	@override String get time_ago => '{time} ago';
	@override String get filter_all => 'All';
	@override String get filter_read => 'Read';
	@override String get filter_unread => 'Unread';
	@override String get type_all => 'All Types';
	@override String get type_ticket => 'Ticket';
	@override String get type_message => 'Message';
	@override String get type_update => 'Update';
}

// Path: app.report_activity
class _TranslationsAppReportActivityEn extends TranslationsAppReportActivityId {
	_TranslationsAppReportActivityEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Activity History';
	@override String get search_placeholder => 'Search reports...';
	@override String get filter => 'Filter';
	@override String get filter_all => 'All';
	@override String get filter_open => 'Open';
	@override String get filter_in_progress => 'In Progress';
	@override String get filter_resolved => 'Resolved';
	@override String get filter_closed => 'Closed';
	@override String get type => 'Type';
	@override String get type_incident => 'Incident';
	@override String get type_service_request => 'Service Request';
	@override String get no_reports => 'No reports yet.';
}

// Path: app.qr
class _TranslationsAppQrEn extends TranslationsAppQrId {
	_TranslationsAppQrEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'QR Code Scanner';
	@override String get instruction => 'Align the QR code within the frame to scan automatically.';
	@override String get flash => 'Flash';
	@override String get switch_camera => 'Switch';
	@override String get result_label => 'Result';
	@override String get go_to_link => 'Go to Link';
	@override String get view_full_text => 'View Full Text';
	@override String get scan_again => 'Scan Again';
	@override String get asset_detail_title => 'Detail Aset';
	@override String get qr_preview_label => 'QR Code Preview';
	@override String get asset_id => 'Asset ID';
	@override String get asset_name => 'Asset Name';
	@override String get asset_location => 'Asset Location';
	@override String get asset_status => 'Asset Status';
	@override String get asset_type => 'Asset Type';
	@override String get create_report_based_on_asset => 'Create Report Based on This Asset';
	@override String get invalid_qr_message => 'Invalid QR data. Please scan a valid asset QR code.';
	@override String get processing => 'Processing Asset Data...';
}

// Path: app.dashboard
class _TranslationsAppDashboardEn extends TranslationsAppDashboardId {
	_TranslationsAppDashboardEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dashboard';
	@override String get ticket_masuk => 'Incoming Tickets';
	@override String get ticket_masuk_desc => 'incoming tickets';
	@override String get proses => 'Processing';
	@override String get proses_desc => 'tickets being processed';
	@override String get deadline => 'Deadline';
	@override String get deadline_desc => 'tickets approaching deadline';
	@override String get reopen => 'Reopen';
	@override String get reopen_desc => 'reopened tickets';
	@override String get pelaporan => 'Reporting';
	@override String get pelayanan => 'Service';
	@override String get filter_pencarian => 'Search filter';
	@override String get kategori => 'Category';
	@override String get jenis => 'Type';
	@override String get bentuk => 'Form';
	@override String get pengirim => 'Sender';
	@override String get tanggal_masuk => 'Entry Date';
	@override String get lampiran => 'Attachments';
	@override String get aksi => 'Action';
	@override String get showing_data => 'Showing data 1 to 10 of 15 data';
	@override String get reportTab => 'Report';
	@override String get serviceTab => 'Service';
	@override String get refresh => 'Refresh';
	@override String get filterTitle => 'Search Filter';
	@override String get category => 'Category';
	@override String get form => 'Form';
	@override String get type => 'Type';
	@override String get status => 'Status';
	@override String get selectCategory => 'Select category';
	@override String get selectForm => 'Select form';
	@override String get selectType => 'Select type';
	@override String get selectStatus => 'Select status';
	@override String get ticket_category => 'Category';
	@override String get ticket_type => 'Type';
	@override String get ticket_form => 'Form';
	@override String get ticket_attachment => 'Attachment';
	@override String get view => 'View';
	@override String get edit => 'Edit';
	@override String get pagination_info => 'Showing data';
	@override String get to => 'to';
	@override String get of_total => 'of';
	@override String get data_label => 'entries';
	@override String get ticket_incoming => 'Incoming Tickets';
	@override String get ticket_incoming_desc => 'Incoming tickets';
	@override String get in_progress => 'Processing';
	@override String get in_progress_desc => 'Ticket in process';
	@override String get menu_dashboard => 'Dashboard';
	@override String get menu_my_tickets => 'My Tickets';
	@override String get menu_history => 'History';
	@override String get menu_settings => 'Settings';
	@override String get menu_help => 'Help';
	@override String get menu_about => 'About';
	@override String get menu_knowledge_base => 'Knowledge Base';
}

// Path: app.rfc
class _TranslationsAppRfcEn extends TranslationsAppRfcId {
	_TranslationsAppRfcEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get rfc_title => 'Request for Change';
	@override String get rfc_add_button => 'Add';
	@override String get rfc_tab_draft => 'Draft';
	@override String get rfc_tab_submitted => 'Submitted';
	@override String get rfc_document => 'Document';
	@override String get rfc_date_sent => 'Date Sent';
	@override String get rfc_status => 'Status';
	@override String get rfc_action => 'Action';
	@override String get rfc_status_draft => 'Draft';
	@override String get rfc_status_waiting_review => 'Waiting Review';
	@override String get rfc_status_approved => 'Approved';
	@override String get rfc_status_rejected => 'Rejected';
	@override String get rfc_pagination_info => 'Showing data {current} to {to} of {total} data';
	@override String get rfc_document_status_check => 'Status Check Document';
	@override String get rfc_no_data => 'No RFC documents available.';
	@override String get rfc_form_title => 'Request for Change Form';
	@override String get submission_title => 'Submission Title';
	@override String get submission_title_hint => 'Enter here';
	@override String get applicant_name => 'Applicant Name';
	@override String get applicant_name_hint => 'Enter here';
	@override String get phone_number => 'Phone Number';
	@override String get phone_number_hint => 'Enter here';
	@override String get asset_category => 'Asset Category';
	@override String get asset_category_hint => 'Select category';
	@override String get asset_name => 'Asset Name';
	@override String get asset_name_hint => 'Select asset';
	@override String get description => 'Description';
	@override String get description_hint => 'Enter here';
	@override String get change_reason => 'Change Reason';
	@override String get change_reason_hint => 'Enter here';
	@override String get start_date => 'Start Date';
	@override String get start_date_hint => '15-09-2025';
	@override String get end_date => 'End Date';
	@override String get end_date_hint => '16-09-2025';
	@override String get affected_asset => 'Affected Asset';
	@override String get affected_asset_hint => 'Select asset';
	@override String get cost_estimate => 'Cost Estimate';
	@override String get cost_estimate_hint => '';
	@override String get change_impact => 'Change Impact';
	@override String get change_impact_hint => 'Enter here';
	@override String get no_change_impact => 'Impact If Change Not Made';
	@override String get no_change_impact_hint => 'Enter here';
	@override String get button_cancel => 'Cancel';
	@override String get button_save_draft => 'Save Draft';
	@override String get button_submit => 'Submit';
	@override String get validation_required => 'This field is required';
	@override String get validation_phone_invalid => 'Phone number is invalid';
	@override String get validation_category_required => 'Please select asset category';
	@override String get validation_asset_required => 'Please select asset name';
	@override String get validation_date_required => 'Please select date range';
	@override String get validation_affected_asset_required => 'Please select affected asset';
	@override String get message_draft_saved => 'Draft saved successfully';
	@override String get message_submit_success => 'RFC submitted successfully';
}

// Path: app.rating
class _TranslationsAppRatingEn extends TranslationsAppRatingId {
	_TranslationsAppRatingEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get rating_title => 'Rating';
	@override String get page_title => 'Satisfaction Rating';
	@override String get detail_title => 'Ticket Rating Detail';
	@override String get back_button => 'Back';
	@override String get refresh => 'Refresh';
	@override String get tab_reporting => 'Reporting';
	@override String get tab_service => 'Service';
	@override String get filter_search => 'Search Filter';
	@override String get filter_category => 'Category';
	@override String get filter_form => 'Form';
	@override String get filter_type => 'Type';
	@override String get filter_rating => 'Rating';
	@override String get no_data => 'No data available';
	@override String get pagination_info => 'Showing data {start} to {end} of {total} data';
}

// Path: app.rating_detail
class _TranslationsAppRatingDetailEn extends TranslationsAppRatingDetailId {
	_TranslationsAppRatingDetailEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get page_title => 'Rating';
	@override String get sender_label => 'Sender';
	@override String get ticket_id_label => 'Ticket ID';
	@override String get satisfaction_rating_label => 'Our Service Satisfaction Rating';
	@override String get comment_label => 'Comment';
	@override String get ease_of_use => 'Ease of Use';
	@override String get response_speed => 'Response Speed';
	@override String get solution_quality => 'Solution Quality';
	@override String get button_cancel => 'Back';
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
			case 'app.request_title_label': return 'Judul Permintaan';
			case 'app.request_title_hint': return 'Masukkan judul permintaan layanan';
			case 'app.problem_label': return 'Rincian Permintaan';
			case 'app.problem_hint': return 'Jelaskan secara singkat masalah atau kebutuhan Anda...';
			case 'app.search_opd_hint': return 'Search OPD name...';
			case 'app.validation.title_required': return 'Report title is required';
			case 'app.validation.asset_type_required': return 'Asset type is required';
			case 'app.validation.asset_form_required': return 'Asset form is required';
			case 'app.validation.asset_data_required': return 'Asset data is required';
			case 'app.validation.location_required': return 'Incident location is required';
			case 'app.validation.expected_solution_required': return 'Expected solution is required';
			case 'app.validation.category_required': return 'Report category must be selected';
			case 'app.validation.description_required': return 'Problem description is required';
			case 'app.validation.description_min_length': return 'Problem description must be at least 20 characters';
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
			case 'app.rfc.asset_category': return 'Asset Category';
			case 'app.rfc.asset_category_hint': return 'Select category';
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
			case 'app.rfc.cost_estimate_hint': return '';
			case 'app.rfc.change_impact': return 'Change Impact';
			case 'app.rfc.change_impact_hint': return 'Enter here';
			case 'app.rfc.no_change_impact': return 'Impact If Change Not Made';
			case 'app.rfc.no_change_impact_hint': return 'Enter here';
			case 'app.rfc.button_cancel': return 'Cancel';
			case 'app.rfc.button_save_draft': return 'Save Draft';
			case 'app.rfc.button_submit': return 'Submit';
			case 'app.rfc.validation_required': return 'This field is required';
			case 'app.rfc.validation_phone_invalid': return 'Phone number is invalid';
			case 'app.rfc.validation_category_required': return 'Please select asset category';
			case 'app.rfc.validation_asset_required': return 'Please select asset name';
			case 'app.rfc.validation_date_required': return 'Please select date range';
			case 'app.rfc.validation_affected_asset_required': return 'Please select affected asset';
			case 'app.rfc.message_draft_saved': return 'Draft saved successfully';
			case 'app.rfc.message_submit_success': return 'RFC submitted successfully';
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
			default: return null;
		}
	}
}

