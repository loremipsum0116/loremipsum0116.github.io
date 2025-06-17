---
title: "자바 객체지향-메소드"
date: 2025-06-17 11:28:43 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 객체지향 프로그래밍: 메소드 심화와 활용

이전 글에서 객체지향 프로그래밍의 핵심인 **클래스, 객체, 인스턴스** 개념을 배우고, 클래스 내부에 선언되는 **변수의 종류**에 대해서도 알아보았습니다. 이제 객체가 '행동'을 수행하는 통로인 \*\*메소드(Method)\*\*에 대해 더 깊이 파고들 시간입니다. 메소드는 단순한 기능 단위를 넘어, 객체지향의 다양한 원칙을 구현하는 데 중요한 역할을 합니다.

이번 글에서는 자바 메소드의 다양한 측면을 탐구할 것입니다. 특히 \*\*매개변수 전달 방식(기본형 vs 참조형)\*\*의 차이, **인스턴스 메소드와 static 메소드**의 역할, 그리고 \*\*메소드 오버로딩(Method Overloading)\*\*을 통한 유연한 기능 제공 방법까지 자세히 살펴보겠습니다. 이 지식은 여러분이 더욱 견고하고 효율적인 자바 코드를 작성하는 데 큰 도움이 될 것입니다.

-----

## 메소드(Method)란?

메소드는 특정 작업을 수행하는 코드 블록입니다. 객체의 '행동' 또는 '기능'을 정의하며, 외부로부터 데이터를 입력받을 수도 있고(매개변수), 작업 수행 후 결과를 반환할 수도 있습니다.

```java
public class Calculator {
    // 덧셈을 수행하는 메소드
    public int add(int a, int b) { // int a, int b는 매개변수
        int result = a + b; // result는 지역 변수
        return result; // int 타입의 값을 반환
    }

    // 환영 메시지를 출력하는 메소드 (반환값 없고, 매개변수 없음)
    public void greet() {
        System.out.println("안녕하세요!");
    }
}
```

위 예시에서 `add` 메소드는 두 개의 정수(`a`, `b`)를 입력받아 덧셈을 수행하고, 그 결과를 정수(`result`)로 반환합니다. `greet` 메소드는 아무것도 입력받지 않고, 아무것도 반환하지 않지만 특정 동작(메시지 출력)을 수행합니다.

-----

## 1\. 매개변수 전달 방식: 기본형 vs 참조형

메소드를 호출할 때 매개변수를 전달하는 방식은 기본형(Primitive Type)과 참조형(Reference Type)에서 큰 차이를 보입니다. 이는 자바의 'Pass by Value(값에 의한 전달)' 원칙 때문입니다.

### 1-1. 기본형 매개변수 (Call by Value)

기본형(int, double, boolean 등) 변수를 메소드의 매개변수로 전달할 때는 **변수에 저장된 실제 값**이 복사되어 전달됩니다. 따라서 메소드 내부에서 이 복사된 값(매개변수)을 변경하더라도, **원본 변수의 값은 변경되지 않습니다.**

```java
public class ParameterExample {
    public static void main(String[] args) {
        int originalValue = 10;
        System.out.println("메소드 호출 전 originalValue: " + originalValue); // 10 출력

        changePrimitive(originalValue);
        System.out.println("메소드 호출 후 originalValue: " + originalValue); // 여전히 10 출력
    }

    // 기본형 매개변수: value의 '값'이 복사되어 전달됨
    public static void changePrimitive(int value) {
        value = 20; // 복사된 값을 변경
        System.out.println("메소드 내에서 value: " + value); // 20 출력
    }
}
```

**실행 결과:**

```
메소드 호출 전 originalValue: 10
메소드 내에서 value: 20
메소드 호출 후 originalValue: 10
```

`changePrimitive` 메소드 내에서 `value`를 20으로 변경했지만, `main` 메소드의 `originalValue`는 여전히 10입니다. 이는 `originalValue`의 '값' 10이 `value`라는 새로운 변수에 복사되었기 때문입니다.

### 1-2. 참조형 매개변수 (Call by Value, but 'Value' is Reference)

