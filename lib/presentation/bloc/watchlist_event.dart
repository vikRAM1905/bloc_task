import 'package:equatable/equatable.dart';

abstract class WatchlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWatchlistEvent extends WatchlistEvent {
  final String group;

  LoadWatchlistEvent(this.group);

  @override
  List<Object?> get props => [group];
}
