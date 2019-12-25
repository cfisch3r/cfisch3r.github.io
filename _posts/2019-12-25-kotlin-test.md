---
layout: post
title: KotlinTest
subtitle: Mein erster Eindruck
category: "TDD"
fb-img: /images/media/posts/kotlintest.png
ref: kotlintest_firstimpression
description: "Meine ersten Eindrücke mit KotlinTest"
excerpt_separator: <!--more-->
---

Katas eignen sich nicht nur dazu, seine TDD-Fertigkeiten zu trainieren. Man kann sie auch dazu nutzen, sich mit neuen Sprachen und Testframeworks auseinanderzusetzen. Genau das habe ich getan, als ich mir eine der Aufgaben aus dem diesjährigen Advent of Code vornahm. Statt der üblichen Kombination aus Java und Junit5 kamen diesmal Kotlin und KotlinTest zum Einsatz und ich bin, soviel sei hier schon verraten, begeistert. Schon beim ersten Versuch konnte ich meine Tests in einer Ausdrucksstärke schreiben, wie ich sie mit den bisherigen Frameworks, die ich verwendet habe, nie in der Lage war, zu erreichen.

<!--more-->

Für den ersten Einsatz von KotlinTest habe ich mich für ein einfaches Kata entschieden, bei dem eine Berechnungsfunktion entwickelt werden musste. Die Aufgabenbeschreibung sowie den Code findet ihr im [Github-Repository](https://github.com/cfisch3r/orbitmap). Folgende Dinge sind mir dabei aufgefallen.

## Dokumentation & Setup  
Um den ersten Test schreiben zu können, habe ich nur wenige Minuten gebraucht. Die [Startseite des Frameworks](https://github.com/kotlintest/kotlintest) enthält kurz und knapp alles, was man für den Start benötigt. Schnell noch eine Abhängigkeit im Gradlefile eingebunden und schon kann es losgehen.

## Ausdrucksstärke
Als Methodennamen der Tests können Strings verwendet werden. CamelCase-Bandwürmer oder zusätzliche DisplayName-Annotationen sind damit überflüssig.

![Kotlin Test Beispiel](/images/stage/posts/kotlintest.png)

Je nach Art meiner Tests kann ich den jeweiligen [Testtyp](https://github.com/kotlintest/kotlintest/blob/master/doc/styles.md) wählen (z.B. Behaviour oder Specification Style). Und dank des Extension-Features von Kotlin lassen sich die Assertions nahezu natürlichsprachlich schreiben.

## Features
Auf den ersten Blick habe ich nichts vermisst, was ich von einem modernen Testframework erwarten würde. Out of the Box sind alle gängigen Features enthalten, wie **Nesting, Property Based Testing, Parametrisierte Tests, Exception Testing, Listeners und Parallele Testausführung**.

## Integration
Da Kotlin von Jet Brains entwickelt wurde, überrascht es nicht, dass die Testausführung und Ergebnisanzeige in Intellij genauso komfortabel wie bei Junit ist. Auch von der Ausführungsgeschwindigkeit her konnte ich keinen Unterschied feststellen.

## Fazit
Wie eingangs schon erwähnt, hat mich der erste Eindruck von KotlinTest mehr als überzeugt. Einfach in der Handhabung und extrem ausdrucksstark bringt es alle Funktionen mit, die ich bei meiner tägliche Arbeit, wenn ich testgetrieben entwickle, benötige. Ich werde das Framework sicherlich in nächster Zeit noch häufiger einsetzen und kann mir sogar vorstellen, dass es dann Junit in meinen Projekten ablösen wird.
