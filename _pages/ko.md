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

{% assign java_posts = site.posts | where: "lang", "ko" | where: "categories", "java" %}
{% if java_posts.size > 0 %}
<ul>
  {% for post in java_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date: "%Y-%m-%d" }})</li>
  {% endfor %}
</ul>
{% else %}
<p>아직 등록된 Java 관련 글이 없습니다.</p>
{% endif %}

---

## 🌱 Spring 관련 글

{% assign spring_posts = site.posts | where: "lang", "ko" | where: "categories", "spring" %}
{% if spring_posts.size > 0 %}
<ul>
  {% for post in spring_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date: "%Y-%m-%d" }})</li>
  {% endfor %}
</ul>
{% else %}
<p>아직 등록된 Spring 관련 글이 없습니다.</p>
{% endif %}

---

## 🗂️ JPA 관련 글

{% assign jpa_posts = site.posts | where: "lang", "ko" | where: "categories", "jpa" %}
{% if jpa_posts.size > 0 %}
<ul>
  {% for post in jpa_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date: "%Y-%m-%d" }})</li>
  {% endfor %}
</ul>
{% else %}
<p>아직 등록된 JPA 관련 글이 없습니다.</p>
{% endif %}

---

## 🕒 최신 포스트

{% assign lang_posts = site.posts | where: "lang", "ko" | sort: "date" | reverse | slice: 0, 5 %}
{% if lang_posts.size > 0 %}
<ul>
  {% for post in lang_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date: "%Y-%m-%d" }})</li>
  {% endfor %}
</ul>
{% else %}
<p>등록된 게시물이 없습니다.</p>
{% endif %}
