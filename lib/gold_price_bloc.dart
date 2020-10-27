import 'dart:async';

import 'package:my_gold/gold_price_event.dart';

// class GoldPriceBloc {
//   double _goldPrice = 0;
//   final _goldPriceStateController = StreamController<double>();
//   StreamSink<double> get _inGoldPrice => _goldPriceStateController.sink;
//   Stream<double> get goldPrice => _goldPriceStateController.stream;
//   final _goldPriceEventController = StreamController<GoldPriceEvent>();
//   Sink<GoldPriceEvent> get goldPriceEventSink => _goldPriceEventController.sink;

//   GoldPriceBloc() {
//     _goldPriceEventController.stream.listen(_mapEventToState);
//   }
//   void _mapEventToState(GoldPriceEvent event) {
//     if (event is ChangeLastestGoldPriceEvent) _goldPrice = event.goldPrice;
//     _inGoldPrice.add(_goldPrice);
//   }
// }
class GoldPriceBloc {
  final goldStreamController = StreamController.broadcast();

  Stream get getStream => goldStreamController.stream;

  Price goldPrice = Price(0, 0);

  void dispose() {
    goldStreamController.close();
  }

  void changeBuyPrice(double price) {
    goldPrice.buying = price;
    goldStreamController.sink.add(goldPrice);
  }

  void changeSellPrice(double price) {
    goldPrice.selling = price;
    goldStreamController.sink.add(goldPrice);
  }
}

class Price {
  double buying = 0;
  double selling = 0;

  Price(this.buying, this.selling);
}

final bloc = GoldPriceBloc();
