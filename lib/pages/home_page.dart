import 'package:bloc_btc/bloc/price_bloc.dart';
import 'package:bloc_btc/services/repository.dart';
import 'package:bloc_btc/widgets/action_buttons.dart';
import 'package:bloc_btc/widgets/btc_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = BtcRepository();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<PriceBloc>(
      create: (context) => PriceBloc(btcRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('BTC price'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0),
            ActionButtons(),
            Expanded(child: BtcPrice()),
          ],
        ),
      ),
    );
  }
}
