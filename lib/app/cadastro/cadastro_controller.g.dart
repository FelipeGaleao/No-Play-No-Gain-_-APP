// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$senhaAtom = Atom(name: '_CadastroControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$imageAtom = Atom(name: '_CadastroControllerBase.image');

  @override
  String get image {
    _$imageAtom.context.enforceReadPolicy(_$imageAtom);
    _$imageAtom.reportObserved();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.context.conditionallyRunInAction(() {
      super.image = value;
      _$imageAtom.reportChanged();
    }, _$imageAtom, name: '${_$imageAtom.name}_set');
  }

  final _$enderecoAtom = Atom(name: '_CadastroControllerBase.endereco');

  @override
  String get endereco {
    _$enderecoAtom.context.enforceReadPolicy(_$enderecoAtom);
    _$enderecoAtom.reportObserved();
    return super.endereco;
  }

  @override
  set endereco(String value) {
    _$enderecoAtom.context.conditionallyRunInAction(() {
      super.endereco = value;
      _$enderecoAtom.reportChanged();
    }, _$enderecoAtom, name: '${_$enderecoAtom.name}_set');
  }

  final _$telefoneAtom = Atom(name: '_CadastroControllerBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.context.enforceReadPolicy(_$telefoneAtom);
    _$telefoneAtom.reportObserved();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.context.conditionallyRunInAction(() {
      super.telefone = value;
      _$telefoneAtom.reportChanged();
    }, _$telefoneAtom, name: '${_$telefoneAtom.name}_set');
  }

  final _$doencaAfsAtom = Atom(name: '_CadastroControllerBase.doencaAfs');

  @override
  String get doencaAfs {
    _$doencaAfsAtom.context.enforceReadPolicy(_$doencaAfsAtom);
    _$doencaAfsAtom.reportObserved();
    return super.doencaAfs;
  }

  @override
  set doencaAfs(String value) {
    _$doencaAfsAtom.context.conditionallyRunInAction(() {
      super.doencaAfs = value;
      _$doencaAfsAtom.reportChanged();
    }, _$doencaAfsAtom, name: '${_$doencaAfsAtom.name}_set');
  }

  final _$DxAtom = Atom(name: '_CadastroControllerBase.Dx');

  @override
  String get Dx {
    _$DxAtom.context.enforceReadPolicy(_$DxAtom);
    _$DxAtom.reportObserved();
    return super.Dx;
  }

  @override
  set Dx(String value) {
    _$DxAtom.context.conditionallyRunInAction(() {
      super.Dx = value;
      _$DxAtom.reportChanged();
    }, _$DxAtom, name: '${_$DxAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'senha: ${senha.toString()},image: ${image.toString()},endereco: ${endereco.toString()},telefone: ${telefone.toString()},doencaAfs: ${doencaAfs.toString()},Dx: ${Dx.toString()}';
    return '{$string}';
  }
}
