import 'package:bloc_btc/bloc/btc_event.dart';
import 'package:bloc_btc/bloc/btc_state.dart';
import 'package:bloc_btc/models/price.dart';
import 'package:bloc_btc/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceBloc extends Bloc<BtcEvent, PriceState> {
  final BtcRepository btcRepository;

  PriceBloc({this.btcRepository}) : assert(btcRepository != null);

  @override
  PriceState get initialState => PriceEmptyState();

  @override
  Stream<PriceState> mapEventToState(BtcEvent event) async* {
    if (event is BtcLoadEvent) {
      yield PriceLoadingState();
      try {
        final Price _loadedPrice = await btcRepository.getAllRates();
       
        yield PriceLoadedState(loadedPrice: _loadedPrice);
      } catch (_) {
        yield PriceErrorState();
      }
    } else if (event is BtcClearEvent) {
      yield PriceEmptyState();
    }
  }

}