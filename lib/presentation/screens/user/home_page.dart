import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Text('Name:${GlobalCubit.get(context).loginModel!.account?.name}'),
                Text('email:${GlobalCubit.get(context).loginModel!.account?.email}'),
                Text('email:${GlobalCubit.get(context).loginModel!.account?.phone}'),
                SizedBox(height: 100,),
                MaterialButton(onPressed: (){
                  CacheHelper.removeData(key: 'id').then((value) {Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                        (route) {
                      return false;
                    },
                  );});
                })

              ],
            ),
          ),
        );
      },

    );
  }
}
