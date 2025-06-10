---
title: "자바 조건문: if문과 switch문"
date: 2025-06-10 11:53:01 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---
-----

## 자바 조건문: 프로그램의 흐름을 결정하는 if문과 switch문

프로그래밍은 마치 복잡한 미로를 헤쳐나가는 것과 같습니다. 때로는 직진하고, 때로는 좌회전하거나 우회전하며 가장 효율적인 길을 찾아야 하죠. 자바에서 이러한 '경로 결정'을 담당하는 것이 바로 \*\*조건문(Conditional Statement)\*\*입니다.
<br><br>
조건문은 특정 **조건에 따라 프로그램의 실행 흐름을 변경**할 때 사용되는 핵심 제어 구조입니다. "만약 이 조건이 참이면 이렇게 하고, 그렇지 않으면 저렇게 해라"와 같은 논리를 코드로 표현할 수 있게 해줍니다.
<br><br>
이번 글에서는 자바에서 가장 많이 사용되는 두 가지 조건문, **`if`문**과 **`switch`문**에 대해 자세히 알아보겠습니다. 각 조건문이 어떤 상황에 적합하며, 어떻게 사용해야 하는지 명확하게 이해하는 시간을 가져보시죠\!

-----

## 🔹 if문: 조건식 기반의 유연한 분기

`if문`은 **조건식의 결과가 `true`일 경우에만 해당 코드 블록을 실행**하는 가장 기본적인 조건문입니다. "만약 \~이라면" 이라는 일상적인 표현처럼, 어떤 조건이 충족될 때 특정 작업을 수행하도록 지시할 때 사용합니다. `else if`와 `else`를 함께 사용하여 복수의 조건을 평가하거나, 조건이 모두 거짓일 때의 대체 로직을 구현할 수 있습니다.

### 기본 구조와 흐름

`if문`의 기본적인 구조는 다음과 같습니다.

```java
if (조건식) {
    // 조건이 참일 때 실행되는 코드 블록
} else if (다른조건) {
    // 첫 번째 조건이 거짓이고, 다른 조건이 참일 때 실행되는 코드 블록
} else {
    // 위의 모든 조건이 거짓일 때 실행되는 코드 블록 (선택 사항)
}
```

  * **`if (조건식)`**: 가장 먼저 평가되는 조건입니다. 조건식은 반드시 **`boolean` 타입의 결과를 반환**해야 합니다 (`true` 또는 `false`).
  * **`else if (다른조건)`**: 첫 번째 `if`문의 조건이 `false`일 경우에만 평가됩니다. 여러 개의 `else if`를 사용하여 다양한 조건을 순차적으로 검사할 수 있습니다.
  * **`else`**: 모든 `if` 및 `else if` 조건이 `false`일 경우에 실행되는 최종적인 블록입니다. 이는 필수가 아니며, 필요할 때만 사용합니다.

### 💡 if문 퀴즈: 나이 판별기

아래 코드는 입력된 `age` 값에 따라 "성인", "청소년", "어린이"를 판별하는 간단한 `if-else if-else` 구조입니다. 이 코드의 출력 결과는 무엇일까요?

```java
public class AgeCheck {
    public static void main(String[] args) {
        int age = 17; // 판별할 나이

        if (age >= 20) {
            System.out.println("성인입니다.");
        } else if (age >= 14) { // 첫 번째 조건(age >= 20)이 거짓일 때만 이 조건이 평가됩니다.
            System.out.println("청소년입니다.");
        } else {
            System.out.println("어린이입니다.");
        }
    }
}
```

<details>
<summary>정답 보기</summary>

출력 결과: 청소년입니다.
<br><br>
설명:
<br>
1.  `age` 변수는 `17`로 초기화됩니다.<br>
2.  첫 번째 `if (age >= 20)` 조건식은 `(17 >= 20)`이므로 `false`입니다.<br>
3.  `else if (age >= 14)` 조건식이 평가됩니다. `(17 >= 14)`는 `true`이므로, 이 블록 내부의 `System.out.println("청소년입니다.");`가 실행됩니다.<br>
4.  하나의 조건이 `true`로 판별되어 블록이 실행되면, 나머지 `else if`나 `else` 블록은 건너뛰고 `if`문 전체가 종료됩니다.<br>

</details>

