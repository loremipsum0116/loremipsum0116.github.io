---
title: "자바 객체지향-상속, 다형성, 추상 클래스"
date: 2025-06-17 11:38:47 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 객체지향 프로그래밍: 상속과 다형성, 추상 클래스

이전 글들에서 객체지향의 기본 요소인 **클래스, 객체, 생성자, 그리고 캡슐화**에 대해 알아보았습니다. 이제 객체지향 프로그래밍의 또 다른 강력한 기둥인 \*\*상속(Inheritance)\*\*과 **다형성(Polymorphism)**, 그리고 이와 밀접하게 관련된 **추상 클래스(Abstract Class)** 개념을 탐구할 차례입니다. 이 개념들은 코드의 **재사용성을 극대화**하고, 프로그램을 더욱 **유연하고 확장 가능**하게 만듭니다.

현실 세계에서 우리는 부모로부터 유전적 특성을 물려받듯, 프로그램에서도 특정 클래스가 다른 클래스의 특성(속성, 행동)을 물려받아 재사용하고 확장할 수 있습니다. 이것이 바로 상속의 기본 아이디어입니다. 이러한 상속 관계를 통해 우리는 더 추상적인 개념을 정의하고, 이를 바탕으로 다양한 형태의 객체를 일관된 방식으로 다룰 수 있게 됩니다.

-----

## 1\. 상속(Inheritance): 코드 재사용의 마법

**상속**은 하나의 클래스가 다른 클래스의 필드(속성)와 메소드(행동)를 물려받아 코드의 **재사용성**을 높이고, 계층적인 관계를 형성하는 객체지향의 핵심 원리입니다. 특성을 물려주는 클래스를 **부모 클래스(Parent Class)** 또는 \*\*슈퍼 클래스(Super Class)\*\*라고 하고, 특성을 물려받는 클래스를 **자식 클래스(Child Class)** 또는 \*\*서브 클래스(Sub Class)\*\*라고 합니다.

### 상속 구현: `extends` 키워드

자바에서 상속은 `extends` 키워드를 사용하여 구현합니다.

```java
class 부모클래스 {
    // 부모 클래스의 필드와 메소드
}

class 자식클래스 extends 부모클래스 {
    // 부모의 필드와 메소드를 물려받음
    // 자식 클래스 고유의 필드와 메소드 추가 가능
}
```

**상속의 특징:**

  * **코드 재사용**: 부모 클래스에 정의된 필드와 메소드를 자식 클래스에서 별도로 구현할 필요 없이 바로 사용할 수 있습니다.
  * **계층 구조**: 현실 세계의 "is-a" 관계(예: "자동차는 운송수단이다", "개는 동물이다")를 모델링하는 데 적합합니다.
  * **확장성**: 부모 클래스의 기능을 그대로 사용하면서, 자식 클래스에서 새로운 기능(필드, 메소드)을 추가하거나, 부모의 기능을 재정의(오버라이딩)할 수 있습니다.
  * **단일 상속**: 자바는 다중 상속(여러 부모로부터 동시에 상속)을 허용하지 않고, 하나의 부모 클래스만 상속받을 수 있습니다. (인터페이스를 통해 다중 상속의 장점을 유사하게 구현할 수 있습니다.)

<!-- end list -->

