---
title: "자바 객체지향-클래스"
date: 2025-06-17 11:18:56 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 객체지향 프로그래밍: 현실 세계를 코드로 담다

지금까지 우리는 자바의 기본적인 데이터 타입, 변수, 연산자, 조건문 등 프로그램을 구성하는 개별적인 요소들을 배워왔습니다. 하지만 실제 복잡한 소프트웨어를 만들 때는 단순히 이러한 요소들을 나열하는 것만으로는 부족합니다. 마치 건물을 지을 때 벽돌 하나하나를 놓는 것을 넘어, 전체적인 설계도와 각 부분의 역할을 이해해야 하는 것과 같습니다.

여기서 등장하는 핵심 개념이 바로 **객체지향 프로그래밍(Object-Oriented Programming, OOP)** 입니다. 자바는 대표적인 객체지향 언어로, 현실 세계의 사물과 개념을 코드 속 '객체'로 모델링하여 프로그램을 만드는 방식을 지향합니다. 이러한 접근 방식은 코드의 **재사용성, 유지보수성, 확장성**을 크게 향상시킵니다.

이번 글에서는 객체지향 프로그래밍의 가장 기본적이면서도 중요한 요소인 **클래스(Class)**, **객체(Object)**, 그리고 \*\*인스턴스(Instance)\*\*가 무엇인지, 그리고 이들이 어떻게 서로 연관되어 프로그램 속에서 동작하는지 자세히 알아보겠습니다. 또한, 클래스 내부에 선언되는 \*\*변수의 종류(인스턴스 변수, static 변수, 지역 변수)\*\*가 어떻게 클래스, 객체와 연결되는지도 함께 살펴보겠습니다.

-----

## 객체지향 프로그래밍(OOP)이란?

\*\*객체지향 프로그래밍(OOP)\*\*은 프로그램을 여러 개의 독립적인 '객체' 단위로 나누어 설계하고 구현하는 프로그래밍 패러다임입니다. 각 객체는 고유한 \*\*상태(데이터)\*\*와 그 상태를 조작하는 \*\*행동(메소드)\*\*을 가집니다.

예를 들어, 현실 세계의 '자동차'를 생각해 봅시다.

  * **상태**: 색상, 모델, 속도, 연식 등
  * **행동**: 시동 걸기, 가속하기, 정지하기, 방향 바꾸기 등

객체지향 프로그래밍은 이러한 현실 세계의 사물이나 개념을 컴퓨터 프로그램 속으로 그대로 가져와 표현하는 방식입니다.

## 클래스(Class): 객체를 만들기 위한 '설계도'

**클래스**는 객체를 생성하기 위한 **'틀'** 또는 **'설계도'** 역할을 합니다. 클래스 자체는 객체가 아닙니다. 마치 자동차를 만들기 위한 설계도면이 실제 자동차가 아닌 것처럼 말이죠. 클래스에는 객체가 가질 \*\*속성(변수, Field)\*\*과 객체가 수행할 \*\*행동(메소드, Method)\*\*이 정의됩니다.

  * **속성(Field)**: 객체가 가질 데이터나 상태를 나타냅니다. 예를 들어, `Car` 클래스라면 `color`, `model`, `speed` 등이 속성이 됩니다. 클래스 내에서 선언된 변수를 '멤버 변수' 또는 '필드'라고 부릅니다.
  * **행동(Method)**: 객체가 수행할 동작이나 기능을 나타냅니다. 예를 들어, `Car` 클래스라면 `startEngine()`, `accelerate()`, `stop()` 등이 메소드가 됩니다.

<!-- end list -->

