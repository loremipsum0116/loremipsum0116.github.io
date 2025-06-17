---
title: "자바 객체지향-클래스(2)"
date: 2025-06-17 11:33:57 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 객체지향 프로그래밍: 생성자와 초기화, 그리고 캡슐화

이전 글에서 **클래스, 객체, 인스턴스**의 개념과 **메소드**의 다양한 활용법을 배웠습니다. 이제 객체지향 프로그래밍의 또 다른 핵심 요소인 \*\*생성자(Constructor)\*\*를 통해 객체가 처음 만들어질 때 어떻게 초기화되는지 알아보겠습니다. 또한, 객체지향의 중요한 원칙 중 하나인 \*\*캡슐화(Encapsulation)\*\*를 구현하는 방법과 이를 위한 **접근 제어자(Access Modifier)**, 그리고 **Getter/Setter** 메소드에 대해서도 깊이 있게 다룰 것입니다.

객체지향은 현실 세계를 모델링하는 데 초점을 둡니다. 이는 단순히 기능(메소드)을 정의하는 것을 넘어, 객체가 안전하고 올바른 '상태'로 시작하고 유지되도록 하는 것을 포함합니다. 생성자와 캡슐화는 이러한 '객체의 올바른 상태 관리'에 필수적인 도구입니다.

-----

## 1\. 생성자(Constructor): 객체 초기화의 시작점

**생성자**는 클래스로부터 **객체(인스턴스)를 생성할 때 딱 한 번 호출되는 특별한 형태의 메소드**입니다. 주된 목적은 생성되는 객체의 **인스턴스 변수를 초기화**하거나, 객체 사용에 필요한 초기 설정을 하는 것입니다.

### 생성자의 특징

  * **이름이 클래스 이름과 동일**해야 합니다.
  * **반환 타입(void 포함)을 명시하지 않습니다.**
  * `new` 연산자와 함께 호출됩니다.
  * 클래스에 생성자가 하나도 없으면, 자바 컴파일러가 매개변수 없는 \*\*기본 생성자(Default Constructor)\*\*를 자동으로 추가해 줍니다.

<!-- end list -->

```java
public class Person {
    String name;  // 인스턴스 변수
    int age;      // 인스턴스 변수
    String gender; // 인스턴스 변수

    // 1. 기본 생성자 (매개변수가 없음)
    // 개발자가 명시적으로 정의하지 않으면 컴파일러가 자동 추가
    public Person() {
        System.out.println("기본 생성자가 호출되었습니다.");
        this.name = "이름없음";
        this.age = 0;
        this.gender = "미정";
    }

    // 2. 매개변수가 있는 생성자 (이름과 나이를 초기화)
    public Person(String name, int age) {
        // this.name은 인스턴스 변수 name, name은 매개변수 name
        this.name = name;
        this.age = age;
        this.gender = "미정"; // 다른 필드는 기본값으로 초기화 또는 명시
        System.out.println(name + " (" + age + "세) Person 객체가 생성되었습니다.");
    }

    // 3. 매개변수가 더 많은 생성자 (이름, 나이, 성별 초기화)
    public Person(String name, int age, String gender) {
        // this(...)를 사용하여 다른 생성자를 호출할 수 있습니다.
        // 첫 줄에서만 사용 가능하며, 다른 초기화 코드보다 먼저 실행되어야 합니다.
        this(name, age); // 매개변수 2개짜리 생성자 호출 (코드 중복 방지)
        this.gender = gender;
        System.out.println("성별 포함, " + name + " Person 객체 생성 완료.");
    }

    public void introduce() {
        System.out.println("안녕하세요, 저는 " + name + "이고 " + age + "세이며, " + gender + "입니다.");
    }

    public static void main(String[] args) {
        Person p1 = new Person(); // 기본 생성자 호출
        p1.introduce(); // 출력: 안녕하세요, 저는 이름없음이고 0세이며, 미정입니다.

        System.out.println("---");

        Person p2 = new Person("김철수", 25); // 매개변수 2개짜리 생성자 호출
        p2.introduce(); // 출력: 안녕하세요, 저는 김철수이고 25세이며, 미정입니다.

        System.out.println("---");

        Person p3 = new Person("이영희", 30, "여성"); // 매개변수 3개짜리 생성자 호출
        p3.introduce(); // 출력: 안녕하세요, 저는 이영희이고 30세이며, 여성입니다.
    }
}
```

## 2\. 생성자 오버로딩 (Constructor Overloading)

