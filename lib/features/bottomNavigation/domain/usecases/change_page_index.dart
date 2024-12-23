import 'package:app_ventas/features/bottomNavigation/domain/entities/page_index.dart';
import 'package:app_ventas/features/bottomNavigation/domain/repositories/page_index_repository.dart';

class ChangePageIndex {
  final PageIndexRepository repository;

  ChangePageIndex(this.repository);

  void call(PageIndex index) {
    repository.setPageIndex(index);
  }
}
