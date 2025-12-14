import 'package:injectable/injectable.dart';
import '../models/teknisi_dashboard_summary_model.dart';
import '../repositories/teknisi_home_repository.dart';

@lazySingleton
class GetTeknisiDashboardSummaryUseCase {
  final TeknisiHomeRepository repository;

  GetTeknisiDashboardSummaryUseCase(this.repository);

  Future<TeknisiDashboardSummaryModel> call() {
    return repository.getDashboardSummary();
  }
}