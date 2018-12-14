---
layout: post
title: Die TDD Testliste
subtitle: Mit der Routenplanung zum Erfolg
category: "Test Driven Development"
ref: tdd_testlist
fb-img: /assets/tdd_mountain.png
excerpt_separator: <!--more-->
---

Wenn wir ein neues Feature testgetrieben entwickeln, stellt sich als erstes immer die Frage, mit welchen Test wir am besten starten. In Coding Dojos habe ich beobachtet, dass die Teilnehmer meist mit dem ersten Testfall beginnen, der ihnen in den Sinn kommt. Aber ist das auch der beste Einstieg, von dem aus sich die folgenden TDD-Iterationen einfach aufbauen lassen und schließlich zur gewünschten Implementierung führen?
Um diese Frage zu beantworten und einen guten Implementierungspfad zu finden, kann eine Testliste sehr hilfreich sein.  

<!--more-->

Kennengelernt habe ich die Testliste als Werkzeug im Buch "TDD by example" von Kent Beck - übrigens ein wirklich sehr empfehlenswerte Lektüre.
Das grundlegende Prinzip dahinter ist denkbar einfach. Anstatt einfach drauf los zu programmieren, versucht ihr, Euer Problem in Teilprobleme zu zerlegen und formuliert dafür entsprechende Testfälle. Diese bringt Ihr dann anschließend eine Reihenfolge, die die Implementierungsschritte zwischen den Tests möglichst klein werden lässt. Damit erreicht Ihr, dass Eure TDD-Zyklen kurz bleiben und Ihr schnell zum Ziel kommt.

![Berg mit Route](/assets/tdd_mountain.png)

Ich vergleiche dieses Vorgehen gerne mit dem Besteigen eines Berges. Auf dem Gipfel erwartet uns der Produktivcode, der das Problem vollständig löst. Die einzelnen Testfälle sind Etappenziele, die es mir ermöglichen, mich in kleinen, überschaubaren Implementierungsschritten dem Ziel zu nähern. Die Testliste ist somit nicht anderes als eine Bergroute, der ich bis zum Gipfel folgen kann. Wie im richtigen Leben führen meist mehrere Wege zum Ziel. Auch bei der Testliste kann es mir passieren, dass ich plötzlich in eine Situation komme, aus der ich keinen nächsten Testschritt finde, der mit einem überschaubaren Implemetierungsaufwand erfüllbar wäre. In solchen Situationen mache ich die letzten Testfälle so lange rückgängig, bis ich wieder genügend andere Wegoptionen habe und probiere eine andere Route. 

Nicht selten stösst man während der Implementierung auf weitere Testfälle. Um den Fokus nicht zu verlieren, füge ich sie erstmal am Ende der Liste hinzu. Erst wenn ich nach dem Refactoring einen Zyklus abgeschlossen habe, entscheide ich dann, an welcher Position eine Umsetzung sinnvoll ist.

## Benefits dieser Methode
- In der Testliste lassen sich Inkonsistenzen in der Anforderungsbeschreibung zu einem frühen Zeitpunkt finden.
- Die Testfälle könnt Ihr vorab mit anderen zusammen erstellen (z. B. Product Owner, Entwickler, Stakeholder) und so deren Expertise einfließen lassen.
- Ergeben sich neue Testfälle, könnt Ihr sie der Liste jederzeit hinzufügen ohne den Fokus auf Eure aktuelle Arbeit zu verlieren.

## Praxistipps
- Die Testfälle lassen sich hervorragend in einer [3-Amigos-Session](https://www.agilealliance.org/glossary/three-amigos/) gemeinsam mit Product Owner, QA Ingenieur und Entwicklern erarbeiten.
- Wenn Ihr nach Scrum arbeitet, könnt Ihr Euch in Eurem Planning Meeting einfach eine Timebox pro User Story setzen, in der Ihr gemeinsam Testfälle im Brainstorming sammelt.
- Die Testliste könnt Ihr wahlweise in einem Kommentarblock in der Testklasse oder aber einfach mit Notizblock und Stift verwalten.
- Wenn Ihr nach jedem Schritt im TDD-Zyklus Euren Stand im Versionsmanagement comittet, könnt Ihr bequem beliebig viele Schritte in Eurer Testliste zurückgehen, wenn Ihr mal in eine Sackgasse geraten seid oder eine alternative Route ausprobieren möchtet. 
