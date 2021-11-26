import 'package:ecommerce_app_mock/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              Text('Register in to get started', style: TextStyle(fontSize: 25)),
              SizedBox(height: 15),
              Text('Experience the all new App!', style: TextStyle(fontSize: 23)),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name',
                  prefixIcon: Image.asset('assets/person.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail ID',
                    prefixIcon: Image.asset('assets/email-24px.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number',
                    prefixIcon: Image.asset('assets/phone-24px.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password',
                    prefixIcon: Image.asset('assets/Icon ionic-ios-lock.png'),
                    suffixIcon: Image.asset('assets/Icon awesome-eye.png')),
              ),
              SizedBox(height: 70),
              MaterialButton(
                onPressed: () { },
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
}
