import 'dart:io';
import 'repair_request.dart';

void main() {
  print("Welcome to the Mobile Repair Managment System");
  if (login()) {
    print("Login Successful");
    var mobileRepairs =
        <RepairRequest>[]; // Create the repairRequests list here
    displayMainMenu(
        mobileRepairs); // Pass repairRequests list to displayMainMenu
  } else {
    print("Login Failed. Exiting...");
  }
}

void addRepairRequest(List<RepairRequest> mobileRepairs) {
  stdout.write('Enter customer name: ');
  var customerName = stdin.readLineSync()!;
  stdout.write('Enter customer phone number: ');
  var phoneNumber = stdin.readLineSync()!;
  stdout.write('Enter device model: ');
  var deviceModel = stdin.readLineSync()!;
  stdout.write('Enter device 15 digit IMEI number: ');
  var imeiNumber = stdin.readLineSync()!;
  stdout.write('Enter issue description: ');
  var issueDescription = stdin.readLineSync()!;
  var repairRequest = RepairRequest(
      customerName, phoneNumber, deviceModel, imeiNumber, issueDescription);
  mobileRepairs.add(repairRequest);
  print('Repair request added successfully.');
}

void viewRepairRequests(List<RepairRequest> mobileRepairs) {
  if (mobileRepairs.isEmpty) {
    print('No repair requests found.');
  } else {
    print('Repair Requests:');
    mobileRepairs.forEach((repairRequest) => print(repairRequest));
  }
}

void updateRepairStatus(List<RepairRequest> mobileRepairs) {
  if (mobileRepairs.isEmpty) {
    print('No repair requests found.');
    return;
  }

  viewRepairRequests(mobileRepairs);

  stdout.write('Enter index of repair request to update: ');
  var index = int.tryParse(stdin.readLineSync()!) ?? -1;
  if (index >= 0 && index < mobileRepairs.length) {
    var repairRequest = mobileRepairs[index];
    stdout.write('Enter new status for ${repairRequest.customerName}: ');
    var status = stdin.readLineSync()!;
    repairRequest.status = status;
    print('Repair status updated successfully.');
  } else {
    print('Invalid index.');
  }
}

void deleteRepairRequest(List<RepairRequest> mobileRepairs) {
  if (mobileRepairs.isEmpty) {
    print('No repair requests found.');
    return;
  }

  viewRepairRequests(mobileRepairs);

  stdout.write('Enter index of repair request to delete: ');
  var index = int.tryParse(stdin.readLineSync()!) ?? -1;
  if (index >= 0 && index < mobileRepairs.length) {
    mobileRepairs.removeAt(index);
    print('Repair request deleted successfully.');
  } else {
    print('Invalid index.');
  }
}

void displayMainMenu(List<RepairRequest> mobileRepairs) {
  while (true) {
    print("\nMain Menu:");
    print("1. Add Repair Request");
    print("2. View Repair Requests");
    print("3. Update Repair Status");
    print("4. Delete Repair Request");
    print("5. Logout");
    stdout.write("Enter your choice: ");
    var choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        addRepairRequest(mobileRepairs);
        break;
      case '2':
        viewRepairRequests(mobileRepairs);
        break;
      case '3':
        updateRepairStatus(mobileRepairs);
        break;
      case '4':
        deleteRepairRequest(mobileRepairs);
        break;
      case '5':
        print("Logging out...");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

bool login() {
  String username;
  String userpwd;
  String serverUsername = "basil";
  String serverPassword = "123";

  print("Please enter your username:");
  username = stdin.readLineSync()!;
  print("Please enter your password:");
  userpwd = stdin.readLineSync()!;

  if (username == serverUsername && userpwd == serverPassword) {
    return true;
  } else {
    print("Login Failed. Please try again.");
    return false;
  }
}
