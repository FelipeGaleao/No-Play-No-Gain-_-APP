// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$valueAtom = Atom(name: '_DashboardControllerBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$passosAtom = Atom(name: '_DashboardControllerBase.passos');

  @override
  int get passos {
    _$passosAtom.context.enforceReadPolicy(_$passosAtom);
    _$passosAtom.reportObserved();
    return super.passos;
  }

  @override
  set passos(int value) {
    _$passosAtom.context.conditionallyRunInAction(() {
      super.passos = value;
      _$passosAtom.reportChanged();
    }, _$passosAtom, name: '${_$passosAtom.name}_set');
  }

  final _$passosTotalAtom = Atom(name: '_DashboardControllerBase.passosTotal');

  @override
  int get passosTotal {
    _$passosTotalAtom.context.enforceReadPolicy(_$passosTotalAtom);
    _$passosTotalAtom.reportObserved();
    return super.passosTotal;
  }

  @override
  set passosTotal(int value) {
    _$passosTotalAtom.context.conditionallyRunInAction(() {
      super.passosTotal = value;
      _$passosTotalAtom.reportChanged();
    }, _$passosTotalAtom, name: '${_$passosTotalAtom.name}_set');
  }

  final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_DashboardControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verificarPassos() {
    final _$actionInfo =
        _$_DashboardControllerBaseActionController.startAction();
    try {
      return super.verificarPassos();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'value: ${value.toString()},passos: ${passos.toString()},passosTotal: ${passosTotal.toString()}';
    return '{$string}';
  }
}
