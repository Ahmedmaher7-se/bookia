import 'package:bookia/feature/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/feature/home/data/models/best_seller_response/product.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider.dart';
import 'package:bookia/feature/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/feature/home/data/repo/home_repo.dart';
import 'package:bookia/feature/home/presentation/cubit/home_state.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Product> products = [];
  List<SliderModel> sliders = [];

  getInitData() async {
    emit(HomeLoadingState());

    var sliderReq = HomeRepo.getSliders();
    var bestSellerReq = HomeRepo.getBestSeller();

    var results = await Future.wait([sliderReq, bestSellerReq]);

    var sliderRes = results[0] as SliderResponse?;
    var bestSellerRes = results[1] as BestSellerResponse?;

    if (sliderRes != null || bestSellerRes != null) {
      products = bestSellerRes?.data?.products ?? [];
      sliders = sliderRes?.data?.sliders ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }

  
  addToWishList({required int productId}) async {
    emit(HomeLoadingState());
    var res = await WishlistRepo.removeFromWishList(productId: productId);

    if (res != null) {
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
