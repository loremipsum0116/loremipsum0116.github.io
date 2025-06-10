---
title: "-1장- 자바 변수"
date: 2025-06-10 10:06:48 +09:00
categories: [java]
lang: ko
locale: ko
---

> 자바에서 변수란 데이터를 저장하기 위한 **메모리 공간에 이름을 붙인 것**입니다.  
> 코드의 구조와 안정성, 가독성은 올바른 변수 선언과 활용에서 시작됩니다.

---

## 🔹 변수의 종류

| 종류 | 선언 위치 | 생명 주기 |
|------|-----------|------------|
| 지역 변수 (Local) | 메서드 내부 | 블록 종료 시 소멸 |
| 인스턴스 변수 | 클래스 내부, static 없음 | 객체 소멸 시까지 유지 |
| 클래스 변수 | `static` 키워드 사용 | 프로그램 종료 시까지 |
| 매개변수 | 메서드 괄호 안 | 메서드 실행 중 유지 |

---

## 🔹 변수 선언과 초기화 예시

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

## 🔹 지역 변수는 반드시 초기화!

지역 변수는 선언 후 초기화하지 않으면 컴파일 오류가 발생합니다.

```java
public void printAge() {
    int age;
    // System.out.println(age); // ❌ 컴파일 에러: 초기화되지 않음
}
```

---

## 🔹 변수의 기본 초기값

| 타입 | 초기값 |
|------|--------|
| int / long | 0 |
| float / double | 0.0 |
| boolean | false |
| 참조형 (String 등) | null |

> 단, **지역 변수는 자동 초기화되지 않음**에 주의!

---

## 🔹 final 변수 (불변 값)

```java
final int MAX_USERS = 100;
// MAX_USERS = 200; // ❌ 불가
```

- 변경 불가능한 값 정의 시 사용
- 보통 **대문자 + 언더스코어**로 네이밍

---

## 🔹 변수 네이밍 컨벤션

| 항목 | 예시 |
|------|------|
| 일반 변수 | `camelCase` → `userName`, `itemCount` |
| 상수 (final) | `UPPER_SNAKE_CASE` → `MAX_LIMIT` |

---

## 🔹 실무 팁

- `final`을 사용하면 불변성 유지 가능 → 디버깅 효율 ↑
- `static` 변수는 **공유 자원** → 동시성 환경에서 주의
- 변수의 **범위를 최소화**하면 유지보수 용이
- 의도를 드러내는 명명 규칙 사용 → 가독성 향상
- 매직 넘버 대신 상수 선언 권장 → 유지보수성 증가

---

## 🔹 예제: 변수 4종류 요약

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

---

## 🔚 마무리

자바의 변수는 단순한 저장 수단이 아니라 **코드 설계의 뼈대**입니다.  
변수 선언, 스코프, 불변성, 공유 범위 등을 전략적으로 다루는 것은 **숙련된 개발자의 필수 역량**입니다.  
기초 개념일수록 정확한 이해가 필요하며, 작은 실수 하나가 프로그램의 큰 오류로 이어질 수 있음을 기억해야 합니다.

---
