---
title: "자바 생성자 호출 순서"
date: 2025-06-17 11:57:54 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## title: "자바 객체지향 - 상속과 생성자 호출 순서" date: 2025-06-17 11:49:10 +09:00 categories: [java] lang: ko locale: ko words\_per\_minute: 30

-----

## 자바 객체지향: 상속과 생성자 호출 순서 (Constructor Chaining)

자바에서 객체가 생성될 때, 우리는 `new` 키워드와 함께 클래스의 \*\*생성자(Constructor)\*\*를 호출합니다. 그런데 만약 클래스들이 **상속 관계**에 있다면, 단 하나의 생성자를 호출하더라도 내부적으로 여러 클래스의 생성자들이 **연쇄적으로 호출**되는 복잡한 과정이 일어납니다. 이 과정을 \*\*생성자 연쇄 호출(Constructor Chaining)\*\*이라고 합니다.

이러한 생성자 호출 순서를 정확히 이해하는 것은 객체지향 프로그래밍에서 객체의 초기화가 어떻게 이루어지는지 파악하고, 잠재적인 오류를 방지하는 데 매우 중요합니다.

-----

## 1\. 생성자 연쇄 호출의 기본 원리

자바에서 모든 클래스는 `java.lang.Object` 클래스를 암시적으로 상속받습니다. 따라서 어떤 객체를 생성하든, 그 객체의 가장 상위 부모는 `Object` 클래스입니다.

객체가 생성될 때의 생성자 호출 순서는 다음과 같은 핵심 원칙을 따릅니다:

1.  **자식 클래스의 생성자를 호출하면, 가장 먼저 부모 클래스의 생성자가 호출됩니다.**
2.  이 과정은 가장 상위의 부모 클래스인 `Object` 클래스의 생성자까지 거슬러 올라갑니다.
3.  `Object` 클래스의 생성자가 실행 완료되면, 이제 **하위 클래스 방향으로 내려오면서 각 클래스의 생성자 코드 블록이 순차적으로 실행**됩니다.

**요약하자면, 호출은 위로 올라가서(`Object`까지), 실행은 아래로 내려옵니다.**

### `super()`와 `this()`의 역할

생성자 연쇄 호출은 주로 `super()`와 `this()` 키워드를 통해 제어됩니다.

  * **`super(...)`**: 부모 클래스의 생성자를 호출할 때 사용합니다.
      * **반드시 자식 클래스 생성자의 첫 줄에 위치**해야 합니다.
      * 만약 개발자가 명시적으로 `super()`를 호출하지 않으면, 자바 컴파일러가 매개변수 없는 `super()`를 **자동으로 첫 줄에 삽입**합니다. (따라서 부모 클래스에 기본 생성자가 없으면 컴파일 에러가 발생할 수 있습니다.)
  * **`this(...)`**: 같은 클래스 내의 **다른 생성자를 호출**할 때 사용합니다.
      * **반드시 해당 생성자의 첫 줄에 위치**해야 합니다.
      * `this(...)`를 호출하는 경우, `super()`는 명시적으로 호출할 수 없으며, `this(...)`가 호출하는 다른 생성자에서 최종적으로 `super()`가 호출되게 됩니다.

-----

## 2\. 상속 관계에서의 생성자 호출 예제

아래 코드를 통해 실제 생성자 호출 순서가 어떻게 이루어지는지 살펴보겠습니다.

