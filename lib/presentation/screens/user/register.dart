import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/home_page.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/component.dart';

var emailController = TextEditingController();
var passController = TextEditingController();
var phoneController = TextEditingController();
var nameController = TextEditingController();
var passConController = TextEditingController();
var formKey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){
        if(state is RegisterSuccess) {
          if(state.registerModel.status==200){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
              (route) {
                return false;
              },
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
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    defaultFormField(
                        controller: nameController,
                        inputType: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) return 'Name can\'t be empty';
                        },
                        label: 'Full Name',
                        isPass: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) return 'E-mail can\'t be empty';
                        },
                        label: 'Email',
                        isPass: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) return 'Phone can\'t be empty';
                        },
                        label: 'Phone',
                        isPass: false),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: passController,
                        inputType: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) return 'Password can\'t be empty';
                        },
                        label: 'Password',
                        isPass: true),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: passConController,
                        inputType: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) return 'Password can\'t be empty';
                        },
                        label: 'Password Confirm',
                        isPass: true),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [

                        MaterialButton(onPressed: (){
                          GlobalCubit.get(context).changeLogin();
                        },color: Colors.blue,
                          height: 61,
                          minWidth: 152,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text('Login'),),
                        SizedBox(width: 32,),
                        MaterialButton(onPressed: (){
                          if (formKey.currentState!.validate()) {
                            GlobalCubit.get(context).userRegister(nameController.text, emailController.text, passController.text, phoneController.text);
                          }

                        },color: Colors.blue,
                          height: 61,
                          minWidth: 152,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text('Register'),),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
