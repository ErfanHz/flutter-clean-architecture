class EnWord {
  static String toWord(String inputNumber) {
    int number = int.parse(inputNumber);
    if (number == 0) {
      return "zero";
    }
    String fullNumber = inputNumber;
    for (var i = 0; i < 15 - fullNumber.length; i++) {
      inputNumber = "0" + inputNumber;
    }
    fullNumber = inputNumber;
    int trillion = int.parse(fullNumber.substring(0, 3));
    int billions = int.parse(fullNumber.substring(3, 6));
    int millions = int.parse(fullNumber.substring(6, 9));
    int hundredThousands = int.parse(fullNumber.substring(9, 12));
    int thousands = int.parse(fullNumber.substring(12, 15));

    String tradtrillion;

    switch (trillion) {
      case 0:
        tradtrillion = "";
        break;
      case 1:
        tradtrillion = _convertLessThanOneThousand(trillion) + " Trillion ";
        break;
      default:
        tradtrillion = _convertLessThanOneThousand(trillion) + " Trillion ";
    }
    String result = tradtrillion;

    String tradBillions;

    switch (billions) {
      case 0:
        tradBillions = "";
        break;
      case 1:
        tradBillions = _convertLessThanOneThousand(billions) + " billion ";
        break;
      default:
        tradBillions = _convertLessThanOneThousand(billions) + " billion ";
    }
    result += tradBillions;

    String tradMillions;

    switch (millions) {
      case 0:
        tradMillions = "";
        break;
      case 1:
        tradMillions = _convertLessThanOneThousand(millions) + " million ";
        break;
      default:
        tradMillions = _convertLessThanOneThousand(millions) + " million ";
    }
    result = result + tradMillions;

    String tradHundredThousands;
    switch (hundredThousands) {
      case 0:
        tradHundredThousands = "";
        break;
      case 1:
        tradHundredThousands = "one thousand ";
        break;
      default:
        tradHundredThousands =
            _convertLessThanOneThousand(hundredThousands) + " thousand ";
    }
    result = result + tradHundredThousands;

    String tradThousand;
    tradThousand = _convertLessThanOneThousand(thousands);
    result = result + tradThousand;
    return result;
  }

  static String _convertLessThanOneThousand(int number) {
    List<String> tensNames = [
      "",
      " ten",
      " twenty",
      " thirty",
      " forty",
      " fifty",
      " sixty",
      " seventy",
      " eighty",
      " ninety"
    ];

    List<String> numNames = [
      "",
      " one",
      " two",
      " three",
      " four",
      " five",
      " six",
      " seven",
      " eight",
      " nine",
      " ten",
      " eleven",
      " twelve",
      " thirteen",
      " fourteen",
      " fifteen",
      " sixteen",
      " seventeen",
      " eighteen",
      " nineteen"
    ];
    String soFar;
    if (number % 100 < 20) {
      soFar = numNames[number % 100];
      number = number ~/ 100;
    } else {
      soFar = numNames[number % 10];
      number = number ~/ 10;
      soFar = tensNames[number % 10] + soFar;
      number = number ~/ 10;
    }
    if (number == 0) {
      return soFar;
    }
    return numNames[number] + " hundred" + soFar;
  }
}

class FaWord {
  static final List<String> tensNames = [
    "",
    " ???? ??",
    " ???????? ??",
    " ???? ??",
    " ?????? ??",
    " ?????????? ??",
    " ?????? ??",
    " ?????????? ??",
    " ?????????? ??",
    " ?????? ??"
  ];

  static final List<String> numNames = [
    "",
    " ????",
    " ????",
    " ????",
    " ????????",
    " ??????",
    " ????",
    " ??????",
    " ??????",
    " ????",
    " ????",
    " ??????????",
    " ????????????",
    " ??????????",
    " ????????????",
    " ????????????",
    " ????????????",
    " ????????",
    " ????????",
    " ??????????"
  ];

  static final List<String> thousandsNames = [
    "",
    " ???? ??",
    " ?????????? ??",
    " ???????? ??",
    " ???????????? ??",
    " ?????????? ??",
    " ???????? ??",
    " ?????????? ??",
    " ?????????? ??",
    " ???????? ??"
  ];

  static final Map<String, int> tensMap = {
    "": 0,
    "????": 10,
    "????????": 20,
    "????": 30,
    "??????": 40,
    "??????????": 50,
    "??????": 60,
    "??????????": 70,
    "??????????": 80,
    "??????": 90,
  };

