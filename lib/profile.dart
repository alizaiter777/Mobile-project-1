import 'package:flutter/material.dart';
import 'user.dart';


class Profile extends StatelessWidget {
  final User user;

  Profile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  SizedBox(width: 200, height: 50, child:
          Text('Welcome ${user.name}',
            style: TextStyle(fontSize: 20 ,color:Colors.blue),
          ),
          ),

            if (user.gender.toLowerCase() == 'male')
              Image.asset('/male.png', width: 100, height: 100),
            if (user.gender.toLowerCase() == 'female')
              Image.asset('/female.png', width: 100, height: 100),
            SizedBox(width: 200, height: 50, child:
            Text('Basic information',
              style: TextStyle(fontSize: 20 ,color:Colors.blue),
            ),
            ),
            SizedBox(width: 200, height: 50, child:
            Text('Name: ${user.name}',
              style: TextStyle(fontSize: 20 ),
            ),
            ),
            SizedBox(width: 200, height: 50, child:
            Text('Email: ${user.email}',
              style: TextStyle(fontSize: 20),
            ),
            ),
            SizedBox(width: 200, height: 50, child:
            Text('Phone: ${user.phone}',
              style: TextStyle(fontSize: 20 ),
            ),
            ),
          ],
        ),
      ),

    );
  }
}
