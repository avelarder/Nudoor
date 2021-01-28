import 'package:nudoor/Services/Auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String repassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text('Regístrate'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label:
                Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'email@email.com',
                  labelText: 'Email *',
                ),
                validator: (val) =>
                    val.isEmpty ? 'Ingresa un email válido' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.security),
                  hintText: '',
                  labelText: 'Contraseña *',
                ),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Ingrese una contraseña de por lo menos 6 caracteres'
                    : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.security),
                  hintText: '',
                  labelText: 'Reingrese su contraseña *',
                ),
                obscureText: true,
                validator: (val) => val.length < 6
                    ? 'Ingresa una contraseña de por lo menos 6 caracteres'
                    : val != password ? 'Las constraseñas no coinciden' : null,
                onChanged: (val) {
                  setState(() => repassword = val);
                },
              ),
              SizedBox(height: 30.0),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Registrar',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error =
                              'Ups! Algo anda mal o la información proporcionada no es correcta. Vuelve a intentar.';
                        });
                      }
                    }
                  }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
