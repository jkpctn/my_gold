import 'package:flutter/material.dart';
import 'package:my_gold/resource/data.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:my_gold/presentation/calculate_function.dart';
import 'package:my_gold/presentation/style.dart';

const header_textstyle = TextStyle(fontSize: 45, fontWeight: FontWeight.w800);
const button_textstyle = TextStyle(fontSize: 5, fontWeight: FontWeight.w800);

class EditBuyOrderScreen extends StatefulWidget {
  final BuyOrder targetBuyOrder;

  const EditBuyOrderScreen({Key key, this.targetBuyOrder}) : super(key: key);

  @override
  _EditBuyOrderScreenState createState() => _EditBuyOrderScreenState();
}

class _EditBuyOrderScreenState extends State<EditBuyOrderScreen> {
  double goldPrice;
  double weight;
  double goldPercentage;
  double price;
  @override
  void initState() {
    super.initState();
    goldPrice = widget.targetBuyOrder.goldPrice;
    weight = widget.targetBuyOrder.weight;
    goldPercentage = widget.targetBuyOrder.goldPercentage;
    price = widget.targetBuyOrder.price;
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    price = calculateBuyingPrice(goldPrice, weight, goldPercentage);
  }

  void changeWeight(double tappedWeight) {
    debugPrint('w $weight tap $tappedWeight');
    weight = tappedWeight;
    setState(() {});
  }

  void changeGoldPercentage(double tappedWeight) {
    debugPrint('w $weight tap $tappedWeight');
    goldPercentage = tappedWeight;
    setState(() {});
  }

  bool isSelectedWeight(double buttonweight) {
    if (buttonweight == weight) {
      debugPrint('$buttonweight,$weight');
      return true;
    } else
      return false;
  }

  bool isSelectedGoldPercentage(double buttonPercentage) {
    if (buttonPercentage == goldPercentage) {
      return true;
    } else
      return false;
  }

  void editBuyOrder() {
    Navigator.pop(context, BuyOrder(goldPrice, weight, goldPercentage, price));
  }

  void _showCustomWeight() {
    debugPrint('CustomWeight');
    showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.decimal(
            minValue: 0,
            maxValue: 50,
            title: new Text("Pick new weight"),
            initialDoubleValue: weight,
          );
        }).then((value) => {
          if (value != null) {setState(() => weight = value)}
        });
  }

  void _showCustomGoldPercentage() {
    debugPrint('CustomWeight');
    showDialog<double>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.decimal(
            minValue: 0,
            maxValue: 100,
            title: new Text("Pick new weight"),
            initialDoubleValue: goldPercentage,
          );
        }).then((value) => {
          if (value != null) {setState(() => goldPercentage = value)}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'แก้ไขข้อมูล',
        style: detailText,
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ราคาซื้อเข้า',
                style: header_textstyle,
              ),
              Text(
                '28000',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'น้ำหนักทอง',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  selectButton('0.6 กรัม', 0.6, isSelectedWeight(0.6)),
                  selectButton('1.6 กรัม', 1.6, isSelectedWeight(1.6)),
                  selectButton('1.9', 1.9, isSelectedWeight(1.9)),
                  selectButton('3.8', 3.8, isSelectedWeight(3.8)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  selectButton('7.6 g', 7.6, isSelectedWeight(7.6)),
                  selectButton('15.2 g', 15.2, isSelectedWeight(15.2)),
                  selectButton('30.4 g', 30.4, isSelectedWeight(30.4)),
                  RaisedButton(
                    elevation: btnElevation,
                    shape: selectButtonShape,
                    child: Text(
                      'กำหนดเอง',
                      style: isCustomWeight(weight)
                          ? (smaller_decorationText)
                          : smaller_detailText,
                    ),
                    color: isCustomWeight(weight) ? selectedBtn : unSelectedBtn,
                    onPressed: () => _showCustomWeight(),
                  )
                ],
              ),
              Text(
                'เปอร์เซ็นทอง',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  selectGoldButton('70 %', 70, isSelectedGoldPercentage(70)),
                  selectGoldButton('80 %', 80, isSelectedGoldPercentage(80)),
                  selectGoldButton(
                      '96.5 %', 96.5, isSelectedGoldPercentage(96.5)),
                  RaisedButton(
                    elevation: btnElevation,
                    shape: selectButtonShape,
                    child: Text(
                      'กำหนดเอง',
                      style: isCustomGoldPercentage(goldPercentage)
                          ? (smaller_decorationText)
                          : smaller_detailText,
                    ),
                    color: isCustomGoldPercentage(goldPercentage)
                        ? selectedBtn
                        : unSelectedBtn,
                    onPressed: () => _showCustomGoldPercentage(),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  orderCard(weight, goldPercentage, goldPrice, price),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: RaisedButton(
                    child: Text(
                      'บันทึก',
                      style: detailText,
                    ),
                    onPressed: editBuyOrder),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container selectButton(
      String title, double weightGrams, bool isSelectedWeight) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        color: isSelectedWeight ? selectedBtn : unSelectedBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: isSelectedWeight ? (Colors.white) : Colors.black),
        ),
        onPressed: () => changeWeight(weightGrams),
      ),
    );
  }

  Container selectGoldButton(
      String title, double weightGrams, bool isSelectedWeight) {
    return Container(
      //color: isSelectedWeight ? (Colors.blue) : null,
      child: RaisedButton(
        elevation: btnElevation,
        shape: selectButtonShape,
        color: isSelectedWeight ? selectedBtn : unSelectedBtn,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: isSelectedWeight ? (Colors.white) : Colors.black),
        ),
        onPressed: () => changeGoldPercentage(weightGrams),
      ),
    );
  }
}

Container orderCard(
    double weightGrams, double goldPercentage, double goldPrice, double price) {
  double _padding = 20;
  const TextStyle detailText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w800);
  return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
              colors: [Colors.yellow, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              blurRadius: 12,
              offset: Offset(0, 6),
            )
          ]),
      child: Row(
        children: <Widget>[
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'ราคาซื้อเข้า',
                        style: detailText,
                      ),
                      Text(
                        'น้ำหนัก',
                        style: detailText,
                      ),
                      Text(
                        'เปอร์เซ็นทอง',
                        style: detailText,
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: _padding, bottom: _padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        ':',
                        style: detailText,
                      ),
                      Text(
                        ':',
                        style: detailText,
                      ),
                      Text(
                        ':',
                        style: detailText,
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(_padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '${goldPrice.toInt()} บาท',
                        style: detailText,
                      ),
                      Text(
                        '$weightGrams กรัม',
                        style: detailText,
                      ),
                      Text(
                        '$goldPercentage %',
                        style: detailText,
                      )
                    ],
                  )),
              Container(
                  height: 90,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      // gradient: LinearGradient(
                      //     colors: [Colors.orange, Colors.red],
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ราคาทองรูปพรรณ', style: smaller_decorationText),
                      Text(
                        '${price.toStringAsFixed(2)}   บาท',
                        style: smaller_decorationText,
                      )
                    ],
                  ))
            ],
          )
        ],
      ));
  ;
}
