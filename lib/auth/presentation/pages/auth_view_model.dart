import 'package:flutter/cupertino.dart';
import 'package:recipe_app/auth/data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {

  AuthViewModel({required AuthRepository authRepo}):_authRepo=authRepo;
  final AuthRepository _authRepo;
  final TextEditingController loginController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
   bool _isAuthenticated=false;
   bool get isAuthenticated =>_isAuthenticated;
}