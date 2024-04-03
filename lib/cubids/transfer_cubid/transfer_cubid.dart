import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/cubids/transfer_cubid/transfer_state.dart';

import '../../data/model/transfer_model.dart';
import '../../data/my_responce.dart';
import '../../data/repository/transfer_repository/transfer_repository.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit({required this.transferRepository})
      : super(TransferInitialState());
  final TransferRepository transferRepository;

  Future<void> getTransfers() async {
    emit(TransferLoadingState());
    MyResponse myResponse = await transferRepository.getTransferInfo();
    if (myResponse.error.isEmpty) {
      emit(TransferSuccessState(
          transfers: myResponse.data as List<TransferModel>));
    } else {
      emit(TransferFailureState(message: myResponse.error));
    }
  }
}