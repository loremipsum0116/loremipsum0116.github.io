---
title: "자바 핵심 클래스 및 객체 동등 비교"
date: 2025-06-25 14:47:51 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

-----

## 자바 핵심 클래스: `Object`와 유용한 유틸리티 클래스

지금까지 자바의 기본 문법과 배열과 같은 데이터 구조를 살펴보았습니다. 이제 모든 자바 클래스의 조상인 **`java.lang.Object`** 클래스의 중요한 역할과, 객체지향 프로그래밍에서 필수적인 **객체 동등 비교** 방법에 대해 심도 있게 알아보겠습니다. 또한, 기본 타입을 객체로 다루게 해주는 **포장(Wrapper) 클래스**, 수학 연산을 위한 `Math` 클래스, 그리고 날짜와 시간을 처리하는 클래스까지 자바 프로그래밍에 유용한 핵심 클래스들을 함께 다룰 것입니다.

객체지향의 근간을 이루는 객체 간의 관계와 동작 방식을 이해하는 것은 효과적인 자바 애플리케이션 개발의 핵심입니다.

-----

## `java.lang.Object` 모듈: 모든 클래스의 조상

`java.lang.Object` 클래스는 자바의 모든 클래스가 명시적으로 상속받지 않아도 **자동으로 상속받는 최상위 클래스**입니다. 따라서 모든 객체는 `Object` 클래스에 정의된 메소드들을 사용할 수 있습니다. 이 중 가장 중요한 메소드들은 객체의 동등성을 비교하거나 객체를 문자열로 표현할 때 사용됩니다.

### ✅ 객체 동등 비교: `hashCode()`와 `equals()`

객체지향 프로그래밍에서 두 객체가 '같은지'를 판단하는 것은 매우 중요합니다. 자바에서 객체의 동등성 비교는 크게 두 가지 방법으로 이루어집니다.

* **`==` 연산자**: 두 변수가 **동일한 객체(동일한 메모리 주소)**를 참조하는지를 비교합니다.
* **`equals()` 메소드**: 두 객체의 **내용(값)이 동일한지**를 비교합니다. 기본적으로 `Object` 클래스의 `equals()`는 `==`와 동일하게 주소를 비교하지만, 대부분의 클래스에서는 이 메소드를 재정의하여 객체의 논리적 동등성을 판단합니다.

**`hashCode()`와 `equals()`의 관계:**

자바 컬렉션 프레임워크(특히 `HashSet`, `HashMap` 등)에서 객체를 저장하거나 검색할 때 `hashCode()`와 `equals()` 메소드를 함께 사용합니다. 중요한 규칙은 다음과 같습니다.

* `hashCode()` 값이 같은 두 객체는 `equals()` 메소드가 `true`를 반환할 **필요는 없습니다.** (서로 다른 객체라도 해시 충돌로 인해 `hashCode()`가 같을 수 있습니다.)
* **`equals()` 메소드가 `true`를 반환하는 두 객체는 반드시 `hashCode()` 값도 같아야 합니다.** (만약 그렇지 않으면 `Set`에 동일한 객체가 두 번 저장되거나 `Map`에서 객체를 찾지 못하는 문제가 발생할 수 있습니다.)

