import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/controller/login_controller/login_states.dart';
import 'package:my_doctor/core/constants.dart';
import 'package:my_doctor/views/LayoutScreen.dart';
import 'package:my_doctor/views/Register_screen.dart';
import '../components/general_component.dart';
import '../controller/login_controller/login_cubit.dart';
import '../network/local/cash_helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state){
          if(state is LoginSuccessState)
          {
            if(state.loginModel.status!)
            {


              CashHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data?.token
              ).then((value) => {
                token = state.loginModel.data?.token,
                //  navigateAndFinish(context, ShopLayout())
              });
            }else
            {
              // print(state.loginModel.message);

              showToast(
                  text:state.loginModel.message!,
                  state: ToastState.ERROR
              );
            }
          }
        },
        builder: (context, state){
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login'.trx(context),
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                              color:mainColor
                          ),
                        ),
                        const SizedBox(height: 15,),
                        CustomTextField(
                          controller: mailController,
                          prefix: Icons.phone,
                          hintText: 'Mail'.trx(context),
                        ),
                        const SizedBox(height: 30,),
                        CustomTextField(
                          controller: passwordController,
                          prefix: Icons.lock_outline,
                          hintText: 'Password'.trx(context),

                         obscureText:LoginCubit.get(context).isPassword,
                        suffix:LoginCubit.get(context).suffix ,
                         suffixpressed: () {
                           LoginCubit.get(context).changePasswordVisibility();
                         }
                        ),
                        const SizedBox(height: 15,),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context)=> defaultButton(
                                width: 200,
                                function: () {
                                  if(formKey.currentState!.validate())
                                  {
                                    LoginCubit.get(context).userLogin(
                                        email: mailController.text,
                                        password: passwordController.text);
                                    navigateTo(context,const LayoutScreen());
                                  }
                                },
                                text: 'Login'.trx(context)),
                            fallback:(context)=>const Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Text('Do_not_have_an_account?'.trx(context),style: const TextStyle(
                                fontSize: 20,
                               color: Colors.black
                            ),),
                            TextButton(
                                onPressed: (){
                                   navigateTo(context, RegisterScreen());
                                },
                                child:  Text('Register'.trx(context),style: const TextStyle(
                                    fontSize: 20),))
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },

      ),
    );
  }
}

