// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:email_app/src/core/utils/color_manager.dart';
// import 'package:email_app/src/core/utils/styles_manager.dart';
// import 'package:email_app/src/core/utils/values_manager.dart';
// import 'package:sizer/sizer.dart';

// import '../../features/login/presentation/widgets/text_form_filed_password.dart';
// import '../../features/register/presentation/cubit/register_cubit.dart';
// import 'custom_click.dart';

// class DialogShowPassword extends StatefulWidget {
//   final Widget? textFormField;

//   final TextEditingController controller;
//   final TextEditingController? controller2;
//   final TextInputType type;
//   final String validate;
//   final String label;
//   final String title;
//   final IconData? icon;
//   bool isPassword = false;
//   bool resetPassword;
//   final Function onTap;

//   final String containerText;

//   DialogShowPassword({
//     required this.controller,
//     Key? key,
//     required this.type,
//     this.resetPassword = true,
//     required this.validate,
//     required this.label,
//     required this.containerText,
//     required this.title,
//     this.isPassword = false,
//     this.icon,
//     this.textFormField,
//     this.controller2,
//     required this.onTap,

//     //this.formKey=GlobalKey<FormState>(),
//   }) : super(key: key);
//   final formKey = GlobalKey<FormState>();

//   @override
//   State<DialogShowPassword> createState() => _DialogShowPasswordState();
// }

// class _DialogShowPasswordState extends State<DialogShowPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RegisterCubit, RegisterState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return SingleChildScrollView(
//           child: AlertDialog(
//             alignment: Alignment.center,
//             backgroundColor: ColorManager.primary1,
//             title: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: AppSize.s20),
//                   child: Text(widget.title,
//                       style: getBoldStyle(
//                         color: ColorManager.brightGreen,
//                         fontSize: AppSize.s16,
//                       )),
//                 ),
//                 const Spacer(),
//                 widget.resetPassword
//                     ? Container(
//                         decoration: BoxDecoration(
//                           color: ColorManager.primary3,
//                           borderRadius: BorderRadius.circular(AppSize.s22),
//                         ),
//                         child: CustomClick(
//                           child: Icon(Icons.close, color: ColorManager.grey100),
//                           onTap: () => Navigator.pop(context),
//                         ),
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//             content: Form(
//               key: widget.formKey,
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 const SizedBox(
//                   height: AppSize.s20,
//                 ),
//                 Column(
//                   children: [
//                     defaultFormFiledPassword(
//                         suffix: RegisterCubit.get(context).suffix,
//                         suffixPressed:
//                             RegisterCubit.get(context).changePasswordVisibility,
//                         isPassword: RegisterCubit.get(context).isPassword,
//                         controller: widget.controller,
//                         type: widget.type,
//                         validate: (String? value) {
//                           if (value.toString().length < 8) {
//                             return widget.validate;
//                           } else {
//                             return null;
//                           }
//                         },
//                         label: widget.label),
//                     const SizedBox(
//                       height: AppSize.s18,
//                     ),
//                     defaultFormFiledPassword(
//                         suffix: RegisterCubit.get(context).suffix,
//                         suffixPressed:
//                             RegisterCubit.get(context).changePasswordVisibility,
//                         isPassword: RegisterCubit.get(context).isPassword,
//                         controller: widget.controller2,
//                         type: widget.type,
//                         validate: (String? value) {
//                           if (value.toString().length < 8 ||
//                               value.toString() != widget.controller.text) {
//                             return widget.validate;
//                           } else {
//                             return null;
//                           }
//                         },
//                         label: widget.label)
//                   ],
//                 ),
//                 const SizedBox(
//                   height: AppSize.s50,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: AppPadding.p60),
//                   child: CustomClick(
//                     onTap: () {
//                       if (widget.formKey.currentState!.validate()) {
//                         widget.onTap();
//                       }
//                     },
//                     child: Container(
//                       height: 5.h,
//                       width: 33.w,
//                       decoration: BoxDecoration(
//                         color: ColorManager.primary3,
//                         borderRadius: BorderRadius.circular(AppSize.s48),
//                       ),
//                       child: Center(
//                         child: Text(
//                           widget.containerText,
//                           style: getBoldStyle(
//                             color: ColorManager.grey100,
//                             fontSize: AppSize.s14,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ]),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
