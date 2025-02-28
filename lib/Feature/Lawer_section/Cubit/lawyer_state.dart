import 'package:equatable/equatable.dart';

abstract class LawyerState extends Equatable {
  const LawyerState();

  @override
  List<Object?> get props => [];
}

class LawyerInitial extends LawyerState {}

class LawyerLoading extends LawyerState {}

class LawyerLoaded extends LawyerState {
  final Map<String, dynamic> lawyerData;
  final List<Map<String, dynamic>> contracts;

  const LawyerLoaded({required this.lawyerData, required this.contracts});

  @override
  List<Object?> get props => [lawyerData, contracts];
}

class LawyerError extends LawyerState {
  final String message;

  const LawyerError(this.message);

  @override
  List<Object?> get props => [message];
}
