import 'package:ecommerce_app_mock/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final auth = FirebaseAuth.instance;
  late String name;
  late String email;
  late String phone;
  late String password;
  late String confirmPassword;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void validate() {
    if(signupFormKey.currentState!.validate()) {
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
          key: signupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Register in to get started', style: TextStyle(fontSize: 25)),
              SizedBox(height: 15),
              Text('Experience the all new App!', style: TextStyle(fontSize: 23)),
              SizedBox(height: 30),
              TextFormField(
                validator: validateInput,
                onChanged: (value){
                  name=value;
                },
                decoration: InputDecoration(labelText: 'Name',
                  prefixIcon: Image.asset('assets/person.png')),
              ),
              SizedBox(height: 20),
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
                  phone=value;
                },
                decoration: InputDecoration(labelText: 'Mobile Number',
                    prefixIcon: Image.asset('assets/phone-24px.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validateInput,
                onChanged: (value){
                  password=value;
                },
                decoration: InputDecoration(labelText: 'Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
                  obscureText: true
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validateInput,
                onChanged: (value){
                  confirmPassword=value;
                },
                decoration: InputDecoration(labelText: 'Confirm Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
                  obscureText: true
              ),
              SizedBox(height: 70),
              MaterialButton(
                onPressed: () {
                  validate();
                  signUpUser();
                },
                minWidth: double.infinity,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.orangeAccent,
                child: Text('REGISTER', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: 13.4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    if(password.toString() == confirmPassword.toString())
    {
      try{
        await auth.createUserWithEmailAndPassword(
          email: email, password: password,).then((value) async {
          await auth.currentUser!.updateDisplayName(name);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      }
      catch(e){
        if(password.length < 6) {
          showDialog(context: context, builder: (ctx) => AlertDialog(
            title: const Text("Information"),
            content: const Text("Please enter a valid password"),
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
        }
        else {
          showDialog(context: context, builder: (ctx) => AlertDialog(
            title: const Text("Information"),
            content: const Text("Please input correct email"),
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
        }
      }
    }
    else {
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Alert!"),
        content: const Text("Password did not match"),
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
    }
  }
}
