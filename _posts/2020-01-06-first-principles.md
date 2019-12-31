---
layout: post
title: Unit Tests
subtitle: FIRST Prinzipien
category: "TDD"
fb-img: /images/media/posts/kotlintest.png
ref: kotlintest_firstimpression
description: "Meine ersten Eindrücke mit KotlinTest"
---

Unittests sind das Fundament einer jeden guten Teststrategie und verdienen daher bei der Entwicklung unsere besondere Aufmerksamkeit. Doch worauf kommt es an und was muss ich dafür tun? Ein paar wenige Prinzipien und Praktiken helfen schon, Effizienz und Effektivität zu steigern.  

<!--more-->

## FIRST Prinzipien

Wenn es um Softwarequalität und Tests geht, kommt man in der Regel nicht um Robert C. Martin herum. Und in der Tat findet man in seinem Standardwerk "Clean Code" Kriterien, die gute Unittests ausmachen. Es handelt sich dabei um fünf Merkmale, deren Anfangsbuchstaben das Akronym **FIRST** ergeben und sich so recht gut merken lassen:

fast
: Die Ausführung eines Unittests sollte nur wenige Millisekunden dauern. Das hat zur Folge, dass ich trotz hoher Testabdeckung immer ein schnelles Feedback bekomme, wenn ich meinen Code ändere oder erweitere. Gleichzeitig ermöglicht es mir, die Tests nach jeder noch so kleinen Änderung laufen zu lassen. Schlägt dann ein Test fehl, weiß ich genau, wo ich nach dem Problem suchen muss, weil nur wenige Codezeilen in Betracht gezogen werden müssen.


independent
: Die Reihenfolge, in der die Tests ausgeführt werden, darf keine Rolle spielen. Du kannst die Tests also parallelisiert laufen lassen, wodurch die Zeit für die Testausführung nicht mehr linear mit dem Wachstum Deiner Codebasis ansteigt. Hinzukommt, dass Du Seiteneffekte vermeidest. Ein fehlgeschlagener Tests hat keine Auswirkungen auf andere, und erschwert Dir so nicht die Suche nach der Ursache.


repeatable
: Die Tests liefern immer dasselbe Ergebnis, solange sich die Implementierung nicht ändert. Das heißt im Umkehrschluss, dass nur Änderungen am Code zu einem fehlgeschlagenen Test führen können. Damit kann es Dir nicht, wie beispielsweise bei Integrationstests, passieren, dass Du ewig nach einem Problem in Deinem Code suchst, während die Ursache aber in einer inkonsistenten Datenbank liegt.


self-validating
: Testergebnisse können nur zwei Werte annehmen: erfolgreich oder fehlgeschlagen. Sie müssen also nicht erst von einem Entwickler interpretiert werden. Das klingt zwar selbstverständlich, aber oft genug weichen wir unbewusst von diesem Prinzip ab, und zwar immer, wenn wir Debug-Logging in unseren Code einbauen. Es ist auf den ersten Blick die einfachste Form um zu prüfen, ob das Programm sich so verhält, wie wir es erwarten. Allerdings müssen wir dafür genau wissen, welche Nachrichten in welcher Reihenfolge erscheinen sollen. Spätestens wenn ein anderer Entwickler, der nicht über dieses Detailwissen verfügt, unseren Code weiterentwickelt, ist es zweifelhaft, ob diese Prüfung noch zuverlässig funktioniert. Hinzu kommt, dass es hierfür immer eines Menschen bedarf.


timely
: Tests sollten vor der Entwicklung des Produktivcodes geschrieben werden. Denn wenn wir, wie es vermutlich die meisten machen, sie nach der Implementierung schreiben, kann es uns passieren, dass unser Code Design nur schwer oder sogar überhaupt nicht testbar ist. Außerdem wissen wir so nicht, ob die Tests bei einem Fehler anschlagen würden, da sie ja sofort erfolgreich laufen. Und last but not least geben uns die Tests, die wir vorab schreiben, ein unmittelbares Feedback während der Implementierung, ähnlich wie bei der Rechtschreibprüfung in einem Textverarbeitungsprogramm. Es käme doch auch niemand auf die Idee, erst ein komplettes Buch zu schreiben und dann die Rechtschreibprüfung zu aktivieren, oder?


## Wie bekomme ich das hin?
Es spricht also sehr viel für Unittests, aber wie schaffe ich es nun, dass möglichst viele meiner Tests diese Eigenschaften haben. Hier ein paar Tipps, die Dir dabei helfen sollen.

1. **Trenne Integrations- und Logikcode**  
Code, der Schnittstellenaufrufe beinhaltet - z.B. Netzwerkaufrufe, Datenbankkommunikation, UI - kann nur per Integrationstests geprüft werden, da er durch externe Faktoren (Nebenläufigkeit, Speicherbegrenzung, Latenzen, etc.) beeinflusst wird. Daher sollten diese Anweisungen vom Geschäftslogikcode getrennt, um letzteren wieder durch Unittests prüfbar zu machen. Ein Designschema, dass einem dabei hilft, ist die [Hexagonale Architektur](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)). Dabei findet sich Schnittstellencode in Adaptern und Logikcode in Kernkomponenten wieder.

2. **Vermeide Shared State**  
Damit Tests unabhängig voneinander ausgeführt werden können, dürfen sie nicht über einen gemeinsamen Zustand miteinander gekoppelt werden. Die Verwendung von Singletons ist daher zu vermeiden. Das gleiche gilt für Anweisungen, die eine Reihenfolge der Testausführungen vorgeben, wie beispielsweise die `@Order`-Annotation von Junit 5.

3. **Praktiziere TDD**  
In der Testgetriebenen Entwicklung beginne ich immer zuerst mit dem Test. Damit ergibt sich automatisch, dass mein Produktivcode auch testbar ist. Und da ich mit einem fehlgeschlagenen Test starte, der nach der Implementierung erfolgreich ist, weiß ich immer, dass er bei einem Fehler richtig anschlagen würde.

4. **Ersetze Debug-Logging durch Tests**  
Mit Debuganweisungen möchte ich in der Regel feststellen, ob eine Komponente korrekt arbeitet. Dafür führe ich den Code aus und prüfe dann die Logausgabe. Ein Test macht prinzipiell nichts anderes, nur automatisiert. Daher vermeide Debuglogging und überlege Dir anstelle dessen, welcher Test Dir dieselbe Prüfung bietet.

## Fazit
Unittests sind unverzichtbar und es zahlt sich aus, wenn möglichst viele Tests in Deiner Codebasis den FIRST-Prinzipien entsprechen. Testgetriebene Entwicklung, ein sauberes, hexagonales Design und isolierte Tests helfen Dir dabei, dieses Ziel zu erreichen.
