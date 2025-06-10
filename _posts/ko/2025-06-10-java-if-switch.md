---
title: "자바 조건문: if문과 switch문"
date: 2025-06-10 11:53:01 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

> 자바에서 조건문은 프로그램의 흐름을 제어하는 가장 기본적인 구조입니다.  
> 조건에 따라 특정 코드를 실행하거나 분기 처리할 때 `if문`과 `switch문`을 사용합니다.

---

## 🔹 if문 (조건식 기반 분기)

`if문`은 **조건식의 결과가 true일 경우에만 코드 블록을 실행**하는 구조입니다.  
복수의 조건을 평가하거나, `else if`, `else`와 함께 사용하여 다양한 흐름을 제어할 수 있습니다.

### ✅ 기본 구조

```java
if (조건식) {
    // 조건이 참일 때 실행
} else if (다른조건) {
    // 두 번째 조건이 참일 때 실행
} else {
    // 위 조건이 모두 거짓일 때 실행
}
```

### 📌 if문 퀴즈

```java
public class AgeCheck {
    public static void main(String[] args) {
        int age = 17;

        if (age >= 20) {
            System.out.println("성인입니다.");
        } else if (age >= 14) {
            System.out.println("청소년입니다.");
        } else {
            System.out.println("어린이입니다.");
        }
    }
}
```

위 코드의 출력 결과는 무엇일까요?
<details>
<summary>정답 보기</summary>

age는 17이므로 두번째 분기점에 해당하게 됩니다.
따라서 출력 결과: 청소년입니다.

</details>

---

## 🔹 switch문 (값 기반 분기)

`switch문`은 **하나의 변수 값에 따라 여러 분기 중 하나를 선택**할 때 유용합니다.  
`case`별로 코드가 실행되며, `break`를 만나면 분기 종료됩니다.

> 자바 7부터는 `String`, 자바 14부터는 `switch → 표현식`도 지원됩니다.

### ✅ 기본 구조

```java
switch (변수) {
    case 값1:
        // 실행 코드
        break;
    case 값2:
        // 실행 코드
        break;
    default:
        // 어떤 case에도 해당하지 않을 때 실행
}
```
전통적인 `switch문`은 **값에 따라 흐름을 분기하지만**, **값을 반환할 수는 없습니다**. 

**Java 14부터는 `switch`를 표현식으로 사용하여 값을 반환할 수 있게 되었습니다.**

---

### ✅ 기존 switch 문

```java
String day = "MONDAY";
String message;

switch (day) {
    case "MONDAY":
        message = "Start of the week";
        break;
    case "FRIDAY":
        message = "End of the week";
        break;
    default:
        message = "Midweek day";
}
System.out.println(message);
```

---

### ✅ switch 표현식 (Java 14+)

```java
String day = "MONDAY";

String message = switch (day) {
    case "MONDAY" -> "Start of the week";
    case "FRIDAY" -> "End of the week";
    default -> "Midweek day";
};

System.out.println(message);
```

- `->` 사용으로 **간결한 분기 가능**
- `switch`가 **값을 반환할 수 있음**

---

`switch`에서 사용하는 yield는 Java 14부터 도입된 `switch` 표현식에서 값을 반환할 때 사용하는 키워드입니다. 기존의 `switch` 문은 단순한 제어 흐름이었지만, `switch` 표현식은 값을 반환할 수 있기 때문에, yield는 그 반환값을 명시하는 데 필요합니다.

### ✅ `yield` 사용 예시

```java
int score = 90;

String grade = switch (score / 10) {
    case 10, 9 -> "A";
    case 8 -> "B";
    case 7 -> "C";
    default -> {
        System.out.println("재시험 대상입니다.");
        yield "F";
    }
};
System.out.println("등급: " + grade);
```

> ⚠️ 코드 블록 사용 시 `yield` 키워드로 값을 반환해야 함

### 💡 switch문 퀴즈

```java
public class DayMessage {
    public static void main(String[] args) {
        String day = "MONDAY";

        switch (day) {
            case "MONDAY":
                System.out.println("즐거운 월요일입니다. 한 주를 시작해요!");
                break;
            case "FRIDAY":
                System.out.println("신나는 금요일입니다. 곧 주말이에요!");
                break;
            default:
                System.out.println("평일입니다.");
        }
    }
}
```
위 코드의 출력 결과는 무엇일까요?
<details>
<summary>정답 보기</summary>

day는 "MONDAY"이므로 첫번째 분기점에 해당하게 됩니다.
따라서 출력 결과: `즐거운 월요일입니다. 한 주를 시작해요!`<br>
(진짜 월요일이 즐겁다고 느끼시는 분이 계시다면... 정말 대단한 멘탈입니다.😅)
</details>
---

---

## 📌 if문 vs switch문 성능 차이

| 항목         | if문                                | switch문                                  |
|--------------|-------------------------------------|--------------------------------------------|
| 평가 방식    | 조건을 위에서 아래로 **순차 비교** | JVM이 jump table 또는 해시로 **빠르게 분기** |
| 적합 조건    | 범위 조건, 논리 조건                | 고정된 값(enum, int, String 등) 비교       |
| 가독성       | 복잡한 조건 표현 가능               | 명확하고 선언적인 분기                     |

---

### ✅ 성능 테스트 코드 예시

```java
public class IfSwitchBenchmark {
    public static void main(String[] args) {
        int testValue = 5;
        int iterations = 100000000;
        long start, end;

        // if문 측정
        start = System.nanoTime();
        for (int i = 0; i < iterations; i++) {
            int result;
            if (testValue == 1) result = 1;
            else if (testValue == 2) result = 2;
            else if (testValue == 3) result = 3;
            else if (testValue == 4) result = 4;
            else result = 5;
        }
        end = System.nanoTime();
        System.out.println("if문 시간: " + (end - start) + " ns");

        // switch 표현식 측정
        start = System.nanoTime();
        for (int i = 0; i < iterations; i++) {
            int result = switch (testValue) {
                case 1 -> 1;
                case 2 -> 2;
                case 3 -> 3;
                case 4 -> 4;
                default -> 5;
            };
        }
        end = System.nanoTime();
        System.out.println("switch문 시간: " + (end - start) + " ns");
    }
}
```

> 위 코드 실행 결과는 어떻게 될까요? 궁금하신 분은 한번 시도해 보세요. 결과는 시스템마다 다르지만, 일반적으로 **switch문이 더 빠릅니다** (특히 정수형 분기에서).

---

## 🔚 마무리

`if문`과 `switch문`은 조건 분기 로직에서 가장 기본이 되는 제어문입니다.  
상황에 따라 두 문법을 적절히 사용하면 **코드의 가독성과 유지보수성**이 크게 향상됩니다.  
조건이 **값의 정확한 비교**라면 `switch`, **범위 판단 또는 복합 조건**이라면 `if`를 사용하세요.

---
