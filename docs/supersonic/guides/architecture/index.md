---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: architecture
---

<section class="docs-section" id="overview">
# Building blocks of a Supersonic application

Supersonic applications utilize the Multi-Page App architecture where all your views and controllers are neatly divided into separate HTML and JS documents. This allows for a clear, modular, MVC-based project file structure, superior memory management, easier bug reproduction, and much more.

## Application architecture

To learn how a Supersonic app is built, where to place your content, and how to effectively build Multi-Page Applications go to
the [basic architecture guide][architecture]

## Cross-view communication

To effectively use the Supersonic Multi-Page App architecture, you need to be able to share data between various parts of your application. Since a MPA is split into multiple separate WebViews, the techniques used are slightly different – but still awesome.
 Learn about different kind of solutions to share data between different views from [cross-view communication guide][communication].

</section>

[architecture]: /supersonic/guides/architecture/app-architecture/

[communication]: /supersonic/guides/architecture/communication