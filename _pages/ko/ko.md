<!-- ---
layout: archive
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
---

## **로렘 기술 블로그에 오신 걸 환영합니다**

**로렘 기술 블로그**의 한국어 섹션에 오신 걸 환영합니다.  
이곳에서는 **자바, 스프링, JPA** 등 다양한 주제에 대해 한국어로 작성된 글들을 보실 수 있습니다.

---

## 최신 포스트

{% assign lang_posts = site.posts | where: "lang", "ko" | slice: 0, 5 %}
{% for post in lang_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %} -->


---
layout: archive
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
---

## **로렘 기술 블로그에 오신 걸 환영합니다**

**로렘 기술 블로그**의 한국어 섹션에 오신 걸 환영합니다.  
이곳에서는 **자바, 스프링, JPA** 등 다양한 주제에 대해 한국어로 작성된 글들을 보실 수 있습니다.

---

## 📘 Java 관련 글
{% assign java_posts = site.posts | where_exp: "post", "post.lang == 'ko' and post.categories contains 'java'" %}
{% for post in java_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}

---

## 🌱 Spring 관련 글
{% assign spring_posts = site.posts | where_exp: "post", "post.lang == 'ko' and post.categories contains 'spring'" %}
{% for post in spring_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}

---

## 🗂️ JPA 관련 글
{% assign jpa_posts = site.posts | where_exp: "post", "post.lang == 'ko' and post.categories contains 'jpa'" %}
{% for post in jpa_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}

---

## 🕒 최신 포스트
{% assign lang_posts = site.posts | where: "lang", "ko" | sort: "date" | reverse | slice: 0, 5 %}
{% for post in lang_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}
