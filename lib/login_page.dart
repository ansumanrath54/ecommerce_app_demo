import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final auth=FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late String email;
  late String password;

  void validate() {
    if(loginFormKey.currentState!.validate()) {
      print('Validated');
    }
    else {
      print('Not validated');
    }
  }

  String? validateInput(value) {
    if(value!.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Login in to get started', style: TextStyle(fontSize: 25)),
              SizedBox(height: 15),
              Text('Experience the all new App!', style: TextStyle(fontSize: 23)),
              SizedBox(height: 50),
              TextFormField(
                validator: validateInput,
                onChanged: (value){
                  email=value;
                },
                decoration: InputDecoration(labelText: 'E-mail ID',
                    prefixIcon: Image.asset('assets/email-24px.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validateInput,
                onChanged: (value){
                  password=value;
                },
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Use Mobile Number', style: TextStyle(color: Colors.orangeAccent, fontSize: 16),),
                  )
                ],
              ),
              SizedBox(height: 270),
              MaterialButton(
                onPressed: () {
                  validate();
                  loginUser();
                },
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.orangeAccent,
                child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: 13.4),
            ],
          ),
        ),
      ),
    );
  }

  void loginUser() async{
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((FirebaseUser) async{
      const snackBar = SnackBar(
        content: Text("You're successfully logged in!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    })
        .catchError((e){
      print(e);
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Alert!"),
        content: const Text("Invalid Email or Password"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
      );
    });
  }
}
