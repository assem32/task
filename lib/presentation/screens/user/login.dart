import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home_page.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/component.dart';

var emailController = TextEditingController();
var passController = TextEditingController();
var formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){
        if(state is LoginSuccess){
          if (state.loginModel.status==200) {
            print(state.loginModel.account);

            Fluttertoast.showToast(
                msg: 'Login success',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
            CacheHelper.saveDataSharedPreference(key: 'id', value: state.loginModel.account?.id).then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
                    (route) {

                  return false;
                },
              );
            });

          } else {
            print('error');
            Fluttertoast.showToast(
                msg: 'Login error',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        }
      },
      builder: (context,state){
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight:  Radius.circular(50))
          ),

          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 167,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63),
                    child: defaultFormField(
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) return 'E-mail isn\'t correct';
                        },
                        label: 'Email',
                        isPass: false),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 63),
                    child: defaultFormField(
                        controller: passController,
                        inputType: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) return 'Password isn\'t correct';
                        },
                        label: 'Password',
                        isPass: true),
                  ),
                  SizedBox(
                    height: 162,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28,
                      ),
                      MaterialButton(onPressed: (){
                        if (formKey.currentState!.validate()) {
                          GlobalCubit.get(context).userLogin(emailController.text, passController.text);
                        }

                      },color: Colors.blue,
                        height: 61,
                        minWidth: 152,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('Login'),),
                      SizedBox(width: 32,),
                      MaterialButton(onPressed: (){
                        GlobalCubit.get(context).changeRegister();
                      },color: Colors.blue,
                        height: 61,
                        minWidth: 152,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('Register'),),
                      SizedBox(width: 28,),
                    ],
                  )
                ],

              ),
            ),
          ),
        );
      },

    );
  }
}
