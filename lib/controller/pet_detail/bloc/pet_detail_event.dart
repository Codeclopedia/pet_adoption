part of 'pet_detail_bloc.dart';

@immutable
sealed class PetDetailEvent {}

class AdoptMeButtonPressEvent extends PetDetailEvent {
  final PetDetailModel petDetail;
  final BuildContext buildContext;
  AdoptMeButtonPressEvent(this.petDetail, this.buildContext);
}