메소드 오버로딩과 마찬가지로, **생성자도 오버로딩이 가능**합니다. 즉, **매개변수의 개수, 타입, 또는 순서가 다른 여러 개의 생성자를 한 클래스 안에 정의**할 수 있습니다. 이를 통해 객체를 다양한 방식으로 초기화할 수 있는 유연성을 제공합니다.

위 `Person` 클래스의 예시에서 이미 **생성자 오버로딩**이 적용되어 있습니다. 매개변수가 없는 생성자, 이름과 나이만 받는 생성자, 그리고 이름, 나이, 성별을 모두 받는 생성자까지 세 가지 형태의 생성자를 정의했습니다.

### `this()`를 이용한 다른 생성자 호출 (참조변수 `this` 활용)

생성자 오버로딩 시 **`this()` 키워드**를 사용하면 같은 클래스 내의 **다른 생성자를 호출**할 수 있습니다. 이는 생성자 간의 코드 중복을 줄이고 유지보수성을 높이는 데 유용합니다. `this()` 호출은 **반드시 생성자의 첫 줄에 위치**해야 합니다.

`Person` 클래스의 세 번째 생성자 `public Person(String name, int age, String gender)`에서 `this(name, age);`를 사용하여 매개변수 두 개인 생성자를 호출하는 것이 그 예시입니다. 이렇게 하면 이름과 나이를 초기화하는 코드를 중복해서 작성할 필요가 없어집니다.

-----

## 3\. 변수 초기화: 인스턴스, static, 지역 변수

자바에서 변수는 사용되기 전에 반드시 초기화되어야 합니다. 변수의 종류에 따라 초기화되는 시점과 방식이 다릅니다.

### 3-1. 인스턴스 변수 초기화

객체(인스턴스)가 생성될 때 초기화됩니다.

  * **명시적 초기화**: 선언과 동시에 값을 할당합니다.
    ```java
    public class MyClass {
        int instanceVar = 10; // 명시적 초기화
    }
    ```
  * **생성자를 통한 초기화**: 생성자 내부에서 인스턴스 변수를 초기화합니다. (가장 일반적이고 권장되는 방법)
    ```java
    public class MyClass {
        String name;
        public MyClass(String name) {
            this.name = name; // 생성자를 통한 초기화
        }
    }
    ```
  * **초기화 블록 (Instance Initializer Block)**: 인스턴스 생성 시 생성자보다 먼저 실행되는 코드 블록입니다. 여러 생성자에서 공통적으로 초기화해야 할 내용이 있을 때 유용하지만, 잘 사용되지는 않습니다.
    ```java
    public class MyClass {
        int instanceVar;
        { // 인스턴스 초기화 블록
            instanceVar = 20;
            System.out.println("인스턴스 초기화 블록 실행");
        }
        public MyClass() { /* ... */ }
    }
    ```
  * **기본값 (Default Value)**: 만약 인스턴스 변수가 초기화되지 않으면, 자바는 해당 타입의 기본값으로 자동 초기화합니다. (숫자 타입: 0, boolean: false, 참조 타입: null)

### 3-2. static 변수 (클래스 변수) 초기화

클래스가 메모리에 로드될 때(가장 먼저) 초기화됩니다. 단 한 번만 초기화됩니다.

  * **명시적 초기화**: 선언과 동시에 값을 할당합니다.
    ```java
    public class MyClass {
        static int staticVar = 100; // 명시적 초기화
    }
    ```
  * **static 초기화 블록 (Static Initializer Block)**: 클래스가 로드될 때 실행되는 코드 블록입니다. 복잡한 static 변수 초기화 로직에 사용됩니다.
    ```java
    public class MyClass {
        static String appName;
        static { // static 초기화 블록
            appName = "My Awesome App";
            System.out.println("Static 초기화 블록 실행");
        }
    }
    ```
  * **기본값 (Default Value)**: 인스턴스 변수와 마찬가지로, static 변수도 초기화되지 않으면 해당 타입의 기본값으로 자동 초기화됩니다.

### 3-3. 지역 변수 초기화

메소드나 블록 내에서 선언되는 지역 변수는 **반드시 사용하기 전에 개발자가 직접 초기화**해야 합니다. 명시적으로 초기화하지 않으면 컴파일 에러가 발생합니다.

```java
public class MyClass {
    public void myMethod() {
        int localVar; // 지역 변수
        // System.out.println(localVar); // 에러! 초기화되지 않은 지역 변수 사용 시도
        localVar = 5; // 직접 초기화
        System.out.println(localVar); // 5 출력
    }
}
```

### 3-4. 변수 초기화 순서

클래스가 로드되고 객체가 생성될 때, 변수들이 초기화되는 순서는 다음과 같습니다.

