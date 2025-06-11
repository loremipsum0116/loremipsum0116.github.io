---
title: "자바 BigDecimal과 Scanner"
date: 2025-06-10 11:30:31 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---
-----

## 자바의 핵심 유틸리티: `BigDecimal`과 `Scanner` 깊이 이해하기

자바 프로그래밍에서 숫자를 다루고 사용자로부터 입력을 받는 것은 매우 흔한 작업입니다. 특히 금융 시스템처럼 **고정밀 계산**이 필수적이거나, 사용자 친화적인 **입력 처리**가 필요한 상황에서는 특정 클래스들을 적절히 활용하는 것이 중요합니다.
<br><br>
이번 글에서는 자바의 표준 라이브러리 중 이러한 목적에 특화된 두 가지 핵심 클래스, \*\*`BigDecimal`\*\*과 \*\*`Scanner`\*\*에 대해 자세히 알아보겠습니다. 이들이 왜 필요하며, 어떻게 사용해야 하는지 명확한 예시와 함께 설명해 드릴게요.

-----

### `BigDecimal`: 고정밀 숫자 계산의 표준

일반적으로 자바에서 실수를 표현할 때는 `float`이나 `double` 타입을 사용합니다. 하지만 이 부동소수점 타입들은 특정 상황에서 예상치 못한 정밀도 문제를 일으킬 수 있습니다. 특히 금융, 과학, 공학 분야처럼 **정확한 소수점 계산**이 필수적인 경우에는 `BigDecimal`을 사용하는 것이 안전하고 권장됩니다.

#### 왜 `BigDecimal`을 사용해야 할까요?

다음 예시를 통해 `double`이 가진 부동소수점 문제를 확인해 보세요.

```java
public class DoublePrecisionIssue {
    public static void main(String[] args) {
        System.out.println(0.1 + 0.2); // 예상: 0.3
        // 실제 출력: 0.30000000000000004
    }
}
```

`0.1 + 0.2`의 결과가 정확히 `0.3`이 아닌 것을 확인할 수 있습니다. 이는 컴퓨터가 부동소수점을 2진수로 표현하는 방식의 한계 때문에 발생하는 현상입니다. 이러한 미세한 오차가 금융 계산에서는 큰 문제로 이어질 수 있습니다.

**`BigDecimal`은 이러한 부동소수점 오류 없이 정확한 소수 계산을 가능하게 합니다.** 숫자를 내부적으로 문자열 형태로 관리하여 정밀도를 잃지 않기 때문입니다.

#### `BigDecimal` 선언 및 연산 방법

`BigDecimal`을 사용하기 위해서는 `java.math.BigDecimal` 패키지를 import 해야 합니다. 숫자를 생성할 때는 **문자열 형태**로 전달하는 것이 가장 중요합니다.

```java
import java.math.BigDecimal;

public class BigDecimalExample {
    public static void main(String[] args) {
        // ✨ 중요: BigDecimal은 문자열로 초기화해야 정확한 값을 유지합니다.
        BigDecimal num1 = new BigDecimal("0.1");
        BigDecimal num2 = new BigDecimal("0.2");

        // BigDecimal은 일반적인 연산자(+, -, *, /)를 사용할 수 없습니다.
        // 반드시 전용 메서드를 사용해야 합니다.
        BigDecimal sumResult = num1.add(num2);       // 덧셈
        BigDecimal diffResult = num1.subtract(num2);  // 뺄셈
        BigDecimal multResult = num1.multiply(num2);  // 곱셈
        // 나눗셈은 RoundingMode를 지정하는 것이 안전합니다.
        BigDecimal divResult = num1.divide(num2, BigDecimal.ROUND_HALF_UP); // 나눗셈 (반올림 모드 지정)

        System.out.println("0.1 + 0.2 = " + sumResult);   // 출력: 0.3
        System.out.println("0.1 - 0.2 = " + diffResult);  // 출력: -0.1
        System.out.println("0.1 * 0.2 = " + multResult);  // 출력: 0.02
        System.out.println("0.1 / 0.2 = " + divResult);   // 출력: 0.5
    }
}
```

#### ⚠ `BigDecimal` 사용 시 주의점

  * **실수형 리터럴 직접 넘기지 않기**: `new BigDecimal(0.1)`처럼 `double` 타입의 `0.1`을 직접 생성자에 넘기면, 이미 `double`로 변환되는 과정에서 오차가 발생하여 `BigDecimal`의 장점을 잃게 됩니다. 반드시 \*\*`new BigDecimal("0.1")`\*\*과 같이 **문자열로 전달**해야 합니다.
  * **연산자 사용 불가**: `BigDecimal` 객체끼리는 `+`, `-`, `*`, `/`와 같은 산술 연산자를 직접 사용할 수 없습니다. 반드시 `add()`, `subtract()`, `multiply()`, `divide()` 등의 **전용 메서드**를 사용해야 합니다.

-----

### `Scanner`: 사용자 입력 처리의 문지기

`Scanner` 클래스는 자바 프로그램에서 **표준 입력 스트림(System.in)**, 즉 키보드로부터 문자열, 정수, 실수 등 다양한 형태의 데이터를 쉽게 입력받을 수 있도록 도와주는 유틸리티 클래스입니다.

#### 기본 사용 예시

`Scanner`를 사용하기 위해서는 `java.util.Scanner` 패키지를 import 해야 합니다.