```java
public class ObjectEqualityExample {
    public static void main(String[] args) {
        String str1 = new String("hello");
        String str2 = new String("hello");
        String str3 = str1; // 같은 객체를 참조

        System.out.println("str1 == str2: " + (str1 == str2)); // false (다른 객체)
        System.out.println("str1.equals(str2): " + str1.equals(str2)); // true (내용 동일)
        System.out.println("str1.hashCode(): " + str1.hashCode());
        System.out.println("str2.hashCode(): " + str2.hashCode());

        System.out.println("str1 == str3: " + (str1 == str3)); // true (동일 객체)
        System.out.println("str1.equals(str3): " + str1.equals(str3)); // true (내용 동일)
    }
}
````

**출력 결과:**

```
str1 == str2: false
str1.equals(str2): true
str1.hashCode(): 99162322
str2.hashCode(): 99162322
str1 == str3: true
str1.equals(str3): true
```

-----

### ✅ 객체 정의 패턴 (POJO): 클래스 설계의 기초

자바에서 일반적인 객체를 정의할 때는 다음과 같은 패턴을 따르는 경우가 많습니다.

  * **`private` 인스턴스 변수**: 객체의 \*\*상태(데이터)\*\*를 저장하는 변수들은 일반적으로 외부에서 직접 접근할 수 없도록 `private` 접근 제한자를 사용합니다. 이는 객체 지향의 **캡슐화(Encapsulation)** 원칙을 따르는 것입니다.
  * **`getter`, `setter` 메소드 정의**: `private` 변수에 안전하게 접근하고 값을 변경할 수 있도록 `public` 메소드인 `getter` (값을 가져옴)와 `setter` (값을 설정함)를 정의합니다.
  * **필드 생성자 (All-args Constructor)**: 객체를 생성할 때 모든 필드의 값을 초기화할 수 있는 생성자입니다.
  * **기본 생성자 (No-args Constructor)**: 매개변수가 없는 생성자로, 객체를 기본 상태로 생성할 때 사용됩니다. 필드 생성자와 함께 오버로딩하여 제공될 수 있습니다.

<!-- end list -->

```java
public class Product {
    // private 인스턴스 변수 (필드)
    private String name;
    private int price;
    private int stock; // 재고 수량 (자주 변하는 값)

    // 기본 생성자
    public Product() {
        // 기본 초기화 로직 (선택 사항)
    }

    // 필드 생성자
    public Product(String name, int price, int stock) {
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    // getter 메소드
    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    // setter 메소드
    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    // toString() 메소드 재정의 (Object 클래스로부터 상속)
    // 객체의 상태를 문자열로 쉽게 확인할 수 있도록 합니다.
    @Override
    public String toString() {
        return "Product{" +
               "name='" + name + '\'' +
               ", price=" + price +
               ", stock=" + stock +
               '}';
    }

    // hashCode() 및 equals() 메소드 재정의 (Object 클래스로부터 상속)
    // 객체의 논리적 동등성을 판단할 때 사용됩니다.
    // 자주 변하는 값(예: stock)은 equals/hashCode 비교에서 제외하는 것이 일반적입니다.
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return price == product.price && // price는 비교에 포함
               name.equals(product.name); // name은 비교에 포함
               // stock은 자주 변하는 값이므로 equals 비교에서 제외하는 경우가 많음
    }

