class WatchListData {
  static List<Map<String, dynamic>> getStocks(String group) {
    switch (group) {
      case "NIFTY":
        return [
          {
            "symbol": "GOLD 26JUL 59500 CE",
            "exchange": "MCX",
            "price": 298.50,
            "change": 23.50,
            "percentage": 8.54,
            "isPositive": true,
            "stocks":0
          },
          {
            "symbol": "ACCELYA",
            "exchange": "NSE",
            "price": 1337.70,
            "change": 1.05,
            "percentage": 0.07,
            "isPositive": true,
            "stocks":0
          },
          {
            "symbol": "ACC",
            "exchange": "BSE",
            "price": 1795.20,
            "change": 27.20,
            "percentage": 1.53,
            "isPositive": true,
            "stocks":200
          },
          {
            "symbol": "ACC",
            "exchange": "NSE",
            "price": 1792.30,
            "change": 25.40,
            "percentage": 1.43,
            "isPositive": false,
            "stocks":100
          },
        ];
      case "BANKNIFTY":
        return [
          {
            "symbol": " RSA",
            "exchange": "MDX",
            "price": 27.50,
            "change": 230.50,
            "percentage": 1.54,
            "isPositive": true,
            "stocks":0
          },
          {
            "symbol": "AYA",
            "exchange": "BSE",
            "price": 5287.70,
            "change": 1.05,
            "percentage": 0.09,
            "isPositive": false,
            "stocks":300
          },
          {
            "symbol": "ASSN",
            "exchange": "NSE",
            "price": 345.20,
            "change": 15.06,
            "percentage": 1.07,
            "isPositive": true,
            "stocks":0
          },
          {
            "symbol": "BBC",
            "exchange": "BSE",
            "price": 12.30,
            "change": 25.40,
            "percentage": 1.43,
            "isPositive": true,
            "stocks":0
          },
        ];
      case "SENSEX":
        return [
          {
            "symbol": " CE",
            "exchange": "MDX",
            "price": 217.50,
            "change": 23.50,
            "percentage": 8.54,
            "isPositive": true,
            "stocks":0
          },
          {
            "symbol": "AYA",
            "exchange": "BSE",
            "price": 3287.70,
            "change": 1.05,
            "percentage": 0.07,
            "isPositive": true,
            "stocks":50
          },
          {
            "symbol": "BBC",
            "exchange": "BSE",
            "price": 12.30,
            "change": 25.40,
            "percentage": 1.43,
            "isPositive": true,
            "stocks":0
          },
        ];
      default:
        return [];
    }
  }
}
