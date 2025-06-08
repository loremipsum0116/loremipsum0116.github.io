---
title: "자바 클래스 기초"
date: 2025-06-09
categories: [java]
lang: ko
---

자바에서 클래스는 객체를 생성하기 위한 청사진입니다.  
클래스는 필드와 메서드로 구성되며, 객체지향 프로그래밍의 핵심입니다.

```java
public class Car {
    String color;
    int speed;

    void drive() {
        System.out.println("주행 중");
    }
}
