part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetRateLoading extends ProductDetailsState {}

final class GetRateSuccess extends ProductDetailsState {}

final class GetRateError extends ProductDetailsState {}

final class addOrUpdateRateLoading extends ProductDetailsState {}

final class addOrUpdateRateSuccess extends ProductDetailsState {}

final class addOrUpdateRateError extends ProductDetailsState {}