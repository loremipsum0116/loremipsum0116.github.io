---
layout: archive
title: "한국어 섹션"
permalink: /ko/
lang: ko
author_profile: true
---

## **로렘 기술 블로그에 오신 것을 환영합니다**

이곳은 **로렘 기술 블로그**의 한국어 섹션입니다.  
**Java**, **Spring**, **JPA** 등의 주제로 작성된 글들을 한국어로 만나보실 수 있습니다.

---
카테고리별로 기술 글들을 확인해보세요:

- [Java](/ko/categories/java/)
- [JPA](/ko/categories/jpa/)
- [Spring](/ko/categories/spring/)

---
## 🆕 최신 글

{% assign lang_posts = site.posts | where: "lang", "ko" | sort: "date" | reverse | slice: 0, 5 %}
{% for post in lang_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}


