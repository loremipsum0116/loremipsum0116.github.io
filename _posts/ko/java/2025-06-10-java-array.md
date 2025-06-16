---
title: "자바 참조타입 - 일차원 배열"
date: 2025-06-16 16:38:46 +09:00
categories: [java]
lang: ko
locale: ko
words_per_minute: 30
---

## 자바의 데이터 타입: 기본 타입과 **참조 타입**

자바의 데이터 타입은 크게 \*\*기본 타입(Primitive Type)\*\*과 \*\*참조 타입(Reference Type)\*\*으로 나뉩니다. 기본 타입이 실제 값을 변수 내부에 직접 저장하는 반면, 참조 타입은 실제 객체(데이터)가 저장된 메모리 공간의 \*\*주소(번지)\*\*를 변수에 저장합니다. 이 주소를 통해 실제 객체에 접근하게 되므로 '참조'라는 이름이 붙었습니다.

일반적으로 클래스, 인터페이스, 배열, 열거(enum) 타입 등이 참조 타입에 해당합니다. `String` 타입도 문자열 객체를 참조하므로 참조 타입입니다.

**기본 타입 예시**: `int`, `double`, `boolean`, `char` 등
**참조 타입 예시**: `String`, 배열(`int[]`, `String[]`), `Scanner`, `List` 등

-----

## 자바 **일차원 배열**

배열(Array)은 **동일한 타입의 값들을 하나의 변수에 묶어서 저장하는 연속적인 메모리 공간**입니다. 특히 일차원 배열은 가장 기본적인 배열 형태로, 데이터들이 일렬로 나열된 구조를 가집니다.

### ✅ 배열 선언 및 생성

배열은 선언과 동시에 크기를 지정하여 생성하거나, 나중에 생성할 수 있습니다.

```java
// 1. 배열 선언만 하기
int[] scores; // int 타입의 배열을 참조할 변수 scores 선언
String[] names; // String 타입의 배열을 참조할 변수 names 선언

// 2. 배열 선언과 동시에 생성 (크기 지정)
int[] numbers = new int[5]; // 5개의 int 값을 저장할 수 있는 배열 생성. 초기값은 0
String[] fruits = new String[3]; // 3개의 String 값을 저장할 수 있는 배열 생성. 초기값은 null

// 3. 배열 선언과 동시에 초기화
// 배열의 크기는 초기화하는 값의 개수에 따라 자동으로 결정됩니다.
int[] ages = {20, 21, 22, 23}; // 4개의 int 값을 가지는 배열 생성
String[] colors = {"Red", "Green", "Blue"}; // 3개의 String 값을 가지는 배열 생성
```

### ✅ 배열 요소 접근

배열의 각 요소는 `배열이름[인덱스]` 형식으로 접근합니다. **배열의 인덱스는 0부터 시작**합니다.

```java
int[] arr = {10, 20, 30};

System.out.println(arr[0]); // 첫 번째 요소: 10
System.out.println(arr[1]); // 두 번째 요소: 20
System.out.println(arr[2]); // 세 번째 요소: 30

arr[1] = 25; // 두 번째 요소의 값을 20에서 25로 변경
System.out.println(arr[1]); // 변경된 값 출력: 25
```

-----

## 일차원 배열 값 `for`문 이용하여 출력하기

배열의 모든 요소를 순회하며 출력할 때는 `for`문을 사용하는 것이 일반적입니다. 배열의 길이를 나타내는 `length` 속성을 활용합니다.

```java
public class PrintArrayWithFor {
    public static void main(String[] args) {
        int[] scores = {85, 92, 78, 60, 95};

        System.out.println("--- 일반 for문을 이용한 배열 출력 ---");
        for (int i = 0; i < scores.length; i++) { // scores.length는 배열의 길이 (5)
            System.out.println("scores[" + i + "] = " + scores[i]);
        }

        System.out.println("\n--- 향상된 for문을 이용한 배열 출력 ---");
        // 향상된 for문 (for-each 루프)은 배열의 모든 요소를 순차적으로 접근할 때 유용합니다.
        for (int score : scores) {
            System.out.println("점수: " + score);
        }
    }
}
```

**출력 결과:**

