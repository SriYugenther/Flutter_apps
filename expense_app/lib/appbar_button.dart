import 'package:expense_app/expensetype.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatefulWidget {
  const AppButtons({super.key, required this.onAddExpense});

  final void Function(Expense) onAddExpense;

  @override
  State<AppButtons> createState() {
    return _AppButtonsState();
  }
}

class _AppButtonsState extends State<AppButtons> {
  //this function is used to store the entered title
  /*var title = "";
  void titledata(String enteredtitle) {
    title = enteredtitle;
  }*/
  //instead of using this approch we can use controller
  //i.e.,,

  final titlecontroller = TextEditingController();
  //when we are using this controller we should dispose it when not used because it willbe running always in the background

  final amountcontroller = TextEditingController();
  DateTime? selectedDate;

  Category selcategory = Category.leisure;
  List<Expense> registeredExpense = [];

  void datepicker() async {
    final initialdate = DateTime.now();
    final firstdate =
        DateTime(initialdate.year - 4, initialdate.month, initialdate.day);
    final lastdate = DateTime.now();
    final pickeddate = await showDatePicker(
        context: context,
        initialDate: initialdate,
        firstDate: firstdate,
        lastDate: lastdate);
    //the showDatePicker will return a future<Date,Time> value this can be stored by used .then(){}
    //or we can also use async and await
    //.then((value) => );
    setState(() {
      selectedDate = pickeddate;
    });
  }

  //this is used to check whether the given input is correct or not
  void validatingData() {
    //tryparse will convert a text to number and if character is given it will return null
    //eg: "hello" => null , "1.22" => 1.22
    final enterdamount = double.tryParse(amountcontroller.text);

    final amountvalid = enterdamount == null || enterdamount <= 0;

    if (titlecontroller.text.trim().isEmpty ||
        amountvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Enter Valid Data"),
          content: const Text("Please make sure the Data is Correct"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    }
    widget.onAddExpense(
      Expense(
          title: titlecontroller.text,
          amount: enterdamount!,
          date: selectedDate!,
          category: selcategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    amountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //used to find the overlay of the keyboard
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      //take the maximum heigth on the screen
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: //const EdgeInsets.all(30),
              //this is used to when the content is  hidden by camera or panel
              EdgeInsets.fromLTRB(16, 48, 16, keyboard + 16),
          child: Column(
            children: [
              //create a textField to get the user data
              TextField(
                //onchanged needs a function with string value to get the data entered
                //onChanged: titledata,
                controller: titlecontroller,
                maxLength: 30,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              //const SizedBox(height: 10),
              Row(
                children: [
                  //expanded is also used to take the available space instead of full space
                  Expanded(
                    child: TextField(
                      controller: amountcontroller,
                      maxLength: 20,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$',
                        label: Text("Amount"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //using the
                        Text(selectedDate == null
                            ? "No Date Selected"
                            : formatter.format(selectedDate!)),
                        IconButton(
                          onPressed: datepicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  DropdownButton(
                      //value is used to display the selected item
                      value: selcategory,
                      //the items are the list in the dropdown menu
                      //values is used to get the list of category

                      //values is a list of enum but items want a list of dropdown menuItem
                      //so we are using the map to convert one type of value to another
                      //map will return iterable but we need a list so use .toList()
                      items: Category.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          selcategory = value;
                        });
                      }),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("cancel"),
                        ),
                        ElevatedButton(
                          onPressed: validatingData,
                          child: const Text("Submit"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
