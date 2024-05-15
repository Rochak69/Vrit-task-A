part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.theStates = TheStates.initial,
    this.errorMessage,
    this.pictures,
  });

  final TheStates theStates;
  final String? errorMessage;

  final List<PictureResponse>? pictures;

  HomeState copyWith({
    TheStates? theStates,
    String errorMessage = AppConstants.errorMessage,
    List<PictureResponse>? pictures,
  }) {
    return HomeState(
      theStates: theStates ?? this.theStates,
      errorMessage: errorMessage,
      pictures: pictures ?? this.pictures,
    );
  }

  @override
  List<Object?> get props => [theStates, errorMessage, pictures];
}
