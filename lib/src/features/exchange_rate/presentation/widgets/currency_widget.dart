import 'package:currency_converter_app/src/core/utils/color_manager.dart';
import 'package:currency_converter_app/src/core/utils/font_manager.dart';
import 'package:currency_converter_app/src/core/utils/strings_manager.dart';
import 'package:currency_converter_app/src/core/utils/styles_manager.dart';
import 'package:currency_converter_app/src/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CurrencySelectionWidget extends StatefulWidget {
  String? baseCurrency;
  String? targetCurrency;
  List<String> currencies;
  Function(String) onBaseCurrencyChanged;
  Function(String) onTargetCurrencyChanged;
  Function()? onSwapCurrencies;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CurrencySelectionWidget({
    super.key,
    required this.baseCurrency,
    required this.targetCurrency,
    required this.currencies,
    required this.onBaseCurrencyChanged,
    required this.onTargetCurrencyChanged,
    this.onSwapCurrencies,
  });

  @override
  _CurrencySelectionWidgetState createState() =>
      _CurrencySelectionWidgetState();
}

class _CurrencySelectionWidgetState extends State<CurrencySelectionWidget> {
  TextStyle labelStyle = getMediumStyle(
    color: ColorManager.secondary3Color,
    fontSize: FontSize.s12,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: widget.baseCurrency,
                    labelStyle: labelStyle,
                    hintText: AppStrings.baseCurrency,
                    border: const OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return widget.currencies
                      .where((currency) => currency
                          .toLowerCase()
                          .startsWith(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: widget.onBaseCurrencyChanged,
                validator: (value) {
                  if (value!.isEmpty ||
                      value == widget.targetCurrency ||
                      widget.currencies.contains(value) == false) {
                    return AppStrings.selectBaseCurrency;
                  }
                  return null;
                },
                onSaved: (value) {
                  // Handle saving the selected base currency
                  final check = widget.formKey.currentState!.validate();
                  if (check) {
                    widget.onBaseCurrencyChanged(value!);
                  }
                },
              ),
            ),
            IconButton(
              onPressed: widget.onSwapCurrencies,
              icon: const Icon(Icons.swap_horiz),
            ),
            Flexible(
              child: TypeAheadFormField<String>(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: widget.targetCurrency,
                    labelStyle: labelStyle,
                    hintText: AppStrings.targetCurrency,
                    border: const OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  // Replace this with your own logic to fetch currency suggestions based on the pattern

                  return widget.currencies
                      .where((currency) => currency
                          .toLowerCase()
                          .startsWith(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: widget.onTargetCurrencyChanged,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.selectTargetCurrency;
                  }
                  return null;
                },
                onSaved: (value) {
                  // Handle saving the selected target currency
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
