import 'package:flutter/material.dart';  
import 'package:cloud_firestore/cloud_firestore.dart';
final databaseReference = Firestore.instance;
final nameController = TextEditingController();
final dobController = TextEditingController();
final phoneNumberController = TextEditingController();
final panController = TextEditingController();
final aadharController = TextEditingController();
final landareaController = TextEditingController();
final addressController = TextEditingController();
final bankaccController = TextEditingController();
void createRecord() async {
  await databaseReference.collection("profile")
      .add({
        'Name': nameController.text, 
        'DOB': dobController.text ,
        'PhoneNo': phoneNumberController.text, 
        'PANNo': panController.text ,
        'AadharNo': aadharController.text, 
        'LandArea': landareaController.text,
        'Address': addressController.text ,
        'BankAccNo': bankaccController.text
      });
}
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    final appTitle = 'Flutter Form Demo';  
    return MaterialApp(  
      title: appTitle,  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text(appTitle),  
        ),  
        body: MyCustomForm(),  
      ),  
    );  
  }  
}  
// Create a Form widget.  
class MyCustomForm extends StatefulWidget {  
  @override  
  MyCustomFormState createState() {  
    return MyCustomFormState();  
  }  
}  
// Create a corresponding State class, which holds data related to the form.  
class MyCustomFormState extends State<MyCustomForm> {  
  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>();  
  
  @override  
  Widget build(BuildContext context) {  
    // Build a Form widget using the _formKey created above.  
    return Form(  
      key: _formKey, 
      child: SingleChildScrollView(
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          TextFormField( 
            controller: nameController , 
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Full Name',  
              labelText: 'Name:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ),  
          TextFormField( 
            controller: phoneNumberController ,  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.phone),  
              hintText: 'Enter Your Phone Number',  
              labelText: 'Phone No:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter valid phone number';  
              }  
              return null;  
            },  
          ),  
          TextFormField(
            controller: dobController ,
            decoration: const InputDecoration(  
            icon: const Icon(Icons.calendar_today),  
            hintText: 'Enter Your Date Of Birth',  
            labelText: 'DOB:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter valid date';  
              }  
              return null;  
            },  
           ),  
           TextFormField(  
            controller: panController , 
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Pan No',  
              labelText: 'Pan No:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 
          TextFormField(  
            controller: aadharController ,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Aadhar No',  
              labelText: 'Aadhar No:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 
          TextFormField(  
            controller: addressController ,
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Address',  
              labelText: 'Address:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 
          TextFormField(  
            controller: landareaController , 
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Land Area(Acres)',  
              labelText: 'Land Area(Acres):',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 
          TextFormField(
            controller: bankaccController ,  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person),  
              hintText: 'Enter Your Bank Account No',  
              labelText: 'Bank Acc No:',  
            ),  
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('Submit'),  
                onPressed: () {  
                  // It returns true if the form is valid, otherwise returns false  
                  if (_formKey.currentState.validate()) {  
                    // If the form is valid, display a Snackbar.  
                    Scaffold.of(context)  
                        .showSnackBar(SnackBar(content: Text('Data is in processing.')));  
                    createRecord();
                  }  
                },  
              )),  
        ],  
      ),
      ),
    );  
  }  
}  