-----

## switch문: 값 기반의 효율적인 분기

`switch문`은 **하나의 변수 또는 표현식의 '값'에 따라 여러 분기 중 하나를 선택**할 때 사용합니다. `if-else if`문이 여러 조건을 순차적으로 검사하는 반면, `switch`문은 특정 값에 직접 점프하여 해당 `case` 블록을 실행하는 방식에 가깝습니다. 이는 특히 많은 수의 명확한 값(예: 요일, 메뉴 선택 번호)을 처리할 때 코드의 가독성을 높이고 효율적일 수 있습니다.

> **자바 `switch`문에서 사용할 수 있는 타입:**
> 자바 7부터는 **`String` 타입**, 자바 14부터는 \*\*`switch` 표현식(`->`)\*\*도 지원됩니다. 이전에는 `int`, `char`, `byte`, `short`, `enum` 타입만 가능했습니다.

### 기본 구조와 `break`의 중요성

```java
switch (변수 또는 표현식) {
    case 값1:
        // 변수 값이 값1과 일치할 때 실행
        break; // break를 만나면 switch문을 빠져나갑니다.
    case 값2:
        // 변수 값이 값2와 일치할 때 실행
        break;
    default:
        // 어떤 case에도 해당하지 않을 때 실행 (선택 사항)
}
```

  * **`switch (변수 또는 표현식)`**: 괄호 안의 값이 각 `case`의 값과 일치하는지 비교합니다.
  * **`case 값:`**: `switch` 괄호 안의 값과 일치하는 `case` 블록부터 실행됩니다.
  * **`break;`**: **반드시 포함해야 합니다.** `break` 키워드를 만나면 현재 `switch`문을 즉시 종료하고 다음 코드로 넘어갑니다. 만약 `break`가 없으면, 일치하는 `case` 이후의 모든 `case` 문이 `break`를 만나거나 `switch`문이 끝날 때까지 순차적으로 실행되는 **폴스루(Fall-through)** 현상이 발생합니다. 이는 의도치 않은 버그의 원인이 될 수 있으므로, 특별한 경우가 아니라면 항상 `break`를 사용해야 합니다.
  * **`default:`**: 모든 `case`가 일치하지 않을 때 실행되는 블록입니다. `if`문의 `else`와 유사하며, 선택 사항입니다.

### 기존 `switch` 문과 `switch` 표현식 (Java 14+) 비교

전통적인 `switch` 문은 단순히 코드 흐름을 분기할 뿐, 특정 값을 **직접 반환할 수는 없었습니다**. 결과를 얻기 위해서는 `case` 블록 내부에서 변수에 값을 할당해야 했습니다.

하지만 **Java 14부터 도입된 `switch` 표현식**은 이러한 불편함을 해소하고, `switch` 구문을 통해 직접 값을 반환할 수 있게 하여 코드를 훨씬 간결하고 함수형 프로그래밍에 가깝게 작성할 수 있도록 합니다.

```java
// ✨ 기존 switch 문 (값을 반환하지 않음)
String dayOld = "MONDAY";
String messageOld;

switch (dayOld) {
    case "MONDAY":
        messageOld = "한 주의 시작, 월요일입니다!";
        break;
    case "FRIDAY":
        messageOld = "곧 주말! 신나는 금요일입니다!";
        break;
    default:
        messageOld = "평범한 평일입니다.";
}
System.out.println("기존 switch 문 결과: " + messageOld); // 출력: 한 주의 시작, 월요일입니다!

System.out.println("--------------------");

// ✨ switch 표현식 (Java 14+): 값을 직접 반환!
String currentDay = "TUESDAY";

// `->` (화살표)를 사용하여 간결하게 값을 할당하고 break 역할까지 합니다.
String newMessage = switch (currentDay) {
    case "MONDAY" -> "한 주의 시작, 월요일입니다!";
    case "FRIDAY" -> "곧 주말! 신나는 금요일입니다!";
    default -> "평범한 평일입니다."; // default는 모든 case에 해당하지 않을 때 필수입니다.
};

System.out.println("switch 표현식 결과: " + newMessage); // 출력: 평범한 평일입니다.
```

### ✅ `yield` 키워드 (Java 14+): `switch` 표현식 내 복잡한 블록에서 값 반환

