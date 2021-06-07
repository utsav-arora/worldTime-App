import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgimage = data['isDaytime'] ? 'day.png':'night.png';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () async  {
               dynamic result = await Navigator.pushNamed(context, '/location');
               setState(() {
                 data = {'location':result['location'],
                 'time' : result['time'],
                   'isDaytime':result['isDaytime'],
                   'flag' : result['flag']
                 };
               });
              },
              label: Text('Edit Location',
              style: TextStyle(
                color: Colors.white,
              ),),
              icon: Icon(Icons.edit_location,
              color: Colors.white,),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 70.0,
                color: Colors.white,
              ),
            ),
          ],
          ),
          ),
        ),
      ),
    );
  }
}
