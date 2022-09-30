import 'package:flutter/material.dart';
import 'UserPage.dart';
import 'HelpPage.dart';
import 'AdminPage.dart';

//https://www.youtube.com/watch?v=_hJsBUUWDmc&ab_channel=FelipeCasseb
//Esconder senha

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginInstance();
}

class LoginInstance extends State<Login> {

  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  IconData iconPassword = Icons.visibility;

  @override
  void dispose(){
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text("MYMEAL"),
          backgroundColor: Colors.yellow,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(0,5,0,5),
              child: Image.asset('claco.jpg')),
      ),
      body: Center(
        child:
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Image.asset('logo_fundo.png', width: 400, height: 250,),
                  //TÍTULO GRANDÃO
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    /*child: const Text(
                      "MyMeal",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 80,
                      ),
                    )
                  ),

                  //SUBTÍTULO
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "MYMEAL",
                      style: TextStyle(fontSize: 20),
                    ),*/
                  ),

                  //ENTRADA USUÁRIO
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome de Usuário",
                      ),
                    ),
                  ),


                  //ENTRADA SENHA
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      obscureText: obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha",
                        prefixIcon: Icon(Icons.password),
                       suffixIcon: IconButton(
                           onPressed:(){
                             if(obscureText == true) {
                               setState(() {
                                 obscureText = false;
                                 iconPassword = Icons.visibility_off;
                               });
                             }else{
                               setState(() {
                                 obscureText = true;
                                 iconPassword = Icons.visibility;
                               });
                             }
                           },
                         icon: Icon(iconPassword),
                       )
                      ),
                    ),
                  ),

                  //BOTÃO DE ESQUECI A SENHA
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HelpPage())
                        );
                      },
                      child: const Text("Esqueci a senha.")
                  ),

                  //Botão de LOGIN
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if(userController.text == "admin" && passwordController.text == "admin"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage())
                          );
                        }else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage())
                          );
                        }


                      }, //onPressed
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não possui conta?"),
                      TextButton(
                        child: const Text(
                            "Contate seu administrador",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HelpPage())
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),

      ),
    );
  }
  
}



