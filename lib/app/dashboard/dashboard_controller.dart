import 'package:health/health.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  @observable
  int value = 0;
  @observable
  int passos = 0;
  @observable
  int passosTotal = 0;
  @action
  void increment() {
    value++;
  }
  void atualizarPassosHoje() async {
    List<HealthDataType> types = [
      HealthDataType.STEPS,
    ];
    DateTime agora = DateTime.now();
    DateTime startDate = DateTime.utc(agora.year, agora.month, agora.day);
    DateTime endDate = DateTime.now();

    List<HealthDataPoint> healthDataList = List<HealthDataPoint>();

    Future.delayed(Duration(milliseconds: 100), () async {
      bool isAuthorized = await Health.requestAuthorization();
      if (isAuthorized) {
        for (HealthDataType type in types) {
          /// Calls to 'Health.getHealthDataFromType' must be wrapped in a try catch block.
          try {
            List<HealthDataPoint> healthData = await Health.getHealthDataFromType(startDate, endDate, type);
            healthDataList.addAll(healthData);
          } catch (exception) {
          }
        }
      }
      passos = 0; 
      /// Do something with the health data list
      for (var healthData in healthDataList) {
        passos = passos + healthData.value.toInt();
      }
      passosTotal = passos;
    });
  }
  @action
  void verificarPassos(){
    atualizarPassosHoje();
    passosTotal = passos;
  }
}
