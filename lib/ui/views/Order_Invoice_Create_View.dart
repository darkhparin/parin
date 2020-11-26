import 'package:cwl/ui/widgets/busy_button.dart';
import 'package:cwl/ui/widgets/input_field.dart';
import 'package:cwl/viewmodels/order_invoice_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/locator.dart';

import 'guest_view.dart';

class OrderInvoiceCreateView extends StatefulWidget {
  final int _orderidNo;

  OrderInvoiceCreateView({@required int orderidNo, Key key})
      : _orderidNo = orderidNo,
        super(key: key);

  @override
  _OrderInvoiceCreateViewState createState() => _OrderInvoiceCreateViewState();
}

class _OrderInvoiceCreateViewState extends State<OrderInvoiceCreateView> {
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return ViewModelProvider<OrderInvoiceViewModel>.withConsumer(
      viewModelBuilder: () => OrderInvoiceViewModel(),
      onModelReady: (model) async {
        await model.handleStartUpLogic(widget._orderidNo);
        emailController.text =
            model.invoiceresponce != null ? model.invoiceresponce.email : '';
        mobileController.text =
            model.invoiceresponce != null ? model.invoiceresponce.mobile : '';
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Invoice Create',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => GuestView(),
                  )),
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.blue[500],
        ),
        body: model.busy
            ? showLoading()
            : model.error != '' ? Container() : orderInvoiceConfirmation(model),
      ),
    );
  }

  Widget showLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget orderInvoiceConfirmation(OrderInvoiceViewModel model) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.blue[100]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),

          // height: screenSize.height/2.9,
          // width: screenSize.width/1,

          child: Card(
            elevation: 20,
            // color: Colors.lightGreen[100],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            margin: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: new Text(
                              model.invoiceresponce == null
                                  ? ''
                                  : '${model.invoiceresponce.partyName ?? ''}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.add_circle_outline,
                              color: Colors.blue,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.invoiceresponce.igst}    IGST',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.add_circle_outline,
                              color: Colors.blueAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.invoiceresponce.sgst}    SGST ',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.add_circle_outline,
                              color: Colors.blueAccent,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.invoiceresponce.cgst}    CGST ',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                      padding: new EdgeInsets.all(5.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Icon(
                              Icons.done_outline,
                              color: Colors.green,
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: new Text(
                              '  ${model.invoiceresponce.amount}    TOTAL',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(0, 0, 20, 0),
                          // child: RaisedButton(
                          child: Text(
                            '',
                            style: TextStyle(color: Colors.black),
                          ),
                          //   elevation: 10,
                          //   color: Colors.deepPurple,
                          //   shape: RoundedRectangleBorder(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(8))),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  Text('Email Address'),
                  Row(children: <Widget>[
                    Expanded(
                      child: InputField(
                        placeholder: 'Email Address',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        onChanged: (text) {
                          model.setemail(text);
                        },
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Checkbox(
                          value: model.hasEmail,
                          onChanged: (bool val) {
                            model.sethasEmail(val);
                          },
                        )),
                  ]),
                  Text('Mobile Number'),
                  Row(children: <Widget>[
                    Expanded(
                      child: InputField(
                        placeholder: 'Mobile Number',
                        controller: mobileController,
                        textInputType: TextInputType.number,
                        onChanged: (text) {
                          model.setmobile(text);
                        },
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Checkbox(
                          value: model.hasMobile,
                          onChanged: (bool val) {
                            model.sethasMobile(val);
                          },
                        )),
                  ]),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: BusyButton(
                        title: 'Create Invoice',
                        busy: model.busy,
                        onPressed: () {
                          model.createInvoice();
                        }),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
