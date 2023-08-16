part of 'pet_detail_bloc.dart';

@immutable
sealed class PetDetailState {}

abstract class PetDetailActionState extends PetDetailState {}

class PetDetailInitial extends PetDetailState {}

class PetDetailLoading extends PetDetailActionState {}

class PetDetailLoaded extends PetDetailActionState {}

class AdoptMePressedState extends PetDetailActionState {}
