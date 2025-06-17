---
title: "자바 객체지향-인터페이스"
date: 2025-06-17 12:02:21 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 객체지향: 인터페이스 (Interface)

자바 객체지향 프로그래밍에서 \*\*인터페이스(Interface)\*\*는 클래스들이 구현해야 하는 **메소드의 집합을 정의하는 특별한 종류의 추상 클래스**라고 볼 수 있습니다. 인터페이스는 객체의 \*\*행위(Behavior)\*\*를 정의하고, 다양한 클래스들이 동일한 행위를 가지도록 **표준을 제시**하는 데 사용됩니다.

인터페이스는 클래스와는 다르게 객체를 직접 생성할 수 없으며, 주로 \*\*다형성(Polymorphism)\*\*을 높이고, 여러 클래스에 걸쳐 공통된 기능을 강제하거나, 느슨한 결합(Loose Coupling)을 통한 유연한 설계를 가능하게 합니다.

-----

## 1\. 인터페이스의 특징과 역할

인터페이스는 다음과 같은 주요 특징과 역할을 가집니다.

  * **추상 메소드의 집합**: 인터페이스는 기본적으로 \*\*추상 메소드(Abstract Method)\*\*로만 구성됩니다. 자바 8부터는 `default` 메소드와 `static` 메소드도 포함할 수 있게 되었지만, 본질적인 목적은 **구현할 클래스에게 어떤 기능을 제공해야 하는지 정의**하는 것입니다.
  * **다중 상속의 대안**: 자바는 클래스의 다중 상속을 허용하지 않습니다. 하지만 인터페이스는 \*\*다중 구현(Multiple Implementation)\*\*을 허용하여, 하나의 클래스가 여러 인터페이스를 구현함으로써 다중 상속과 유사한 효과를 낼 수 있습니다.
  * **상수(Constant) 정의**: 인터페이스 내에 정의되는 모든 필드(변수)는 **`public static final`** 특성을 가집니다. 즉, **상수만 정의할 수 있으며, 인스턴스 변수나 static 변수는 직접 정의할 수 없습니다.**
  * **느슨한 결합**: 인터페이스를 사용하면 구현 클래스 간의 의존성을 줄여서 시스템을 더욱 유연하고 확장 가능하게 만듭니다.
  * **설계 명세**: 인터페이스는 특정 기능을 제공하는 클래스가 가져야 할 '계약' 또는 '명세'의 역할을 합니다. 이는 협업 시 개발자 간의 약속을 명확히 합니다.

-----

## 2\. 인터페이스 선언 및 구현

### 2-1. 인터페이스 선언

인터페이스는 `interface` 키워드를 사용하여 선언합니다.

```java
public interface Soundable {
    // 상수 정의 (public static final은 생략 가능)
    String DEFAULT_SOUND_TYPE = "General Sound";

    // 추상 메소드 (public abstract은 생략 가능)
    void makeSound();
    void playMusic(String songName);

    // Java 8부터 추가된 default 메소드 (구현부가 있음)
    default void describe() {
        System.out.println("이 객체는 소리를 낼 수 있습니다.");
    }

    // Java 8부터 추가된 static 메소드 (인터페이스 이름으로 직접 호출)
    static void showSoundCapability() {
        System.out.println("모든 Soundable 객체는 소리를 내는 능력을 가집니다.");
    }
}
```

**특징:**

  * **메소드**: 인터페이스의 모든 메소드는 자바 8 이전에는 **`public abstract`** 이었으며, 이 키워드는 생략 가능합니다. 자바 8부터는 **`default`** 메소드와 **`static`** 메소드도 추가되어 구현부를 가질 수 있게 되었습니다.
  * **변수**: 인터페이스에 선언되는 모든 변수는 **`public static final`** 상수로 간주되며, 이 키워드 역시 생략 가능합니다. **인스턴스 변수나 단순한 static 변수는 정의할 수 없습니다.** 즉, 상태(State)를 가질 수 없고 오직 상수만 가질 수 있습니다.

### 2-2. 인터페이스 구현 (implements)

클래스는 `implements` 키워드를 사용하여 하나 이상의 인터페이스를 구현할 수 있습니다. 인터페이스를 구현하는 클래스는 해당 인터페이스에 정의된 **모든 추상 메소드를 반드시 오버라이딩하여 구현**해야 합니다.

