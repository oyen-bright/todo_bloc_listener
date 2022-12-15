part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodoFilterEvent {
  final Filter filer;
  const ChangeFilterEvent({
    required this.filer,
  });
  @override
  List<Object> get props => [filer];

  @override
  String toString() => 'ChangeFilterEvent(filer: $filer)';
}
