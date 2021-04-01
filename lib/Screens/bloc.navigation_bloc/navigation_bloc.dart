import 'package:bloc/bloc.dart';
import 'package:tester/Screens/AcademicStaff/CourseAS.dart';
import 'package:tester/Screens/Administrator/Requests.dart';
import 'package:tester/Screens/Administrator/SchedulesAdmin.dart';
import 'package:tester/Screens/Administrator/homepage_administrator.dart';
import 'package:tester/Screens/profile.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyProfileClickedEvent,
  RequestClickedEvent,
  ScheduleClickedEvent,
  SettingsClickedEvent,
  LogoutClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  /*

  if (user== "administrator"){
    NavigationStates get initialState => homePageAdministrator();
  }else if (user == "AcademicStaff"){
    NavigationStates get initialState => CourseAS();
  }else{
    NavigationStates get initialState => HomePageStudent();
  }

  */
  NavigationStates get initialState => CourseAS();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:

        /* if (user == "administrator") {
          yield homePageAdministrator();
          break;
        } else if (user == "AcademicStaff") {
          yield CourseAS();
          break;
        } else {
          yield HomePageStudent();
          break;
        }
        */
        yield homePageAdministrator();
        break;
      case NavigationEvents.MyProfileClickedEvent:
        yield Profile();
        break;
      case NavigationEvents.RequestClickedEvent:
        yield Requests();
        break;
      case NavigationEvents.SettingsClickedEvent:
        // TODO: Handle this case.
        break;
      case NavigationEvents.LogoutClickedEvent:
        // TODO: Handle this case.
        break;
      case NavigationEvents.ScheduleClickedEvent:
        yield SchedulesAdmin();
        break;
    }
  }
}
