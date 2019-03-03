---
layout: post
title: Agile Traceability mit TDD und Continuous Integration
category: "Test Driven Development"
ref: tracibility
fb-img: /assets/tracibility.png
excerpt_separator: <!--more-->
---
Wenn wir Software entwickeln, ist es unser Ziel, regelmäßig ein Produkt zu liefern, dass alle Anforderungen erfüllt. Um das auch nachzuweisen zu können, bräuchten wir eine Rückverfolgbarkeit zwischen den Quellen einer Anforderung und unseren Liefergegenständen, und zwar in beide Richtungen. Ein weit verbreitetes Werkzeug hierfür ist die Traceability Matrix, die jedoch meist mit einem hohen Pflegeaufwand verknüpft ist, zumindest, wenn man eine einigermaßen hohe Aktualität und Korrektheit erreichen möchte.
Die Testgetriebe Entwicklung in Verbindung mit dem Continuous-Integration-Ansatz bietet uns hier eine schlanke und gleichzeitig validierbare Alternative.

<!--more-->

Bevor wir zu der Lösung kommen, wollen wir aber erstmal einen Blick auf den Nutzen werfen, den wir erzielen wollen. Im wesentlichen sind es drei Aspekte, bei denen uns die Rückverfolgbarkeit unterstützt:

* Analyse der Auswirkungen von Anforderungsänderungen
* Überprüfung der Anforderungsabdeckung
* Vermeidung unnötiger Umsetzungsaufwände (Stichwort "Gold Plating")


Um diese Ziele zu erreichen, verwenden viele Projekte eine Traceability Matrix, in der die Beziehungen aller Artefakte zwischen Anforderungsquelle und Liefergegenständen untereinander gepflegt werden, entweder mit Hilfe eines Werkzeuges oder ganz einfach in Form eines Excelsheets. Das ist jedoch sehr pflegeintensiv und kann auch nur schwer validiert werden. Spätestens wenn wir uns im Bereich von Continuous Deployment mit mehreren Auslieferungen pro Tag bewegen, kommt dieser Ansatz an seine Grenzen.
Wünschenswert wäre daher eine Methode, die sich ohne großen Mehraufwand in den bestehenden Entwicklungsprozess integriert und die eine automatische Überprüfbarkeit der Beziehungen ermöglicht. Und hier kommen die Testgetriebene Entwicklung und Continuous Integration ins Spiel. Die folgende Abbildung zeigt das Zusammenspiel aller Komponenten, die hierfür benötigt werden.

![agile traceability](/assets/traceability.png)

Den Anfang macht das [Acceptance Test Driven Development](https://en.wikipedia.org/wiki/Acceptance_test–driven_development), bei dem wir alle Anforderungen in Form von automatisierten Akzeptanztests erfassen. Damit sind wir in der Lage, später jederzeit nachweisen zu können, dass unser Produkt die Anforderungen erfüllt.
Ein bewährtes Mittel, um von den Backlogeinträgen zu diesen Tests zu gelangen ist die [Three-Amigo-Session](https://www.agilealliance.org/glossary/three-amigos/), bei der Product Owner, QA Engineer und Entwicker zusammensitzen und Testfälle definieren. Diese dienen quasi als eine Art [Lingua Franca](https://de.wikipedia.org/wiki/Lingua_franca), mit deren Hilfe die drei Fachexperten zu einer gemeinsame Definition und Dokumentation der Anforderungen gelangen. Wenn eine Rückverfolgbarkeit auf weitere Anforderungsquellen erforderlich ist, können dieser aus den Tests heraus per Hyperlink referenziert werden.
Im nächsten Schritt schreiben die Entwickler dann testgetrieben den Produktivcode, bis alle Akzeptanztests grün sind. Die ["Three Rules of TDD"](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd) stellen dabei sicher, dass nur soviel Code geschrieben wird, wie nötig ist, einen Test erfolgreich ausführen zu können.

Für die Überprüfung und Auswertung der Traceability wenden wir uns nun dem Countinous-Integration-Prozess zu. Das zugrundeliegende Buildscript setzt Anforderungsquellen, Anforderungen (aka Akzeptanztests), Source Code, und das  Produkt (Deployment Units) in Beziehung und überprüft ihre Verknüpfungen.
Da sich alle Komponenten im selben Version Control Repository befinden, ist ein eindeutiger Versionsbezug untereinander sichergestellt. Das Ergebnis der Überprüfung lässt sich als Ausführungsreport im Zuge des Pipelinebuilds erzeugen und zusammen mit den anderen Artefakten in einem Artefaktrepository ablegen.  

## Fazit
Die Testgetriebene Entwicklung in Kombination mit Continuous Integration bietet dank der Integration in den Entwicklungsprozess und dem hohen Automatisierungsgrad die Vorteile der Rückverfolgbarkeit ohne nennenswerten Mehraufwand: Auswirkungen von Anforderungsänderungen können durch Änderung der entsprechenden Tests und einen erneuten Testdurchlauf bestimmt werden. Die Anforderungsabdeckung ist bereits durch die testgetriebene Vorgehensweise gewährleistet, kann aber auch durch Code Coverage Tools in Verbindung mit [Mutation Testing](https://en.wikipedia.org/wiki/Mutation_testing) nachgewiesen werden. Dasselbe gilt für die Vermeidung unnötiger Implementierungsaufwände.
Alle notwendigen Werkzeuge sind darüberhinaus bereits bei den meisten Entwicklungsteams im Einsatz und erfordern somit keine zusätzlichen Kosten.
