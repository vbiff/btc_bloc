import 'dart:convert';

import 'package:bloc_btc/models/price.dart';
import 'package:http/http.dart';

class BtcProvider {

  Future<Price> getRate() async {

    final response = await get(Uri.parse('https://data.messari.io/api/v1/assets/btc/metrics'));
    
    if (response.statusCode == 200) {  
      final double btcRate = json.decode(response.body)['data']['market_data']['price_usd']; 
     
      return Price.fromDynamic(btcRate);

      
    } else {
      throw Exception('Error fetching price');
    }
    }
  
}