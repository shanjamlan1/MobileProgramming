import 'package:mob_prog_project/data/plan/plan_database.dart';

class PlanRepository {
  Future getPlan() => PlanDatabaseService().getPlan();
  Future getQueryPlan(String query) =>
      PlanDatabaseService().getPlanQuery(query);
}
