import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Login in to get started', style: TextStyle(fontSize: 25)),
              SizedBox(height: 15),
              Text('Experience the all new App!', style: TextStyle(fontSize: 23)),
              SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail ID',
                    prefixIcon: Image.asset('assets/email-24px.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () { },
                    child: Text('Use Mobile Number', style: TextStyle(color: Colors.orangeAccent, fontSize: 16),),
                  )
                ],
              ),
              SizedBox(height: 270),
              MaterialButton(
                onPressed: () { },
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
}
