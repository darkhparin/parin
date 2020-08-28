import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/application/cwlResultModel.dart';
import 'package:cwl/models/order/orderInvocieCreateRequestModel.dart';
import 'package:cwl/models/order/orderInvoiceConfirmationModel.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:cwl/ui/views/invocie_pdf_view.dart';

import '../locator.dart';
import 'base_model.dart';

class OrderInvoiceViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  OrderInvoiceConfirmationModel _invoiceresponce;
  OrderInvoiceConfirmationModel get invoiceresponce => _invoiceresponce;
  void setinvoiceresponce(OrderInvoiceConfirmationModel val) {
    _invoiceresponce = val;
    notifyListeners();

    if (_invoiceresponce != null) {
      sethasEmail(_invoiceresponce.hasEmailAlert);
      sethasMobile(_invoiceresponce.hasSmsAlert);
      setmobile(_invoiceresponce.mobile);
      setemail(_invoiceresponce.email);
    } else {
      sethasEmail(false);
      sethasMobile(false);
      setmobile('');
      setemail('');
    }
  }

  int _orderid;
  int get orderid => _orderid;
  void setorderid(int val) {
    _orderid = val;
    notifyListeners();
  }

  bool _hasEmail = false;
  bool get hasEmail => _hasEmail;
  void sethasEmail(bool val) {
    _hasEmail = val;
    notifyListeners();
  }

  bool _hasMobile = false;
  bool get hasMobile => _hasMobile;
  void sethasMobile(bool val) {
    _hasMobile = val;
    notifyListeners();
  }

  String _mobile;
  String get mobile => _mobile;
  void setmobile(String val) {
    _mobile = val;
    notifyListeners();
  }

  String _email;
  String get email => _email;
  void setemail(String val) {
    _email = val;
    notifyListeners();
  }

  String _error;
  String get error => _error;
  void seterror(String val) {
    _error = val;
    notifyListeners();
  }

  Future handleStartUpLogic(int param) async {
    setBusy(true);
    seterror('');
    setorderid(param);
    try {
      var responce = await _apiService.orderAPIservice
          .getOrderInvoiceConfirmationResponce(orderid);
      setBusy(false);
      seterror('');
      setinvoiceresponce(responce);
    } catch (e) {
      setBusy(false);
      seterror(e.toString());
      await _dialogService.showDialog(
        title: 'Error',
        description: _error,
      );
    }
  }

  Future createInvoice() async {
    try {
      var model = new OrderInvocieCreateRequestModel();
      model.orderId = orderid;
      model.mobile = _mobile;
      model.email = _email;
      model.hasEmailAlert = _hasEmail;
      model.hasSmsAlert = _hasMobile;

      var result = await _apiService.orderAPIservice
          .getOrderInvoiceCreateResponce(model);
      int invoiceId = result.id;
      var responce = await _dialogService.showDialog(
        title: 'Invoice Successfully Created.',
        buttonTitle: 'Download PDF',
        description: result.message,
      );
      if (responce.confirmed) {
        _navigationService.navigateReplacementTo(PdfViewerPageRoute,
            arguments: invoiceId);
      }
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
