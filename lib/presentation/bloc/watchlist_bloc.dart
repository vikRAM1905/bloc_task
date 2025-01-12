import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data.dart';
import '../../model/watchlist_model.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistLoading()) {
    on<LoadWatchlistEvent>((event, emit) {
      try {
        debugPrint("group name::${event.group}");
        final stocks = WatchListData.getStocks(event.group)
            .map((data) => WatchlistItem(
          symbol: data["symbol"],
          exchange: data["exchange"],
          price: data["price"],
          change: data["change"],
          percentage: data["percentage"],
          isPositive: data["isPositive"],
          stocks: data['stocks']
        ))
            .toList();
        emit(WatchlistLoaded(stocks));
      } catch (e) {
        emit(WatchlistError("Failed to load watchlist"));
      }
    });
  }
}
