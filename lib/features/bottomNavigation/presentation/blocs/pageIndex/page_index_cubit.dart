import 'package:app_ventas/config/router/router.dart';
import 'package:app_ventas/features/bottomNavigation/domain/entities/page_index.dart';
import 'package:app_ventas/features/bottomNavigation/domain/repositories/page_index_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_index_state.dart';

class PageIndexCubit extends Cubit<PageIndexState> {
  final PageIndexRepository _pageIndexRepository;
  final RouterCubit routerCubit;
  PageIndexCubit(
      {required PageIndexRepository pageIndexRepository,
      required this.routerCubit})
      : _pageIndexRepository = pageIndexRepository,
        super(const PageIndexState(0));

  void changePageIndexValue(int newPageIndex) {
    PageIndex index = PageIndex(pageIndexValue: newPageIndex);
    _pageIndexRepository.setPageIndex(index);
    routerCubit.goToHome(newPageIndex);
    emit(state.copyWith(pageIndex: index.pageIndexValue));
  }
}
