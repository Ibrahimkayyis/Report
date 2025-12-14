part of 'rfc_form_cubit.dart';

enum AssetStatus { initial, loading, success, failure }
enum FormSubmitStatus { initial, submitting, success, failure }

class RfcFormState extends Equatable {
  final List<ConfigurationItemModel> assets;
  final AssetStatus assetStatus;
  final FormSubmitStatus formStatus;
  final String? errorMessage;

  const RfcFormState({
    this.assets = const [],
    this.assetStatus = AssetStatus.initial,
    this.formStatus = FormSubmitStatus.initial,
    this.errorMessage,
  });

  RfcFormState copyWith({
    List<ConfigurationItemModel>? assets,
    AssetStatus? assetStatus,
    FormSubmitStatus? formStatus,
    String? errorMessage,
  }) {
    return RfcFormState(
      assets: assets ?? this.assets,
      assetStatus: assetStatus ?? this.assetStatus,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage, // Error message tidak dipersist jika null
    );
  }

  @override
  List<Object?> get props => [assets, assetStatus, formStatus, errorMessage];
}