참조형(객체, 배열) 변수를 메소드의 매개변수로 전달할 때도 '값에 의한 전달'이 적용됩니다. 하지만 이때 전달되는 '값'은 실제 객체 자체가 아니라 \*\*객체가 저장된 메모리 '주소'(참조값)\*\*입니다. 따라서 메소드 내부에서 이 복사된 주소(매개변수)를 통해 **객체에 접근하여 객체의 내용을 변경하면, 원본 객체도 변경됩니다.**

```java
class MyObject {
    int data;
    MyObject(int data) { this.data = data; }
}

public class ParameterExample {
    public static void main(String[] args) {
        MyObject obj = new MyObject(100);
        System.out.println("메소드 호출 전 obj.data: " + obj.data); // 100 출력

        changeReference(obj); // obj가 가리키는 '주소값'이 o에 복사됨
        System.out.println("메소드 호출 후 obj.data: " + obj.data); // 200 출력
        
        // 새로운 객체를 할당해도 원본은 바뀌지 않음
        createNewObject(obj); // obj가 가리키는 '주소값'이 o에 복사됨
        System.out.println("새 객체 할당 메소드 호출 후 obj.data: " + obj.data); // 여전히 200 출력
    }

    // 참조형 매개변수: o에 obj가 가리키는 '주소값'이 복사되어 전달됨
    public static void changeReference(MyObject o) {
        o.data = 200; // 복사된 주소값을 통해 원본 객체의 내용 변경
        System.out.println("메소드 내에서 o.data: " + o.data); // 200 출력
    }

    // 매개변수에 새로운 객체를 할당하는 경우
    public static void createNewObject(MyObject o) {
        o = new MyObject(300); // o가 새로운 객체를 참조하게 됨 (원본 obj와는 무관)
        System.out.println("메소드 내에서 새로운 객체 o.data: " + o.data); // 300 출력
    }
}
```

**실행 결과:**

```
메소드 호출 전 obj.data: 100
메소드 내에서 o.data: 200
메소드 호출 후 obj.data: 200
메소드 내에서 새로운 객체 o.data: 300
새 객체 할당 메소드 호출 후 obj.data: 200
```

`changeReference` 메소드에서 `o.data = 200;`을 통해 `o`가 가리키는 객체의 `data` 값을 변경했을 때, `main` 메소드의 `obj`가 가리키는 객체의 `data` 값도 200으로 변경된 것을 알 수 있습니다. 이는 두 변수가 **동일한 힙 영역의 객체를 참조**하고 있기 때문입니다.

하지만 `createNewObject` 메소드에서 `o = new MyObject(300);`처럼 매개변수 `o`에 아예 **새로운 객체를 할당**하면, `o`는 이제 원래 `obj`가 참조하던 객체가 아닌, 새로운 객체를 참조하게 됩니다. 이 경우 `obj`는 여전히 원래 객체를 참조하므로 `obj.data`는 변경되지 않습니다.

-----

## 2\. 인스턴스 메소드 vs static 메소드

메소드도 변수처럼 `static` 키워드의 유무에 따라 동작 방식이 달라집니다.

### 2-1. 인스턴스 메소드 (Instance Method)

  * **선언 방식**: `static` 키워드 없이 선언됩니다.
  * **호출 방식**: 반드시 **객체(인스턴스)를 생성한 후, 객체 참조 변수를 통해서 호출**해야 합니다.
      * `객체참조변수.메소드명()`
  * **접근 가능 범위**: 해당 객체의 **인스턴스 변수**와 **인스턴스 메소드**는 물론, **static 변수**와 **static 메소드**에도 접근할 수 있습니다.
  * **용도**: 객체마다 다른 값을 가지는 인스턴스 변수를 조작하거나, 객체의 고유한 행동을 정의할 때 사용합니다.
  * **예시**: `Car` 클래스의 `startEngine()`, `accelerate()`, `stop()`

<!-- end list -->

