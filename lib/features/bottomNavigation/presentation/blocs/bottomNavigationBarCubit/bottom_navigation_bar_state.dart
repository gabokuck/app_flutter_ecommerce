part of 'bottom_navigation_bar_cubit.dart';

class BottomNavigationBarState extends Equatable {
  final int pageIndex;
  const BottomNavigationBarState(
      {required this.pageIndex });

  get pageIndexValue => pageIndex;

  BottomNavigationBarState copyWith(
      {int? pageIndex, List<BottomNavigationBarItem>? items}) {
    return BottomNavigationBarState(
        pageIndex: pageIndex ?? this.pageIndex,);
  }

  @override
  List<Object> get props => [pageIndex];
}
