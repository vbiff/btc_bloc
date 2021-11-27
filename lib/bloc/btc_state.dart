import 'package:bloc_btc/models/price.dart';
import 'package:flutter/foundation.dart';

abstract class PriceState {}

class PriceEmptyState extends PriceState {}

class PriceLoadingState extends PriceState {}

class PriceLoadedState extends PriceState {
  Price loadedPrice;
  PriceLoadedState({@required this.loadedPrice}) : assert(loadedPrice != null);
}

class PriceErrorState extends PriceState {}