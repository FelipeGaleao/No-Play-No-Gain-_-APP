import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;
abstract class _CadastroControllerBase with Store {
  /* Carregando dados da Autenticação do Firebase */



@observable
String senha = "caraio";
@observable
String image = "";

@observable
String endereco = "";

@observable
String telefone = "";
@observable
String doencaAfs = "";
@observable
String Dx = "";  
  void verificarCadastro(String username) async{
  Future<void> getName() async {
  var ds = await 
  Firestore.instance.collection('informacoes').document(username).get();
  doencaAfs = ds['doencaAfs'];
  Future.delayed(const Duration(seconds: 3), () {
});
}
getName();
    }
 void direcionar(String username){
   verificarCadastro('${username}');
  Dx = doencaAfs;
 }
}    
