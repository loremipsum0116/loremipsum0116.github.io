---
layout: archive
title: "English Section"
permalink: /en/
lang: en
author_profile: true
---

## **Welcome to Lorem Tech Blog**

Welcome to the English section of **Lorem Tech Blog**.  
Here you’ll find articles written in English on topics such as **Java**, **Spring**, and **JPA**.

---

## 🆕 Latest Posts

{% assign lang_posts = site.posts | where: "lang", "en" | slice: 0, 5 %}
{% for post in lang_posts %}
- [{{ post.title }}]({{ post.url }}) ({{ post.date | date: "%Y-%m-%d" }})
{% endfor %}
