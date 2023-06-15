import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_doctor/config/local/app_localisations.dart';
import 'package:my_doctor/views/login_screen.dart';
import '../components/general_component.dart';
import '../controller/register_cubit/cubit.dart';
import '../controller/register_cubit/states.dart';
import '../core/constants.dart';
import '../network/local/cash_helper.dart';
import 'LayoutScreen.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var maritalStatusController = TextEditingController();
  var phoneController = TextEditingController();
  var dateOfBirthController =TextEditingController();
  String? dropdownValue ;
  String? dropdownValue2 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:  (BuildContext context)=> RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state){
          if(state is RegisterSuccessState)
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
              print(state.loginModel.message);

              showToast(
                  text:state.loginModel.message!,
                  state: ToastState.ERROR
              );
            }
          }
        },
        builder: (context, state){
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register'.trx(context),
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: mainColor
                            ),
                          ),

                          const SizedBox(height: 30,),
                          CustomTextField(
                            controller: nameController,
                            prefix: Icons.person,
                            hintText: 'Name'.trx(context),
                            inputType: TextInputType.text,
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: ageController,
                            prefix: Icons.person,
                            hintText: 'age'.trx(context),
                            inputType: TextInputType.number,
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: dateOfBirthController,
                            prefix: Icons.date_range,
                            hintText: 'date_of_birth'.trx(context),
                            inputType: TextInputType.datetime,
                            onTap: (){
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-08-30'),
                              ).then((value)
                              {

                                dateOfBirthController.text = DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: genderController,
                            prefix: Icons.generating_tokens_sharp,
                            hintText: 'Gender'.trx(context),
                            inputType: TextInputType.text,

                          ),
///////

                    // DropdownButtonFormField<String>(
                    //   value: dropdownValue,
                    //   onChanged: (String? newValue) {
                    //     if (newValue != null) {
                    //       dropdownValue = newValue;
                    //     }
                    //   },
                    //   items: <String>[
                    //     'male',
                    //     'female',
                    //   ].map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    //   decoration: InputDecoration(
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: mainColor,
                    //         width: 3,
                    //       ),
                    //       borderRadius: BorderRadius.circular(17),
                    //     ),
                    //     labelText: 'Gender'.trx(context),
                    //     labelStyle: TextStyle(color: mainColor),
                    //     prefixIcon: Icon(Icons.generating_tokens_sharp, color: mainColor),
                    //   ),
                    // ),

///////
                          const SizedBox(height: 15,),
// CustomTextField(
//   controller: maritalStatusController,
//   prefix: Icons.person,
//   hintText: 'Marital Status',
//   inputType: TextInputType.text,
// )
                          DropdownButtonFormField<String>(
                            value:dropdownValue,
                            onChanged: (String? newValue) {
                                dropdownValue2 = newValue!;
                            },
                            items: <String>[
                              'Single'.trx(context),
                              'Marred'.trx(context),
                              'devorsed'.trx(context),
                              'Widower'.trx(context),
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(
                                      color: mainColor,
                                      width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(17)
                              ),
                              labelText: 'Marital_Status'.trx(context),
                              labelStyle: const TextStyle(color: mainColor),
                              prefixIcon: const Icon( Icons.person,color: mainColor,),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: emailController,
                            prefix: Icons.email_outlined,
                            hintText: 'Mail'.trx(context),
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: passwordController,
                            prefix: Icons.lock_outline,
                            hintText: 'Password'.trx(context),
                            inputType: TextInputType.visiblePassword,
                            //obscureText: true,
                            obscureText:  RegisterCubit.get(context).isPassword,
                            suffix: RegisterCubit.get(context).suffix ,
                            suffixpressed: (){
                              RegisterCubit.get(context).changePasswordVisibility();

                            },
                          ),
                          const SizedBox(height: 15,),
                          CustomTextField(
                            controller: phoneController,
                            prefix: Icons.phone,
                            hintText: 'Phone'.trx(context),
                            inputType: TextInputType.phone,
                          ),
                          const SizedBox(height: 30,),
                          ConditionalBuilder(
                            condition: state is ! RegisterLoadingState,
                              builder: (context)=>Center(
                                child: defaultButton(
                                    width: 200,
                                    function: () {
                                      if(formKey.currentState!.validate())
                                      {
                                        RegisterCubit.get(context).userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                            gender: genderController.text,
                                            maritalState: dropdownValue2!,
                                            brithdate: dateOfBirthController.text,
                                            age: ageController.text
                                        );

                                        navigateTo(context,const LayoutScreen() );
                                      }
                                    },
                                    text: 'Register'.trx(context)),
                              ),
                            fallback:(context)=>const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Text('Already_have_an_account'.trx(context),style: TextStyle(
                                  fontSize: 20
                              ),),
                              TextButton(
                                  onPressed: (){
                                      navigateTo(context,LoginScreen());
                                  },
                                  child:   Text('Login'.trx(context),style: TextStyle(
                                      fontSize: 20),))
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ) ;
  }
}