1.  **static 변수 및 static 초기화 블록**: 클래스 로딩 시점에 정의된 순서대로 실행됩니다.
2.  **인스턴스 변수 명시적 초기화 및 인스턴스 초기화 블록**: 객체 생성 시점에 정의된 순서대로 실행됩니다.
3.  **생성자**: 마지막으로 생성자가 실행되어 인스턴스 변수를 최종적으로 초기화합니다.

<!-- end list -->

```java
public class InitializationOrder {
    static int sNum = 1;
    static {
        System.out.println("1. static 초기화 블록: sNum = " + sNum++); // 1
    }

    int iNum = 10;
    { // 인스턴스 초기화 블록
        System.out.println("2. 인스턴스 초기화 블록: iNum = " + iNum++); // 10
    }

    public InitializationOrder() {
        System.out.println("3. 생성자 호출: iNum = " + iNum++); // 11
    }

    public static void main(String[] args) {
        System.out.println("main 메소드 시작");
        InitializationOrder order1 = new InitializationOrder(); // 객체 생성
        System.out.println("order1.iNum: " + order1.iNum); // 12
        System.out.println("order1.sNum: " + InitializationOrder.sNum); // 2
    }
}
```

**실행 결과:**

```
1. static 초기화 블록: sNum = 1
main 메소드 시작
2. 인스턴스 초기화 블록: iNum = 10
3. 생성자 호출: iNum = 11
order1.iNum: 12
order1.sNum: 2
```

`sNum`은 클래스 로드 시점에 초기화되고, `iNum`은 객체가 생성될 때마다 매번 초기화되는 것을 알 수 있습니다.

-----

## 4\. 접근 제어자(Access Modifier)와 캡슐화(Encapsulation)

객체지향의 중요한 원칙 중 하나는 \*\*정보 은닉(Information Hiding)\*\*입니다. 이는 객체 내부의 중요한 데이터를 외부에서 함부로 변경하거나 접근하지 못하도록 막는 것을 의미하며, 이를 통해 객체의 \*\*무결성(Integrity)\*\*을 유지하고 코드의 **유지보수성**을 높일 수 있습니다. 자바에서는 **접근 제어자**와 **Getter/Setter 메소드**를 통해 캡슐화를 구현합니다.

### 4-1. 접근 제어자 (Access Modifier)

접근 제어자는 클래스, 필드(변수), 메소드, 생성자 등의 멤버에 대한 접근 범위를 지정하는 키워드입니다.

| 접근 제어자 | 설명 | 접근 가능 범위 |
|---|---|---|
| `public` | 모든 곳에서 접근 가능합니다. (가장 넓은 범위) | 같은 패키지 + 다른 패키지 |
| `protected` | 같은 패키지 내에서, 그리고 다른 패키지의 자손 클래스에서 접근 가능합니다. | 같은 패키지 + 다른 패키지의 자손 클래스 |
| (default) | 아무런 접근 제어자를 붙이지 않은 경우. 같은 패키지 내에서만 접근 가능합니다. | 같은 패키지 내 |
| `private` | 해당 클래스 내부에서만 접근 가능합니다. (가장 좁은 범위) | 같은 클래스 내 |

### 4-2. 캡슐화 구현 (Encapsulation)

캡슐화는 데이터(필드)와 그 데이터를 조작하는 메소드를 하나로 묶고, 외부로부터 데이터를 직접 접근하는 것을 막아 **데이터를 보호**하는 객체지향의 핵심 원칙입니다. 즉, 객체의 내부 구현을 숨기고, 미리 정의된 메소드를 통해서만 상호작용하도록 합니다.

**캡슐화 구현 단계:**

1.  **필드(인스턴스 변수)를 `private`으로 선언**하여 외부 직접 접근을 막습니다.
2.  **`public` 메소드(Getter/Setter)를 통해 간접적으로 필드에 접근**하도록 허용합니다.

<!-- end list -->