```java
// 부모 클래스: Animal
class Animal {
    String name;
    int age;

    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
        System.out.println(name + " (동물) 생성됨.");
    }

    public void eat() {
        System.out.println(name + "이(가) 먹습니다.");
    }

    public void sleep() {
        System.out.println(name + "이(가) 잠을 잡니다.");
    }
}

// 자식 클래스: Dog (Animal을 상속받음)
class Dog extends Animal {
    String breed; // Dog 고유의 필드

    // 자식 클래스 생성자는 부모 클래스 생성자를 호출해야 합니다.
    // super(...)를 사용하여 부모 생성자를 호출
    public Dog(String name, int age, String breed) {
        super(name, age); // 부모 클래스(Animal)의 생성자 호출
        this.breed = breed;
        System.out.println(breed + "종 개 " + name + " 생성됨.");
    }

    // Dog 고유의 메소드
    public void bark() {
        System.out.println(name + "이(가) 멍멍 짖습니다.");
    }

    // 메소드 재정의(Override): 부모의 eat() 메소드를 자식에 맞게 변경
    @Override // @Override 어노테이션은 필수는 아니지만, 재정의임을 명시하고 컴파일러가 오류를 체크하도록 돕습니다.
    public void eat() {
        super.eat(); // 부모의 eat() 메소드를 먼저 호출할 수도 있습니다.
        System.out.println(name + "이(가) 사료를 먹습니다.");
    }
}

public class InheritanceExample {
    public static void main(String[] args) {
        // Animal 객체 생성
        Animal genericAnimal = new Animal("동물이", 5);
        genericAnimal.eat();
        genericAnimal.sleep();
        System.out.println("---");

        // Dog 객체 생성 (Animal의 필드와 메소드를 물려받음)
        Dog myDog = new Dog("바둑이", 3, "진돗개");
        System.out.println("이름: " + myDog.name); // 부모로부터 물려받은 필드
        System.out.println("나이: " + myDog.age);   // 부모로부터 물려받은 필드
        System.out.println("품종: " + myDog.breed); // Dog 고유의 필드

        myDog.eat();    // Dog에서 재정의된 eat() 메소드 호출
        myDog.sleep();  // 부모로부터 물려받은 sleep() 메소드 호출
        myDog.bark();   // Dog 고유의 메소드 호출
    }
}
```

**실행 결과:**

```
동물이 (동물) 생성됨.
동물이(가) 먹습니다.
동물이(가) 잠을 잡니다.
---
바둑이 (동물) 생성됨.
진돗개종 개 바둑이 생성됨.
이름: 바둑이
나이: 3
품종: 진돗개
바둑이이(가) 먹습니다.
바둑이이(가) 사료를 먹습니다.
바둑이이(가) 잠을 잡니다.
바둑이이(가) 멍멍 짖습니다.
```

`Dog` 클래스는 `Animal` 클래스를 상속받아 `name`과 `age` 필드, `eat()`과 `sleep()` 메소드를 자동으로 물려받았습니다. 또한 `bark()`라는 자신만의 고유한 메소드를 추가하고, 부모의 `eat()` 메소드를 `Dog`에 맞게 \*\*재정의(Override)\*\*했습니다.

-----

## 2\. 다형성(Polymorphism): 하나의 참조로 다양한 형태 다루기

**다형성**은 객체지향 프로그래밍의 가장 강력한 특징 중 하나로, \*\*"하나의 타입으로 여러 형태의 객체를 참조할 수 있는 성질"\*\*을 의미합니다. 좀 더 쉽게 말하면, 부모 타입의 참조 변수로 자식 타입의 객체를 참조할 수 있고, 이 참조 변수를 통해 호출되는 메소드의 실행 결과는 참조하는 객체의 실제 타입에 따라 달라지는 성질입니다.

### 다형성의 원리: 부모 타입 = 자식 객체

  * **`부모타입 변수 = new 자식타입();`** 형태로 객체를 생성하고 참조할 수 있습니다.
  * 이렇게 참조할 경우, 해당 변수를 통해서는 **부모 타입에 정의된 필드와 메소드만 접근이 가능**합니다.
  * **하지만**, 자식 클래스에서 **재정의(Override)된 메소드**가 있다면, 부모 타입의 변수로 호출하더라도 **항상 자식 클래스에서 재정의된 메소드가 호출**됩니다. 이를 \*\*동적 바인딩(Dynamic Binding)\*\*이라고 합니다.

<!-- end list -->

