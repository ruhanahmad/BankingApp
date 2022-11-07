import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String? nameButton;
  const ButtonWidget({Key? key, this.icon, this.nameButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.withOpacity(.2),
              elevation: 0,
              fixedSize: const Size(125, 35),
              padding:
                  const EdgeInsets.only(top: 8, bottom: 5, left: 10, right: 20),
              // shadowColor: Color(0xffFF4500),
              // elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  nameButton!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  String? label,
  TextStyle? labelStyle,
  String? hintText,
  IconData? prefix,
  TextStyle? style,
  IconData? suffix,
  Function? suffixpress,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          validator: validate,
          style: style,
          decoration: InputDecoration(
            // errorStyle: TextStyle(height: 1),

            labelText: label,
            labelStyle: labelStyle,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              prefix,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              // borderSide: BorderSide.none,

              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),

            suffixIcon: suffixIcon,

            // suffixIcon: IconButton(
            //     icon: Icon(
            //       suffix,
            //     ),
            //     onPressed: () {
            //       suffixpress!;
            //     }),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key, this.lable}) : super(key: key);
  final Widget? lable;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedValue = "USA";
  String? newValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: DropdownButtonFormField(
            decoration: InputDecoration(
              label: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: widget.lable,
              ),
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey, width: 2),
                borderSide: BorderSide.none,

                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) => value == null ? "Select a country" : null,
            dropdownColor: Colors.white,
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },

            // there are  a function in ** widgets file ** that has all data about  **called  dropdownItems**  the  DropdownButtonFormField  you can find
            items: dropdownItems),
      ),
    );
  }
}

class SwiftWidget extends StatelessWidget {
  const SwiftWidget({Key? key, this.copyValue, this.name}) : super(key: key);

  final String? name;
  final String? copyValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
          child: Row(
            children: [
              Text(
                name!,
                style:  TextStyle(
                    // height: 1.4,
                    fontSize: 12,
                    fontFamily: 'jannah',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 20, bottom: 2),
          child: Row(
            children: [
              Text(
                copyValue!,
                style: TextStyle(
                    // height: 1.4,
                    fontSize: 12,
                    fontFamily: 'jannah',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Spacer(),
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.copy,
                size: 20,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, this.icon, this.text}) : super(key: key);
  final Widget? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Icon(
          //   icon,
          //   size: 20,
          //   color: Colors.black,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Tab(
              icon: icon!,
              height: 20,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              text!,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'jannah',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
     DropdownMenuItem(child: Text("USA"), value: "USA"),
     DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
     DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return menuItems;
}