```java
// Car 클래스 선언 (자동차의 설계도)
public class Car {
    // 1. 속성 (Field, 멤버 변수) 정의
    String color; // 인스턴스 변수: 각 자동차(객체)마다 다른 색상을 가집니다.
    String model; // 인스턴스 변수: 각 자동차(객체)마다 다른 모델명을 가집니다.
    int speed;    // 인스턴스 변수: 각 자동차(객체)마다 현재 속도가 다릅니다.

    // static 변수 (클래스 변수): 모든 자동차(객체)가 공유하는 속성
    // 이 클래스로부터 만들어지는 모든 자동차가 공유하는 제조사 이름이라고 가정해 봅시다.
    static String manufacturer = "JavaMotors"; 

    // 2. 행동 (Method) 정의
    // 시동을 거는 메소드
    public void startEngine() {
        System.out.println(model + "의 시동을 겁니다.");
    }

    // 가속하는 메소드
    public void accelerate(int amount) {
        speed += amount;
        System.out.println(model + "이(가) " + speed + "km/h로 가속합니다.");
    }

    // 정지하는 메소드
    public void stop() {
        speed = 0;
        System.out.println(model + "이(가) 정지합니다.");
    }
    
    // 제조사 정보를 출력하는 메소드 (static 변수 활용)
    public static void printManufacturer() {
        System.out.println("모든 " + manufacturer + " 자동차의 총 생산 대수는 아직 미정입니다.");
    }
}
```

위 코드에서 `Car`는 클래스이며, 이 클래스는 `color`, `model`, `speed`라는 속성과 `startEngine()`, `accelerate()`, `stop()`, `printManufacturer()`이라는 행동을 가질 것이라고 정의하고 있습니다.

-----

## 클래스 내 변수의 종류: 인스턴스, static, 지역 변수

클래스 내부에서 선언되는 변수는 그 위치와 `static` 키워드 유무에 따라 세 가지 종류로 나뉩니다.

1.  **인스턴스 변수 (Instance Variable)**

      * **선언 위치**: 클래스 내부, 메소드 외부에 선언됩니다.
      * **생명 주기**: 객체(인스턴스)가 생성될 때 함께 생성되고, 해당 객체가 메모리에서 사라질 때 함께 사라집니다.
      * **공유 범위**: 각 객체(인스턴스)마다 **고유한 값**을 가집니다. 즉, `myCar`의 `color`와 `yourCar`의 `color`는 다를 수 있습니다.
      * **메모리**: **힙(Heap) 영역**에 저장됩니다.
      * **예시**: 위 `Car` 클래스의 `color`, `model`, `speed`

2.  **클래스 변수 (Class Variable) 또는 static 변수**

      * **선언 위치**: 클래스 내부, 메소드 외부에 `static` 키워드와 함께 선언됩니다.
      * **생명 주기**: 프로그램 시작 시 클래스가 메모리에 로드될 때 함께 생성되고, 프로그램이 종료될 때 해제됩니다. 객체 생성 여부와 관계없이 존재합니다.
      * **공유 범위**: 해당 클래스로부터 생성된 **모든 객체가 공유하는 값**입니다. 어떤 객체에서 이 변수 값을 변경하면, 다른 모든 객체에도 그 변경 내용이 반영됩니다.
      * **메모리**: \*\*메소드 영역(Method Area)\*\*에 저장됩니다.
      * **접근 방법**: `클래스명.변수명` 또는 `객체참조변수.변수명`으로 접근 가능하나, 일반적으로 `클래스명.변수명`으로 접근하는 것을 권장합니다.
      * **예시**: 위 `Car` 클래스의 `manufacturer`

3.  **지역 변수 (Local Variable)**

      * **선언 위치**: 메소드, 생성자, 또는 초기화 블록 내부에 선언됩니다.
      * **생명 주기**: 해당 블록이 실행될 때 생성되고, 블록의 실행이 끝나면 자동으로 소멸됩니다.
      * **공유 범위**: 선언된 블록 내에서만 유효하며, 다른 블록이나 객체와는 무관합니다.
      * **메모리**: **스택(Stack) 영역**에 저장됩니다.
      * **예시**: 아래 `main` 메소드의 `myCar`, `yourCar` 또는 `accelerate` 메소드의 `amount` 변수

-----

## 객체(Object)와 인스턴스(Instance): 설계도로 만들어진 '실체'