```java
public class Account {
    // 1. private으로 선언된 필드 (외부에서 직접 접근 불가)
    private String accountNumber;
    private double balance;
    private String ownerName;

    // 생성자 (필드 초기화)
    public Account(String accountNumber, String ownerName, double balance) {
        this.accountNumber = accountNumber;
        this.ownerName = ownerName;
        // 잔액은 음수가 될 수 없도록 검증 로직 추가
        if (balance >= 0) {
            this.balance = balance;
        } else {
            this.balance = 0;
            System.out.println("경고: 초기 잔액은 음수가 될 수 없습니다. 0으로 설정됩니다.");
        }
    }

    // 2. Getter 메소드: 필드 값을 읽을 때 사용 (public)
    public String getAccountNumber() {
        return accountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public String getOwnerName() {
        return ownerName;
    }

    // 3. Setter 메소드: 필드 값을 변경할 때 사용 (public)
    // 잔액 변경 시 유효성 검증 로직 추가 가능
    public void deposit(double amount) { // 입금 (setter 역할 겸용)
        if (amount > 0) {
            this.balance += amount;
            System.out.println(amount + "원이 입금되었습니다. 현재 잔액: " + this.balance);
        } else {
            System.out.println("입금액은 0보다 커야 합니다.");
        }
    }

    public void withdraw(double amount) { // 출금 (setter 역할 겸용)
        if (amount > 0 && this.balance >= amount) {
            this.balance -= amount;
            System.out.println(amount + "원이 출금되었습니다. 현재 잔액: " + this.balance);
        } else {
            System.out.println("출금액이 유효하지 않거나 잔액이 부족합니다.");
        }
    }

    // 이름은 변경할 일이 적다고 가정하고 Setter를 만들지 않을 수도 있습니다.
    // public void setOwnerName(String ownerName) {
    //     this.ownerName = ownerName;
    // }

    public static void main(String[] args) {
        Account myAccount = new Account("123-456-7890", "홍길동", 10000.0);

        // myAccount.balance = -5000; // private 필드이므로 직접 접근 불가 (컴파일 에러)

        System.out.println("계좌번호: " + myAccount.getAccountNumber()); // Getter로 값 읽기
        System.out.println("현재 잔액: " + myAccount.getBalance());     // Getter로 값 읽기

        myAccount.deposit(5000); // Setter 역할을 하는 메소드로 잔액 변경
        myAccount.withdraw(2000); // Setter 역할을 하는 메소드로 잔액 변경
        myAccount.withdraw(20000); // 유효하지 않은 출금 시도

        System.out.println("최종 잔액: " + myAccount.getBalance());
    }
}
```

캡슐화를 통해 `balance` 필드를 `private`으로 숨기고, `deposit()`과 `withdraw()`와 같은 `public` 메소드를 통해서만 잔액을 조작하도록 했습니다. 이 메소드들 안에서 입금/출금액이 양수인지, 잔액이 충분한지 등을 **검증하는 로직**을 추가하여 객체의 상태(balance)를 더욱 안전하게 관리할 수 있습니다.

-----

## 📌 요약 정리: 객체 초기화와 캡슐화

  * **생성자**: 객체 생성 시 딱 한 번 호출되어 인스턴스 변수를 초기화하고 초기 설정을 수행하는 특별한 메소드. 클래스 이름과 동일하며 반환 타입 없음.
  * **생성자 오버로딩**: 매개변수의 개수, 타입, 순서가 다른 여러 생성자를 정의하여 객체를 다양한 방식으로 초기화 가능. `this(...)`로 다른 생성자 호출 가능 (첫 줄에만).
  * **변수 초기화 순서**:
    1.  **static 변수/블록** (클래스 로딩 시)
    2.  **인스턴스 변수 명시적 초기화/블록** (객체 생성 시)
    3.  **생성자** (객체 생성 시)
  * **지역 변수**: 반드시 사용 전 직접 초기화해야 함 (컴파일 에러 방지).
  * **접근 제어자**: `public`, `protected`, `(default)`, `private`으로 멤버의 접근 범위를 지정.
  * **캡슐화**: 필드(데이터)를 `private`으로 숨기고, `public` 메소드(Getter/Setter)를 통해 간접적으로 접근하여 객체의 무결성을 보호하는 객체지향 원칙.
  * **Getter/Setter**: 캡슐화된 필드의 값을 읽고(`get`), 변경하는(`set`) `public` 메소드. 변경 시 유효성 검증 로직 추가 가능.

-----

## 💡 객체지향 퀴즈: 스마트폰 클래스

다음 `Smartphone` 클래스를 보고, 출력 결과를 예상하고 캡슐화가 잘 적용되었는지 생각해 보세요.

