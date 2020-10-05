import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/blocs/InitiateFormBloc.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';

class InitiateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitiateFormBloc(),
      child: Builder(
        builder: (context) {
          final initiateFormBloc = context.bloc<InitiateFormBloc>();
          return FormBlocListener<InitiateFormBloc, String, String>(
            onSubmitting: (context, state) {
              locator<NavigationService>().navigateTo(InitiateLoadingRoute);
            },
            onSuccess: (context, state) {
              locator<NavigationService>().navigateTo(InitiateSuccessRoute);
            },
            onFailure: (context, state) {
              locator<NavigationService>().navigateTo(InitiateFailRoute,
                  argument: state.failureResponse);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      'Twitch Crawler',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, letterSpacing: 4),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Input the following fields to initiate a probe',
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  Spacer(),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownFieldBlocBuilder(
                        selectFieldBloc: initiateFormBloc.country,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Country',
                          prefixIcon: Icon(
                            Icons.place,
                            color: Colors.red[300],
                          ),
                        ),
                        showEmptyItem: false,
                        itemBuilder: (context, value) => value,
                        errorBuilder: (context, error) => error),
                  ),
                  Spacer(),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownFieldBlocBuilder(
                        selectFieldBloc: initiateFormBloc.language,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Language',
                          prefixIcon: Icon(
                            Icons.language,
                            color: Colors.green[300],
                          ),
                        ),
                        itemBuilder: (context, value) => value,
                        showEmptyItem: false,
                        errorBuilder: (context, error) => error),
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: initiateFormBloc.submit,
                    child: Text(
                      'Initiate',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(
                    flex: 15,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox.fromSize(
                        size: Size(76, 36), // button width and height
                        child: ClipRect(
                          child: Material(
                            color: Colors.blue[600], // button color
                            child: InkWell(
                              splashColor: Colors.orange[200], // splash color
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateTo(SideBarMenuRoute);
                              }, // button pressed
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ), // icon
                                  Text(
                                    "Menu",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ), // text
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
