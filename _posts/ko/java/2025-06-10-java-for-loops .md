---
title: "자바 반복문 - for문과 이중 for문"
date: 2025-06-10 12:29:17 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 반복문: 코드의 효율성을 높이는 `for`문과 이중 `for`문

프로그래밍에서 \*\*반복문(Loop Statement)\*\*은 특정 코드 블록을 여러 번 실행해야 할 때 사용하는 핵심적인 제어 구조입니다. 수많은 데이터를 처리하거나, 일정한 패턴을 가진 출력을 만들어낼 때 반복문은 개발자의 시간을 절약하고 코드의 효율성을 극대화합니다.
<br><br>
특히 `for`문은 반복 횟수가 명확할 때 가장 강력한 성능을 발휘하며, 필요에 따라 `for`문을 중첩하여 사용하는 **이중 `for`문**은 2차원 데이터 구조나 복잡한 패턴을 다루는 데 매우 효과적입니다. 이번 글에서는 `for`문의 기본 개념부터 다양한 활용 예시, 그리고 이중 `for`문까지 심도 있게 알아보겠습니다.

-----

### `for`문이란?

`for`문은 정해진 횟수만큼 반복 작업을 수행할 때 사용하는 제어문입니다. 초기화, 조건 검사, 증감식의 세 가지 핵심 요소로 구성되어 있어 반복의 시작, 유지, 종료 조건을 한눈에 파악할 수 있습니다.

#### `for`문 구조

```java
for (초기식; 조건식; 증감식) {
    // 조건식이 true인 동안 반복 실행할 코드 블록
}
```

  * **초기식**: 반복문이 시작되기 전에 **딱 한 번 실행**됩니다. 주로 반복 제어에 사용될 변수(반복 변수)를 선언하고 초기값을 할당합니다.
  * **조건식**: 매 반복이 시작되기 전에 **조건식을 평가**합니다. 조건식의 결과가 `true`이면 코드 블록이 실행되고, `false`가 되면 반복문은 종료됩니다.
  * **증감식**: 한 번의 반복(코드 블록 실행)이 끝날 때마다 **항상 실행**됩니다. 주로 반복 변수의 값을 변경하여 조건식에 영향을 줍니다.

-----

### 예제 1: 1부터 5까지 출력하기

다음 코드는 `for`문의 가장 기본적인 활용 예시로, 1부터 5까지의 숫자를 순서대로 출력합니다.

```java
public class ForLoopExample1 {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("i의 값 = " + i);
        }
    }
}
```

**코드 분석:**

  * **`int i = 1;`**: **초기식**. 반복 변수 `i`를 선언하고 `1`로 초기화합니다. 이 과정은 반복문 시작 시 단 한 번만 실행됩니다.
  * **`i <= 5;`**: **조건식**. `i`가 `5`보다 작거나 같을 때까지 반복을 계속합니다. 이 조건이 `false`가 되는 순간 반복문은 종료됩니다.
  * **`i++`**: **증감식**. `System.out.println("i의 값 = " + i);`가 실행된 후, `i`의 값을 1씩 증가시킵니다.
  * **`System.out.println(...);`**: 조건식이 `true`일 때 실행되는 **코드 블록**입니다.

**출력 결과:**

```
i의 값 = 1
i의 값 = 2
i의 값 = 3
i의 값 = 4
i의 값 = 5
```

-----

### 🔁 `for`문 응용 예제

`for`문의 초기식, 조건식, 증감식을 다양하게 조합하여 여러 가지 흥미로운 반복 로직을 구현할 수 있습니다.

#### 1️⃣ 역방향 반복: 카운트다운\!

값을 증가시키는 대신 감소시키면서 역순으로 반복할 수 있습니다.

```java
public class ForLoopReverse {
    public static void main(String[] args) {
        System.out.println("카운트다운 시작!");
        for (int i = 5; i > 0; i--) { // i를 5부터 시작하여 1보다 클 때까지 1씩 감소
            System.out.println(i);
        }
        System.out.println("발사!");
    }
}
```

**✔ 설명:**

  * **초기식**: `int i = 5` → `i`를 `5`부터 시작합니다.
  * **조건식**: `i > 0` → `i`가 `0`보다 클 때까지 (즉, `1`까지) 반복합니다.
  * **증감식**: `i--` → 매 반복마다 `i`의 값을 `1`씩 감소시킵니다.

**출력 결과:**

```
카운트다운 시작!
5
4
3
2
1
발사!
```

**주 용도:** 역순 출력 (예: 카운트다운, 배열의 마지막 요소부터 역순 탐색, 스택 자료구조 순회 등)

-----

#### 특정 간격으로 반복: 짝수만 출력\!

