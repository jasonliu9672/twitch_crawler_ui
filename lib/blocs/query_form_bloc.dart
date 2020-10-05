import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:twitch_crawler_ui/respository/transaction_repository.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';

class QueryFormBloc extends FormBloc<String, String> {
  final TransactionRepository _transactionRepository;
  final channel = SelectFieldBloc(items: ['HA']);
  var country;

  QueryFormBloc(List<String> collectionNames,
      {@required TransactionRepository transactionRepository})
      : assert(transactionRepository != null),
        _transactionRepository = transactionRepository {
    country = SelectFieldBloc(items: collectionNames);
    addFieldBlocs(
      fieldBlocs: [country],
    );
    country.addValidators([FieldBlocValidators.required]);
    country.onValueChanges(onData: (prevous, current) async* {
      if (current.value.isNotEmpty) {
        addFieldBlocs(fieldBlocs: [channel]);
      } else {
        removeFieldBlocs(fieldBlocs: [channel]);
      }
    });
  }
  @override
  void onSubmitting() async {
    var response;
    if (channel.value.isNotEmpty)
      response = await _transactionRepository
          .getTransactionsByCountry(country.value, channel: channel.value);
    else {
      response =
          await _transactionRepository.getTransactionsByCountry(country.value);
    }
    if (response.isNotEmpty) {
      locator<MainContentNav>()
          .navigateTo(DataTablePageRoute, argument: response);
      emitSuccess();
    } else {
      emitFailure();
    }
  }
}
