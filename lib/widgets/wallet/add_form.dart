import 'package:flutter/material.dart';
import '/color.dart';

class AddForm extends StatefulWidget {
  AddForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(
    int transactionAmount,
    BuildContext ctx,
  ) submitFn;

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formkey = GlobalKey<FormState>();
  String _cardNum = '';
  String _nameTrans = '';
  int _amountTrans = 0;

  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState!.save();
      widget.submitFn(
        _amountTrans,
        context,
      );
      print(_nameTrans);
      print(_amountTrans);
      print(_cardNum);
    }
    _formkey.currentState!.reset();
    _cardNum = '';
    _nameTrans = '';
    _amountTrans = 0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size.width * 0.8,
              child: TextFormField(
                key: ValueKey('cardNum'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid card number';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  label: Text('card number'),
                  prefixIcon: Icon(Icons.rectangle_rounded),
                  prefixIconColor: Color.fromRGBO(87, 14, 87, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) {
                  _cardNum = value!;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: TextFormField(
                key: ValueKey('name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  label: Text('Transaction name'),
                  prefixIcon: Icon(Icons.edit),
                  prefixIconColor: Color.fromRGBO(87, 14, 87, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) {
                  _nameTrans = value!;
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: TextFormField(
                key: ValueKey('amount'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  label: Text('Amount'),
                  prefixIcon: Icon(Icons.attach_money),
                  prefixIconColor: Color.fromRGBO(87, 14, 87, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) {
                  _amountTrans = int.parse(value!);
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            if (widget.isLoading) CircularProgressIndicator(),
            if (!widget.isLoading)
              ElevatedButton(
                onPressed: _trySubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(87, 14, 87, 1),
                  fixedSize: Size(size.width * 0.8, size.height * 0.06),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add To Wallet',
                  style: TextStyle(
                    fontFamily: 'CENSCBK',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 253, 240, 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
