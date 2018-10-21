---
layout: post
title: Technische Schulden
subtitle: Agiler Umgang mit Schulden
category: "Agile Methoden"
excerpt_separator: <!--more-->
---


Das Management der technischen Schulden in einem Projekt gehört zu den wichtigsten Aufgaben, möchte man nicht irgendwann vor einen unwartbaren Legacysystem stehen, dass eine vollständige Neuentwicklung zwingend erforderlich macht. Doch bevor Ihr Euch an den Abbau der technischen Schulden macht, solltet Ihr erstmal dafür sorgen, dass keine neuen Schulden entstehen. Ansonsten sind alle Anstrengungen, endlich wieder Geschwindigkeit aufzunehmen, vergebene Liebesmüh. In dieser Artikelreihe möchte ich Euch einige hierfür nützliche Praktiken vorstellen. Den Beginn macht die Testgetriebe Entwicklung.

<!--more-->

## Mit Refactoring zu besserer Qualität
Fehlende Test führen immer wieder dazu, dass notwendige Refactorings nicht durchgeführt werden aus Angst, dabei Fehler im Code zu erzeugen. Wer will schon für einen Bug verantwortlich sein, nur weil er den Code verständlicher gemacht hat? Auf Dauer leiden jedoch die Erweiterbarkeit und Lesbarkeit Eures Codes darunter und Fehleranalyse ebenso wie die Entwicklung neuer Features werden Stück für Stück zeitaufwendiger. Zu all dem steigt durch die fehlende Testautomatisierung der manuelle QA-Aufwand immer weiter an, was Euer Projekt noch langsamer werden lässt.

## Mehr Sicherheit durch TDD 
Um diesem Siechtum der Codequalität zu entkommen, solltet Ihr in Eurem Team zu einer Testgetriebenen Entwicklung (TDD) übergehen. Indem Ihr bei neuen Klassen und Modulen vor der Implementierung immer erst den Test schreibt, schafft Ihr das notwendige Sicherheitsnetz für künftige Refactorings. Unabhängig davon, in welche Richtung sich die Anforderungen auch entwickeln, könnt er so das Design gefahrlos anpassen und damit die Codequalität auf einem gleichbeibenden Niveau halten. 

## Mit Training zum Erfolg
Doch Vorsicht. Die Regeln von TDD sind zwar einfach, aber die erfolgreiche Umsetzung in der Praxis erfordert eine entsprechende Erfahrung mit dieser Methodik. Bevor Ihr also damit loslegt, solltet Ihr die Grundprinzipien und -muster von TDD erlernen und ihre Anwendung üben. Ansonsten droht die Gefahr, dass die Wartbarkeit und Zuverlässigkeit der Tests leiden und an dieser Stelle weitere technische Schulden aufgebaut werden. Hinzukommt, dass Ihr unter Zeitdruck geratet, wenn Ihr eine noch ungeübte Methodik unter Projektbedingungen einsetzt, und Ihr lauft Gefahr, dann doch wieder Code ohne Tests zu schreiben. Wenn man von Brust- auf Kraulschwimmen umsteigt, ist es gut, wenn nicht gerade der Weiße Hai hinter einem her ist.

## Tipps

- _Holt Euch die Unterstützung eines erfahrenen TDD-Coachs._ Ihr erspart Euch eine langwierige Lernzeit und vermeidet unnötige technische Schulden.

- Trainiert den Einsatz von TDD. Nur wenn Ihr darin geübt seid, entwickelt Ihr auch unter Zeitdruck testgetrieben.

- Bezieht Eure Tests mit in den Code Review ein. Tests sind Erste-Klasse-Bürger der Codebasis und müssen ebenso sorgfältig entwickelt werden wie der Implementierungscode, sonst drohen weitere technische Schulden.

- Behaltet die Testpyramide im Auge. Nur wenn Ihr eine gute Basis von Unittests habt, könnt Ihr den Umfang langläufiger und aufwändiger Integrations- und End-to-End-Tests auf ein Minimum reduzieren.

- Wählt und konfiguriert Eure Testwerkzeuge sorgfältig und rechtzeitg. Nur wenn deren Einsatz leicht und zeitnah möglich ist, kommen sie auch unter schwierigen Bedingungen zum Einsatz.



  


llll Ihr unter dem Zeitdruck Eures Projektes 
die denen Ihr Euren Code den Dieser Umstieg erstreckt sich in der Regel über einen Zeitraum von mehreren Monaten, in dem Ihr Euch in mehreren Trainingseinheiten erst einmal mit den verschiedenen Aspekten dieser zunächst ungewohnten Vorgehensweise vertraut machen müsst. Dabei stehen neben den Grundprinzipien und -mustern auch der Aufbau und die Wartbarkeit der Tests im Fokus. Parallel müsst Ihr passende Testframeworks und strategien für die Integrationstests auswählen und kennenlernen. Hat sich die Testgetriebene Entwicklung erstmal als Standardvorgehen bei Euch etabliert, nimmt der Anteil des testabgedeckten Codes zu. Die Qualität steigt wieder, denn: In Clean Codes Bugs cannot hide.   

