class BuyOrder {
  double goldPrice;
  double weight;
  double goldPercentage;
  double price;
  BuyOrder(this.goldPrice, this.weight, this.goldPercentage, this.price);
}

class SellOrder {
  double goldPrice;
  double weight;
  double goldPercentage;
  double price;
  double makingFee;
  SellOrder(this.goldPrice, this.weight, this.goldPercentage, this.price,
      this.makingFee);
}

List<BuyOrder> buyOrders = [
  BuyOrder(28000, 10, 70, 0),
  BuyOrder(26000, 20, 10, 0),
  BuyOrder(25000, 310, 96.5, 0),
];
List<Map> data = [
  {
    'goldPrice': 25000,
    'weight': 200,
    'fee': 700,
    'goldPercentage': 90,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  },
  {
    'goldPrice': 28000,
    'weight': 300,
    'fee': 500,
    'goldPercentage': 20,
    'price': 20000
  }
];