```java
// Soundable 인터페이스를 구현하는 Dog 클래스
class Dog implements Soundable {
    private String name;

    public Dog(String name) {
        this.name = name;
    }

    // Soundable 인터페이스의 추상 메소드 구현
    @Override
    public void makeSound() {
        System.out.println(name + "가 멍멍 짖습니다!");
    }

    @Override
    public void playMusic(String songName) {
        System.out.println(name + "는 " + songName + " 노래를 들으면 꼬리를 흔듭니다.");
    }

    // default 메소드는 구현하지 않아도 되지만, 필요하면 오버라이딩 가능
    @Override
    public void describe() {
        System.out.println(name + "는 " + DEFAULT_SOUND_TYPE + " 타입의 소리를 낼 수 있는 동물입니다.");
    }
}

// Soundable 인터페이스를 구현하는 Car 클래스
class Car implements Soundable {
    private String model;

    public Car(String model) {
        this.model = model;
    }

    // Soundable 인터페이스의 추상 메소드 구현
    @Override
    public void makeSound() {
        System.out.println(model + "가 빵빵 경적을 울립니다!");
    }

    @Override
    public void playMusic(String songName) {
        System.out.println(model + "에서 " + songName + " 노래가 흘러나옵니다.");
    }
}

public class InterfaceExample {
    public static void main(String[] args) {
        // 인터페이스 다형성 활용
        Soundable myDog = new Dog("바둑이");
        Soundable myCar = new Car("테슬라 모델3");

        myDog.makeSound(); // 바둑이가 멍멍 짖습니다!
        myDog.playMusic("강아지 송"); // 바둑이는 강아지 송 노래를 들으면 꼬리를 흔듭니다.
        myDog.describe(); // 바둑이는 General Sound 타입의 소리를 낼 수 있는 동물입니다.

        System.out.println("---");

        myCar.makeSound(); // 테슬라 모델3가 빵빵 경적을 울립니다!
        myCar.playMusic("드라이브 송"); // 테슬라 모델3에서 드라이브 송 노래가 흘러나옵니다.
        // myCar.carDescription(); // 컴파일 에러: Soundable 타입에는 carDescription 메소드가 없음
        // (myCar는 Soundable 인터페이스 타입으로 선언되었기 때문에 Soundable에 정의된 메소드만 호출 가능)
        myCar.describe(); // 이 객체는 소리를 낼 수 있습니다. (기본 default 메소드 호출)

        System.out.println("---");

        // 인터페이스의 static 메소드 호출
        Soundable.showSoundCapability(); // 모든 Soundable 객체는 소리를 내는 능력을 가집니다.

        // 인터페이스에 정의된 상수 사용
        System.out.println("기본 사운드 타입: " + Soundable.DEFAULT_SOUND_TYPE);
    }
}
```

-----

## 3\. 인터페이스의 핵심 개념: 추상 메소드 집합 및 변수 제한

### 3-1. 추상 메소드의 집합 (Abstract Method Collection)

인터페이스의 가장 본질적인 역할은 \*\*클래스가 따라야 할 행위의 청사진(Blueprint)\*\*을 제공하는 것입니다. 이 청사진은 **오직 추상 메소드**로만 이루어져 있었습니다 (자바 8 이전).

  * 인터페이스에 선언된 추상 메소드는 \*\*메소드 시그니처(이름, 매개변수, 반환 타입)\*\*만 있고, **구현부(Body)가 없습니다.**
  * 인터페이스를 구현하는 모든 클래스는 이 추상 메소드들을 **반드시 자신의 목적에 맞게 구현**해야 합니다. 이를 통해 다양한 클래스들이 동일한 인터페이스를 구현함으로써 **다형성**을 활용할 수 있게 됩니다.
  * 예시: `Soundable` 인터페이스의 `makeSound()` 메소드를 `Dog` 클래스는 "멍멍"으로, `Car` 클래스는 "빵빵"으로 다르게 구현하지만, 두 객체 모두 `Soundable` 타입으로 `makeSound()`를 호출할 수 있습니다.

### 3-2. 인스턴스 변수 및 static 변수 정의 불가

인터페이스는 클래스와 달리 **객체의 상태(State)를 가질 수 없습니다.**

  * 인터페이스 내부에 \*\*인스턴스 변수(non-static field)\*\*를 선언하는 것은 허용되지 않습니다.
      * 이는 인터페이스가 **구현 객체들의 공통적인 행위 명세**를 위한 것이지, **개별 객체의 데이터를 저장**하기 위한 것이 아니기 때문입니다.
  * 인터페이스 내부에 **일반적인 static 변수**를 선언하는 것도 허용되지 않습니다.
      * 인터페이스에 선언되는 모든 변수는 컴파일 시 자동으로 **`public static final`** 특성을 부여받아 \*\*상수(Constant)\*\*로 처리됩니다. 이는 인터페이스가 특정 값을 공유하는 데 사용될 수 있지만, 변하는 상태를 가지는 필드는 정의할 수 없다는 의미입니다.

