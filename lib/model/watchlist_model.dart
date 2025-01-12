class WatchlistItem {
  final String symbol;
  final String exchange;
  final double price;
  final double change;
  final double percentage;
  final bool isPositive;
  final int? stocks;

  WatchlistItem({
    required this.symbol,
    required this.exchange,
    required this.price,
    required this.change,
    required this.percentage,
    required this.isPositive,
    this.stocks
  });
}
