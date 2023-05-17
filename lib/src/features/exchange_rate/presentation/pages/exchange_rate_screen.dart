import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:currency_converter_app/src/core/utils/toast.dart';
import 'package:currency_converter_app/src/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/strings_manager.dart';

import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../data/models/rate.dart';
import '../cubit/exchange_rate_view_cubit.dart';
import '../widgets/currency_widget.dart';
import '../widgets/dated_divider.dart';
import '../widgets/rate_widget.dart';
import '../widgets/rate_with_dated_divider.dart';

class ExchangeRateView extends StatefulWidget {
  final Map<String, dynamic> args;
  const ExchangeRateView({Key? key, required this.args}) : super(key: key);

  @override
  _ExchangeRateViewState createState() => _ExchangeRateViewState();
}

class _ExchangeRateViewState extends State<ExchangeRateView> {
  DateTime? startDate;
  DateTime? endDate;

  final _scrollController = ScrollController();
  bool _isScrollingDown = true;
  bool _isRowVisible = true;

  List data = [];

  String? baseCurrency;
  String? targetCurrency;
  List<String> currencies = [];

  Map<String, dynamic> countries = {};

  final firstYear = 1999;
  final formatter = DateFormat('yyyy-MM-dd');

  Future<void> _getData() async {
    if (startDate == null || endDate == null) {
      showErrorToast(context, message: AppStrings.dateRangeError);
      return;
    }
    if (baseCurrency == null || targetCurrency == null) {
      showErrorToast(context, message: AppStrings.currencyError);
      return;
    }

    context.read<ExchangeRateViewCubit>().loadData();
  }

  void _swapCurrencies() {
    context.read<ExchangeRateViewCubit>().swapCurrencies();
  }

  void _onBaseCurrencyChanged(String value) {
    context.read<ExchangeRateViewCubit>().setBaseCurrency = value;
  }

  void _onTargetCurrencyChanged(String value) {
    context.read<ExchangeRateViewCubit>().setTargetCurrency = value;
  }

  void _onScroll() {
    final isScrollingDown = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
    if (isScrollingDown != _isScrollingDown) {
      // setState(() {
      _isScrollingDown = isScrollingDown;
      _isRowVisible = _isScrollingDown;
      // });
    }

    // Load more messages when the user reaches the end of the list
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ExchangeRateViewCubit>().loadData();
    }
  }

  void setStartAndEndDate(List<DateTime?> dates) {
    final start = dates.first;
    final end = dates.last;
    if (dates.length == 1) {
      context.read<ExchangeRateViewCubit>().setStartDate =
          formatter.format(start!); //granted that start is not null
      context.read<ExchangeRateViewCubit>().setEndDate = null;
      endDate = null;
      return;
    } else if (dates.length == 2) {
      //granted that both are not null
      context.read<ExchangeRateViewCubit>().setStartDate = formatter.format(start!);
      context.read<ExchangeRateViewCubit>().setEndDate = formatter.format(end!);
      return;
    }
  }

  @override
  void initState() {
    // _getData();

    _scrollController.addListener(_onScroll);
    //load symbols from assets
    // loadCountriesAndCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeRateViewCubit, ExchangeRateViewState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            shrinkWrap: true,
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                floating: true,
                elevation: AppSize.s0,
                leading: Icon(
                  FontAwesomeIcons.coins,
                  color: ColorManager.secondaryColor,
                  size: AppSize.s30,
                ),
                title: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    AppStrings.appName,
                    style: getBoldStyle(
                      color: ColorManager.secondary3Color,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
                centerTitle: false,
              ),

              //loading state
              if (state is ExchangeRateViewLoadingState)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              //empty state
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CurrencySelectionWidget(
                      baseCurrency: baseCurrency,
                      targetCurrency: targetCurrency,
                      currencies: currencies,
                      onBaseCurrencyChanged: _onBaseCurrencyChanged,
                      onTargetCurrencyChanged: _onTargetCurrencyChanged,
                      onSwapCurrencies: _swapCurrencies,
                    ),
                    Text(
                      AppStrings.selectStartEndDate,
                      style:
                          getSemiBoldStyle(color: ColorManager.secondary3Color),
                    ),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                        firstDate: DateTime(firstYear),
                        lastDate: DateTime.now(),
                      ),
                      value: [startDate, endDate],
                      onValueChanged: (dates) {
                        setStartAndEndDate(dates);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p10),
                      child: CustomButton(
                          buttonName: AppStrings.checkHistory,
                          iconData: FontAwesomeIcons.magnifyingGlass,
                          onPressed: _getData),
                    ),
                  ],
                ),
              ),
              if (data.isNotEmpty)
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          state.hasMoreItems ? data.length + 1 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Build your UI for individual rate items here

                        if (index == data.length && state.hasMoreItems) {
                          return const CupertinoActivityIndicator();
                        } else {
                          final item = data[index] as Rate;
                          final country =
                              countries[item.currency]['description'] ?? '';

                          if (index == 0) {
                            return RateWithDatedDivider(
                              item: item,
                              country: country,
                            );
                          }
                          return RateWidget(
                            rate: item,
                            country: country,
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        //if date of current item is different from upcoming item, show date
                        if (index < data.length - 1 && !state.hasMoreItems) {
                          final item = data[index] as Rate;

                          final nextItem = data[index + 1] as Rate;
                          if (item.date != nextItem.date) {
                            return DatedDivider(
                              date: nextItem.date,
                            );
                          }
                        }

                        return const SizedBox();
                      }),
                )),
            ],
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: data.isEmpty
              ? null
              : FloatingActionButton.extended(
                  label: const Text(AppStrings.clear),
                  onPressed: () {
                    context.read<ExchangeRateViewCubit>().reset();
                  },
                  backgroundColor: ColorManager.secondary5Color,
                  icon: const Icon(FontAwesomeIcons.trashCan),
                ),
        );
        // }
      },
      listener: (context, state) async {
        if (state is ExchangeRateViewErrorState) {
          showErrorToast(context, message: state.error);
        } else if (state is ExchangeRateViewLoadingState) {
          showSuccessToast(context, message: AppStrings.loadingCurrencyHistory);

          data = state.oldData;
        } else if (state is ExchangeRateViewSuccessState) {
          data = state.data;
        } else if (state is ExchangeRateViewSymbolsLoadedState) {
          currencies = state.currencies;
          countries = state.countries;
        } else if (state is ExchangeRateViewSwapCurrencyState) {
          baseCurrency = state.baseCurrency;
          targetCurrency = state.targetCurrency;
        } else if (state is ExchangeRateViewUpdateBaseCurrencyState) {
          baseCurrency = state.baseCurrency;
        } else if (state is ExchangeRateViewUpdateTargetCurrencyState) {
          targetCurrency = state.targetCurrency;
        } else if (state is ExchangeRateViewUpdateStartDateState) {
          startDate = DateTime.parse(state.startDate);
        } else if (state is ExchangeRateViewUpdateEndDateState) {
          endDate = DateTime.tryParse(state.endDate ?? '');
        } else if (state is ExchangeRateViewResetState) {
          data = [];
          showSuccessToast(context, message: AppStrings.clearData);
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }
}
