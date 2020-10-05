import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/blocs/query_form_bloc.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';
import 'package:twitch_crawler_ui/respository/transaction_repository.dart';

class QueryForm extends StatefulWidget {
  @override
  _QueryFormState createState() => _QueryFormState();
}

class _QueryFormState extends State<QueryForm> {
  Future<List<String>> _collectionsNames;
  TransactionRepository _transactionRepository;
  @override
  void initState() {
    super.initState();
    _transactionRepository = TransactionRepository();
    _collectionsNames = _transactionRepository.getCollectionNames();
    // _probes = getProbesList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _collectionsNames,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          BlocProvider(
            create: (context) => QueryFormBloc(snapshot.data,
                transactionRepository: TransactionRepository()),
            child: Builder(
              builder: (context) {
                final queryFormBloc = context.bloc<QueryFormBloc>();
                return FormBlocListener<QueryFormBloc, String, String>(
                  onSubmitting: (context, state) {
                    locator<NavigationService>()
                        .navigateTo(InitiateLoadingRoute);
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Input the following fields to Search',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          Spacer(),
                          ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownFieldBlocBuilder(
                                selectFieldBloc: queryFormBloc.country,
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
                                selectFieldBloc: queryFormBloc.channel,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelText: 'Channel',
                                ),
                                showEmptyItem: false,
                                itemBuilder: (context, value) => value,
                                errorBuilder: (context, error) => error),
                          ),
                          Spacer(),
                          RaisedButton(
                            onPressed: queryFormBloc.submit,
                            child: Text(
                              'Search',
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
                                    splashColor:
                                        Colors.orange[200], // splash color
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
                                              fontSize: 16,
                                              color: Colors.white),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Fetching Data...',
                style: TextStyle(fontSize: 36),
              ),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