`switch` 표현식에서 `->` 연산자 뒤에 단일 표현식이 아닌, 여러 줄의 코드를 실행해야 하는 경우에는 코드 블록 `{}`을 사용합니다. 이때, 이 코드 블록의 최종 결과값을 `switch` 표현식의 반환 값으로 명시하기 위해 **`yield` 키워드**를 사용합니다.

```java
int score = 90;

String grade = switch (score / 10) { // score를 10으로 나눈 몫으로 case를 판단 (예: 90 -> 9, 80 -> 8)
    case 10, 9 -> "A"; // 10 또는 9일 경우 "A" 반환 (쉼표로 여러 case 값을 한 줄에 지정 가능)
    case 8 -> "B";
    case 7 -> "C";
    default -> { // 70점 미만일 경우
        System.out.println("재시험 대상입니다. 더 노력해야 합니다."); // 여러 줄의 코드 실행 가능
        yield "F"; // 이 코드 블록의 최종 반환 값은 "F"입니다.
    }
};
System.out.println("획득 등급: " + grade); // 출력: 획득 등급: A (score가 90일 때)

System.out.println("--------------------");

// score가 60일 때의 예시
score = 60;
grade = switch (score / 10) {
    case 10, 9 -> "A";
    case 8 -> "B";
    case 7 -> "C";
    default -> {
        System.out.println("재시험 대상입니다. 더 노력해야 합니다.");
        yield "F";
    }
};
System.out.println("획득 등급: " + grade); // 출력: 재시험 대상입니다. 더 노력해야 합니다. / 획득 등급: F
```

`yield`는 `switch` 표현식 내의 코드 블록에서만 사용되며, 마치 `return`처럼 해당 블록의 최종 결과값을 `switch` 표현식의 결과로 반환합니다.

### 💡 `switch`문 퀴즈: 오늘의 메시지

아래 코드는 `day` 변수의 값에 따라 다른 메시지를 출력하는 `switch`문입니다. 출력 결과는 무엇일까요?