```
--- 일반 for문을 이용한 배열 출력 ---
scores[0] = 85
scores[1] = 92
scores[2] = 78
scores[3] = 60
scores[4] = 95

--- 향상된 for문을 이용한 배열 출력 ---
점수: 85
점수: 92
점수: 78
점수: 60
점수: 95
```

-----

### 💡 배열 기초 퀴즈

다음 코드를 실행했을 때, 어떤 결과가 출력될까요?

```java
public class ArrayQuiz {
    public static void main(String[] args) {
        char[] greetings = {'H', 'e', 'l', 'l', 'o'};
        System.out.print(greetings[4]);
        System.out.print(greetings[1]);
        System.out.print(greetings[3]);
        System.out.print(greetings[3]);
        System.out.print(greetings[0]);
    }
}
```

<details>
<summary>정답 보기</summary>
<br>
정답은: olleh
<br>
설명:<br>
배열의 인덱스는 0부터 시작합니다.
greetings[4]는 'o' (인덱스 4)
greetings[1]는 'e' (인덱스 1)
greetings[3]는 'l' (인덱스 3)
greetings[3]는 'l' (인덱스 3)
greetings[0]는 'H' (인덱스 0)

따라서 출력되는 순서는 'o', 'l', 'l', 'e', 'H'가 됩니다. System.out.print는 줄바꿈을 하지 않으므로 모두 한 줄에 이어서 출력됩니다.
<br>

</details>

-----

## 배열 값 출력 - 랜덤값으로 초기화

배열을 생성한 후, `Math.random()` 함수 등을 이용하여 배열의 각 요소를 무작위 값으로 초기화할 수 있습니다.

```java
import java.util.Random; // Random 클래스 사용을 위해 임포트

public class RandomArrayInitialization {
    public static void main(String[] args) {
        int[] randomNumbers = new int[10]; // 크기가 10인 정수형 배열 생성
        Random rand = new Random(); // Random 객체 생성

        System.out.println("--- 랜덤값으로 초기화된 배열 ---");
        for (int i = 0; i < randomNumbers.length; i++) {
            // 0부터 99까지의 랜덤 정수를 생성하여 배열에 저장
            randomNumbers[i] = rand.nextInt(100); 
            System.out.println("randomNumbers[" + i + "] = " + randomNumbers[i]);
        }
    }
}
```

**출력 예시 (실행할 때마다 다름):**

```
--- 랜덤값으로 초기화된 배열 ---
randomNumbers[0] = 45
randomNumbers[1] = 73
randomNumbers[2] = 12
randomNumbers[3] = 88
randomNumbers[4] = 5
randomNumbers[5] = 91
randomNumbers[6] = 29
randomNumbers[7] = 67
randomNumbers[8] = 3
randomNumbers[9] = 54
```

-----

## 배열에서 최대/최소 구하기

배열에 저장된 값들 중에서 가장 크거나 작은 값을 찾으려면, 반복문을 사용하여 배열의 모든 요소를 순회하며 현재까지의 최대/최소값과 비교하여 갱신하는 방법을 사용합니다.

```java
public class FindMinMaxInArray {
    public static void main(String[] args) {
        int[] numbers = {45, 73, 12, 88, 5, 91, 29, 67, 3, 54};

        // 초기값 설정: 배열의 첫 번째 요소를 최대값과 최소값으로 가정합니다.
        int max = numbers[0]; 
        int min = numbers[0];

        // 배열의 두 번째 요소부터 끝까지 순회
        for (int i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i]; // 현재 요소가 max보다 크면 max 갱신
            }
            if (numbers[i] < min) {
                min = numbers[i]; // 현재 요소가 min보다 작으면 min 갱신
            }
        }

        System.out.println("배열 요소: " + java.util.Arrays.toString(numbers));
        System.out.println("최대값: " + max);
        System.out.println("최소값: " + min);
    }
}
```

**출력 결과:**

```
배열 요소: [45, 73, 12, 88, 5, 91, 29, 67, 3, 54]
최대값: 91
최소값: 3
```

-----

## 중복 없는 배열 만드는 방법

중복 없는 요소를 가지는 배열을 만들려면, 주로 `Set` 컬렉션을 활용하거나, 배열에 값을 추가하기 전에 이미 존재하는 값인지 확인하는 로직을 구현합니다. `Set`은 본질적으로 중복을 허용하지 않는 컬렉션이므로, 중복 제거에 매우 유용합니다.

