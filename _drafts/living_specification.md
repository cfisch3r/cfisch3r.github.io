---
layout: post
title: Living Specification
subtitle: mit JGiven
category: "TDD"
fb-img: /images/media/posts/testcoverage.png
ref: living_specification
description: ""
excerpt_separator: <!--more-->
---



<!--more-->


Vor einigen Jahren arbeitete ich zusammen mit meinem Team an der Weiterentwicklung eines Webportals, als dort eine umfangreiche Überarbeitung der Suchmaschinenoptimierung anstand. Der neu eingestellte SEO-Experte hatte bereits zahlreiche Verbesserungen identifiziert, insbesondere hinsichtlich der Generierung der Seiten-URLs, denn die sind für das Ranking in den Suchmaschinen von entscheidender Bedeutung. Als wir uns daran machten, seine User Stories zu implementieren, stießen wir jedoch auf unerwartete Probleme. Die neuen Generierungsregeln waren zwar in sich alle schlüssig, doch in Kombination mit der bereits in der bestehenden Codebasis vorhandenen URL-Logik ergaben sich immer wieder Sonderfälle, die wir vorher nicht bedacht hatten. Das erforderte dann weitere Klärungsrunden und führte schließlich dazu, dass wir viel länger als geschätzt für die Umsetzung brauchten. Hinzu kam, dass uns einige Grenzfälle durchrutschten und dann erst in der Produktion auffielen. Als wir schließlich in der Retrospektive nach den Problemursachen suchten, mussten wir feststellen, dass niemand mehr, weder Fachbereich noch Entwickler, das Regelwerk zur URL-Generierung in seiner Gesamtheit überblickte. Wir waren also nicht mehr in der Lage, neue Anforderungen zu formulieren, die sich widerspruchsfrei in die bestehende Anwendung integrieren lassen.

Dieses Problem ist, wie ich feststellen musste, leider kein Einzelfall.
Denn je länger eine Software entwickelt wird, umso komplexer wird üblicherweise die darin abgebildete Fachlogik. Gerade wenn wir im agilen Umfeld unterwegs sind, wo wir immer wieder in kleinen Schritten die Funktionalität erweitern, ist es wichtig, neue User Storys vor dem Hintergrund des fachlichen Gesamtkontextes betrachten, um die Konsistenz zu bewahren. Unter anderen müssen wir uns immer wieder diese Fragen stellen:

* Stehen die neuen Regeln im Widerspruch zu den bereits bestehenden?
* Ergeben alle Regeln zusammen ein in sich schlüssiges, fachliches Modell?
* Welche Grenzfälle gibt es und wie ist das gewünschte Verhalten?

Um hierauf Antworten finden zu können, brauchen wir eine aktuelle, eindeutige und vollständige Beschreibung des fachlichen Verhaltens unserer Software. Doch woher kommt diese? Wer erstellt, pflegt und verifiziert sie? Die Antwort ist, wie immer in der agilen Welt: Das Team! :-)

Stellt sich nur die Frage, wie wir das am besten tun. Und hier kommt nun Specification by Example ins Spiel.

## Ein Beispiel

Die Grundidee ist einfach. Wir beschreiben das gewünschte Verhalten unserer Software anhand konkreter Beispiele.
Wie so etwas aussehen kann, möchte ich anhand eines Katas zeigen. Es geht dabei um einen Software, die einmal täglich den Warenbestand eines Geschäfts aktualisiert, indem sie die Qualität und das Verfallsdatum der Produkte im Lager anpasst. die vollständige fachliche Beschreibung findet Ihr [hier](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt).

Greifen wir uns mal die generellen Geschäftsregeln für die Aktualisierung heraus:
* Alle Waren haben einen "SellIn"-Wert, der die Anzahl der Tage angibt, innerhalb derer die Ware verkauft werden muss.
* Alle Waren haben einen "Quality"-Wert, der den Wert der Ware angibt.
* Am Ende jeden Tages reduziert das System beide Werte für alle Waren.
* Wenn das "SellIn"-Datum vorbei ist, reduziert sich der "Quality"-Wert doppelt so schnell.
* Der "Quality"-Wert ist niemals negativ.

Spezifizieren wir diese Anforderungen nun in Form von Beispielen.

```
# Qualitätsaktualisierung
Gegeben ist	eine Ware mit "Sellin"-Wert von 5 und "Quality"-Wert von 8  
Wenn	die Waren aktualisiert werden
Dann ist der "Quality"-Wert der Ware 7.

# Haltbarkeitsaktulisierung
Gegeben ist	eine Ware mit "Sellin"-Wert von 5 und "Quality"-Wert von 8  
Wenn	die Waren aktualisiert werden
Dann ist der "Sellin"-Wert der Ware 4.

# Qualität nach Ablauf des Sellin-Datum
Gegeben ist	eine Ware mit "Sellin"-Wert von -1 und "Quality"-Wert von 8  
Wenn	die Waren aktualisiert werden
Dann ist der "Quality"-Wert der Ware 6.

# Qualität ist niemals negativ
Gegeben ist	eine Ware mit "Sellin"-Wert von -1 und "Quality"-Wert von 0  
Wenn	die Waren aktualisiert werden
Dann ist der "Quality"-Wert der Ware 0.
```

Was haben wir nun mit diesem Ansatz gegenüber der vorherigen Formulierung der Regeln gewonnen. Aus meiner Sicht lassen sich drei wesentliche Ziele einer guten Spezifikation damit erreichen:

Eineindeutigkeit
Allgemein formulierte Geschäftsregeln lassen oft Spielraum zur Interpretation. Beispiele dagegen zwingen mich, konkret zu werden. Die Wahrscheinlichkeit, dass es zu Missverständnissen zwischen Anforderern und Umsetzern kommt, sinkt dadurch, oder, wie es Dr. Peter Hruschka so schön formulierte:
„Denn manchmal sind drei gute Beispiele besser für das Verständnis der Anforderungen als eine schlechte Abstraktion.“

Sprache
Beispiele drücken das gewünschte Verhalten der Software aus, mit dem ein fachlicher Nutzen erreicht wird. Sie schlagen also eine sprachliche Brücke von dem zu lösenden Problem zu der zu implementierenden Lösung.
Das unterstützt die Kommunikation zwischen den Fach- und Technikexperten in der Produktentwicklung.

Überprüfbarkeit
Als Entwickler ist es unsere Pflicht, nachzuweisen, dass die Software den Anforderungen genügt. Am einfachsten gelingt uns das durch Tests, die wir aus den Beispielen ableiten. Wir erhalten auf diese Weise eine automatisch überprüfbare Spezifikation.



## Fazit
