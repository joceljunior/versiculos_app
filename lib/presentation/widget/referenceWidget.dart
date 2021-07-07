import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:versiculos_app/models/reference.dart';
import 'package:versiculos_app/presentation/widget/cubit/reference_cubit.dart';
import 'package:share/share.dart';

class ReferenceContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReferenceCubit(),
      child: ReferenceWidget(),
    );
  }
}

// ignore: camel_case_types
class ReferenceWidget extends StatelessWidget {
  final String textBiblie;
  final String referenceBiblie;

  const ReferenceWidget({Key key, this.textBiblie, this.referenceBiblie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: Image.asset(
              'assets/biblieOpen.png',
              height: 200,
              width: 500,
            ),
          ),
        ),
        BlocBuilder<ReferenceCubit, Reference>(
          builder: (context, state) {
            if (state == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.purple,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  child: ListTile(
                    tileColor: Colors.purple[50],
                    subtitle: Row(
                      children: [
                        Text(state.referenceBible),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                            visible: state.referenceBible != "",
                            child: Container(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                  backgroundColor: Colors.purple,
                                  child: Icon(
                                    Icons.share,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    Share.share(state.text +
                                        "\n\n\n" +
                                        state.referenceBible);
                                  }),
                            ))
                      ],
                    ),
                    title: Container(
                      margin: EdgeInsets.all(30),
                      child: Center(
                        child: Text(state.text),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: RaisedButton(
              elevation: 15,
              color: Colors.purple,
              onPressed: () {
                //context.read<ReferenceCubit>().getVersicule();
                context.read<ReferenceCubit>().getVersiculeDatabase();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Text(
                  'Novo Versículo',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