증감식의 단위를 조절하여 특정 간격으로 반복할 수 있습니다.

```java
public class ForLoopEvenNumbers {
    public static void main(String[] args) {
        System.out.println("0부터 10까지의 짝수:");
        for (int i = 0; i <= 10; i += 2) { // i를 0부터 시작하여 10 이하까지 2씩 증가
            System.out.println(i);
        }
    }
}
```

**✔ 설명:**

  * **초기식**: `int i = 0` → `i`를 `0`으로 시작합니다.
  * **조건식**: `i <= 10` → `i`가 `10` 이하일 때까지 반복합니다.
  * **증감식**: `i += 2` → `i`의 값을 매 반복마다 `2`씩 증가시킵니다.

**출력 결과:**

```
0부터 10까지의 짝수:
0
2
4
6
8
10
```

**주 용도:** 특정 간격으로 반복 처리할 때 유용합니다 (예: 짝수/홀수 출력, 배열의 특정 인덱스 건너뛰기, 격자형 데이터 처리 등).

-----

### 이중 `for`문 (Nested `for` Loops)

이중 `for`문은 `for`문 안에 또 다른 `for`문이 포함된 형태를 말합니다. **바깥 `for`문이 1회 실행될 때마다, 안쪽 `for`문은 자신의 반복 횟수만큼 모두 실행됩니다.** 이는 2차원 배열을 다루거나, 표 형식의 데이터를 출력하거나, 복잡한 패턴을 그릴 때 매우 강력한 기능을 제공합니다.

#### 예제 2: 3행 4열 형식으로 숫자 출력

```java
public class NestedForLoopExample1 {
    public static void main(String[] args) {
        // 바깥 for문: 행(row)을 제어
        for (int i = 1; i <= 3; i++) { 
            // 안쪽 for문: 열(column)을 제어
            for (int j = 1; j <= 4; j++) {
                System.out.print(j + " "); // 각 열의 숫자를 출력하고 공백으로 구분
            }
            System.out.println(); // 한 행의 출력이 끝나면 줄바꿈
        }
    }
}
```

**코드 분석:**

  * 바깥 `for`문은 `i`가 `1`부터 `3`까지 반복하며 총 3번 실행됩니다. 각 `i` 값은 새로운 '행'을 의미합니다.
  * 안쪽 `for`문은 `j`가 `1`부터 `4`까지 반복하며 총 4번 실행됩니다. 이 안쪽 `for`문은 바깥 `for`문이 한 번 실행될 때마다 '완전히' 다시 시작하여 4번 반복합니다. 각 `j` 값은 현재 행의 '열'을 의미합니다.
  * `System.out.print(j + " ");`는 `j`의 값과 공백을 출력하지만 줄바꿈은 하지 않습니다.
  * 안쪽 `for`문이 모두 끝나면 `System.out.println();`을 통해 줄을 바꿔 다음 행을 준비합니다.

**출력 결과:**

```
1 2 3 4 
1 2 3 4 
1 2 3 4 
```

-----

#### 예제 3: 구구단 (2단\~9단)

이중 `for`문은 구구단처럼 표 형태의 결과를 출력할 때 매우 유용합니다.

```java
public class Gugudan {
    public static void main(String[] args) {
        // 바깥 for문: 단(dan)을 제어 (2단부터 9단까지)
        for (int dan = 2; dan <= 9; dan++) {
            System.out.println("[" + dan + "단]"); // 현재 단의 제목 출력
            // 안쪽 for문: 각 단의 곱셈을 제어 (x1부터 x9까지)
            for (int i = 1; i <= 9; i++) {
                System.out.println(dan + " x " + i + " = " + (dan * i));
            }
            System.out.println(); // 각 단이 끝날 때마다 빈 줄 추가하여 가독성 높임
        }
    }
}
```

**출력 결과:**

```
[2단]
2 x 1 = 2
2 x 2 = 4
...
2 x 9 = 18

[3단]
3 x 1 = 3
...
3 x 9 = 27

...

[9단]
9 x 1 = 9
...
9 x 9 = 81
```

-----

#### 예제 4: 별 피라미드 출력

이중 `for`문을 사용하여 다양한 기하학적 패턴이나 그림을 그릴 수 있습니다. 다음은 별(`*`)로 피라미드 모양을 만드는 예시입니다.

