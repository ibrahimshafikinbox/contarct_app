abstract class ContractState {}

class ContractInitial extends ContractState {}

class ContractLoading extends ContractState {}

class ContractSuccess extends ContractState {}

class ContractFailure extends ContractState {
  final String error;

  ContractFailure({required this.error});
}

class ContractLoaded extends ContractState {
  final String error;

  ContractLoaded({required this.error});
}

// get contract

class GetContractLoading extends ContractState {}

class GetContractSuccess extends ContractState {
  final List<Map<String, dynamic>> contracts;

  GetContractSuccess({required this.contracts});
}

class GetContractFailure extends ContractState {
  final String error;

  GetContractFailure({required this.error});
}

// Get Reviewd Order

class GetReviewdContractLoading extends ContractState {}

class GetReviewedContractSuccess extends ContractState {
  final List<Map<String, dynamic>> contracts;

  GetReviewedContractSuccess({required this.contracts});
}

class GetReviewedContractFailure extends ContractState {
  final String error;

  GetReviewedContractFailure({required this.error});
}

// Get Finished Order

class GetFinisedContractLoading extends ContractState {}

class GetFinisedContractSuccess extends ContractState {
  final List<Map<String, dynamic>> contracts;

  GetFinisedContractSuccess({required this.contracts});
}

class GetFinisedContractFailure extends ContractState {
  final String error;

  GetFinisedContractFailure({required this.error});
}

// update contracting
class UpdateContractLoading extends ContractState {}

class UpdateContractSuccess extends ContractState {}

class UpdateContractFailure extends ContractState {
  final String error;

  UpdateContractFailure({required this.error});
}

class UpdateContractLoaded extends ContractState {
  final String error;

  UpdateContractLoaded({required this.error});
}
