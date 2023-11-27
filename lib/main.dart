import 'package:flutter/material.dart';
import 'user.dart';
import 'home.dart';
import 'chat.dart';
// Ali Al Reda Zaiter id : 12131728
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Real Estate App',
      initialRoute: '/', // Set the initial route to '/'
      routes: {

        '/': (context) => RegistrationPage(), // Registration page as the initial route
       // Create an instance of Home
        '/chat': (context) => Chat(),

      },
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final User user = User();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  void _registerAndNavigateToHome(BuildContext context) {
    user.name = nameController.text;
    user.email = emailController.text;
    user.phone = phoneController.text;
    user.gender = genderController.text;
    bool isRegistered = true;

    if (isRegistered) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home(user:user)),
            (route) => false, // This line removes all the routes from the stack
      );

    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(width: 200, height: 50, child:
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
          SizedBox(width: 200, height: 50, child:
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
          ),
          SizedBox(width: 200, height: 50, child:
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
          ),
          SizedBox(width: 200, height: 50, child:
              TextField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
          ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _registerAndNavigateToHome(context),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
