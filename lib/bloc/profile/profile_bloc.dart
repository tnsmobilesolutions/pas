import 'package:bloc/bloc.dart';
import 'package:prabasi_anchalika_sangha/API/userAPI.dart';
import 'package:prabasi_anchalika_sangha/model/userModel.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<MyprofileEvent>((event, emit) async {
      final currentUser = await UserAPI().currentUser();
      emit(
        MyprofileState(currentUser: currentUser),
      );
    });
    // on<EditProfileEvent>((event, emit) async {

    //   emit(
    //     EditProfileState(),
    //   );
    // });
  }
}
