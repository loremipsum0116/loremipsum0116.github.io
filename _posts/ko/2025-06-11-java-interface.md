---
title: "자바 인터페이스 활용법"
layout: single
categories: [java]
lang: ko
author_profile: true
read_time: true
share: true
related: true
excerpt: "인터페이스는 자바에서 다형성을 구현하는 강력한 수단입니다."
---

인터페이스는 클래스가 구현해야 하는 메서드의 집합을 정의합니다.  
`implements` 키워드를 사용하여 클래스에 인터페이스를 구현할 수 있습니다.

```java
interface Animal {
    void sound();
}

class Cat implements Animal {
    public void sound() {
        System.out.println("야옹");
    }
}