**객체**는 클래스를 기반으로 메모리에 실제로 만들어진 \*\*'실체'\*\*를 의미합니다. 즉, 설계도(`클래스`)를 바탕으로 만들어진 실제 '자동차'입니다. 객체는 생성될 때마다 독립적인 속성값을 가질 수 있습니다.

**인스턴스**는 '객체'와 거의 같은 의미로 사용되지만, 좀 더 관계에 초점을 맞춘 용어입니다. 특정 클래스로부터 생성된 객체를 그 클래스의 \*\*'인스턴스'\*\*라고 부릅니다.
예를 들어, "myCar는 `Car` 클래스의 객체이다"라고 말할 수도 있지만, "myCar는 `Car` 클래스의 인스턴스이다"라고 말하는 것이 더 정확한 표현입니다.

### ✅ 클래스로 객체(인스턴스) 생성하기

객체를 생성하는 과정은 다음 두 단계로 이루어집니다.

1.  **클래스 타입의 변수 선언**: 객체의 주소값을 저장할 변수를 선언합니다.
    ```java
    클래스명 변수명;
    ```
2.  **`new` 연산자를 사용하여 객체 생성 및 할당**: `new` 키워드를 사용하여 클래스의 생성자를 호출하고, 힙(Heap) 메모리 영역에 실제 객체를 생성한 후, 그 객체의 메모리 주소를 선언된 변수에 할당합니다.

<!-- end list -->

```java
public class CarExample {
    public static void main(String[] args) {
        // 지역 변수: main 메소드 안에서만 유효한 변수
        // 1. Car 클래스 타입의 변수 선언 (아직 객체는 생성되지 않음)
        Car myCar; // myCar는 Car 객체를 '참조'할 지역 변수입니다.

        // 2. new 연산자를 사용하여 Car 클래스의 객체(인스턴스)를 생성하고 변수에 할당
        myCar = new Car(); // 힙 메모리에 Car 객체가 생성되고, 그 주소가 myCar에 저장됩니다.

        // myCar 인스턴스의 인스턴스 변수에 접근하고 값 설정
        myCar.color = "Red";
        myCar.model = "Tesla Model 3";
        myCar.speed = 0;

        System.out.println("내 차의 제조사: " + Car.manufacturer); // static 변수는 클래스명으로 접근
        System.out.println("내 차의 색상: " + myCar.color);
        System.out.println("내 차의 모델: " + myCar.model);
        System.out.println("내 차의 현재 속도: " + myCar.speed + "km/h");

        myCar.startEngine(); // 메소드 호출
        myCar.accelerate(50); // 메소드 호출 (amount는 이 메소드 내의 지역 변수)
        myCar.stop();        // 메소드 호출

        System.out.println("--------------------");

        // 또 다른 Car 객체(인스턴스) 생성
        Car yourCar = new Car(); // 힙 메모리에 새로운 Car 객체가 생성됩니다.
        yourCar.color = "Blue";
        yourCar.model = "Hyundai Sonata";
        yourCar.speed = 0;

        System.out.println("네 차의 제조사: " + Car.manufacturer); // static 변수는 클래스명으로 접근
        System.out.println("네 차의 색상: " + yourCar.color);
        System.out.println("네 차의 모델: " + yourCar.model);
        yourCar.accelerate(30);

        // myCar와 yourCar는 서로 독립적인 객체입니다.
        // 각자의 인스턴스 변수 속성을 가지고, 각자의 행동을 수행합니다.
        System.out.println("myCar의 최종 속도: " + myCar.speed + "km/h"); // 0 (stop() 호출 후)
        System.out.println("yourCar의 최종 속도: " + yourCar.speed + "km/h"); // 30

        // static 변수 값 변경 (모든 객체에 영향)
        Car.manufacturer = "Global Motors"; // 클래스 변수 값 변경
        System.out.println("--------------------");
        System.out.println("제조사 변경 후 myCar의 제조사: " + myCar.manufacturer); // 변경된 값 출력
        System.out.println("제조사 변경 후 yourCar의 제조사: " + yourCar.manufacturer); // 변경된 값 출력
        Car.printManufacturer(); // static 메소드도 클래스명으로 호출
    }
}
```

