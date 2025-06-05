---
layout: default
title: "English Section"
permalink: /en/
lang: en
author_profile: true
---

{% assign en_posts = site.posts | where: "lang", "en" %}
{% assign pinned = en_posts | where: "pinned", true %}
{% assign recent = en_posts | where_exp: "post", "post.pinned != true" | sort: "date" | reverse | slice: 0, 5 %}

{%- if pinned.size > 0 %}
## 📌 Pinned Post
{% for post in pinned %}
<article>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p><small>{{ post.date | date: "%B %d, %Y" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
{%- endif %}

---

## 📝 Recent Posts (5)

{% for post in recent %}
<article>
  <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
  <p><small>{{ post.date | date: "%B %d, %Y" }}</small></p>
  {{ post.excerpt }}
</article>
{% endfor %}
