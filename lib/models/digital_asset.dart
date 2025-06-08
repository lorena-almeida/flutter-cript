class DigitalAsset {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChangePercentage24h;
  final double marketCap;
  final String imageUrl;
  final int rank;

  DigitalAsset({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.marketCap,
    required this.imageUrl,
    required this.rank,
  });

  factory DigitalAsset.fromJson(Map<String, dynamic> json) {
    return DigitalAsset(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'].toUpperCase(),
      currentPrice: json['current_price'].toDouble(),
      priceChangePercentage24h: json['price_change_percentage_24h'].toDouble(),
      marketCap: json['market_cap'].toDouble(),
      imageUrl: json['image'],
      rank: json['market_cap_rank'] ?? 0,
    );
  }
} 