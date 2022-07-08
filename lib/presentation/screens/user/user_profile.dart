import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/login.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/register.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor:  Color(0xff005DA3),
          body: Column(
            children: [
              Image(image: AssetImage('assets/images/logotop.png')),
              if(GlobalCubit.get(context).index==0)
                Expanded(child: Login())
              else
                Expanded(child: Register())
            ],
          ),
        );
      },
    );
  }
}