```java
// 최상위 부모 (Grandparent) 클래스
class Grandparent {
    int gVal;
    public Grandparent() {
        this.gVal = 0;
        System.out.println("Grandparent 기본 생성자 호출 (gVal=" + gVal + ")");
    }
    public Grandparent(int val) {
        this.gVal = val;
        System.out.println("Grandparent(int) 생성자 호출 (gVal=" + gVal + ")");
    }
}

// 부모 (Parent) 클래스 - Grandparent 상속
class Parent extends Grandparent {
    int pVal;
    public Parent() {
        // super(); // 컴파일러가 자동으로 Grandparent의 기본 생성자를 삽입
        this.pVal = 0;
        System.out.println("Parent 기본 생성자 호출 (pVal=" + pVal + ")");
    }
    public Parent(String name) {
        super(100); // Grandparent(int) 생성자 명시적 호출
        this.pVal = name.length();
        System.out.println("Parent(String) 생성자 호출 (pVal=" + pVal + ", name=" + name + ")");
    }
}

// 자식 (Child) 클래스 - Parent 상속
class Child extends Parent {
    int cVal;
    public Child() {
        // super(); // 컴파일러가 자동으로 Parent의 기본 생성자를 삽입
        this.cVal = 0;
        System.out.println("Child 기본 생성자 호출 (cVal=" + cVal + ")");
    }
    public Child(int data) {
        this("데이터: " + data); // Child 클래스 내의 다른 생성자(String 매개변수) 호출
        System.out.println("Child(int) 생성자 호출 완료 (cVal=" + cVal + ")");
    }
    public Child(String message) {
        super(message); // Parent 클래스의 String 매개변수 생성자 명시적 호출
        this.cVal = message.length();
        System.out.println("Child(String) 생성자 호출 (cVal=" + cVal + ", message=" + message + ")");
    }
}

public class ConstructorChainingExample {
    public static void main(String[] args) {
        System.out.println("--- 1. Child 객체 생성: new Child() ---");
        Child c1 = new Child();
        /*
         * 예상 호출 및 실행 순서:
         * 1. new Child() 호출
         * 2. Child() 생성자 내부에서 (자동으로 삽입된) super() 호출 -> Parent() 호출
         * 3. Parent() 생성자 내부에서 (자동으로 삽입된) super() 호출 -> Grandparent() 호출
         * 4. Grandparent() 생성자 실행 (Object 생성자까지 갔다가 돌아옴)
         * -> "Grandparent 기본 생성자 호출..." 출력
         * 5. Parent() 생성자 실행
         * -> "Parent 기본 생성자 호출..." 출력
         * 6. Child() 생성자 실행
         * -> "Child 기본 생성자 호출..." 출력
         */

        System.out.println("\n--- 2. Child 객체 생성: new Child(500) ---");
        Child c2 = new Child(500);
        /*
         * 예상 호출 및 실행 순서:
         * 1. new Child(500) 호출
         * 2. Child(int data) 생성자 내부에서 this("데이터: " + data) 호출 -> Child(String) 호출
         * 3. Child(String message) 생성자 내부에서 super(message) 호출 -> Parent(String) 호출
         * 4. Parent(String name) 생성자 내부에서 super(100) 호출 -> Grandparent(int) 호출
         * 5. Grandparent(int) 생성자 실행 (Object 생성자까지 갔다가 돌아옴)
         * -> "Grandparent(int) 생성자 호출..." 출력
         * 6. Parent(String) 생성자 실행
         * -> "Parent(String) 생성자 호출..." 출력
         * 7. Child(String) 생성자 실행
         * -> "Child(String) 생성자 호출..." 출력
         * 8. Child(int) 생성자 실행
         * -> "Child(int) 생성자 호출 완료" 출력
         */
    }
}
```

**실행 결과:**

```
--- 1. Child 객체 생성: new Child() ---
Grandparent 기본 생성자 호출 (gVal=0)
Parent 기본 생성자 호출 (pVal=0)
Child 기본 생성자 호출 (cVal=0)

--- 2. Child 객체 생성: new Child(500) ---
Grandparent(int) 생성자 호출 (gVal=100)
Parent(String) 생성자 호출 (pVal=8, name=데이터: 500)
Child(String) 생성자 호출 (cVal=8, message=데이터: 500)
Child(int) 생성자 호출 완료 (cVal=8)
```

위 결과를 보면, 객체를 생성할 때 항상 가장 상위의 부모 생성자부터 호출되어 내부 로직이 실행된 후, 차례대로 자식 생성자의 로직이 실행되는 것을 명확히 확인할 수 있습니다. `this()`와 `super()`를 어떻게 사용하느냐에 따라 생성자 호출 연쇄의 경로가 달라집니다.

-----

## 3\. 왜 이런 호출 순서가 중요할까?

생성자 연쇄 호출의 원리를 이해하는 것은 다음과 같은 이유로 중요합니다:

  * **객체 초기화의 안정성**: 부모 클래스의 멤버(필드, 메소드)가 먼저 초기화되어야 자식 클래스에서 이를 안전하게 사용할 수 있습니다. 이 순서가 보장되지 않으면 자식 생성자가 부모의 미초기화된 멤버를 사용하려다 오류가 발생할 수 있습니다.
  * **자원 할당 및 해제**: 복잡한 객체 초기화 과정에서 부모 객체가 먼저 필요한 자원을 할당하고, 자식 객체가 그 위에 추가적인 자원을 할당하는 방식으로 일관성을 유지할 수 있습니다.
  * **코드 이해 및 디버깅**: 객체 생성 시 예상치 못한 동작이 발생했을 때, 생성자 호출 순서를 알면 문제의 원인을 더 쉽게 파악하고 디버깅할 수 있습니다.

-----

## 📌 요약 정리: 상속과 생성자 호출 순서

  * **생성자 연쇄 호출(Constructor Chaining)**: 상속 관계에서 자식 클래스 객체 생성 시, 부모 클래스의 생성자가 먼저 호출되는 일련의 과정.
  * **호출 순서**:
    1.  자식 생성자가 호출되면, 내부적으로 `super()` (명시적 또는 자동 삽입)를 통해 부모 생성자를 호출.
    2.  이 과정이 `Object` 클래스까지 재귀적으로 반복.
    3.  `Object` 생성자부터 시작하여 **가장 상위 부모 -\> 중간 부모 -\> 자식 클래스 순서로 각 생성자 내부의 코드 블록이 실행**됨.
  * **`super(...)`**: 자식 생성자의 첫 줄에서 부모 생성자를 호출.
  * **`this(...)`**: 같은 클래스 내의 다른 생성자를 호출. `this()`가 `super()`를 대신 호출하는 역할.
  * **중요성**: 객체의 안정적인 초기화 보장, 자원 관리의 일관성 유지, 디버깅 용이성 향상.

