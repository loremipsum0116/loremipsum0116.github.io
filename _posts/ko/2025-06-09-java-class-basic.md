---
title: "자바 클래스 기초"
layout: single
categories: [java]
lang: ko
author_profile: true
read_time: true
share: true
related: true
excerpt: "자바에서 클래스란 무엇이며 어떻게 정의하는지 간단하게 살펴봅니다."
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