#Boy Scout Rule
Unter Pfadfindern gilt: Hinterlasse den Platz immer etwas sauberer als Du ihn vorgefunden hast. So wird mit etwas Mehraufwand unsere Umwelk Stück für Stück besser. Ähnlich könnt Ihr Eure Software bei jeder Erweiterung immer wieder ein Stück verbessern, indem Ihr Euch den Code in unmittelbarer Nähe Eurer Änderungen anschaut und diesen durch Refactorings wartbarer macht. Meist findet man die optimale Lösung nämlich nicht bei der ersten Implementierung, da man das Problem noch nicht vollständig durchdrungen hat. Mit der Boy Scout Rule reflektiert Ihr immer wieder den bestehenden Code vor dem Hintergrund Eures neuen Wissens und könnt ihn Stück für Stück optimieren. Doch passt auf, dass Ihr dabei nicht vom Höckschen aufs Stöckschen kommt. Schnell führt ein Refactoring zum anderen und Ihr findet Euch plötzlich in einem unfangreichen Umbau der gesamten Codebasis wieder. Daher solltet Ihr Euch im Team vorab Gedanken machen, wie weit Ihr bei einer Änderung Eure Verbesserung gestalten wollt, am besten pro Story im Planningmeeting. So habt Ihr eine gute Kontrolle über Eure Aufwände und könnt diese beim Sprint Forecast berücksichtigen. Wenn Ihr mit der Boy Scout Rule beginnt, wird dieses zwangsläufig eine Auswirkung auf Eure Velocity haben. Daher sprecht vorher mit Eurem PO darüber, damit er das für seine Prognosen für die Zukunft berücksichtigen kann.

#Sprout Strategie
Sobald Ihr Euch für die Testgetriebene Entwicklung und eine kontinuierliche Verbesserung der Codequalität entschieden habt, wird die Integration Eures neuen Codes in die bestehende Codebasis zur nächsten großen Herausforderung. Meist ist es sehr schwierig oder extrem aufwändig, die bestehenden Klassen und Module unter eine ausreichende Testabdeckung zu bekommen, um dann die Erweiterungen oder das Refactoring sicher durchführen zu können. Schwer auflösbare Abhängigkeiten und riesige Gottklassen treiben die Aufwände hierfür schnell in unwirtschaftliche Höhen. Dabei geht es ja zunächst darum, keine weiteren Schulden aufzubauen und nicht, die alten abzubauen. Die Sprout Strategie hilft Euch dabei, diesem Dilemma zu entkommen. Dabei schafft Ihr Euch zunächst im ersten Schritt einen Erweiterungspunkt in der bestehenden Codebasis, an der Euren neuen Code einhängen könnt. Um bei den dafür notwendigen Refactorings nicht unbeabsichtige Regressionsfehler zu erzeugen, solltet Ihr soweit wie möglich die entsprechenden Werkzeuge Eurer IDE einsetzen. Falls Euch diese nicht zur Verfügung stehen, greift Ihr am besten auf die Muster aus dem Refactoring Buch von Martin Fowler zurück. Habt Ihr das geschafft, könnt Ihr nun im gewohnter Weise testgetrieben Eure Erweiterung schreiben. Dieser neue Spross (daher auch der Name des Musters) ist nun befreit von den Altlasten bietet eine optimale Ausgangsbasis für Euren nächsten Weiterentwicklungen. Diese Strategie hat jedoch leider einen unschönen Nebeneffekt. Mit jedem neuen Spross nimmt die Fragmentierung und damit die Komplexität Eures Codes zu. Daher ist es wichtig, den parallel dazu den Schuldenabbau weiterzutreiben und mit der Zeit die alte Codebasis aubzubauen. Sobald das geschehen ist, lassen sich die neuen Codebestandteile dank der hohen Testabdeckung einfach und sicher wieder konsolidieren.

#Inspektion
Alle vorgestellten Praktiken laufen parallel zur Weiterentwicklung. Es wird also eine längere Zeit dauern, bis Ihr erste Erfolge verzeichnen und Verbesserungen spüren werdet. Um dabei nicht die Motivation zu verlieren, solltet Ihr Euren     ~                                     ~                                          Fortschritt unbedingt messen. So habt Ihr nicht das Gefühl, auf der Stelle   ~                                     ~                                          zu treten. Um auf diesem Weg nicht die Motivation zu verlieren..,



Alle hier beschriebenen Maßnahmen bedingen und verstärken sich gegenseitig und sollten daher gemeinsam angegangen werden. Ihre Einführung solltet Ihr daher gut planen und durch einen Experten begleiten lassen, da ansonsten die Gefahr besteht, dass Euch der Projektalltag einholt und die guten Vorsätze schnell wieder vergessen werden.  
Um dabei nicht die Motivation zu verlieren, solltet Ihr Euren     ~                                                                       Fortschritt unbedingt messen. So habt Ihr nicht das Gefühl, auf der Stelle   ~                                     ~                                          zu treten.  




Was sind Technische Schulden?
Wie entstehen Sie und wie gehe ich mit Ihnen um?

<!--more-->

Die besten technischen Schulden sind die, die erst gar nicht entstehen. Doch leider lässt sich das nicht immer verhindern. Um das zu verstehen, hilft die Einteilung von Martin Fowler.

![Gründe für technische Schulden](/assets/technical_debt_reasons.png)

Schulden aus den beiden linken Kategorien lassen sich verhindern bezw. gegensteuern. Die beiden rechten hingegen sind unausweichlich.

##Einbindung in den agilen Alltag

Wie man sieht, hat man es ständig mit technischen Schulden zu tun. Man muss also kontinuierlich darauf reagieren. Das gelingt am besten, wenn man die notwendigen Maßnahmen mit den agilen Tätigkeiten verbindet. Hier ein Beispiel für Scrum:

###Schulden identifizieren & quantifizieren
Gute Gelegenheit bei Reviews & Retrospektiven. Aber auch beim Code Reviews im Zuge der Definition of Done. Um diese zu sammeln sollten sie in Form einer Schuldengeschichte im Backlog festgehalten werden. Dabei ist wichtig, die Schulden zu quantifizieren, denn nur so kann der PO sie entsprechend einplanen. Wichtige Kriterien sind:

- Behebungskosten
- Betroffene Komponenten


###Schulden priorisieren

### Schuldenabbau planen