```java
// Car 클래스 (이전 글 예시)
public class Car {
    String model; // 인스턴스 변수
    static String manufacturer = "JavaMotors"; // static 변수

    // 인스턴스 메소드: 객체의 model 필드를 사용합니다.
    public void startEngine() {
        System.out.println(model + "의 시동을 겁니다.");
    }

    // static 메소드: static 필드만 사용하거나, 객체와 무관한 공통 기능 제공
    public static void printManufacturer() {
        System.out.println("모든 " + manufacturer + " 자동차");
    }
}

public class MethodCallExample {
    public static void main(String[] args) {
        Car myCar = new Car(); // 객체 생성
        myCar.model = "Tesla";

        myCar.startEngine(); // 인스턴스 메소드 호출 (객체를 통해서)
        // System.out.println(Car.model); // 에러! static 메소드에서 인스턴스 변수에 직접 접근 불가
    }
}
```

### 2-2. static 메소드 (Class Method)

  * **선언 방식**: `static` 키워드를 사용하여 선언됩니다.
  * **호출 방식**: **클래스 이름을 통해서 직접 호출**하는 것이 일반적입니다. 객체를 생성하지 않고도 호출할 수 있습니다.
      * `클래스명.메소드명()`
  * **접근 가능 범위**: 오직 **static 변수**와 **static 메소드**에만 직접 접근할 수 있습니다. 인스턴스 변수나 인스턴스 메소드에는 직접 접근할 수 없습니다. (왜냐하면 static 메소드가 호출될 시점에 객체가 존재하지 않을 수도 있기 때문입니다.)
  * **용도**: 객체와 독립적으로 동작하는 유틸리티 메소드 (예: 수학 계산, 공통 설정), 모든 객체가 공유하는 데이터를 다룰 때 사용합니다.
  * **예시**: `Math.random()`, `System.out.println()`

<!-- end list -->

```java
public class MethodCallExample {
    public static void main(String[] args) {
        // static 메소드 호출 (클래스명으로 직접 호출)
        Car.printManufacturer();
        // Car.startEngine(); // 에러! static 메소드에서 인스턴스 메소드를 직접 호출할 수 없음
    }
}
```

**핵심 정리**:

  * **인스턴스 메소드**는 **객체의 고유한 상태(인스턴스 변수)에 따라 동작**해야 할 때 사용합니다. (객체 없이는 의미가 없음)
  * **static 메소드**는 **객체의 생성과 무관하게 공통적으로 사용되는 기능**이나 **클래스 전체에 관련된 작업**을 수행할 때 사용합니다. (객체 없이도 동작 가능)

-----

## 3\. 메소드 반환값: 기본형 vs 참조형

메소드는 작업을 수행한 후 그 결과를 호출한 곳으로 반환할 수 있습니다. 이때 반환되는 값의 타입도 기본형과 참조형으로 나뉩니다.

### 3-1. 기본형 반환값

메소드가 `int`, `double`, `boolean` 등 기본형 타입의 값을 반환할 경우, **실제 값**이 복사되어 반환됩니다.

```java
public class ReturnValueExample {
    public int multiply(int x, int y) {
        return x * y; // x * y의 실제 값(정수)이 반환됨
    }

    public static void main(String[] args) {
        ReturnValueExample re = new ReturnValueExample();
        int result = re.multiply(5, 3); // 15가 반환되어 result에 저장
        System.out.println("곱셈 결과: " + result); // 출력: 15
    }
}
```

### 3-2. 참조형 반환값

메소드가 `String`, 배열, 또는 사용자 정의 클래스(객체)와 같은 참조형 타입의 값을 반환할 경우, \*\*객체의 메모리 '주소'(참조값)\*\*가 복사되어 반환됩니다. 이 주소를 통해 호출한 쪽에서 반환된 객체에 접근할 수 있습니다.