```java
public class PolymorphismExample {
    public static void main(String[] args) {
        // 부모 타입 변수로 자식 객체를 참조
        Animal myAnimal1 = new Dog("흰둥이", 2, "말티즈"); // Animal 타입으로 Dog 객체 참조
        Animal myAnimal2 = new Animal("고양이", 4);     // Animal 타입으로 Animal 객체 참조

        // myAnimal1은 Animal 타입이지만, 실제로는 Dog 객체를 참조합니다.
        myAnimal1.eat(); // Dog에서 재정의된 eat() 메소드가 호출됨
        myAnimal1.sleep(); // Animal의 sleep() 메소드 호출 (Dog에는 재정의 안 됨)
        // myAnimal1.bark(); // 에러! Animal 타입 변수로는 Dog 고유의 bark() 메소드에 접근 불가

        System.out.println("---");

        // myAnimal2는 Animal 타입으로 Animal 객체를 참조합니다.
        myAnimal2.eat(); // Animal의 eat() 메소드 호출
        myAnimal2.sleep(); // Animal의 sleep() 메소드 호출

        System.out.println("---");

        // 배열을 이용한 다형성: 하나의 Animal 배열에 여러 종류의 Animal 객체 저장 가능
        Animal[] animals = new Animal[3];
        animals[0] = new Dog("메리", 7, "푸들");
        animals[1] = new Animal("오리", 1);
        animals[2] = new Dog("로빈", 5, "치와와");

        for (Animal animal : animals) {
            animal.eat(); // 모든 동물이 각자의 eat() 방식을 호출 (다형성)
        }
    }
}
```

**실행 결과:**

```
흰둥이 (동물) 생성됨.
말티즈종 개 흰둥이 생성됨.
고양이 (동물) 생성됨.
흰둥이이(가) 먹습니다.
흰둥이이(가) 사료를 먹습니다.
흰둥이이(가) 잠을 잡니다.
---
고양이이(가) 먹습니다.
고양이이(가) 잠을 잡니다.
---
메리 (동물) 생성됨.
푸들종 개 메리 생성됨.
오리 (동물) 생성됨.
로빈 (동물) 생성됨.
치와와종 개 로빈 생성됨.
메리이(가) 먹습니다.
메리이(가) 사료를 먹습니다.
오리이(가) 먹습니다.
로빈이(가) 먹습니다.
로빈이(가) 사료를 먹습니다.
```

`myAnimal1`은 `Animal` 타입으로 선언되었지만, 실제로는 `Dog` 객체를 참조하고 있기 때문에 `eat()` 메소드를 호출하면 `Dog` 클래스에서 재정의된 `eat()` 메소드가 실행됩니다. 이것이 다형성의 핵심입니다.

-----

## 3\. 추상 클래스(Abstract Class): 미완성의 설계도

**추상 클래스**는 이름 그대로 '추상적인', 즉 **미완성된 메소드(추상 메소드)를 포함할 수 있는 클래스**입니다. 오로지 **상속을 목적으로 만들어진 클래스**이며, 자식 클래스에게 특정 메소드를 **반드시 구현하도록 강제**함으로써 일관된 기능을 제공하도록 돕습니다.

### 추상 클래스의 특징

  * `abstract` 키워드를 사용하여 선언합니다.
  * **`new` 연산자로 직접 객체를 생성할 수 없습니다.** (미완성된 클래스이므로)
  * 일반 필드, 생성자, 일반 메소드를 가질 수 있습니다.
  * **추상 메소드**를 포함할 수 있습니다. (하나라도 추상 메소드가 있다면 그 클래스는 반드시 추상 클래스여야 합니다.)
  * **추상 클래스가 반드시 추상 메소드를 포함해야 하는 것은 아닙니다.** 추상 메소드가 없더라도 `abstract` 키워드를 붙여 추상 클래스로 만들 수 있습니다. (이 경우 주로 객체 생성을 막고 상속을 통한 확장만 허용하려는 목적)
  * 추상 클래스를 상속받는 자식 클래스는 \*\*반드시 부모의 모든 추상 메소드를 오버라이딩(구현)\*\*해야 합니다. 만약 하나라도 구현하지 않는다면, 그 자식 클래스도 추상 클래스가 되어야 합니다.

### 추상 메소드(Abstract Method)

  * 메소드의 선언부만 있고, **구현부(`{}`)가 없는 메소드**입니다.
  * `abstract` 키워드를 사용하여 선언하며, 끝에 세미콜론(;)을 붙입니다.
  * 반드시 **추상 클래스 내부**에서만 정의될 수 있습니다.

<!-- end list -->

