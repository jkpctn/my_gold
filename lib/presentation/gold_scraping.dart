import 'package:web_scraper/web_scraper.dart';

Future<String> getBuyPrice() async {
  final webScraper = WebScraper('https://www.goldtraders.or.th');
  if (await webScraper.loadWebPage('/')) {
    final titleElements = webScraper.getPageContent();
    String buyPricePattern =
        '<span id="DetailPlace_uc_goldprices1_lblBLSell"><b><font color="Red">';
    int buyPriceIdx = titleElements.indexOf(buyPricePattern);
    return titleElements.substring(buyPriceIdx + buyPricePattern.length,
        buyPriceIdx + buyPricePattern.length + 6);
  }
  return '';
}

Future<String> getSellPrice() async {
  final webScraper = WebScraper('https://www.goldtraders.or.th');
  if (await webScraper.loadWebPage('/')) {
    final titleElements = webScraper.getPageContent();
    String sellPricePattern =
        '<span id="DetailPlace_uc_goldprices1_lblBLBuy"><b><font color="Red">';
    int sellPriceIdx = titleElements.indexOf(sellPricePattern);
    return titleElements.substring(sellPriceIdx + sellPricePattern.length,
        sellPriceIdx + sellPricePattern.length + 6);
  }
  return '';
}
