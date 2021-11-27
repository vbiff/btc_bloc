import 'package:bloc_btc/bloc/price_bloc.dart';
import 'package:bloc_btc/bloc/btc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final PriceBloc userBloc = BlocProvider.of<PriceBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            userBloc.add(BtcLoadEvent());
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent)),
        ),
        SizedBox(width: 12.0),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            userBloc.add(BtcClearEvent());
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
        ),
      ],
    );
  }
}