```java
// 추상 클래스: Shape (도형)
abstract class Shape {
    String color;

    public Shape(String color) {
        this.color = color;
        System.out.println(color + " 도형 생성.");
    }

    // 일반 메소드
    public void printColor() {
        System.out.println("이 도형의 색상은 " + color + "입니다.");
    }

    // 추상 메소드: 넓이를 계산하는 방법은 도형마다 다르므로 자식에게 구현을 강제
    public abstract double calculateArea(); // 구현부가 없고 선언만 있음
}

// Concrete Class (구현 클래스): Circle (원)
class Circle extends Shape {
    double radius;

    public Circle(String color, double radius) {
        super(color); // 부모 추상 클래스의 생성자 호출
        this.radius = radius;
        System.out.println("원 생성됨. 반지름: " + radius);
    }

    // 추상 메소드 구현 (오버라이딩)
    @Override
    public double calculateArea() {
        return Math.PI * radius * radius;
    }
}

// Concrete Class (구현 클래스): Rectangle (직사각형)
class Rectangle extends Shape {
    double width;
    double height;

    public Rectangle(String color, double width, double height) {
        super(color);
        this.width = width;
        this.height = height;
        System.out.println("직사각형 생성됨. 너비: " + width + ", 높이: " + height);
    }

    // 추상 메소드 구현 (오버라이딩)
    @Override
    public double calculateArea() {
        return width * height;
    }
}

public class AbstractClassExample {
    public static void main(String[] args) {
        // Shape s = new Shape("Black"); // 에러! 추상 클래스는 직접 객체 생성 불가

        Circle circle = new Circle("Red", 5.0);
        circle.printColor();
        System.out.println("원의 넓이: " + circle.calculateArea());

        System.out.println("---");

        Rectangle rectangle = new Rectangle("Blue", 4.0, 6.0);
        rectangle.printColor();
        System.out.println("직사각형의 넓이: " + rectangle.calculateArea());

        System.out.println("--- 다형성을 이용한 추상 클래스 참조 ---");
        // 부모(추상) 타입으로 자식 객체 참조 가능
        Shape s1 = new Circle("Green", 3.0);
        Shape s2 = new Rectangle("Yellow", 7.0, 2.0);

        s1.printColor();
        System.out.println("s1의 넓이: " + s1.calculateArea()); // 실제 객체(Circle)의 calculateArea 호출

        s2.printColor();
        System.out.println("s2의 넓이: " + s2.calculateArea()); // 실제 객체(Rectangle)의 calculateArea 호출
    }
}
```

**실행 결과:**

```
Red 도형 생성.
원 생성됨. 반지름: 5.0
이 도형의 색상은 Red입니다.
원의 넓이: 78.53981633974483
---
Blue 도형 생성.
직사각형 생성됨. 너비: 4.0, 높이: 6.0
이 도형의 색상은 Blue입니다.
직사각형의 넓이: 24.0
--- 다형성을 이용한 추상 클래스 참조 ---
Green 도형 생성.
원 생성됨. 반지름: 3.0
이 도형의 색상은 Green입니다.
s1의 넓이: 28.27433388230813
Yellow 도형 생성.
직사각형 생성됨. 너비: 7.0, 높이: 2.0
이 도형의 색상은 Yellow입니다.
s2의 넓이: 14.0
```

`Shape` 클래스는 `calculateArea()`라는 추상 메소드를 가지고 있으므로 `abstract` 클래스가 됩니다. `Circle`과 `Rectangle`은 `Shape`를 상속받아 `calculateArea()` 메소드를 각자의 방식대로 **반드시 구현**해야 합니다. 마지막으로, `Shape` 타입의 변수로 `Circle`과 `Rectangle` 객체를 참조하여 `calculateArea()`를 호출할 때 **다형성**에 의해 각 객체에 맞는 메소드가 실행되는 것을 확인할 수 있습니다.

-----

