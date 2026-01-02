
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../Features/authentication/login/view_model/login_view_model.dart';
import '../../Features/authentication/sign_up/view_model/sign_up_view_model.dart';
import '../../Features/home/view_model/home_view_model.dart';



List<SingleChildWidget> providers = [
 
  ChangeNotifierProvider<SignUpViewModel>(create: (_) => SignUpViewModel()),
  ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
  ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),



];
