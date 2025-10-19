import 'package:bookia/feature/home/data/models/best_seller_response/product.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Product> products = [];

  getBestSeller() async {
    emit(HomeLoadingState());
    var res = await HomeRepo.getBestSeller();

    if (res != null) {
      products = res.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
