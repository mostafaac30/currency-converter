import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:email_app/src/core/utils/toast.dart';
import 'package:email_app/src/core/widgets/custom_button.dart';
import 'package:email_app/src/features/home/data/models/rate.dart';
import 'package:email_app/src/features/home/presentation/widgets/rate_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/strings_manager.dart';

import '../../../../core/utils/styles_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../cubit/home_view_cubit.dart';
import '../widgets/currency_widget.dart';

class HomeView extends StatefulWidget {
  final Map<String, dynamic> args;
  const HomeView({Key? key, required this.args}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _getData() async {
    if (startDate == null || endDate == null) {
      showErrorToast(context, message: AppStrings.dateRangeError);
      return;
    }
    if (baseCurrency == null || targetCurrency == null) {
      showErrorToast(context, message: AppStrings.currencyError);
      return;
    }

    context.read<HomeViewCubit>().loadData();
  }

  final _scrollController = ScrollController();
  bool _isScrollingDown = true;
  bool _isRowVisible = true;

  List data = [];

  String? baseCurrency;
  String? targetCurrency;
  List<String> currencies = [];

  void _swapCurrencies() {
    setState(() {
      final temp = baseCurrency;
      baseCurrency = targetCurrency;
      targetCurrency = temp;
    });
  }

  void _onBaseCurrencyChanged(String value) {
    setState(() {
      baseCurrency = value;
    });
  }

  void _onTargetCurrencyChanged(String value) {
    setState(() {
      targetCurrency = value;
    });
  }

  Map<String, dynamic> countries = {};

  Future<void> loadCountriesAndCurrencies() async {
    final String response = await rootBundle.loadString('assets/symbols.json');
    countries = await json.decode(response);
    currencies = countries.keys.toList();
  }

  @override
  void initState() {
    // _getData();

    _scrollController.addListener(_onScroll);
    //load symbols from assets
    loadCountriesAndCurrencies();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final isScrollingDown = _scrollController.position.userScrollDirection ==
        ScrollDirection.forward;
    if (isScrollingDown != _isScrollingDown) {
      setState(() {
        _isScrollingDown = isScrollingDown;
        _isRowVisible = _isScrollingDown;
      });
    }

    // Load more messages when the user reaches the end of the list
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<HomeViewCubit>().loadData();
    }
  }

  //refresh
  void _refreshData() {
    context.read<HomeViewCubit>().refreshData();
  }

  final formatter = DateFormat('yyyy-MM-dd');
  void setStartAndEndDate(DateTime? start, DateTime? end) {
    if (start == null || end == null) return;

    context.read<HomeViewCubit>().endDate = formatter.format(end);
    context.read<HomeViewCubit>().startDate = formatter.format(start);
    startDate = start;
    endDate = end;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewLoadingState) {
          data = state.oldData;
        } else if (state is HomeViewSuccessState) {
          data = state.data;
        }
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () {
              _refreshData();
              return Future.value();
            },
            child: CustomScrollView(
              shrinkWrap: true,
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: true,
                  // pinned: true,
                  elevation: 0,
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p20, vertical: AppPadding.p10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager
                            .secondary2Color, // set the background color
                        borderRadius: BorderRadius.circular(
                            AppSize.s14), // set the border radius
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.search,
                          prefixIcon: Icon(Icons.search),
                          // no border color
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          // no border color
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          // no border color
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        // onChanged: _searchData,
                      ),
                    ),
                  ),
                ),

                if (data.isNotEmpty)
                  SliverToBoxAdapter(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = data[index] as Rate;
                          // Build your UI for individual rate items here
                          if (index == 0) {
                            return _buildRateWithDate(item);
                          }
                          return RateWidget(
                            rate: item,
                            country:
                                countries[item.currency]['description'] ?? '',
                          );
                        },
                        separatorBuilder: (context, index) {
                          final item = data[index] as Rate;

                          //if date of current item is different from upcoming item, show date
                          if (index < data.length - 1) {
                            final nextItem = data[index + 1] as Rate;
                            if (item.date != nextItem.date) {
                              return _buildRateWithDate(nextItem);
                            }
                          }
                          return const SizedBox();
                        }),
                  ),

                //loading state
                if (state is HomeViewLoadingState && data.isEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                //loading more state
                if (state is HomeViewLoadingState && data.isNotEmpty)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                //empty state
                if (data.isEmpty)
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
                        const Text("Select Start And End Date"),
                        CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.range,
                            firstDate: DateTime(1999),
                            lastDate: DateTime.now(),
                          ),
                          value: const [],
                          onValueChanged: (dates) {
                            setStartAndEndDate(dates.first, dates.last);
                            print(dates);
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomButton(
                              buttonName: 'Get Data',
                              iconData: FontAwesomeIcons.magnifyingGlass,
                              onPressed: _getData),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
        // }
      },
      listener: (context, state) {
        if (state is HomeViewErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
    );
  }

  Widget _buildRateWithDate(Rate item) {
    return Column(
      children: [
        Row(children: <Widget>[
          Expanded(
              child: Divider(
            color: ColorManager.secondary3Color,
          )),
          if (item.date != null)
            Text(
              formatter.format(item.date!),
              style: getBoldStyle(
                color: ColorManager.secondaryColor,
                fontSize: FontSize.s20,
              ),
            ),
          Expanded(
              child: Divider(
            color: ColorManager.secondary3Color,
          )),
        ]),
        RateWidget(
          rate: item,
          country: countries[item.currency]['description'] ?? '',
        )
      ],
    );
  }
}