## 📌 요약 정리: 상속, 다형성, 추상 클래스

  * **상속(Inheritance)**: `extends` 키워드를 사용하여 부모 클래스의 필드와 메소드를 자식 클래스가 물려받아 재사용하고 확장하는 객체지향 원리.
      * 자식 클래스 생성자는 `super()`를 통해 부모 생성자를 호출해야 합니다.
      * **메소드 오버라이딩**: 자식 클래스에서 부모의 메소드를 자신에게 맞게 재정의하는 것.
  * **다형성(Polymorphism)**: 하나의 타입으로 여러 형태의 객체를 참조할 수 있는 성질.
      * `부모타입 변수 = new 자식타입();` 형태로 참조 가능.
      * 부모 타입 변수로는 부모에 정의된 멤버만 접근 가능.
      * **자식에서 재정의된 메소드는 호출 시 자식의 메소드가 실행됩니다 (동적 바인딩).**
  * **추상 클래스(Abstract Class)**: `abstract` 키워드로 선언되며, **상속만을 목적으로** 합니다.
      * `new` 연산자로 **직접 객체 생성 불가**.
      * 필드, 생성자, 일반 메소드를 가질 수 있습니다.
      * \*\*추상 메소드(Abstract Method)\*\*를 포함할 수 있습니다 (구현부 없음).
      * **추상 클래스가 반드시 추상 메소드를 포함해야 하는 것은 아닙니다.**
      * 추상 클래스를 상속받는 자식 클래스는 모든 추상 메소드를 **반드시 구현**해야 합니다 (그렇지 않으면 자식 클래스도 추상 클래스가 되어야 함).

-----

## 💡 상속/다형성 퀴즈: 동물 소리내기

다음 코드를 보고 출력 결과를 예상해 보세요.

```java
class Animal2 {
    public void sound() {
        System.out.println("동물이 소리를 냅니다.");
    }
}

class Cat extends Animal2 {
    @Override
    public void sound() {
        System.out.println("야옹!");
    }
    public void groom() {
        System.out.println("고양이가 몸단장을 합니다.");
    }
}

class Dog2 extends Animal2 {
    @Override
    public void sound() {
        System.out.println("멍멍!");
    }
}

public class AnimalSoundQuiz {
    public static void main(String[] args) {
        Animal2 animal1 = new Cat();
        Animal2 animal2 = new Dog2();
        Animal2 animal3 = new Animal2();

        animal1.sound();
        animal2.sound();
        animal3.sound();

        // animal1.groom(); // 이 코드는 컴파일 될까요?
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
출력 결과:

```
야옹!
멍멍!
동물이 소리를 냅니다.
```

<br>
설명:
<br>

1.  `animal1`은 `Animal2` 타입으로 선언되었지만 `Cat` 객체를 참조하고 있습니다. `Cat`에서 `sound()` 메소드를 재정의했으므로, `animal1.sound()`는 "야옹\!"을 출력합니다.
2.  `animal2`는 `Animal2` 타입으로 선언되었지만 `Dog2` 객체를 참조하고 있습니다. `Dog2`에서 `sound()` 메소드를 재정의했으므로, `animal2.sound()`는 "멍멍\!"을 출력합니다.
3.  `animal3`은 `Animal2` 타입으로 `Animal2` 객체를 참조하고 있습니다. `sound()` 메소드는 재정의되지 않았으므로, `Animal2`의 "동물이 소리를 냅니다."를 출력합니다.
4.  주석 처리된 `animal1.groom()` 코드는 **컴파일 에러**가 발생합니다. `animal1`은 `Animal2` 타입으로 선언되었기 때문에, `Cat` 클래스에만 존재하는 `groom()` 메소드에는 접근할 수 없습니다. 다형성에서 부모 타입 변수는 부모에 정의된 메소드만 호출할 수 있고, 재정의된 메소드만 자식의 것으로 실행됩니다.
    </details>

-----

## 🔚 마치며: 유연한 객체지향 설계의 기반

이번 글에서는 객체지향 프로그래밍의 핵심 개념인 **상속, 다형성, 그리고 추상 클래스**에 대해 알아보았습니다. 이 개념들은 단순히 코드 재사용을 넘어, 프로그램을 더욱 유연하고 확장 가능하며 유지보수하기 쉽게 만드는 강력한 도구입니다.

상속을 통해 코드 중복을 줄이고 계층적인 관계를 형성하며, 다형성을 통해 하나의 타입으로 다양한 객체를 일관된 방식으로 다룰 수 있게 됩니다. 또한, 추상 클래스는 자식 클래스에게 특정 기능을 구현하도록 강제함으로써, 설계의 일관성을 유지하고 협업을 용이하게 합니다.

이러한 개념들을 잘 이해하고 활용하는 것은 복잡한 소프트웨어를 효율적으로 개발하는 데 필수적입니다. 다음 글에서는 상속, 생성자 관련 핵심 개념인 \*\*생성자 호출 순서\*\*에 대해 알아보겠습니다.
