---
layout: post
title: Living Specification
subtitle: Tests als Dokumentation
category: "TDD"
fb-img: /images/media/posts/test_as_doc.png
ref: living_specification
description: ""
excerpt_separator: <!--more-->
---
Wir entwickeln immer umfangreichere und komplexere Software. Gleichzeitig müssen neue Anforderungen schnell evaluiert und integriert werden, ohne dass ungewünschte Nebeneffekte auftauchen oder Nacharbeiten notwendig werden. Glücklich, wer da eine aktuelle und genaue Dokumentation seiner Applikation zur Hand hat. Doch der Aufwand hierfür steht meist in keinem Verhältnis zum Nutzen. Das muss aber nicht unbedingt so sein!
Wer ein paar simple Regeln befolgt, kann einfach seine Tests als Dokumentation nutzen.

<!--more-->

## Durchblick gefragt
Vor einigen Jahren arbeitete ich zusammen mit meinem Team an der Weiterentwicklung eines Webportals, als dort eine umfangreiche Überarbeitung der Suchmaschinenoptimierung anstand. Der neu eingestellte SEO-Experte hatte bereits zahlreiche Verbesserungen identifiziert, insbesondere hinsichtlich der Generierung der Seiten-URLs, denn die sind für das Ranking in den Suchmaschinen von entscheidender Bedeutung. Als wir uns daran machten, seine User Stories zu implementieren, stießen wir jedoch auf unerwartete Probleme. Die neuen Generierungsregeln für URLs waren zwar in sich alle schlüssig, doch in Kombination mit der bereits in der bestehenden Codebasis vorhandenen URL-Logik ergaben sich immer wieder Sonderfälle, die wir vorher nicht bedacht hatten. Das erforderte dann weitere Klärungsrunden und führte schließlich dazu, dass wir viel länger als geschätzt für die Umsetzung brauchten. Hinzu kam, dass uns einige Grenzfälle durchrutschten und dann erst in der Produktion auffielen. Als wir schließlich in der Retrospektive nach den Problemursachen suchten, mussten wir feststellen, dass niemand mehr, weder Fachbereich noch Entwickler, das Regelwerk zur URL-Generierung in seiner Gesamtheit überblickte. Wir waren also nicht mehr in der Lage, neue Anforderungen zu formulieren, die sich widerspruchsfrei in die bestehende Anwendung integrieren lassen.

## Konsistenz braucht Dokumentation
Dieses Problem ist, wie ich feststellen musste, leider kein Einzelfall.
Denn je länger eine Software entwickelt wird, umso komplexer wird üblicherweise die darin abgebildete Fachlogik. Gerade wenn wir im agilen Umfeld unterwegs sind, wo wir immer wieder in kleinen Schritten die Funktionalität erweitern, ist es wichtig, neue User Storys vor dem Hintergrund des fachlichen Gesamtkontextes betrachten zu können, um die Konsistenz zu bewahren. Unter anderen müssen wir uns immer wieder diese Fragen stellen:

* Stehen die neuen Regeln im Widerspruch zu den bereits bestehenden?
* Ergeben alle Regeln zusammen ein in sich schlüssiges, fachliches Modell?
* Welche Grenzfälle gibt es und wie ist das gewünschte Verhalten?

Um hierauf Antworten finden zu können, brauchen wir eine aktuelle, eindeutige und vollständige Beschreibung des fachlichen Verhaltens unserer Software. Doch woher kommt diese?

## User Stories sind keine Dokumentation
Einige Teams, die ich kenne, versuchen das Problem zu lösen, indem sie ihre User Stories - meist in Form von Jira-Tickets - als fachliche Dokumentation nutzen. Es ist aber schwierig, wenn nicht unmöglich, aus dieser Vielzahl einzelner Änderungswünsche ein konsistentes Bild der implementierten Fachlichkeit zusammenzupuzzlen. Um die vollständige Beschreibung einer Funktionalität zu erhalten, bleibt mir meist nichts kein anderer Weg als eine Volltextsuche. Das ist mühselig und birgt die Gefahr, dass ich etwas Wesentliches übersehe, insbesondere, wenn  sich Anforderungen über die Zeit geändert haben und die chronologische Reihenfolge der User Stories ein Rolle spielt.

## Tests als Lebende Spezifikation
Dabei haben wir, wenn wir testgetrieben entwickeln, bereits eine sehr detaillierte Beschreibung unserer Software; unsere Tests sind nämlich nichts anderes als eine lebende Spezifikation des gewünschte Verhalten unserer Software und erfüllen darüber hinaus die [wichtigsten Merkmale einer guten Dokumentation]({% post_url 2019-03-27-dokumentationsstrategie %}).

prägnant
: Tests spezifizieren mit Hilfe konkreter Nutzungsbeispiele und beugen so Missverständnissen vor. Da sie durch die Testpyramide in unterschiedliche Scopeebenen aufgeteilt sind, kann der Leser darüber hinaus immer den für ihn erforderlichen Detailgrad wählen, ohne sich durch die komplette Spezifikation arbeiten zu müssen.

