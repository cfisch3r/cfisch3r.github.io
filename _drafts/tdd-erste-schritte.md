---
layout: post
title: TDD Benefits
subtitle: 5 Probleme am Anfang
category: "Agile Methoden"
excerpt_separator: <!--more-->
---

Aller Anfang ist schwer. Das gilt auch für die Testgetriebene Entwicklung. Dabei erscheint diese Met
<!--more-->

Die Probleme beginnen meist schon bei der Auswahl des ersten Tests. Womit fange ich an? Was wäre der erste, einfachste Schritt? Ich beobachte häufig, dass TDD-Neulinge mit dem erstbesten Testfall loslegen, der ihnen in den Sinn kommt, nur um dann festzustellen, dass sie Schwierigkeiten haben, in wenigen Minuten eine funktionierende Implementierung zu schreiben, die den Test grün werden lässt. Diese Sackgasse lässt sich einfach umgehen, indem man sich zu Beginn kurz Zeit nimmt und alle Testfälle sammelt, die einem im den Sinn kommen. Anschließend ordnet man diese Liste nach der Komplexität, die für die jeweilige Implementierung notwendig wäre. jetzt kann man einfach von oben nach unten starten.

In der testgetriebenen Entwicklung startet man konsequenterweise mit den Test. Das führt dazu, dass wir im ersten Test Produktivcode aufrufen, der noch nicht existiert. Wir sind damit im roten Bereich, das heißt, der Code ist nicht lauffähig. Bevor wir also den Test weiterschreiben und das Assert-Statement hinzufügen, müssen wir erst wieder in einen funktionierenden Zustand kommen. Das heißt, wir müssen genügend Produktivcode schreiben, so dass es keine Compilerwarnungen mehr gibt. Die meisten IDEs bieten dafür komfortable Shortcuts an, mit denen sich der nötige Code generieren lässt. Sobald wieder alles wieder läuft, können wir mit dem Testcode weitermachen.