```java
public class Smartphone {
    private String model;
    private String color;
    private int batteryPercentage; // 배터리 잔량 (0~100)

    public Smartphone(String model, String color) {
        this.model = model;
        this.color = color;
        this.batteryPercentage = 100; // 초기 배터리 100%
        System.out.println(model + " 스마트폰이 새로 생성되었습니다!");
    }

    // Getter for model
    public String getModel() {
        return model;
    }

    // Getter for color
    public String getColor() {
        return color;
    }

    // Getter for batteryPercentage
    public int getBatteryPercentage() {
        return batteryPercentage;
    }

    // 배터리 충전 메소드 (Setter 역할)
    public void chargeBattery(int amount) {
        if (amount > 0) {
            batteryPercentage += amount;
            if (batteryPercentage > 100) {
                batteryPercentage = 100;
            }
            System.out.println(model + " 배터리 " + amount + "% 충전 완료. 현재: " + batteryPercentage + "%");
        } else {
            System.out.println("충전량은 양수여야 합니다.");
        }
    }

    // 스마트폰 사용 메소드 (Setter 역할)
    public void useBattery(int amount) {
        if (amount > 0 && batteryPercentage - amount >= 0) {
            batteryPercentage -= amount;
            System.out.println(model + " 배터리 " + amount + "% 사용. 현재: " + batteryPercentage + "%");
        } else if (batteryPercentage - amount < 0) {
            batteryPercentage = 0;
            System.out.println(model + " 배터리 부족! 폰이 꺼집니다.");
        } else {
            System.out.println("사용량은 양수여야 합니다.");
        }
    }

    public static void main(String[] args) {
        Smartphone myPhone = new Smartphone("Galaxy S24", "Black");
        System.out.println("모델: " + myPhone.getModel() + ", 색상: " + myPhone.getColor());
        System.out.println("초기 배터리: " + myPhone.getBatteryPercentage() + "%");

        myPhone.useBattery(30);
        myPhone.chargeBattery(15);
        myPhone.useBattery(90); // 배터리 부족 상황
        myPhone.chargeBattery(-10); // 잘못된 충전 시도

        System.out.println("최종 배터리: " + myPhone.getBatteryPercentage() + "%");
    }
}
```

<details>
<summary>정답 보기</summary>
<br>

출력 결과:
<br><br>

Galaxy S24 스마트폰이 새로 생성되었습니다!<br>
모델: Galaxy S24, 색상: Black<br>
초기 배터리: 100%<br>
Galaxy S24 배터리 30% 사용. 현재: 70%<br>
Galaxy S24 배터리 15% 충전 완료. 현재: 85%<br>
Galaxy S24 배터리 부족! 폰이 꺼집니다.<br>
충전량은 양수여야 합니다.<br>
최종 배터리: 0%<br><br>


<br>
설명:
<br>

1.  `Smartphone` 객체가 생성될 때, 생성자에 따라 `model`, `color`가 초기화되고 `batteryPercentage`는 100으로 고정 초기화됩니다.<br><br>
2.  `model`, `color`, `batteryPercentage` 필드는 `private`으로 선언되어 외부에서 직접 접근하거나 변경할 수 없습니다. (캡슐화 적용)<br><br>
3.  `getModel()`, `getColor()`, `getBatteryPercentage()` 메소드를 통해 필드 값을 읽을 수 있습니다.<br><br>
4.  `chargeBattery()`와 `useBattery()` 메소드는 `batteryPercentage` 값을 변경하는 역할을 합니다. 이 메소드들 안에는 배터리 값이 0\~100% 범위를 벗어나지 않도록 하거나, 유효하지 않은 입력(음수)을 막는 **유효성 검증 로직**이 포함되어 객체의 상태를 안전하게 유지합니다.<br><br>
5.  `myPhone.useBattery(90)` 호출 시, 잔량 85%에서 90% 사용을 시도하므로 잔액 부족 메시지와 함께 배터리가 0%로 설정됩니다.<br><br>
6.  `myPhone.chargeBattery(-10)` 호출 시, 음수 충전량에 대한 유효성 검증으로 인해 "충전량은 양수여야 합니다." 메시지가 출력되고 실제 배터리 값은 변경되지 않습니다.<br>

</details>

-----

## 🔚 마치며: 견고한 객체 설계를 위한 필수 요소

이번 글에서는 객체지향 프로그래밍에서 객체의 생명 주기와 상태 관리에 매우 중요한 **생성자**와 **변수 초기화** 개념을 심도 있게 다루었습니다. 또한, 객체의 내부 데이터를 안전하게 보호하고 유효성을 보장하는 **캡슐화**의 중요성, 그리고 이를 위한 **접근 제어자**와 **Getter/Setter** 활용법도 알아보았습니다.

생성자와 초기화는 객체가 올바른 상태로 시작하도록 보장하고, 캡슐화는 객체가 이후에도 안전하고 예측 가능한 방식으로 동작하도록 돕습니다. 이 모든 개념은 재사용 가능하고 유지보수하기 쉬운 견고한 객체지향 시스템을 구축하는 데 필수적인 요소들입니다.
