import 'package:app_ventas/features/bottomNavigation/domain/entities/page_index.dart';
import 'package:app_ventas/features/bottomNavigation/domain/repositories/page_index_repository.dart';

class PageIndexRepositoryImpl implements PageIndexRepository {
  int _pageIndex = 0;

  @override
  void setPageIndex(PageIndex index) {
    _pageIndex = index.pageIndexValue;
  }

  int get pageIndex => _pageIndex;
}