```java
import java.util.Scanner; // Scanner 클래스 임포트

public class ScannerExample {
    public static void main(String[] args) {
        // Scanner 객체 생성: System.in(표준 입력, 즉 키보드)으로부터 입력받도록 설정
        Scanner scanner = new Scanner(System.in); 

        System.out.print("당신의 이름은 무엇인가요? ");
        String name = scanner.nextLine(); // 사용자가 엔터를 누를 때까지 한 줄 전체를 문자열로 읽어옴

        System.out.println("안녕하세요, " + name + "님! 만나서 반갑습니다.");

        // 스캐너 사용이 끝나면 반드시 close()하여 자원을 반환해야 합니다.
        scanner.close(); 
    }
}
```

**실행 및 출력 예시:**

```
당신의 이름은 무엇인가요? 심현석  <- 사용자 입력
안녕하세요, 심현석님! 만나서 반갑습니다.
```

#### `Scanner`의 주요 입력 메서드

  * **`nextLine()`**: 공백을 포함하여 **한 줄 전체**를 읽어옵니다. 엔터를 누르면 입력이 종료됩니다.
  * **`next()`**: 공백 이전의 **한 단어**만 읽어옵니다.
  * **`nextInt()`**: 입력된 문자열을 **`int` 타입**으로 변환하여 읽어옵니다.
  * **`nextDouble()`**: 입력된 문자열을 **`double` 타입**으로 변환하여 읽어옵니다.
  * **`hasNextLine()`, `hasNextInt()` 등**: 다음에 읽을 데이터가 해당 타입인지 확인하는 메서드 (반복문 등에서 유용).

-----

### 💡 `Scanner` 퀴즈

다음 코드는 `Scanner`를 사용하여 나이를 입력받고 내년 나이를 계산하여 출력합니다. `age`에 `25`를 입력했다고 가정했을 때, 위 코드의 출력 결과는 무엇일까요?

```java
import java.util.Scanner;

public class ScannerQuiz {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("나이를 입력하세요: ");
        int age = sc.nextInt(); // 정수 입력 받기
        System.out.println("내년이면 " + (age + 1) + "살이 됩니다.");
        sc.close();
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
입력: 25
<br>
출력: 내년이면 26살이 됩니다.
<br>
설명:
<br>
1.  System.out.print("나이를 입력하세요: ");가 출력됩니다.<br>
2.  사용자가 25를 입력하고 엔터를 누릅니다.<br>
3.  int age = sc.nextInt();를 통해 25가 age변수에 정수형으로 저장됩니다.<br>
4.  System.out.println("내년이면 " + (age + 1) + "살이 됩니다.");에서 (age + 1)은 (25 + 1)이 되어 26이 됩니다.<br>
5.  최종적으로 내년이면 26살이 됩니다.가 출력됩니다.<br>

</details>

-----

### 📌 요약 정리

| 항목 | 설명 | 주요 사용처 |
|---|---|---|
| **`BigDecimal`** | `float`, `double`의 부동소수점 오차 없이 **정확한 소수점 계산**을 위한 클래스. 숫자를 **문자열로 초기화**하고 **메서드를 통해 연산**해야 함. | 금융 시스템, 과학 계산, 정밀한 수치 연산이 필요한 모든 분야. |
| **`Scanner`** | 표준 입력(키보드)으로부터 **다양한 타입의 데이터를 입력받는** 유틸리티 클래스. 사용 후에는 반드시 `close()`하여 자원 해제. | 콘솔 기반 프로그램에서 사용자 입력 받기, 파일에서 데이터 읽기. |

-----

### 🛠 실무 팁

  * **돈 계산할 땐 무조건 `BigDecimal`\!**: 금액, 이자율 등 단 1원, 1센트의 오차도 허용되지 않는 계산에서는 반드시 `BigDecimal`을 사용해야 합니다.

  * **`Scanner`의 `nextInt()`, `nextDouble()` 뒤에 `nextLine()` 사용 주의**: `nextInt()`나 `nextDouble()` 등 숫자를 읽는 메서드는 숫자만 읽고 \*\*엔터(개행 문자)\*\*는 버퍼에 남겨둡니다. 그 뒤에 `nextLine()`을 사용하면 버퍼에 남아있는 엔터를 읽어버려 의도치 않게 빈 문자열이 입력되는 문제가 발생할 수 있습니다. 이를 방지하려면 숫자 입력 후 `scanner.nextLine();`을 한 번 더 호출하여 개행 문자를 비워주는 것이 좋습니다.

    ```java
    Scanner sc = new Scanner(System.in);
    System.out.print("나이: ");
    int age = sc.nextInt(); // 숫자만 읽고 엔터는 버퍼에 남음
    sc.nextLine(); // 버퍼에 남은 엔터를 소비하여 비워줌

    System.out.print("이름: ");
    String name = sc.nextLine(); // 이제 제대로 이름을 입력받음
    System.out.println("이름: " + name + ", 나이: " + age);
    sc.close();
    ```

-----

### 🔚 마치며

`BigDecimal`과 `Scanner`는 자바 개발자가 일상적으로 접하고 활용하는 매우 중요한 클래스입니다. `BigDecimal`을 통해 정밀한 수치 계산의 안정성을 확보하고, `Scanner`를 통해 사용자 친화적인 입력 처리를 구현할 수 있습니다.
<br>
이 두 클래스의 올바른 사용법을 익히는 것은 효율적이고 견고한 자바 애플리케이션을 개발하는 데 큰 도움이 될 것입니다. 다음 시간에는 분기점에 따라 
로직을 처리하는 **조건문**에 대해 알아보겠습니다.