```java
public class DayMessage {
    public static void main(String[] args) {
        String day = "MONDAY"; // 현재 요일

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

<details>
<summary>정답 보기</summary>
<br>
출력 결과: 즐거운 월요일입니다. 한 주를 시작해요!<br><br>

설명:
<br><br>
1.  day 변수는 "MONDAY"로 초기화됩니다.<br>
2.  switch문은 day의 값과 일치하는 case를 찾습니다. 첫 번째 case "MONDAY"가 일치합니다.<br>
3.  해당 블록 내부의 System.out.println("즐거운 월요일입니다. 한 주를 시작해요!");가 실행됩니다.<br>
4.  break;를 만나 switch문이 종료됩니다.<br>
<br><br>
(진짜 월요일이 즐겁다고 느끼시는 분이 계시다면... 정말 대단한 멘탈입니다.😅)

</details>

-----

## `if`문 vs `switch`문: 언제 무엇을 쓸까? (성능 비교 포함)

`if`문과 `switch`문은 모두 조건에 따라 코드를 분기하지만, 각각의 장점과 적합한 상황이 다릅니다. 이들을 적절히 선택하여 사용하는 것이 효율적이고 가독성 좋은 코드를 작성하는 데 중요합니다.

| 항목 | `if`문 (`if-else if-else`) | `switch`문 |
|---|---|---|
| **평가 방식** | 조건을 위에서 아래로 **순차적으로 평가**합니다. 첫 번째 `true` 조건을 만나면 해당 블록을 실행하고 종료합니다. | JVM은 내부적으로 **Jump Table** 또는 **해시 기반**으로 해당 `case`로 빠르게 이동하여 분기 처리합니다. (특히 정수형, 열거형 값에 효율적) |
| **적합 조건** | **범위 조건** (`age >= 20`, `score < 60`), **논리 조건** (`isLogged && isAdmin`), **복합 조건** (`(x > 0 && y < 10) || z == 5`) 등 **유연하고 복잡한 조건식**에 적합합니다. | **단일 변수의 고정된 값** (`int`, `char`, `byte`, `short`, `String`, `enum`)에 따라 분기할 때 적합합니다. 예를 들어, 특정 숫자, 요일 이름, 메뉴 선택 등에 사용됩니다. |
| **가독성** | 복잡한 논리 표현에 적합하며, 조건을 직관적으로 표현할 수 있습니다. `else if`가 많아지면 코드가 길어져 다소 복잡해 보일 수 있습니다. | 명확하고 선언적인 분기 구조를 제공합니다. 많은 `case`가 있어도 비교적 깔끔하게 보이며, `switch` 표현식은 더욱 간결합니다. |
| **성능 (일반적 경향)** | 조건의 수가 많아질수록 순차 비교로 인해 **성능 저하**가 발생할 수 있습니다. (CPU 캐시 미스 등) | 많은 `case`가 있어도 특정 값으로 **직접 점프**하기 때문에 일반적으로 `if-else if`보다 **빠른 성능**을 보입니다. 특히 정수형 분기에서 유리합니다. |

### 성능 테스트 코드 예시

아래 코드는 `if-else if`문과 `switch` 표현식의 대략적인 성능 차이를 측정하는 간단한 벤치마크 예시입니다. 결과는 시스템 환경과 JVM 버전에 따라 다를 수 있지만, 일반적으로 `switch`문이 더 빠릅니다.

```java
public class IfSwitchBenchmark {
    public static void main(String[] args) {
        int testValue = 5; // 테스트할 값
        int iterations = 100_000_000; // 반복 횟수 (1억 번)
        long start, end;

        System.out.println("--- if문 vs switch문 성능 비교 (반복 횟수: " + iterations + "회) ---");

        // if문 측정
        start = System.nanoTime(); // 현재 시간(나노초) 기록
        for (int i = 0; i < iterations; i++) {
            int result; // 결과를 저장할 변수
            if (testValue == 1) result = 1;
            else if (testValue == 2) result = 2;
            else if (testValue == 3) result = 3;
            else if (testValue == 4) result = 4;
            else result = 5; // testValue가 5이므로 이 부분이 주로 실행됨
        }
        end = System.nanoTime(); // 종료 시간 기록
        System.out.println("if문 소요 시간: " + (end - start) + " ns");

        // switch 표현식 측정
        start = System.nanoTime(); // 현재 시간(나노초) 기록
        for (int i = 0; i < iterations; i++) {
            // switch 표현식은 값을 직접 반환하므로 더 간결합니다.
            int result = switch (testValue) {
                case 1 -> 1;
                case 2 -> 2;
                case 3 -> 3;
                case 4 -> 4;
                default -> 5; // testValue가 5이므로 이 부분이 주로 실행됨
            };
        }
        end = System.nanoTime(); // 종료 시간 기록
        System.out.println("switch문 소요 시간: " + (end - start) + " ns");

        System.out.println("\n(참고: 위 결과는 실행 환경에 따라 달라질 수 있습니다.)");
    }
}
```

> 위 코드 실행 결과는 어떻게 될까요? 궁금하신 분은 한번 직접 실행해 보세요. 대부분의 경우 **`switch`문이 `if-else if`보다 더 빠른 결과**를 보여줄 것입니다. 이는 `switch`문이 내부적으로 최적화된 점프 테이블(Jump Table) 방식을 사용하기 때문입니다.

-----

## 🔚 마치며: 현명한 조건문 선택으로 더 좋은 코드를\!

`if`문과 `switch`문은 자바에서 프로그램의 흐름을 제어하는 가장 기본적이면서도 강력한 도구입니다. 이 두 가지를 언제, 어떻게 사용해야 할지 정확히 이해하는 것은 효율적이고 가독성 높은 코드를 작성하는 데 매우 중요합니다.

  * **복잡한 조건식(범위, 논리 연산)이 필요하다면 `if`문을 활용하세요.**
  * **하나의 변수가 가질 수 있는 명확한 값에 따라 분기한다면 `switch`문을 고려하세요.** (특히 Java 14+의 `switch` 표현식은 더욱 강력합니다\!)
  * **`break`의 중요성**과 **`yield` 키워드의 역할**을 잊지 마세요.
  * 성능 차이가 미미할지라도, 코드의 **가독성과 유지보수성** 측면에서 더 적합한 조건문을 선택하는 것이 중요합니다.

다음 글에서는 프로그램의 반복적인 작업을 처리하는 데 사용되는 \*\*반복문(Loop Statement)\*\*에 대해 알아보겠습니다.