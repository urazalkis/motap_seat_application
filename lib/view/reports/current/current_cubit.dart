import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/view/reports/current/current_service.dart';

import 'current_model_response.dart';
import 'current_state.dart';


class CurrentCubit extends Cubit<ICurrentState>
{
  ICurrentService currentService;
  late List<Current> currentList;

  CurrentCubit(this.currentService):super(CurrentInit());


  Future<void> getCurrent() async {
    try{

      emit(CurrentLoading());
       currentList = await currentService.getCurrent();

      emit(CurrentLoaded(currentList));


      print("başarılı");
    }
    catch(e){
      emit(CurrentError("Cari Bilgileri Alınamadı $e"));

    }
  }


}