```java
class Person {
    String name;
    Person(String name) { this.name = name; }
    void introduce() {
        System.out.println("안녕하세요, 저는 " + name + "입니다.");
    }
}

public class ReturnValueExample {
    // Person 객체를 생성하여 반환하는 메소드
    public Person createPerson(String name) {
        Person p = new Person(name); // 힙에 새로운 Person 객체 생성
        return p; // p가 가리키는 '주소값'이 반환됨
    }

    // 배열을 반환하는 메소드
    public int[] createNumbersArray() {
        int[] numbers = {10, 20, 30}; // 힙에 새로운 배열 객체 생성
        return numbers; // numbers가 가리키는 '주소값'이 반환됨
    }

    public static void main(String[] args) {
        ReturnValueExample re = new ReturnValueExample();

        // Person 객체 반환
        Person myPerson = re.createPerson("홍길동"); // 힙에 생성된 Person 객체의 주소가 myPerson에 저장
        myPerson.introduce(); // 출력: 안녕하세요, 저는 홍길동입니다.

        // 배열 반환
        int[] returnedArray = re.createNumbersArray(); // 힙에 생성된 배열 객체의 주소가 returnedArray에 저장
        System.out.println("반환된 배열의 첫 번째 요소: " + returnedArray[0]); // 출력: 10
    }
}
```

메소드에서 참조형을 반환하면, 실제 객체는 힙에 그대로 남아 있고, 해당 객체의 주소만 반환되어 호출한 곳의 참조 변수에 할당됩니다. 이를 통해 여러 메소드가 동일한 객체를 공유하고 조작할 수 있게 됩니다.

-----

## 4\. 메소드 오버로딩 (Method Overloading)

**메소드 오버로딩**은 하나의 클래스 내에서 **이름은 같지만 매개변수의 타입, 개수, 또는 순서가 다른 메소드를 여러 개 정의**하는 객체지향의 특징입니다. 이는 동일한 기능을 수행하지만 입력 데이터의 형태가 다를 때 유용하며, 코드의 직관성과 가독성을 높여줍니다.

컴파일러는 메소드 호출 시 제공된 매개변수 정보를 바탕으로 어떤 오버로딩된 메소드를 호출해야 할지 자동으로 판단합니다.

**오버로딩의 조건:**

1.  **메소드 이름이 같아야 한다.**
2.  **매개변수의 개수, 타입, 또는 순서 중 적어도 하나는 달라야 한다.**
3.  **반환 타입은 오버로딩 조건에 영향을 주지 않는다.** (반환 타입만 다르고 매개변수가 같으면 오버로딩이 아님)

<!-- end list -->

```java
public class Calculator {
    // 1. 두 정수의 덧셈
    public int add(int a, int b) {
        System.out.println("정수 두 개 덧셈");
        return a + b;
    }

    // 2. 세 정수의 덧셈 (매개변수 개수 다름)
    public int add(int a, int b, int c) {
        System.out.println("정수 세 개 덧셈");
        return a + b + c;
    }

    // 3. 두 실수의 덧셈 (매개변수 타입 다름)
    public double add(double a, double b) {
        System.out.println("실수 두 개 덧셈");
        return a + b;
    }

    // 4. 문자열과 정수 덧셈 (매개변수 타입 순서 다름)
    public String add(String s, int n) {
        System.out.println("문자열과 정수 덧셈");
        return s + n;
    }

    // 5. 정수와 문자열 덧셈 (매개변수 타입 순서 다름)
    public String add(int n, String s) {
        System.out.println("정수와 문자열 덧셈");
        return n + s;
    }

    // 다음은 오버로딩이 아님 (반환 타입만 다름) - 컴파일 에러 발생
    // public double add(int a, int b) { return (double)a + b; }

    public static void main(String[] args) {
        Calculator calc = new Calculator();

        System.out.println(calc.add(10, 20));       // 정수 두 개 덧셈: 30
        System.out.println(calc.add(10, 20, 30));   // 정수 세 개 덧셈: 60
        System.out.println(calc.add(10.5, 20.5));   // 실수 두 개 덧셈: 31.0
        System.out.println(calc.add("Hello", 123)); // 문자열과 정수 덧셈: Hello123
        System.out.println(calc.add(456, "World")); // 정수와 문자열 덧셈: 456World
    }
}
```

메소드 오버로딩은 `System.out.println()`처럼 다양한 타입의 데이터를 출력할 때 동일한 메소드 이름을 사용하지만 내부적으로는 다른 오버로딩된 메소드를 호출하는 경우를 통해 일상적으로 접할 수 있습니다.

