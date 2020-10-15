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
  BuyOrder(2000, 10, 70, 200),
  BuyOrder(3000, 20, 10, 2100),
  BuyOrder(4000, 310, 96.5, 2002),
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
