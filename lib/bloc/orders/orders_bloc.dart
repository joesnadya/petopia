import 'package:flutter_bloc/flutter_bloc.dart';

import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(InitiateOrdersState()) {
    on<SubmitOrdersEvent>(((event, emit) {
      // emit(LoadingOrdersState());
      emit(SuccessOrdersState());
    }));
  }
}