part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double width;
  final double height;
  final String text;
  final Function ?onTap;

  const SelectableBox(this.text,
      {super.key, this.isSelected = false,
      this.isEnabled = true,
      this.width = 144,
      this.height = 60,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnabled)
                ? const Color(0xFFE4E4E4)
                : isSelected
                    ? mainColor
                    : Colors.transparent,
            border: Border.all(
                color: (!isEnabled)
                    ? const Color(0xFFE4E4E4)
                    : isSelected
                        ? Colors.transparent
                        : const Color(0xFFE4E4E4))),
        child: Center(
          child: Text(
            text,
            style: (isSelected)
                ? whiteTextFont.copyWith(fontSize: 16)
                : greyTextFont.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}