aktuell
: Da Tests zeitgleich mit der Implementierung entstehen, geben sie auch immer den aktuellen Implementierungsstand wieder, egal ob es sich um die Version handelt, die in Produktion läuft oder die, die gerade auf die Abnahme durch den Fachbereich wartet. Außerdem werden durch Test definierte Spezifikationen im Rahmen der CI/CD-Pipeline regelmäßig gegen die Applikation verifiziert.

zugänglich
: Testreports lassen sich auf einfache Art und Weise automatisiert erzeugen und als statische Webseiten allen Stakeholdern zugänglich machen. Für die Entwickler ist es sogar noch einfacher, da sich die Tests im selben Repository wie der Produktivcode befinden. Über die IDE können die Entwickler so komfortabel in die Dokumentation zugreifen. Mehr noch: Da die Tests den Produktivcode aufrufen, ist es möglich, durch diese Beziehung auf direktem Weg von der Implementierung in die Spezifikation zu wechseln.

## Best Practices

Was muss ich nun tun, um meine Test als Spezifikation nutzen zu können?

1. **Verhalten beschreiben**  
Tests sollten so formuliert werden, dass sie das gewünschte Verhalten und nicht die Implementierung beschreiben. Haben wir beispielsweise eine Komponente, die einen Text anhand einer vorgegeben Zeilenlänge umbricht, sollte der Test nicht einfach nur `testTextWrap` heißen. Es sollte stattdessen die konkrete Fachlogik erkennbar sein. Ein guter Testname wäre beispielsweise `it breaks text with space immediately after limit and skips space`. Die vollständige Testliste für dieses Beispiel findet Ihr [hier](https://github.com/cfisch3r/wordwrap/blob/master/test/wordwrap_test.js).

2. **Fachsprache verwenden**  
Während der Produktivcode den Lösungsraum der Applikation darstellt, spezifizieren unsere Tests den Problemraum der Anforderungen. Daher sollten wir bei der Testformulierung die Sprache der Fachdomäne wählen, um so allen Stakeholder das Verständnis unserer Dokumentation zu erleichtern. Wenn wir Domain Driven Design einsetzen, können wir hierfür die Ubiquitous Language verwenden, die wir gemeinsam mit der Fachseite entwickelt haben.

3. **Fachlichen Kontext verknüpfen**  
Tests beschreiben, wie sich unsere Software verhalten soll. Um die fachlichen Zusammenhänge und konzeptionellen Hintergründe verstehen zu können, brauche wir aber mehr Informationen, nämlich neben dem Was auch das Warum. Dazu können wir entweder aus den Tests heraus auf entsprechende Dokumente verweisen, oder aber die Testbeschreibungen in ein fachliches Dokument eingliedern.  

4. **Dokumentation veröffentlichen**  
Dokumentation erzeugt nur dann einen Wert, wenn sie auch genutzt wird. Daher ist es essentiell, diese in ihrer aktuellsten Version einfach zugänglich zu machen, so dass wir sie ohne Aufwand jederzeit nutzen können, sei es als Nachschlagewerk in Refinementterminen oder als Referenzen in User Stories. Am einfachsten lässt sich das erreichen, indem wir nach erfolgreichen Testdurchlauf in Zuge unseres Continuous-Delivery/Deployment-Prozesses die Dokumentation generieren und als statische Website veröffentlichen.

## Werkzeuge
Für Dokumentationszwecke besonders gut eignen sich Frameworks, die aus dem Testcode natürlichsprachliche Reports erzeugen. Junit 5 beispielsweise bietet hierfür besondere [Feature](https://junit.org/junit5/docs/current/user-guide/#writing-tests-display-names) in Form der `@DisplayName`-Annotation und der `DisplayNameGenerator`-Klassen.

Möchte man zusätzlich zum Verhalten auch noch das Nutzungsszenario dokumentieren, bieten sich BDD-Frameworks an, die Spezifikationen in Form des [Gherkin](https://cucumber.io/docs/gherkin/reference/)-Schemas ermöglichen. Ein Beispiel findet Ihr in meinem [Artikel zu JGiven]({% post_url 2020-01-20-simple-bdd-mit-jgiven %}).

Zur Beschreibung des fachlichen Kontextes eignen sich am besten Dokumentenformate, die sich leicht mit Testcode integrieren lassen und mit denselben Werkzeugen wie der Testcode gepflegt werden können. [AsciiDoc](https://asciidoctor.org) ist hier ein guter Kandidat.

Hinweise, wie sich diese Werkzeuge am besten automatisiert zu einer Dokumentation integrieren lassen, findet Ihr auf der exzellenten [Docs-As-Code-Website](https://docs-as-co.de) meines Kollegen Ralph Müller.

## Fazit
Eine gute Testabdeckung ist schon die halbe Miete für eine Lebende Spezifikation. Mit etwas Augenmerk auf die oben genannten Richtlinien lässt sich ohne großen Mehraufwand das darin enthaltene Wissen nutzbar machen, egal ob für ein Refinement oder eine [3-Amigo-Session](https://www.agilealliance.org/glossary/three-amigos/).
