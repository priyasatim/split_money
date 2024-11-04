import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_money/bloc/internet_bloc/internet_event.dart';
import 'package:split_money/bloc/internet_bloc/internet_state.dart';

class InternetBlo extends Bloc<InternetEvent,InternetState>{

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBlo(): super(InternetStateInitialize()) {
    on<InternetGainEvent>((event, emit) {emit(InternetGainState());});
    on<InternetLostEvent>((event, emit) { emit(InternetLostState());});

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}