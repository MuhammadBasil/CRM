// repair_request.dart
class RepairRequest {
  final String customerName;
  final String phoneNumber;
  final String deviceModel;
  final String imeinumber;
  final String issueDescription;
  String status;

  RepairRequest(this.customerName, this.phoneNumber, this.deviceModel,
      this.imeinumber, this.issueDescription,
      {this.status = 'Pending'});

  @override
  String toString() {
    return 'Customer Name: $customerName, Phone Number: $phoneNumber, Device Model: $deviceModel, imei: $imeinumber Issue: $issueDescription, Status: $status';
  }
}
