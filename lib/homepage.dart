import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Rectangle 23.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                //SizedBox(width: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Image.asset('assets/Icon ionic-ios-heart.png'),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            shadowColor: Colors.black,
                            primary: Colors.white, // <-- Button color
                            onPrimary: Colors.red, // <-- Splash color
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Image.asset('assets/Icon awesome-share.png'),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                            shadowColor: Colors.black,
                            primary: Colors.white, // <-- Button color
                            onPrimary: Colors.red, // <-- Splash color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(
                    dotsCount: 4,
                    position: 0
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Eyevy', style: TextStyle(fontSize: 20),),
                SizedBox(height: 15),
                Text('Full Rim Round, Cat eyed Anti Glare Frame (48 mm)', style: TextStyle(fontSize: 20),),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('₹ 219', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(width: 15),
                    Text('₹999', style: TextStyle(fontSize: 25, decoration: TextDecoration.lineThrough, color: Colors.black54)),
                    SizedBox(width: 15),
                    Text('78% off', style: TextStyle(fontSize: 25, color: Colors.green)),
                  ],
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () { },
                      child: Text('ADD TO CART'),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                    ),
                    SizedBox(width: 50),
                    RaisedButton(
                      onPressed: () { },
                      child: Text('ADD TO CART'),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
