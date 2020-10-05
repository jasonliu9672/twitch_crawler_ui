import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:twitch_crawler_ui/apis/probe.dart';
import 'package:twitch_crawler_ui/models/probe.dart';

const Map LANGUAGE_MAP = {
  'Traditional Chinese': 'zh',
  'English': 'en',
  'Spanish': 'es',
  'Korean': 'ko',
  'Russian': 'ru',
  'Japanese': 'ja',
  'French': 'fr'
};
const COUNTRY_MAP = {
  'Taiwan': 'Taiwan',
  'Albania': 'Albania',
  'Argentina': 'Argentina',
  'Australia': 'Australia',
  'Austria': 'Austria',
  'Belgium': 'Belgium',
  'Brazil': 'Brazil',
  'Bulgaria': 'Bulgaria',
  'Canada': 'Canada',
  'France': 'France',
  'Georgia': 'Georgia',
  'Germany': 'Germany',
  'Greece': 'Greece',
  'Hong Kong': 'HongKong',
  'Iceland': 'Iceland',
  'Japan': 'Japan',
  'Mexico': 'Mexico',
  'South Korea': 'SouthKorea',
  'Swedan': 'Swedan',
  'Singapore': 'Singapore',
  'United Kingdom': 'UnitedKingdom',
  'United States': 'UnitedStates'
};

class InitiateFormBloc extends FormBloc<String, String> {
  final country = SelectFieldBloc(items: COUNTRY_MAP.keys.toList());
  final language = SelectFieldBloc(items: LANGUAGE_MAP.keys.toList());

  InitiateFormBloc() {
    addFieldBlocs(
      fieldBlocs: [country, language],
    );
    country.addValidators([FieldBlocValidators.required]);
    language.addValidators([FieldBlocValidators.required]);
  }
  @override
  void onSubmitting() async {
    var response = await initiateProbe(
        COUNTRY_MAP[country.value], LANGUAGE_MAP[language.value]);
    if (response is Probe) {
      emitSuccess();
    } else {
      emitFailure(failureResponse: response.toString());
    }
  }
}
