abstract class ContractState {}

class ContractInitial extends ContractState {}

class ContractLoading extends ContractState {}

class ContractSuccess extends ContractState {}

class ContractFailure extends ContractState {
  final String error;

  ContractFailure({required this.error});
}