    @Override
    public int hashCode() {
        // name과 price를 기반으로 해시코드 생성
        int result = name.hashCode();
        result = 31 * result + price;
        return result;
        // stock은 hashCode 계산에서 제외하는 경우가 많음
    }
}
```

-----

## `String` 클래스 주요 메소드

자바의 문자열(`String`)은 불변(immutable) 객체이며, 문자열 조작과 분석을 위한 다양한 유용한 메소드를 제공합니다.

  * `char charAt(int index)`: 문자열에서 특정 **인덱스**의 위치에 있는 문자를 리턴합니다.
  * `char[] toCharArray()`: 문자열을 \*\*문자 배열(char[])\*\*로 변환합니다.
  * `String(char[] value)`: `char` 배열을 다시 문자열로 생성합니다.
  * `int indexOf(String searchStr)`: 문자열이 포함되어 있다면 해당 문자열의 **시작 인덱스**를 리턴하고, 포함되어 있지 않으면 `-1`을 리턴합니다.
  * `boolean contains(CharSequence s)`: 문자열이 포함되어 있으면 `true`, 포함되어 있지 않으면 `false`를 리턴합니다.
  * `String substring(int beginIndex)`: `beginIndex`부터 문자열 끝까지의 부분 문자열을 **추출**합니다.
  * `String substring(int beginIndex, int endIndex)`: `beginIndex`부터 `endIndex - 1`까지의 부분 문자열을 추출합니다 (`beginIndex <= 인덱스 < endIndex`).
  * `String replace(CharSequence target, CharSequence replacement)`: 문자열 내에서 `target` 문자열을 `replacement` 문자열로 **교체**합니다.
    ```java
    String str = "자바 프로그래밍은 자바입니다.";
    String newStr = str.replace("자바", "JAVA"); // "JAVA 프로그래밍은 JAVA입니다."
    ```
  * `String trim()`: 문자열의 **양 끝 공백을 제거**합니다.
    ```java
    String str = "             010";
    String newStr = str.trim(); // "010"
    ```

-----

## 포장(Wrapper) 클래스: 기본 타입을 객체로

자바의 **기본(Primitive) 타입**(예: `int`, `double`, `boolean`)은 객체가 아니므로, 객체 지향적인 특성을 가질 수 없고 컬렉션 프레임워크(예: `ArrayList`)에서 직접 사용할 수 없습니다. 이를 해결하기 위해 기본 타입에 해당하는 **포장(Wrapper) 클래스**가 제공됩니다.

  * **박싱(Boxing)**: 기본 타입의 값을 포장 클래스의 객체로 변환하는 과정.
  * **언박싱(Unboxing)**: 포장 클래스의 객체에서 기본 타입의 값을 추출하는 과정.

자바 5부터는 \*\*오토 박싱(Auto-boxing)\*\*과 **오토 언박싱(Auto-unboxing)** 기능이 도입되어 기본 타입과 포장 클래스 간의 변환이 매우 자유로워졌습니다.

**포장 클래스 비교 시 주의사항:**

포장 클래스는 객체이므로 `==` 연산자는 객체의 주소값을 비교합니다. 따라서 `-128`에서 `127` 범위 외의 값은 `==` 비교 시 예상과 다른 결과를 낼 수 있으므로, 반드시 `equals()` 메소드를 사용하여 값을 비교해야 합니다. (JVM이 이 범위의 `Integer` 객체들을 캐싱하기 때문입니다.)

```java
public class WrapperClassExample {
    public static void main(String[] args) {
        // 자동 박싱 (int -> Integer)
        Integer i = 10;
        System.out.println("자동 박싱된 Integer i: " + i);

        // 명시적 박싱 (int -> Integer)
        Integer i2 = new Integer(10); // Deprecated
        System.out.println("명시적 박싱된 Integer i2: " + i2);

        // 자동 언박싱 (Integer -> int)
        int i3 = i2;
        System.out.println("자동 언박싱된 int i3: " + i3);

        // 포장 클래스 비교 시 주의 (== vs equals)
        Integer a = 100;
        Integer b = 100;
        System.out.println("a == b (100): " + (a == b)); // true (캐싱 범위 내)

        Integer x = 200;
        Integer y = 200;
        System.out.println("x == y (200): " + (x == y)); // false (캐싱 범위 밖, 다른 객체)
        System.out.println("x.equals(y) (200): " + x.equals(y)); // true (값 비교)
    }
}
```

**출력 결과:**

```
자동 박싱된 Integer i: 10
명시적 박싱된 Integer i2: 10
자동 언박싱된 int i3: 10
a == b (100): true
x == y (200): false
x.equals(y) (200): true
```

-----

## `Math` 클래스: 수학 계산 유틸리티

`java.lang.Math` 클래스는 수학에서 자주 사용하는 함수들을 제공하는 유틸리티 클래스입니다. 모든 메소드가 **`static` 메소드**로 구성되어 있어, 객체를 생성할 필요 없이 `Math.메소드명()` 형태로 직접 호출하여 사용할 수 있습니다.

  * `Math.round(double a)`: 소수점 첫째 자리에서 **반올림**하여 정수(`long` 또는 `int`)로 리턴합니다.
  * `Math.random()`: `0.0` (포함) 이상 `1.0` (미포함) 미만의 **실수형 난수**(`double`)를 리턴합니다.

<!-- end list -->

```java
public class MathExample {
    public static void main(String[] args) {
        double value = 3.64;
        long roundedValue = Math.round(value); // 3.64를 반올림
        System.out.println(value + "의 반올림 값: " + roundedValue); // 4

        double randomValue = Math.random(); // 0.0 이상 1.0 미만의 난수
        System.out.println("랜덤 값 (0.0 <= x < 1.0): " + randomValue);

        // 1부터 100까지의 정수 난수 생성 예시
        int randomInt = (int) (Math.random() * 100) + 1;
        System.out.println("1부터 100까지의 랜덤 정수: " + randomInt);
    }
}
```

**출력 결과 (예시):**

```
3.64의 반올림 값: 4
랜덤 값 (0.0 <= x < 1.0): 0.7329487...
1부터 100까지의 랜덤 정수: 42
```

-----

## 날짜와 시간 클래스: `Date`, `SimpleDateFormat`, `LocalDate`

자바에서 날짜와 시간을 다루는 방법은 여러 가지가 있습니다. 크게 `java.util.Date` 계열과 자바 8부터 도입된 `java.time` 패키지 계열이 있습니다.

```java
public class DateTimeExample {
	public static void main(String[] args) {
		// 1. java.util.Date (오래된 방식)
		java.util.Date date = new java.util.Date(); // 실행 시점의 날짜, 시간을 리턴 (util 패키지)
		System.out.println("현재 날짜와 시간 (Date): " + date);

		// SimpleDateFormat: Date 객체와 문자열 간 변환 (포매팅/파싱)
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		String str = sdf.format(date); // 날짜시간 객체 -> 문자열 (예: 2025년 04월 15일 화요일)
		System.out.println("SimpleDateFormat으로 포매팅된 날짜: " + str);

		try {
		    str = "2025-04-15";
		    sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			java.util.Date newDate = sdf.parse(str); // 문자열 -> 날짜시간 객체
			System.out.println("문자열로부터 파싱된 Date: " + newDate);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("--------------------");

		// 2. java.time 패키지 (Java 8 이후의 새로운 방식, 권장)
		java.time.LocalDate ld = java.time.LocalDate.now(); // 날짜 정보만 저장 - now() 실행 시점 / of() 특정 날짜
		System.out.println("현재 날짜 (LocalDate): " + ld);
		
		java.time.format.DateTimeFormatter df = java.time.format.DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		str = ld.format(df); // LocalDate 객체 -> 문자열 (예: 2025년 4월 15일)
		System.out.println("DateTimeFormatter로 포매팅된 날짜: " + str);
		
		java.time.LocalDate newLocalDate = java.time.LocalDate.parse(str, df); // 문자열, 포맷팅 규칙으로 파싱
		System.out.println("문자열로부터 파싱된 LocalDate: " + newLocalDate); // newLocalDate.toString()
	}
}
```

**출력 결과 (예시):**

```
현재 날짜와 시간 (Date): Wed Jun 25 14:47:51 KST 2025
SimpleDateFormat으로 포매팅된 날짜: 2025년 06월 25일 수요일
문자열로부터 파싱된 Date: Mon Apr 15 00:00:00 KST 2025
--------------------
현재 날짜 (LocalDate): 2025-06-25
DateTimeFormatter로 포매팅된 날짜: 2025년 06월 25일
문자열로부터 파싱된 LocalDate: 2025-06-25
```

-----

### 📌 요약 정리: 자바 핵심 클래스

| 요소 | 설명 |
|---|---|
| **`Object` 클래스** | 모든 자바 클래스의 **최상위 조상**. 모든 객체가 기본적으로 가지는 `equals()`, `hashCode()`, `toString()` 등의 메소드를 정의. |
| **객체 동등 비교** | `==` (주소 비교)와 `equals()` (내용 비교)로 나뉪. \<br\> `equals()`가 `true`면 `hashCode()`도 같아야 함. |
| **객체 정의 패턴** | `private` 인스턴스 변수, `getter`/`setter` 메소드, 필드/기본 생성자, \<br\> `toString()`/`hashCode()`/`equals()` 재정의를 포함. \<br\> `hashCode()`/`equals()` 재정의 시 자주 변하는 값은 제외 권장. |
| **`String` 클래스** | 불변(immutable) 객체로, 문자열 조작을 위한 다양한 메소드 제공. \<br\> (`charAt`, `indexOf`, `contains`, `substring`, `replace`, `trim` 등) |
| **포장(Wrapper) 클래스** | 기본 타입을 객체로 다루기 위해 사용. \<br\> `Integer`, `Double`, `Boolean` 등. \<br\> **박싱** (기본 → 포장), **언박싱** (포장 → 기본). \<br\> `-128~127` 범위 외 `Integer` 비교 시 `==` 대신 반드시 `equals()` 사용. |
| **`Math` 클래스** | 모든 메소드가 `static`으로 이루어진 수학 관련 유틸리티 클래스. \<br\> (`round`, `random` 등) |
| **날짜/시간 클래스** | `java.util.Date` (구 방식)과 `java.time` 패키지 (Java 8 이후 권장). \<br\> `SimpleDateFormat` / `DateTimeFormatter`를 통해 문자열과 날짜/시간 객체 간 변환 가능. |

-----

### 💡 `Object` 메소드 퀴즈

다음 코드를 실행했을 때, 출력 결과로 가장 적절한 것은 무엇일까요?

```java
class Book {
    String title;
    String author;

