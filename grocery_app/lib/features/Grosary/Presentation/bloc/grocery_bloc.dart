import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_event.dart';
import 'package:grocery_app/features/Grosary/Presentation/bloc/grocery_state.dart';

import '../../Domein/useCase/getAll.dart';


class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GetAllGroceryUsecase getAllGroceryUsecase ;
  GroceryBloc({required this.getAllGroceryUsecase}) : super(GroceryInitial()) {

    on<LoadAllGroceryEvent>((event, emit)async {
    log('get request in bloc');

      emit(GroceryLoadingState());

      final result = await getAllGroceryUsecase.excute();
      log('send request from bloc');


        result.fold(
            (error) => emit(GroceryError(message: error.toString())),               
            (datas) {emit(GroceryLoaded(data: datas));},
            ); 

      
     
    });
  }
}
