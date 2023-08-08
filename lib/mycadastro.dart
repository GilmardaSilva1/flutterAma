// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  int RA = 0;
  String nome = "";

  TextEditingController campoRA = TextEditingController();
  TextEditingController campnome = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [
        Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
              controller: campoRA,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              
              validator: (value) {
                if(value!.isEmpty){
                  return("O RA não pode ser vazio");
                  mostrarMsgSucesso();
                }else{
                  if(int.parse(campoRA.text)<10){
                    return ("O RA deve ser maior que 10");
                  }
                }
                return null;
              },
            ),
            TextFormField(
              controller: campnome,
              validator: (value) {
                if(value!.isEmpty){
                  return("O nome não pdoe ser vazio");
                  mostrarMsgSucesso();
                }else{
                  if(campnome.text.length<5){
                    return("O nome precisa ter mais que 5 caracteres");
                  }
                }
                return null;
              },
            ),
                ],
              )
            ),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate())
              {
              RA = int.parse(campoRA.text);
              nome = campnome.text;
              setState(() {
                
              });
              }
              
            }, child: Text("Cadastrar")),
            Text("Valores digitados : $RA, $nome")
          ],
        ),],
        ),),
      );

  }
  //método
  void mostrarMsgSucesso(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Aluno cadastro com sucesso')));
  }
}