import 'package:assignment_1/assignment.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});
  static const String routeName = '/booking';

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  @override
  void initState() {
    super.initState();
  }

  final _submitKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlCity = TextEditingController();

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPhone.dispose();
    ctrlCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Form")
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Form(
            key: _submitKey,
            child: Column(
              children: [
                SizedBox(height: 32),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person)
                  ),
                  controller: ctrlName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    return value.toString().isEmpty
                     ? 'Masukan Nama Anda!' : null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email", 
                    prefixIcon: Icon(Icons.email)
                  ),
                  controller: ctrlEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return !EmailValidator.validate(value.toString())
                        ? 'Email tidak valid!'
                        : null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone", 
                    prefixIcon: Icon(Icons.phone)
                  ),
                  controller: ctrlPhone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value.toString().isEmpty
                        ? 'Masukkan Nomor Hp Anda!'
                        : null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "City", 
                    prefixIcon: Icon(Icons.location_city)
                  ),
                  controller: ctrlCity,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value.toString().isEmpty
                        ? 'Masukkan Kota Anda!'
                        : null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (ctrlCity.text.toString().isEmpty ||
                          ctrlEmail.text.toString().isEmpty ||
                          ctrlName.text.toString().isEmpty ||
                          ctrlPhone.text.toString().isEmpty) {
                        showDialog(
                            context: context,
                            builder: ((((context) {
                              return AlertDialog(
                                title: Text("Booking Failed"),
                                content: Column(children: [
                                  Text("Please fill all form field!"),
                                  
                                ]),
                              );
                            }))));
                      } else {
                        showDialog(
                            context: context,
                            builder: ((((context) {
                              return AlertDialog(
                                title: Text("Booking Confirmation!"),
                                content: Column(children: [
                                  Text("Name: " + ctrlName.text.toString()),
                                  Text("Email: " + ctrlEmail.text.toString()),
                                  Text("Phone: " + ctrlPhone.text.toString()),
                                  Text("City: " + ctrlCity.text.toString()),
                                  SizedBox(height: 16),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, assignment.routeName);
                                      },
                                      child: Text("OK"))
                                ]),
                              );
                            }))));
                      }
                    },
                    child: Text("OK"))
              ],
            ),
            )
          ),
      ),
    );
  }
}