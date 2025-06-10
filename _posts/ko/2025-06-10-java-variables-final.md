---
title: "자바 변수"
date: 2025-06-10 10:06:48 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

> **변수**란 무엇일까요?
> 수학에서는 흔히 **아직 정해지지 않은 값**을 뜻하죠.
> 하지만 자바에서 변수는 다릅니다. **데이터를 저장하기 위한 메모리 공간에 이름을 붙인 것**입니다.
> 코드의 구조, 안정성, 가독성은 올바른 변수 선언과 활용에서 시작됩니다.
---

## 변수의 종류

| 종류           | 선언 위치           | 생명 주기               |
|----------------|---------------------|--------------------------|
| 지역 변수      | 메서드 내부         | 블록 종료 시 소멸       |
| 인스턴스 변수  | 클래스 내부, static 없음 | 객체 소멸 시까지 유지 |
| 클래스 변수    | static 키워드 사용   | 프로그램 종료 시까지     |
| 매개변수       | 메서드 괄호 안       | 메서드 실행 중 유지      |



> ⚠️ 참고: 이 글에서는 변수의 기본 개념만 다룹니다.  
> **클래스 기반 변수(인스턴스, static 변수)**에 대한 더 깊은 설명은  
> 추후 **객체지향 프로그래밍**에서 자세히 다루겠습니다.


---

## 변수 선언과 초기화 예시

```java
public class Person {
    int age = 25;               // 인스턴스 변수
    static int count = 0;       // 클래스 변수

    public void speak(String message) {
        String localMessage = message + "!";
        System.out.println(localMessage); // 지역 변수
    }
}
```

---

## 지역 변수는 반드시 초기화!

지역 변수는 선언 후 초기화하지 않으면 컴파일 오류가 발생합니다.

```java
public void printAge() {
    int age;
    // System.out.println(age); // ❌ 컴파일 에러: 초기화되지 않음
}
```

---

## 변수의 기본 초기값

| 타입              | 초기값     |
|-------------------|------------|
| int / long        | 0          |
| float / double    | 0.0        |
| boolean           | false      |
| 참조형 (String 등) | null       |

>⚠️ 단, **지역 변수는 자동 초기화되지 않음**에 주의!

---

## final 변수 (불변 값)

```java
final int MAX_USERS = 100;
// MAX_USERS = 200; // ❌ 불가
```

- 변경 불가능한 값 정의 시 사용
- 보통 **대문자 + 언더스코어**로 네이밍

---

## 변수 명명 규칙

자바에서 변수 이름은 반드시 아래의 **작성 규칙**을 따라야 하며, 일부는 **필수**, 일부는 **관례**입니다.

### 변수 이름 작성 규칙

| 구분     | 규칙 설명                                                                 | 예시                                                           |
|----------|--------------------------------------------------------------------------|----------------------------------------------------------------|
| ✅ 필수  | 첫 글자는 문자(`a-z`, `A-Z`), 언더스코어(`_`), 또는 달러 기호(`$`)만 가능. 숫자 시작 불가 | `price`, `$value`, `_name`<br>❌ `1value`, `#speed`, `@id`     |
| ✅ 필수  | **대소문자를 구분**함                                                    | `value` ≠ `Value`                                              |
| ✅ 필수  | **자바 예약어는 변수명으로 사용 불가**                                   | ❌ `int`, `class`, `boolean`, `float`, `double`, `new` 등      |
| 🔁 관례  | 소문자로 시작하고, 단어 구분은 대문자 → **camelCase** 사용 권장         | `userName`, `maxSpeed`, `carBodyColor`                         |
| 🔁 관례  | 의미 없는 1글자 또는 과도하게 긴 변수는 지양                              | ❌ `u`, `ddddddddd...`, `userInformationThatIsTooVerbose`       |
| 📌 참고 | 변수명에 사용할 수 있는 기호는 `_`, `$`만 허용                             | `$_internal` ✔ / `*value` ❌ / `#hash` ❌                        |

---

### ❌ 자바 예약어는 변수명으로 사용할 수 없습니다

다음은 변수로 **사용이 불가능한 자바 키워드** 목록 중 일부입니다:

```
byte, short, int, long, float, double, char, boolean,
public, private, class, static, void, return, new, final, if, else
```

> ❌ 예:  
> `int int = 5;` → 컴파일 오류 발생

---

### 📌 요약 정리

- 변수는 **문자/언더스코어/달러 기호로 시작**해야 하며, 숫자로 시작하면 안 됨
- **대소문자 구분**이 있으므로 `count`와 `Count`는 다른 변수
- **자바 예약어 사용 금지** → `public`, `class`, `static` 등
- **camelCase** 명명 규칙을 따르는 것이 가독성과 유지보수에 도움됨
- 명확한 의미를 담은 변수명이 바람직함

---

## 📌 실무 팁

- `final`을 사용하면 불변성 유지 가능 → 디버깅 효율 ↑
- `static` 변수는 **공유 자원**이므로 멀티스레드 환경에서 주의
- 변수의 **범위를 최소화**하면 유지보수 용이
- 의도를 드러내는 **명명 규칙** 사용 → 가독성 향상
- **매직 넘버 대신 상수 선언** 권장 → 유지보수성 증가

---

## 💡 변수 퀴즈

```java
public class Example {
    int instanceVar = 10;            // 인스턴스 변수
    static int staticVar = 20;       // 클래스 변수

    public void doSomething(int paramVar) { // 매개변수
        int localVar = 30;           // 지역 변수
        System.out.println(localVar + paramVar + instanceVar + staticVar);
    }
}
```
위 코드에서 **paramVar**에 대입한 숫자가 **40**이라고 가정해 봅시다. 그렇다면 4가지 변수를 모두 더한 값은 얼마일까요?

<details>
  <summary>정답 보기</summary>

instanceVar, staticVar, paramVar localVar 각각 10, 20, 40, 30의 값이 대입되어 있으므로 정답은 100입니다.

</details>
---

## 🔚 마무리

자바의 변수는 단순한 저장 수단이 아니라 **코드 설계의 뼈대**입니다.  
변수 선언, 스코프, 불변성, 공유 범위 등을 전략적으로 다루는 것은 **숙련된 개발자의 필수 역량**입니다.  
기초 개념일수록 정확한 이해가 필요하며, 작은 실수 하나가 프로그램의 큰 오류로 이어질 수 있음을 기억해야 합니다.

---
