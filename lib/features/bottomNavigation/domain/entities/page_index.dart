import 'package:equatable/equatable.dart';

class PageIndex extends Equatable {
  final int pageIndexValue;

  const PageIndex({required this.pageIndexValue});

  @override
  List<Object?> get props => [pageIndexValue];
}
