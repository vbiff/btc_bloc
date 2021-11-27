import 'package:bloc_btc/models/price.dart';
import 'package:bloc_btc/services/api_provider.dart';

class BtcRepository {
  BtcProvider _btcProvider = BtcProvider();
  Future<Price> getAllRates() => _btcProvider.getRate();
}