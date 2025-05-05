part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class IndexChangeState extends NavBarState {
  final int index;
  IndexChangeState(this.index);
}
