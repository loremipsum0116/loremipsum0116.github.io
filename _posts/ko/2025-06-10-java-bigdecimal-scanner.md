---
title: "자바 BigDecimal과 Scanner"
date: 2025-06-10 11:30:31 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

> 자바에서는 고정밀 계산이 필요할 때 `BigDecimal`, 사용자 입력을 처리할 때 `Scanner`를 활용합니다.  
> 특히 금융, 과학 분야에선 `float`이나 `double`보다 `BigDecimal`이 안정적인 선택입니다.

---

## 🔹 BigDecimal: 고정밀 숫자 계산 클래스

### ✅ 왜 BigDecimal을 쓰는가?

```java
System.out.println(0.1 + 0.2); // 0.30000000000000004
```

- `double`의 부동소수점 오류 때문에 정확한 계산이 어려움
- `BigDecimal`은 **정확한 소수 계산** 가능

### ✅ 선언과 연산 방법

```java
import java.math.BigDecimal;

public class Main {
    public static void main(String[] args) {
        BigDecimal num1 = new BigDecimal("0.1");
        BigDecimal num2 = new BigDecimal("0.2");
        BigDecimal result = num1.add(num2);
        System.out.println(result);  // 0.3
    }
}
```

- 문자열로 생성해야 **정확한 값 유지**
- `add()`, `subtract()`, `multiply()`, `divide()` 등 메서드 사용

---

## ⚠ BigDecimal 사용 시 주의점

- `new BigDecimal(0.1)`처럼 **실수형 리터럴을 직접 넘기면 부정확**
- 연산 시에는 반드시 메서드를 사용해야 함 (`+`, `-` 연산자 사용 불가)

---

## 🔹 Scanner: 사용자 입력 받기

`Scanner`는 표준 입력(키보드)으로부터 문자열, 정수, 실수 등을 쉽게 입력받을 수 있는 클래스입니다.

### ✅ 기본 사용 예

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("당신의 이름은? ");
        String name = sc.nextLine();
        System.out.println("안녕하세요, " + name + "님!");
    }
}
```

---

## 💡 Scanner 퀴즈

```java
Scanner sc = new Scanner(System.in);
System.out.print("나이를 입력하세요: ");
int age = sc.nextInt();
System.out.println("내년이면 " + (age + 1) + "살이 됩니다.");
```
age에 25를 대입했다고 가정합시다! 위 코드의 출력 결과는 무엇일까요?
<details>
<summary>정답 보기</summary>

- 예를 들어 `25`를 입력하면  
출력: `내년이면 26살이 됩니다.`

</details>

---

## 📌 정리

| 항목        | 설명 |
|-------------|------|
| `BigDecimal` | 소수점 오류 없는 정밀 계산 |
| `Scanner`    | 콘솔 입력값 받기용 클래스 |

---

## 🛠 실무 팁

- 돈 계산할 땐 반드시 `BigDecimal` 사용!
- `Scanner`는 `nextLine()`과 `nextInt()` 혼용 시 주의 (개행 문자 처리 문제 발생 가능)

---

## 🔚 마무리

`BigDecimal`과 `Scanner`는 초보자부터 실무자까지 폭넓게 사용하는 핵심 클래스입니다.  
특히 사용자 입력 처리와 정밀 연산이 필요한 상황에서 그 진가를 발휘합니다.

---