-----

## 📌 요약 정리: 메소드 심화와 활용

  * **메소드**: 객체의 '행동'을 정의하는 코드 블록.
  * **매개변수 전달**:
      * **기본형**: **값 복사** (원본 변경 X)
      * **참조형**: **주소 값 복사** (주소로 접근하는 **객체 내용 변경 O**, 새 객체 할당 X)
  * **메소드 종류**:
      * **인스턴스 메소드**: `static` 없이 선언. **객체를 생성 후 호출**. 인스턴스 변수/메소드, static 변수/메소드 모두 접근 가능.
      * **static 메소드**: `static` 키워드 사용. **클래스 이름으로 호출**. static 변수/메소드만 직접 접근 가능.
  * **메소드 반환값**:
      * **기본형**: 실제 값 반환.
      * **참조형**: 객체의 **메모리 주소** 반환.
  * **메소드 오버로딩**: 동일한 클래스 내에서 **같은 이름**을 가지지만 **매개변수의 타입, 개수, 순서가 다른** 여러 메소드를 정의하는 것. 반환 타입은 오버로딩 조건에 해당하지 않음.
  * **생성자**: 객체 생성 및 초기화 시 호출되는 특별한 메소드. 클래스 이름과 동일하며 반환 타입 없음.
  * **`this`**: 현재 객체(인스턴스) 자신을 참조.

-----

## 💡 메소드 퀴즈: 오버로딩과 매개변수

다음 코드의 출력 결과를 예상해 보세요.

```java
public class QuizMethods {

    public static void modify(int x) {
        x = x + 10;
        System.out.println("modify(int x) 내 x: " + x);
    }

    public static void modify(int[] arr) {
        arr[0] = arr[0] + 10;
        System.out.println("modify(int[] arr) 내 arr[0]: " + arr[0]);
    }

    public static void main(String[] args) {
        int num = 5;
        System.out.println("main 시작 num: " + num);
        modify(num);
        System.out.println("main 끝 num: " + num);

        System.out.println("--------------------");

        int[] data = {100};
        System.out.println("main 시작 data[0]: " + data[0]);
        modify(data);
        System.out.println("main 끝 data[0]: " + data[0]);
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
출력 결과:

```
main 시작 num: 5
modify(int x) 내 x: 15
main 끝 num: 5
--------------------
main 시작 data[0]: 100
modify(int[] arr) 내 arr[0]: 110
main 끝 data[0]: 110
```

<br>
설명:
<br>

1.  **`modify(int x)` 호출**: `num` (기본형)의 `값 5`가 `x`로 복사됩니다. `x`는 15로 변경되지만, `main` 메소드의 `num`에는 영향을 주지 않습니다.
2.  **`modify(int[] arr)` 호출**: `data` (참조형)가 가리키는 **배열의 주소값**이 `arr`로 복사됩니다. `arr[0]`을 변경하는 것은 `arr`이 참조하는 **힙 영역의 실제 배열 객체의 값**을 변경하는 것이므로, `main` 메소드의 `data[0]`도 변경됩니다.
3.  두 `modify` 메소드는 이름이 같지만 매개변수 타입(int vs int[])이 다르므로 **오버로딩**된 메소드입니다. 자바는 호출 시 인자의 타입에 따라 올바른 메소드를 선택합니다.
    </details>

-----

## 🔚 마치며: 객체의 행동 정의하기

이번 글에서는 자바 메소드의 심화된 개념과 객체지향에서 메소드가 어떻게 활용되는지 자세히 살펴보았습니다.인스턴스 메소드와 static 메소드의 구분을 통해 객체지향 설계를 더욱 명확하게 할 수 있습니다. 또한, 메소드 오버로딩은 코드의 유연성과 재사용성을 높여주는 강력한 기능입니다.

메소드는 객체의 '행동'을 정의하는 핵심 요소이며, 이들을 잘 활용하는 것이 곧 효율적이고 유지보수하기 좋은 객체지향 코드를 작성하는 길입니다.
