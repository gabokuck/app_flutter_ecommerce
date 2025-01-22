import 'package:app_ventas/config/router/router.dart';
import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/bottomNavigation/domain/entities/page_index.dart';
import 'package:app_ventas/features/bottomNavigation/domain/repositories/page_index_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  final PageIndexRepository _pageIndexRepository;
  final RouterCubit routerCubit;
  AuthBloc? authBloc;

  BottomNavigationBarCubit({
    required PageIndexRepository pageIndexRepository,
    required this.routerCubit,
    this.authBloc,
  })  : _pageIndexRepository = pageIndexRepository,
        super(BottomNavigationBarState(pageIndex: 0));

  void setAuthBloc(AuthBloc bloc) {
    authBloc = bloc;
  }

  void changePageIndexValue(int newPageIndex, {int? totalPages}) {
    PageIndex index = PageIndex(pageIndexValue: newPageIndex);
    _pageIndexRepository.setPageIndex(index);
    routerCubit.goToRouter(newPageIndex, totalPages: totalPages);
    emit(state.copyWith(pageIndex: index.pageIndexValue));
  }
}
