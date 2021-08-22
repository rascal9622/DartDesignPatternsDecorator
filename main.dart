void main() {
  final PizzaMenu pizzaMenu = PizzaMenu();
  
  Map<int, PizzaToppingsData> _pizzaToppingsDataMap;
  Pizza _pizza;
  
  _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingsDataMap();
  
  // ### Select Custom Pizza Toppings ###
  // _pizzaToppingsDataMap[1].setSelected(true); // Basil
  // _pizzaToppingsDataMap[2].setSelected(true); // Mozzarella
  // _pizzaToppingsDataMap[3].setSelected(true); // Olive Oil
  // _pizzaToppingsDataMap[4].setSelected(true); // Oregano
  // _pizzaToppingsDataMap[5].setSelected(true); // Pecorino
  // _pizzaToppingsDataMap[6].setSelected(true); // Pepperino
  // _pizzaToppingsDataMap[7].setSelected(true); // Sauce
  
  _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  
  print('${_pizza.getDesc()}');
  print('');
  print('Price is ${_pizza.getPrice()}');
}

abstract class Pizza {
  String desc = "";
  
  String getDesc();
  double getPrice();
}

class PizzaBase extends Pizza {
  PizzaBase(String desc) {
    this.desc = desc;
  }
  
  @override
  String getDesc() {
    return desc;
  }
  
  @override
  double getPrice() {
    return 3.0;
  }
}

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;
  
  PizzaDecorator(this.pizza);
  
  @override
  String getDesc() {
    return pizza.getDesc();
  }
  
  @override
  double getPrice() {
    return pizza.getPrice();
  }
}

class Basil extends PizzaDecorator {
  Basil(Pizza pizza) : super(pizza) {
    desc = 'Basil';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.2;
  }
}

class Mozzarella extends PizzaDecorator {
  Mozzarella(Pizza pizza) : super(pizza) {
    desc = 'Mozzarella';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.5;
  }
}

class OliveOil extends PizzaDecorator {
  OliveOil(Pizza pizza) : super(pizza) {
    desc = 'Olive Oil';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.1;
  }
}

class Oregano extends PizzaDecorator {
  Oregano(Pizza pizza) : super(pizza) {
    desc = 'Oregano';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.2;
  }
}

class Pecorino extends PizzaDecorator {
  Pecorino(Pizza pizza) : super(pizza) {
    desc = 'Pecorino';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.7;
  }
}

class Pepperoni extends PizzaDecorator {
  Pepperoni(Pizza pizza) : super(pizza) {
    desc = 'Pepperoni';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 1.5;
  }
}

class Sauce extends PizzaDecorator {
  Sauce(Pizza pizza) : super(pizza) {
    desc = 'Sauce';
  }
  
  @override
  String getDesc() {
    return '${pizza.getDesc()}\n- $desc';
  }
  
  @override
  double getPrice() {
    return pizza.getPrice() + 0.3;
  }
}

class PizzaToppingsData {
  final String label;
  bool selected = false;
  
  PizzaToppingsData(this.label);
  
  void setSelected(bool value) {
    selected = value;
  }
}

class PizzaMenu {
  final Map<int, PizzaToppingsData> _pizzaToppingsDataMap = {
    1: PizzaToppingsData('Basil'),
    2: PizzaToppingsData('Mozzarella'),
    3: PizzaToppingsData('Olive Oil'),
    4: PizzaToppingsData('Oregano'),
    5: PizzaToppingsData('Pecorino'),
    6: PizzaToppingsData('Pepperoni'),
    7: PizzaToppingsData('Sauce'),
  };
  
  Map<int, PizzaToppingsData> getPizzaToppingsDataMap() => _pizzaToppingsDataMap;
  
  Pizza getPizza(int index, Map<int, PizzaToppingsData> pizzaToppingsDataMap) {
    switch(index) {
      case 0:
        return _getMargherita();
      case 1:
        return _getPepperoni();
      case 2:
        return _getCustom(pizzaToppingsDataMap);
    }
    
    throw Exception("index of '$index' does not exist.");
  }
  
  Pizza _getMargherita() {
    Pizza pizza = PizzaBase('Pizza Margherita');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Basil(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);
    pizza = OliveOil(pizza);
    
    return pizza;
  }
  
  Pizza _getPepperoni() {
    Pizza pizza = PizzaBase('Pizza Pepperoni');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Pepperoni(pizza);
    pizza = Oregano(pizza);
    
    return pizza;
  }
  
  Pizza _getCustom(Map<int, PizzaToppingsData> pizzaToppingsDataMap) {
    Pizza pizza = PizzaBase('Custom Pizza');
    
    if (pizzaToppingsDataMap[1].selected) {
      pizza = Basil(pizza);
    }
    
    if (pizzaToppingsDataMap[2].selected) {
      pizza = Mozzarella(pizza);
    }
    
    if (pizzaToppingsDataMap[3].selected) {
      pizza = OliveOil(pizza);
    }
    
    if (pizzaToppingsDataMap[4].selected) {
      pizza = Oregano(pizza);
    }
    
    if (pizzaToppingsDataMap[5].selected) {
      pizza = Pecorino(pizza);
    }
    
    if (pizzaToppingsDataMap[6].selected) {
      pizza = Pepperoni(pizza);
    }
    
    if (pizzaToppingsDataMap[7].selected) {
      pizza = Sauce(pizza);
    }
    
    return pizza;
  }
}