이러한 제한은 인터페이스가 **행위의 추상화**에만 집중하고, 데이터 관리의 책임은 이를 구현하는 클래스에게 위임하여 설계의 **단순성과 명확성**을 유지하도록 돕습니다.

-----

## 📌 요약 정리: 인터페이스

  * **인터페이스**: 클래스들이 구현해야 할 **추상 메소드의 집합**을 정의하는 특별한 형태의 추상 클래스.
  * **주요 역할**: 다형성 증진, 다중 구현을 통한 다중 상속 효과, 느슨한 결합, 설계 명세 제시.
  * **특징**:
      * 기본적으로 **`public abstract` 메소드**로 구성 (Java 8부터 `default`, `static` 메소드 추가).
      * 선언된 모든 필드는 **`public static final` 상수**이다.
      * **인스턴스 변수 및 일반적인 static 변수는 정의할 수 없다.** (오직 상수만 가능)
  * **구현**: `implements` 키워드를 사용하며, 인터페이스의 모든 추상 메소드를 반드시 구현해야 한다.

-----

## 💡 인터페이스 심화 퀴즈

다음 자바 코드와 설명에 대한 질문입니다.

```java
interface Flyable {
    // #1
    int MAX_ALTITUDE = 10000;

    // #2
    void takeOff();
    void land();

    // #3
    default void accelerate() {
        System.out.println("가속합니다.");
    }

    // #4
    static void describeFlight() {
        System.out.println("비행 객체의 공통 특성.");
    }

    // #5
    // private String type; // 인터페이스 내 인스턴스 변수 선언 시도
}

abstract class Vehicle implements Flyable {
    // #6
    private int speed; // 이 선언은 가능할까?

    @Override
    public void takeOff() {
        System.out.println("차량이 이륙합니다.");
    }

    // land 메소드는 추상으로 남겨둘 수 있다.
}

class Airplane extends Vehicle {
    @Override
    public void land() {
        System.out.println("비행기가 착륙합니다.");
    }
}
```

**질문:** 위 코드에서 컴파일 에러가 발생하거나, 인터페이스의 본질적 특성(메소드 및 변수 정의 제한)을 위배하는 주석 처리된 라인은 몇 번일까요? (정답은 하나 이상일 수 있습니다.)

1.  `#1`
2.  `#2`
3.  `#3`
4.  `#4`
5.  `#5`
6.  `#6`

<details>
<summary>정답 보기</summary>
<br>
**정답:** 5번<br><br>

**설명:**<br><br>

  * **\#5는 컴파일 에러를 발생**시킵니다. 인터페이스는 **인스턴스 변수를 가질 수 없습니다.** 인터페이스 내의 모든 필드는 암묵적으로 `public static final` 상수가 됩니다.<br>
  * 나머지 옵션들은 유효한 선언입니다:<br>
      * `#1`은 인터페이스 내 유효한 상수 선언입니다.<br>
      * `#2`는 인터페이스 내 유효한 추상 메소드 선언입니다.<br>
      * `#3`은 자바 8부터 허용되는 `default` 메소드 선언입니다.<br>
      * `#4`는 자바 8부터 허용되는 `static` 메소드 선언입니다.<br>
      * `#6`은 추상 클래스 `Vehicle` 내의 인스턴스 변수 선언입니다. **추상 클래스는 상태(인스턴스 변수)를 가질 수 있습니다.** 이는 인터페이스와 추상 클래스의 중요한 차이점 중 하나입니다.<br><br>

</details>

-----

## 🔚 마치며: 설계의 유연성을 위한 인터페이스

이번 글에서는 자바 객체지향의 중요한 요소인 **인터페이스**에 대해 깊이 있게 다루었습니다. 인터페이스가 어떻게 **클래스의 행위를 표준화**하고, **다형성을 활용**하여 유연하고 확장 가능한 설계를 가능하게 하는지 이해하셨을 것입니다. 특히 **인터페이스가 추상 메소드의 집합으로 구성되며, 인스턴스 변수나 static 변수를 직접 정의할 수 없고 오직 상수만을 가질 수 있다는 점**은 인터페이스의 본질적인 목적을 이해하는 데 핵심적인 부분입니다.

클래스의 상속이 'is-a' 관계(A는 B이다)를 나타내며 객체의 상태(필드)를 가질 수 있는 반면, 인터페이스의 구현은 'can-do' 관계(A는 \~를 할 수 있다)를 나타내며 오직 행위(메소드)의 명세만을 제공합니다. 이러한 차이를 명확히 이해하면 객체지향 설계에서 인터페이스를 언제, 왜 사용해야 하는지 명확히 판단할 수 있습니다.