**실행 결과:**

```
내 차의 제조사: JavaMotors
내 차의 색상: Red
내 차의 모델: Tesla Model 3
내 차의 현재 속도: 0km/h
Tesla Model 3의 시동을 겁니다.
Tesla Model 3이(가) 50km/h로 가속합니다.
Tesla Model 3이(가) 정지합니다.
--------------------
네 차의 제조사: JavaMotors
네 차의 색상: Blue
네 차의 모델: Hyundai Sonata
Hyundai Sonata이(가) 30km/h로 가속합니다.
myCar의 최종 속도: 0km/h
yourCar의 최종 속도: 30km/h
--------------------
제조사 변경 후 myCar의 제조사: Global Motors
제조사 변경 후 yourCar의 제조사: Global Motors
모든 Global Motors 자동차의 총 생산 대수는 아직 미정입니다.
```

위 예시에서 `myCar`와 `yourCar`는 모두 `Car`라는 \*\*동일한 설계도(클래스)\*\*로부터 만들어졌지만, 각각 고유한 `color`, `model`, `speed` 값(인스턴스 변수)을 가집니다. 반면 `manufacturer`(static 변수)는 모든 `Car` 객체가 **공유**하며, 어느 한 곳에서 값을 바꾸면 모든 객체에 영향을 미치는 것을 확인할 수 있습니다. `main` 메소드 안에서 선언된 `myCar`, `yourCar` 변수들은 메소드 실행이 끝나면 사라지는 **지역 변수**입니다.

-----

## 📌 요약 정리: 클래스, 객체, 인스턴스 그리고 변수의 종류

  * **클래스(Class)**: 객체를 만들기 위한 **설계도**. 객체가 가질 속성(필드)과 행동(메소드)을 정의합니다. 클래스 자체는 메모리에 실제 데이터를 저장하지 않습니다.

  * **객체(Object)**: 클래스 설계도를 바탕으로 **메모리에 생성된 실제 실체**. 독립적인 속성 값을 가지며, 정의된 행동을 수행할 수 있습니다.

  * **인스턴스(Instance)**: 특정 클래스로부터 생성된 **객체**를 지칭할 때 사용되는 용어. "myCar는 `Car` 클래스의 인스턴스이다" 와 같이 특정 클래스와의 관계를 강조합니다.

  * **생성**: `new` 연산자를 통해 클래스로부터 객체(인스턴스)를 생성합니다. 이때 실제 데이터는 **힙 영역**에 저장되고, 객체를 참조하는 변수는 **스택 영역**에 그 주소값을 가집니다.

  * **변수의 종류**:

      * **인스턴스 변수**: 각 **객체(인스턴스)마다 고유**하게 값을 가집니다. (`color`, `model`, `speed`)
      * **클래스 변수 (static 변수)**: **모든 객체가 공유**하는 값입니다. 클래스 로드 시점에 메모리(메소드 영역)에 할당됩니다. (`manufacturer`)
      * **지역 변수**: 메소드/블록 내에서 선언되며, 해당 블록이 끝나면 사라집니다. (`myCar`, `yourCar`, `amount`)

-----

## 💡 클래스/객체 퀴즈: 동물 농장

다음 `Animal` 클래스와 `main` 메소드를 보고, 어떤 결과가 출력될지 예상해 보세요.

