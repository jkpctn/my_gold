import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gold/config/routes.dart';
import 'package:my_gold/resource/data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String date = '20 กันยายน 2563';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          {
            //Navigator.of(context).pushNamed(AppRoutes.showBuyOrder);
            break;
          }
        case 1:
          {
            Navigator.of(context)
                .pushNamed(AppRoutes.showBuyOrder, arguments: tmpOrders);
            break;
          }
        case 2:
          {
            //Navigator.of(context).pushNamed(AppRoutes.showBuyOrder);
            break;
          }
      }
    });
  }

  List<BuyOrder> tmpOrders = [];
  _navigateAndDisplayAddData(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.of(context).pushNamed(AppRoutes.addBuyOrder);
    if (result != null) {
      tmpOrders.add(result);
      _scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("เพิ่ม 1 รายการสำเร็จ"),
            ],
          ),
        ));
    }
    setState(() {});
  }

  void selectDate() {}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaeaea),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'วันที่',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: Colors.black12,
                      child: Text(
                        '$date',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.event_available),
                      color: Colors.black,
                      onPressed: selectDate,
                    ),
                  ],
                ),
                Text(
                  'ซื้อเข้า - ขายออก',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () => {_navigateAndDisplayAddData(context)},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              color: Colors.transparent,
                              child: Image(
                                width: 90,
                                height: 90,
                                image: AssetImage('images/buy_gold.png'),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ซื้อเข้า',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '${tmpOrders.length} items',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            color: Colors.transparent,
                            child: Image(
                              width: 90,
                              height: 90,
                              image: AssetImage('images/sell_gold.png'),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ขายออก',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              '0 items',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('หน้าแรก',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('สถิติ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('คำนวณ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      //   items: allDestinations.map((Destination destination) {
      //     return BottomNavigationBarItem(
      //       icon: Icon(destination.icon),
      //       backgroundColor: destination.color,
      //       title: Text(destination.title)
      //     );
      //   }).toList(),
      // ),
    );
  }
}

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('หน้าแรก', Icons.home, Colors.teal),
  Destination('สถิติ', Icons.assessment, Colors.cyan),
  Destination('คำนวณ', Icons.home, Colors.orange),
];
