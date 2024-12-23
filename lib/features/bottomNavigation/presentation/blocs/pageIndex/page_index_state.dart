part of 'page_index_cubit.dart';

class PageIndexState extends Equatable {
  final int pageIndex;
  const PageIndexState(this.pageIndex);

  get pageIndexValue => pageIndex;

  PageIndexState copyWith({int? pageIndex}) {
    return PageIndexState(pageIndex ?? this.pageIndex);
  }

  @override
  List<Object> get props => [pageIndex];
}