  static final Map<String, int> numsMap = {
    "": 0,
    "????": 1,
    "????": 2,
    "????": 3,
    "????????": 4,
    "??????": 5,
    "????": 6,
    "??????": 7,
    "??????": 8,
    "????": 9,
    "????": 10,
    "??????????": 11,
    "????????????": 12,
    "??????????": 13,
    "????????????": 14,
    "????????????": 15,
    "????????????": 16,
    "????????": 17,
    "????????": 18,
    "??????????": 19,
  };

  static final Map<String, int> thousandsMap = {
    "": 0,
    "????": 100,
    "??????????": 200,
    "????????": 300,
    "????????????": 400,
    "??????????": 500,
    "????????": 600,
    "??????????": 700,
    "??????????": 800,
    "????????": 900,
  };

  static final Map<String, int> millionsMap = {
    "????????": 1000,
    "????????????": 1000000,
    "??????????????": 1000000000,
    "??????????????": 1000000000000,
  };

  static int toNumber(String word) {
    List<String> words = word.split(" ??");
    int finalValue = 0;
    int tempValue = 0;
    for (var word in words) {
      List<String> temps = word.split(" ");
      for (var item in temps) {
        if (numsMap.containsKey(item)) {
          tempValue += numsMap[item] ?? 0;
        } else if (tensMap.containsKey(item)) {
          tempValue += tensMap[item] ?? 0;
        } else if (thousandsMap.containsKey(item)) {
          tempValue += thousandsMap[item] ?? 0;
        } else if (millionsMap.containsKey(item)) {
          if (tempValue == 0) {
            tempValue += millionsMap[item]!;
          } else {
            tempValue *= millionsMap[item]!;
          }
          finalValue += tempValue;
          tempValue = 0;
        } else {
          throw Exception("Not correct format / Wrong language!");
        }
      }
    }
    finalValue += tempValue;
    return finalValue;
  }

  static String toWord(String inputNumber) {
    int number = int.parse(inputNumber);
    if (number == 0) {
      return "??????";
    }
    String fullNumber = inputNumber;
    for (var i = 0; i < 15 - fullNumber.length; i++) {
      inputNumber = "0" + inputNumber;
    }
    fullNumber = inputNumber;

    int trillion = int.parse(fullNumber.substring(0, 3));
    int billions = int.parse(fullNumber.substring(3, 6));
    int millions = int.parse(fullNumber.substring(6, 9));
    int hundredThousands = int.parse(fullNumber.substring(9, 12));
    int thousands = int.parse(fullNumber.substring(12, 15));

    String tradtrillion;

    switch (trillion) {
      case 0:
        tradtrillion = "";
        break;
      case 1:
        tradtrillion = _convertLessThanOneThousand(trillion) + " ?????????????? ";
        break;
      default:
        tradtrillion = _convertLessThanOneThousand(trillion) + " ?????????????? ??";
    }
    String result = tradtrillion;

    String tradBillions;

    switch (billions) {
      case 0:
        tradBillions = "";
        break;
      default:
        tradBillions = _convertLessThanOneThousand(billions) + " ?????????????? ??";
    }
    result += tradBillions;

    String tradMillions;

    switch (millions) {
      case 0:
        tradMillions = "";
        break;
      default:
        tradMillions = _convertLessThanOneThousand(millions) + " ???????????? ??";
    }
    result = result + tradMillions;

    String tradHundredThousands;
    switch (hundredThousands) {
      case 0:
        tradHundredThousands = "";
        break;
      case 1:
        tradHundredThousands = "???????? ??";
        break;
      default:
        tradHundredThousands =
            _convertLessThanOneThousand(hundredThousands) + " ???????? ??";
    }
    result = result + tradHundredThousands;

    String tradThousand;
    tradThousand = _convertLessThanOneThousand(thousands);
    result = result + tradThousand;

    if (result.endsWith(" ??")) {
      result = result.substring(0, result.length - 2);
    }

    return result;
  }

  static String _convertLessThanOneThousand(int number) {
    String soFar;
    if (number % 100 < 20) {
      soFar = numNames[number % 100];
      number = number ~/ 100;
    } else {
      soFar = numNames[number % 10];
      number = number ~/ 10;
      soFar = tensNames[number % 10] + soFar;
      number = number ~/ 10;
    }
    if (number == 0) {
      if (soFar.endsWith(" ??")) {
        soFar = soFar.substring(0, soFar.length - 2);
      }
      return soFar;
    }
    var str = "";
    str = (thousandsNames[number] + soFar);
    if (str.endsWith(" ??") || str.endsWith("?? ")) {
      str = str.substring(0, str.length - 2);
    }
    return str;
  }
}