-----

## 💡 생성자 호출 순서 퀴즈

다음 코드를 실행했을 때 출력 결과는 무엇일까요?

```java
class A {
    public A() {
        System.out.println("A's Constructor");
    }
    public A(int x) {
        System.out.println("A's Constructor with int: " + x);
    }
}

class B extends A {
    public B() {
        System.out.println("B's Constructor");
    }
    public B(String s) {
        super(s.length()); // A 클래스의 int 매개변수 생성자 호출
        System.out.println("B's Constructor with String: " + s);
    }
}

class C extends B {
    public C() {
        // super(); // 컴파일러 자동 삽입 (B의 기본 생성자 호출)
        System.out.println("C's Constructor");
    }
    public C(double d) {
        this("Value: " + d); // C 클래스의 String 매개변수 생성자 호출
        System.out.println("C's Constructor with double: " + d);
    }
    public C(String msg) {
        // super(); // 컴파일러 자동 삽입 (B의 기본 생성자 호출) -> 하지만 이 경우엔 B의 기본 생성자가 아닌 String 생성자가 호출되어야 한다.
        // 올바른 호출을 위해서는 super(String)을 명시적으로 호출해야 합니다.
        // 예를 들어, super(msg + " from C");
        // 이 예제에서는 B의 기본 생성자가 호출됩니다.
        System.out.println("C's Constructor with String: " + msg);
    }
}

public class ConstructorQuiz {
    public static void main(String[] args) {
        System.out.println("--- Creating C1 ---");
        C c1 = new C();

        System.out.println("\n--- Creating C2 ---");
        C c2 = new C(3.14);
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
**주의:** 위 퀴즈의 `C(String msg)` 생성자에 대한 주석은 약간 혼란을 줄 수 있습니다. 자바 컴파일러는 `super()`나 `this()`가 없으면 **무조건 `super()`를 삽입**하며, 이는 **부모의 기본 생성자를 호출**합니다. 따라서 `C(String msg)`에서는 `B()`가 호출됩니다.

출력 결과:

```
--- Creating C1 ---
A's Constructor
B's Constructor
C's Constructor

--- Creating C2 ---
A's Constructor
B's Constructor
C's Constructor with String: Value: 3.14
C's Constructor with double: 3.14
```

<br>
설명:
<br>

1.  **`new C()`**:<br><br>

      * `C()` 호출. `super()`가 생략되어 `B()`를 호출.<br>
      * `B()` 호출. `super()`가 생략되어 `A()`를 호출.<br>
      * `A()` 호출. 실행: "A's Constructor"<br>
      * `B()` 실행: "B's Constructor"<br>
      * `C()` 실행: "C's Constructor"<br><br>

2.  **`new C(3.14)`**:<br><br>

      * `C(double d)` 호출. `this("Value: " + d)`를 통해 `C(String)`을 호출.<br>
      * `C(String msg)` 호출. `super()`가 생략되어 `B()`를 호출.<br>
      * `B()` 호출. `super()`가 생략되어 `A()`를 호출.<br>
      * `A()` 실행: "A's Constructor"<br>
      * `B()` 실행: "B's Constructor"<br>
      * `C(String)` 실행: "C's Constructor with String: Value: 3.14"<br>
      * `C(double)` 실행: "C's Constructor with double: 3.14"<br><br>

이 퀴즈는 `super()`가 명시되지 않았을 때 컴파일러가 부모의 기본 생성자를 자동으로 호출한다는 규칙과 `this()`를 통한 생성자 연쇄 호출을 잘 보여줍니다.

</details>

-----

## 🔚 마치며: 객체의 완벽한 탄생

이번 글에서는 자바 객체지향 프로그래밍에서 매우 중요한 \*\*생성자 연쇄 호출(Constructor Chaining)\*\*의 원리와 동작 방식에 대해 상세히 알아보았습니다. 특히 상속 관계에서 `super()`와 `this()` 키워드가 생성자 호출 흐름을 어떻게 제어하는지 예제를 통해 확인했습니다.

객체가 생성될 때 가장 상위 부모부터 시작하여 자식 클래스 방향으로 생성자가 연쇄적으로 호출되고 실행된다는 점을 명심하는 것은, 객체의 올바른 초기화를 보장하고 복잡한 시스템에서 발생할 수 있는 초기화 관련 오류를 이해하고 해결하는 데 필수적인 지식입니다.

이로써 객체지향의 핵심인 클래스, 객체, 생성자, 그리고 상속 및 다형성 개념을 깊이 있게 다루었습니다. 다음 글에서는 객체지향의 마지막 큰 축인 \*\*인터페이스(Interface)\*\*와 그 활용에 대해 알아보겠습니다.
