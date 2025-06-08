---
title: "자바 상속 개념 이해"
layout: single
categories: [java]
lang: ko
author_profile: true
read_time: true
share: true
related: true
excerpt: "자바에서 상속을 통해 코드 재사용성을 높이는 방법을 알아봅니다."
---

자바에서 상속은 `extends` 키워드를 통해 구현되며, 부모 클래스의 필드와 메서드를 자식 클래스가 사용할 수 있게 합니다.

```java
class Animal {
    void sound() {
        System.out.println("소리낸다");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("멍멍");
    }
}