```java
class Animal { // public 키워드를 붙이지 않으면 파일명과 달라도 됩니다.
    String name; // 인스턴스 변수
    String sound; // 인스턴스 변수
    static String kingdom = "동물계"; // 클래스 변수 (static 변수)

    public void makeSound() {
        System.out.println(name + "이(가) " + sound + " 소리를 냅니다.");
    }

    public static void printKingdom() {
        System.out.println("모든 생명체는 " + kingdom + "에 속합니다.");
    }
}

public class AnimalFarm {
    public static void main(String[] args) {
        Animal dog = new Animal(); // 지역 변수 dog
        dog.name = "바둑이";
        dog.sound = "멍멍";

        Animal cat = new Animal(); // 지역 변수 cat
        cat.name = "나비";
        cat.sound = "야옹";

        dog.makeSound();
        cat.makeSound();

        System.out.println("--- Static 변수 확인 ---");
        System.out.println("강아지의 종: " + dog.kingdom); // 객체를 통해서도 static 변수 접근 가능
        System.out.println("고양이의 종: " + cat.kingdom); // 객체를 통해서도 static 변수 접근 가능
        Animal.printKingdom(); // static 메소드는 클래스명으로 호출

        Animal.kingdom = "생물계"; // static 변수 값 변경

        System.out.println("--- Static 변수 변경 후 확인 ---");
        System.out.println("강아지의 종: " + dog.kingdom);
        System.out.println("고양이의 종: " + cat.kingdom);
        Animal.printKingdom();
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
출력 결과:

```
바둑이이(가) 멍멍 소리를 냅니다.
나비이(가) 야옹 소리를 냅니다.
--- Static 변수 확인 ---
강아지의 종: 동물계
고양이의 종: 동물계
모든 생명체는 동물계에 속합니다.
--- Static 변수 변경 후 확인 ---
강아지의 종: 생물계
고양이의 종: 생물계
모든 생명체는 생물계에 속합니다.
```

<br>
설명:
<br>

1.  `Animal` 클래스는 `name`, `sound` (인스턴스 변수)와 `kingdom` (static 변수), `makeSound()` (인스턴스 메소드), `printKingdom()` (static 메소드)를 가집니다.<br>
2.  `main` 메소드에서 `dog`와 `cat`이라는 두 개의 `Animal` 인스턴스를 생성하고 각각의 `name`과 `sound`를 설정합니다. 이들은 각 객체에 독립적으로 저장됩니다.<br>
3.  `dog.makeSound()`와 `cat.makeSound()`는 각 인스턴스의 고유한 `name`과 `sound` 값을 사용하여 출력합니다.<br>
4.  `kingdom`은 `static` 변수이므로 `dog.kingdom`이든 `cat.kingdom`이든 `Animal.kingdom`이든 모두 동일한 메모리 공간을 참조합니다. 따라서 처음에는 "동물계"가 출력됩니다.<br>
5.  `Animal.printKingdom()`도 `static` 메소드이므로 `kingdom` 변수의 현재 값을 출력합니다.<br>
6.  `Animal.kingdom = &quot;생물계&quot;;` 코드를 통해 `static` 변수 `kingdom`의 값을 "생물계"로 변경합니다. 이 변경은 `dog`와 `cat` 등 **모든 `Animal` 인스턴스에 즉시 반영**됩니다.<br>
7.  변경 후 다시 `dog.kingdom`, `cat.kingdom`, `Animal.printKingdom()`을 호출하면 모두 변경된 "생물계"가 출력되는 것을 확인할 수 있습니다.
    </details>

-----

## 🔚 마치며: 객체지향의 첫걸음

이번 글에서는 자바 객체지향 프로그래밍의 핵심 축인 **클래스, 객체, 인스턴스** 개념을 알아보았습니다. 이 개념들은 자바를 넘어 대부분의 현대 프로그래밍 언어에서 매우 중요하게 다뤄지는 기초입니다. 클래스가 설계도이고, 객체/인스턴스는 그 설계도를 통해 만들어진 실제 사물이라는 비유를 기억한다면 이해하기 쉬울 것입니다. 또한, 클래스 내부에 선언되는 변수의 종류(인스턴스, static, 지역 변수)와 그 특징을 이해하는 것은 객체지향 설계에 있어 매우 중요합니다.

이러한 객체지향의 기본 개념을 이해하는 것은 앞으로 배우게 될 상속, 다형성, 캡슐화 등 더 깊이 있는 객체지향 특성들을 이해하는 데 필수적인 토대가 됩니다.
