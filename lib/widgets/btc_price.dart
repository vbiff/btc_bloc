import 'package:bloc_btc/bloc/price_bloc.dart';
import 'package:bloc_btc/bloc/btc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BtcPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceBloc, PriceState>(
      builder: (context, state) {
        if (state is PriceEmptyState) {
          return Center(
            child: Text(
              'No BTC price received.\n Press button "Load"',
              style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
            ),
          );
        }

        if (state is PriceLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is PriceLoadedState) {
          return Center(
            child: Text('Current BTC price \$:\n \n\n\n ${state.loadedPrice.price}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            
          );
          
        }

        if (state is PriceErrorState) {
          return Center(
            child: Text(
              'Error fetching rate',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return null;
      },
    );
  }
}
