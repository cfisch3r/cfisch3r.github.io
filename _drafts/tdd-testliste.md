---
layout: post
title: TDD Benefits
subtitle: 5 Probleme am Anfang
category: "Agile Methoden"
excerpt_separator: <!--more-->
---

Als ich meine ersten Schritte mit TDD gemacht habe, fand ich es besonders schwierig, den geigneten Startpunkt zu finden. Mit welchem Testfall sollte ich beginnen? Meist nahm ich den ersten Test, der mir in den Sinn kam, nur um dann festzustellen, dass ich sehr lange brauchte, um diesen dann grün zu bekommen, weil einfach viel Implementierungscode notwendig war. Doch auch wenn die ersten Zyklen gut von der Hand gingen, fand ich mich ab und an in einer Sackgasse, aus der kein offensichtlicher nächster Testschritt herausführte. Irgendetwas musste ich also falsch machen. Mein Aha-Erlebnis hatte ich dann endlich, als ich das Buch "TDD by example" von Kent Beck las.
Darin beschreibt er ein Hilfsmittel, das Abhilfe für meine Probleme versprach: Die Testliste.
<!--more-->

Das Prinzip hinter der Testliste ist denkbar einfach. Anstatt einfach drauf los zu programmieren, befasst man sich zunächst mal mit dem Problem und sammelt zunächst alle Testfälle, die einem in den Sinn kommen. Anschließend sortiert man sie entsprechend ihrer Implementierungskomplexität vom simpel bis aufwändig.

<Bild>

Jetzt kann man beginnend mit dem einfachsten Testfall Listenpunkt um Listenpunkt abarbeiten und dadurch in kleinen Schritten den Implementierungscode umsetzen. <Vergleich Bergroute> Dadurch entsteht im optimalen ein FLow, bei dem nur kurze Zeit für die Implementierungsphase benötigt. Nicht selten stösst man währenddessen auf weitere Testfälle. Um den Fokus nicht zu verlieren füge ich sie am Ende der Liste hinzu. Erst wenn ich nach dem Refactoring einen Zyklus abgeschlossen habe, entscheide ich mich, an welcher Position eine Umsetzung sinnvoll ist.



Trotz dieser Vorgehensweise kann es vorkommen, dass man an einen Punkt kommt, an dem sich kein geeigneter nächster Testfall findet, der sich mit einem kleinen Implementierungsaufwand erfüllen lässt.   

Tipps:
- Timebox
- Als Kommentar im Klassenkopf oder ein einfacher Notizblock und Stift. Meist s
- Eingabe Ausgabe, gebenenfalls 
- EInbeziehung im Planning 2
- Bob Martins Artikel zur Komplexität
- Versionierung


Benefits:
- frühe Entdeckung von Logikfehlern
- Nutzung von Expertise anderer
- Fokussierung

Übungskata:
Passwort