    public Book(String title, String author) {
        this.title = title;
        this.author = author;
    }

    // equals와 hashCode는 재정의하지 않음
}

public class BookComparison {
    public static void main(String[] args) {
        Book book1 = new Book("어린 왕자", "앙투안 드 생텍쥐페리");
        Book book2 = new Book("어린 왕자", "앙투안 드 생텍쥐페리");
        Book book3 = book1;

        System.out.println("book1 == book2: " + (book1 == book2));
        System.out.println("book1.equals(book2): " + book1.equals(book2));
        System.out.println("book1 == book3: " + (book1 == book3));
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
출력 결과:<br><br>

book1 == book2: false<br>
book1.equals(book2): false<br>
book1 == book3: true<br>

<br>
설명:
<br>

1.  book1 == book2: new Book(...)을 두 번 호출했으므로, book1과 book2는 서로 다른 메모리 공간에 있는 별개의 객체입니다. 따라서 false가 출력됩니다.<br>
2.  book1.equals(book2): Book 클래스에서 equals() 메소드를 재정의하지 않았습니다. 자바의 모든 클래스는 Object 클래스를 상속받는데, Object 클래스의 equals() 메소드는 기본적으로 == 연산자와 동일하게 객체의 메모리 주소(참조)를 비교합니다. book1과 book2는 다른 객체이므로 false가 출력됩니다.<br>
3.  book1 == book3: book3 = book1 코드를 통해 book3 변수는 book1이 참조하는 동일한 객체를 참조하게 됩니다. 따라서 true가 출력됩니다.

</details>

-----

### 🔚 마치며: 객체지향 심화의 시작

이번 글에서는 자바의 모든 객체가 기반이 되는 `Object` 클래스의 중요성을 이해하고, 객체의 **동등성 비교 (`equals()`와 `hashCode()`)** 원칙에 대해 깊이 있게 다루었습니다. 또한, 실제 자바 클래스를 설계할 때 활용되는 **POJO 패턴**을 익히고, 문자열(`String`), 숫자(`Wrapper`), 수학(`Math`), 날짜/시간(`Date`, `LocalDate`)과 같이 자주 사용되는 핵심 유틸리티 클래스들의 기능과 사용법을 살펴보았습니다.

이러한 내용들은 자바에서 데이터를 올바르게 모델링하고, 효율적으로 처리하며, 안정적인 애플리케이션을 개발하는 데 필수적인 지식입니다. 특히 `equals()`와 `hashCode()`의 올바른 재정의는 컬렉션 사용 시 예상치 못한 문제를 방지하는 데 결정적인 역할을 합니다.