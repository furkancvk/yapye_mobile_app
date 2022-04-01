import 'package:flutter/material.dart';
import '../constants.dart';

class AppForm {
  static Widget AppTextFormField({required String hintText, bool isPassword = false, bool isEmail = false, required TextEditingController controller, required void Function(String?) onSaved}) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      obscureText: isPassword,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color.fromRGBO(13, 13, 13, .4)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Color.fromRGBO(242, 135, 5, 1)),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.only(left: 15),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color.fromRGBO(13, 13, 13, .3)
          )
      ),
      onSaved: onSaved,
      onChanged: onSaved,
    );
  }
  static Widget AppCheckbox({required String label, double? fontSize = 14, required bool isChecked, required void Function(bool?) onChanged}) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
              width: 2.7,
              color: Color.fromRGBO(13, 13, 13, .4)
          ),
          checkColor: Color.fromRGBO(242, 242, 242, 1),
          activeColor: Color.fromRGBO(242, 135, 5, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.5)),
          ),
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(label, style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
          color: Color.fromRGBO(13, 13, 13, .4),
        )),
      ],
    );
  }
  static Widget AppTextButtonIcon({required Icon icon, required String label, required void Function() onPressed}) {
    return TextButton.icon(
      style: ButtonStyle(
        overlayColor:  MaterialStateProperty.all(Color.fromRGBO(242, 135, 5, .3)),
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(label, style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color.fromRGBO(13, 13, 13, .6),
      )),
    );
  }
  static Widget AppToggleButtons(changeCurrentForm){
    return AppToggleButtonsWidget(changeCurrentForm: changeCurrentForm);
  }
}

class AppToggleButtonsWidget extends StatefulWidget {
  const AppToggleButtonsWidget({Key? key, this.changeCurrentForm}) : super(key: key);
  final changeCurrentForm;

  @override
  State<StatefulWidget> createState() => _AppToggleButtonsWidget();
}
class _AppToggleButtonsWidget extends State<AppToggleButtonsWidget>{
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(8)
      ),
      child: ToggleButtons(
          selectedColor: AppColors.light,
          color: AppColors.light,
          fillColor: AppColors.orangeAccent,
          borderRadius: BorderRadius.circular(8),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Giriş Yap",
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Kaydol",
                style:  TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          onPressed: (index) => {
            widget.changeCurrentForm(index),
            setState(() {
              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            }),
          },
          isSelected: isSelected
      ),
    );
  }
}