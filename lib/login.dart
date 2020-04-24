import 'package:flutter/material.dart';
import 'package:testingapp/Utils/uidata.dart';
import 'package:testingapp/home.dart';

class LoginPage  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(context),
      ),
    );
}

  loginBody(context) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[loginHeader(context), loginFields(context)],
    ),
  );

  loginHeader(context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      FlutterLogo(
        colors: Colors.blue,
        size: 80.0,
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        "Bienvenido a ${UIData.appName}",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor),
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        "Ingrese sus credenciales para continuar",
        style: TextStyle(color: Colors.grey),
      ),
    ],
  );

  loginFields(context) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Nombre de usuario o email",
              labelText: "Usuario o email",
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Ingrese su contraseña",
              labelText: "Contraseña",
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(12.0),
            shape: StadiumBorder(),
            child: Text(
              "Autenticar",
              style: TextStyle(color: Colors.white),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "NUEVO EN NOODOR, REGISTRESE AQUI.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}