```java
public class StarPyramid {
    public static void main(String[] args) {
        int height = 5; // 피라미드 높이

        // 바깥 for문: 행 (층)
        for (int i = 1; i <= height; i++) {
            // 안쪽 for문 1: 공백 출력 (피라미드 정렬)
            for (int j = 1; j <= height - i; j++) {
                System.out.print(" ");
            }
            // 안쪽 for문 2: 별 출력 (각 층의 별 개수)
            // 각 층의 별 개수: 1층=1개, 2층=3개, 3층=5개... (2*i - 1)
            for (int k = 1; k <= 2 * i - 1; k++) {
                System.out.print("*");
            }
            System.out.println(); // 한 층 출력 후 줄바꿈
        }
    }
}
```

**코드 분석:**

  * **바깥 `for`문 (`i`):** 피라미드의 각 층(행)을 제어합니다. `height`만큼 반복합니다.
  * **안쪽 `for`문 1 (`j`):** 각 층의 왼쪽에 필요한 공백을 출력하여 피라미드를 중앙에 정렬합니다. 층이 높아질수록 공백의 수는 줄어듭니다 (`height - i`).
  * **안쪽 `for`문 2 (`k`):** 각 층에 출력될 별의 개수를 제어합니다. 피라미드의 별 개수는 `2 * i - 1` 공식에 따라 증가합니다 (1층: 1개, 2층: 3개, 3층: 5개...).
  * **`System.out.println();`**: 한 층의 공백과 별 출력이 끝나면 다음 층을 위해 줄을 바꿉니다.

**출력 결과:**

```
    *
   ***
  *****
 *******
*********
```

-----

### 📌 요약 정리

| 요소 | 설명 |
|---|---|
| **`for`문** | 반복 횟수가 명확할 때 사용하는 제어문. 초기식, 조건식, 증감식으로 구성. |
| **초기식** | 반복 시작 전 단 한 번 실행. 반복 변수 선언 및 초기화. |
| **조건식** | 매 반복 전 평가. `true`이면 반복 계속, `false`이면 반복 종료. |
| **증감식** | 매 반복 후 실행. 반복 변수 값 변경 (증가 또는 감소). |
| **코드 블록** | 조건식이 참일 때 반복 실행되는 실제 코드. |
| **이중 `for`문** | `for`문 안에 또 다른 `for`문이 중첩된 형태. 행/열 기반의 데이터, 패턴 출력 등에 유용. 바깥 `for`문이 1회 실행될 때마다 안쪽 `for`문은 완전히 실행됨. |
| **향상된 `for`문** (참고) | 배열 또는 컬렉션의 모든 요소를 순회할 때 사용하는 간결한 문법 (이번 글에서는 다루지 않았지만, 배열/컬렉션 학습 시 함께 알아두면 좋습니다). |

-----

### 💡 반복문 퀴즈

```java
public class LoopQuiz {
    public static void main(String[] args) {
        for (int i = 1; i <= 3; i++) {
            for (int j = 1; j <= 3; j++) {
                System.out.println(i + " x " + j + " = " + ???);
            }
        }
    }
}
```

위 코드는 두 개의 `for`문을 사용하여 1부터 3까지의 수를 곱한 결과를 출력합니다.
`???`에 들어갈 값을 생각해 보세요.

<details>
<summary>정답 보기</summary>
<br>
??? 부분에는 (i * j)가 들어가야 합니다.
<br><br>
설명:
<br>
  * 바깥 for문의 변수 i는 현재 곱셈의 첫 번째 숫자를 나타냅니다 (1, 2, 3).<br>
  * 안쪽 for문의 변수 j는 현재 곱셈의 두 번째 숫자를 나타냅니다 (1, 2, 3).<br>
  * 따라서 i * j는 이 두 숫자의 곱셈 결과를 의미하며, 이를 System.out.println을 통해 출력하게 됩니다.

</details>

-----

### 🔚 마치며

`for`문은 프로그래밍에서 반복적인 작업을 효율적으로 수행하는 데 가장 기본이 되는 도구입니다. **반복 횟수가 명확할 때** 특히 유용하며, 초기화, 조건, 증감식을 통해 반복의 모든 과정을 명확하게 제어할 수 있습니다.

또한, **이중 `for`문**은 2차원적인 구조(표, 격자)를 다루거나, 복잡한 패턴(별 피라미드 등)을 생성할 때 매우 효과적입니다. 각 반복 변수의 \*\*범위(scope)\*\*와 **증감 조건**을 정확히 이해하는 것이 핵심이며, 이를 통해 의도한 대로 정확하게 코드를 실행할 수 있습니다.

이번 글에서 다룬 `for`문과 이중 `for`문의 개념과 예시들을 통해 반복문의 기본을 탄탄히 다지셨기를 바랍니다\! 직접 다양한 형태의 `for`문을 작성해보면서 익숙해지는 것이 중요해요. 다음 글에서는 **향상된 for문**에 대해 알아보겠습니다.