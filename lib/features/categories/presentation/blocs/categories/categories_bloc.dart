import 'package:app_ventas/features/categories/domain/entities/category.dart';
import 'package:app_ventas/features/categories/domain/usecases/get_list_categories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetListCategories getListCategories;

  CategoriesBloc({required this.getListCategories})
      : super(CategoriesInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      try {
        final categories = await getListCategories();
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
