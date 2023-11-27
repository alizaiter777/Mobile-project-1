import 'package:flutter/material.dart';
import 'chat.dart';
import 'profile.dart'; // Import your Profile page

import 'user.dart';


class Home extends StatefulWidget {
  final User user;

  Home({required this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [Padding(
        padding: EdgeInsets.symmetric(vertical: 5),child:
        SizedBox(width: 400, height: 150, child:
            HouseItem('/House1.png', 'House1' ),),),
            Text(' Beirut                                    100,000 dollar '
              ,
              style: TextStyle(fontSize: 16,color:Colors.blue),
            ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),child:
        SizedBox(width: 400, height: 150, child:
            HouseItem('/House2.png', 'House2'),),),
            Text(' Baalbek                                    200,000 dollar '
              ,
              style: TextStyle(fontSize: 16,color:Colors.blue),
            ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2),child:
        SizedBox(width: 400, height: 150, child:
            HouseItem('/House3.png', 'House3'),),
      ),
            SizedBox(height: 8), // Adjust the spacing between the image and text
            Text(' Tyre                                    300,000 dollar '
              ,
              style: TextStyle(fontSize: 16,color:Colors.blue),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
            } else if (_currentIndex == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(user: widget.user)));
            }
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HouseItem extends StatelessWidget {
  final String assetName;
  final String pictureName;

  HouseItem(this.assetName, this.pictureName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Container(


        child: Image.asset(assetName,  fit: BoxFit.cover),

      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HouseDetail(pictureName)));
      },
    );
  }
}

class HouseDetail extends StatelessWidget {
  final String pictureName;

  HouseDetail(this.pictureName);
  Widget getDetailWidget() {
    String detailImage;
    String detailText;

    if (pictureName == 'House1') {
      detailImage = 'house11.png';
      detailText = '100,000 Dollar \n '
          'This house is located in the Beirut area \n '
          'and consists from 3 rooms : \n'
          '1 Living room \n '
          '1 Master Bedroom \n'
          '1 Bedroom \n'
          '1 Guest room\n'
          '1 Kitchen\n'
          '2 Bathroom\n'
          'for more info contact the Agent  \n';
    } else if (pictureName == 'House2') {
      detailImage = 'house22.png';
      detailText = '200,000 Dollar \n '
          'This house is located in the Baalbek area \n '
          'and consists from 4 rooms : \n'
          '1 Living room \n '
          '3 Bedroom \n'
          '1 Machine room\n'
          '1 Kitchen\n'
          '2 Bathroom\n'
          '1 Sauna\n'
          'for more info contact the Agent  \n';
    } else {
      detailImage = 'House33.png';
      detailText = '300,000 Dollar \n '
          'This house is located in the Tyre area \n '
          'and consists from 4 rooms : \n'
          '1 Living room \n'
          '1 Master bedroom \n'
          '2 Bedroom\n'
          '1 Dining room '
          '1 Kitchen\n'
          '2 Bathroom\n'
          '1 Laundry room\n'

          'for more info contact the Agent  \n';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('/$detailImage', width: 600, height: 300, fit: BoxFit.cover),
        SizedBox(height: 20),
        Text(
          detailText,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details about $pictureName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getDetailWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
              },
              child: Text('Chat with Agent'),
            ),
          ],
        ),
      ),
    );
  }
}