import 'package:flutter/material.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/planview.dart';

class PlanPage extends StatelessWidget {
  final Plan plans;

  const PlanPage({Key key, this.plans}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyPlanPageState(
      plans: this.plans,
    );
  }
}

class MyPlanPageState extends StatefulWidget {
  final Plan plans;

  const MyPlanPageState({Key key, this.plans}) : super(key: key);
  _MyPlanPageState createState() => _MyPlanPageState(plans: this.plans);
}

class _MyPlanPageState extends State<MyPlanPageState> {
  final Plan plans;

  _MyPlanPageState({this.plans});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3248),
      ),
      body: Container(
          child: PlansCard(
        plans: plans,
        item: plans,
        selected: false,
      )),
    );
  }
}
