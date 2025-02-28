import 'package:equatable/equatable.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String transactionId;
  PaymentSuccess(this.transactionId);
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure(this.error);
}

class CouponLoading extends PaymentState {}

class CouponSuccess extends PaymentState {
  final int discount;
  CouponSuccess(this.discount);
}

class CouponFailure extends PaymentState {
  final String error;
  CouponFailure(this.error);
}

class PaymentCouponValid extends PaymentState {
  final int discount;
  PaymentCouponValid({required this.discount});

  @override
  List<Object?> get props => [discount];
}

class PaymentCouponInvalid extends PaymentState {}