### 1\. `Set`을 활용하는 방법 (가장 일반적이고 효율적)

임의의 정수형 배열에 중복된 값이 있을 경우, `HashSet`을 사용하여 중복을 제거하고 다시 배열로 변환하는 예시입니다.

```java
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.ArrayList; // ArrayList를 사용하여 Set의 요소를 다시 리스트로 변환

public class UniqueArrayWithSet {
    public static void main(String[] args) {
        int[] originalArray = {1, 2, 3, 2, 4, 1, 5, 3};

        // 1. HashSet 생성 및 배열 요소 추가: HashSet은 중복을 자동으로 제거합니다.
        Set<Integer> uniqueElements = new HashSet<>();
        for (int number : originalArray) {
            uniqueElements.add(number); // 중복된 값은 추가되지 않음
        }

        // 2. Set의 요소를 다시 배열로 변환 (또는 List로 변환)
        // Set의 크기만큼 새로운 배열 생성
        int[] uniqueArray = new int[uniqueElements.size()];
        int index = 0;
        for (int number : uniqueElements) {
            uniqueArray[index++] = number;
        }
        
        System.out.println("원본 배열: " + Arrays.toString(originalArray));
        System.out.println("중복 제거된 배열 (Set 사용): " + Arrays.toString(uniqueArray));

        // 또는 ArrayList로 변환하여 사용:
        // List<Integer> uniqueList = new ArrayList<>(uniqueElements);
        // System.out.println("중복 제거된 리스트 (Set 사용): " + uniqueList);
    }
}
```

**출력 결과 (Set의 순서는 보장되지 않음):**

```
원본 배열: [1, 2, 3, 2, 4, 1, 5, 3]
중복 제거된 배열 (Set 사용): [1, 2, 3, 4, 5]
```

### 2\. 반복문과 조건문을 활용하는 방법 (직접 구현)

`Set`을 사용하지 않고 직접 중복을 확인하며 배열에 추가하는 방법입니다. 이 방법은 일반적으로 `Set`을 사용하는 것보다 복잡하고 성능상 불리할 수 있습니다.

```java
import java.util.Arrays;

public class UniqueArrayManual {
    public static void main(String[] args) {
        int[] originalArray = {1, 2, 3, 2, 4, 1, 5, 3};
        int[] tempUniqueArray = new int[originalArray.length]; // 최대 크기로 임시 배열 생성
        int uniqueCount = 0; // 중복 없는 요소의 실제 개수

        for (int i = 0; i < originalArray.length; i++) {
            boolean isDuplicate = false;
            // 현재 요소가 이미 uniqueCount까지의 tempUniqueArray에 있는지 확인
            for (int j = 0; j < uniqueCount; j++) {
                if (originalArray[i] == tempUniqueArray[j]) {
                    isDuplicate = true;
                    break; // 중복 발견, 더 이상 확인할 필요 없음
                }
            }
            if (!isDuplicate) {
                tempUniqueArray[uniqueCount++] = originalArray[i]; // 중복이 아니면 추가
            }
        }
        
        // 실제 중복 없는 요소의 개수만큼만 새 배열 생성
        int[] uniqueArray = Arrays.copyOf(tempUniqueArray, uniqueCount);

        System.out.println("원본 배열: " + Arrays.toString(originalArray));
        System.out.println("중복 제거된 배열 (수동 구현): " + Arrays.toString(uniqueArray));
    }
}
```

**출력 결과:**

```
원본 배열: [1, 2, 3, 2, 4, 1, 5, 3]
중복 제거된 배열 (수동 구현): [1, 2, 3, 4, 5]
```

-----

### 🔚 마치며

이번 글에서는 자바의 참조 타입 개념을 시작으로, 가장 기본적인 데이터 구조인 **일차원 배열**에 대해 알아보았습니다. 배열의 선언, 초기화, 그리고 `for`문을 활용하여 배열의 요소를 효율적으로 출력하는 방법, 랜덤값으로 배열을 초기화하고 최대/최소값을 찾는 방법까지 다루었습니다.

특히, **중복 없는 배열을 만드는 방법**에서는 `Set` 컬렉션을 활용하는 효율적인 방법과 직접 반복문을 통해 중복을 제거하는 방법을 비교하여 제시했습니다. 각 상황에 맞는 적절한 방법을 선택하여 코드를 작성하는 것이 중요합니다.

