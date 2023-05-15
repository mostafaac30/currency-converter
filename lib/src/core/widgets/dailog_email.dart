// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:email_app/src/core/utils/color_manager.dart';
// import 'package:email_app/src/core/utils/strings_manager.dart';
// import 'package:email_app/src/core/utils/styles_manager.dart';
// import 'package:email_app/src/core/utils/values_manager.dart';
// import 'package:sizer/sizer.dart';

// import 'custom_click.dart';

// // ignore: must_be_immutable
// class DialogShowEmail extends StatefulWidget {
//   final Widget? textFormField;

//   final TextEditingController controller;
//   final TextEditingController? controller2;
//   final TextInputType type;
//   final String validate;
//   final String label;
//   final String title;
//   final IconData? icon;
//   bool isPassword = false;
//   final Function onTap;

//   final String containerText;

//   DialogShowEmail({
//     required this.controller,
//     Key? key,
//     required this.type,
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
//   State<DialogShowEmail> createState() => _DialogShowEmailState();
// }

// class _DialogShowEmailState extends State<DialogShowEmail> {
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
//                 Container(
//                   decoration: BoxDecoration(
//                     color: ColorManager.primary3,
//                     borderRadius: BorderRadius.circular(AppSize.s22),
//                   ),
//                   child: CustomClick(
//                     child: Icon(Icons.close, color: ColorManager.grey100),
//                     onTap: () => Navigator.pop(context),
//                   ),
//                 ),
//               ],
//             ),
//             content: Form(
//               key: widget.formKey,
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 const SizedBox(
//                   height: AppSize.s20,
//                 ),
//                 defaultFormFiled(
//                   controller: widget.controller,
//                   type: TextInputType.emailAddress,
//                   validate: (String? value) {
//                     final regex = RegExp(
//                       r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
//                       caseSensitive: false,
//                       multiLine: true,
//                     );

//                     if (!regex.hasMatch(value.toString())) {
//                       return AppStrings.validateEmail;
//                     } else {
//                       return null;
//                     }
//                   },
//                   label: AppStrings.email,
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
