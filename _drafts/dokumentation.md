---
layout: post
title: Dokumentation
subtitle:
category: "Agile Team Pattern"
ref: tdd_testlist
fb-img: /assets/tdd_mountain.png
excerpt_separator: <!--more-->
---



<!--more-->

 Mir ist noch kein Team begegnet, das nicht in irgendeiner Form wichtige Informationen rund um ihre Produktentwicklung festgehalten hat, egal ob im Wiki, Ticketsystem oder in Chatforen (ja, auch das habe ich schon gesehen :-)).  Daher starte ich immer mit einer Bestandsaufnahme des Ist-Zustands, um dann darauf aufbauend Verbesserungspotentiale finden und geeignete Maßnahmen identifizieren zu können. Um die Analyse des Status Quo zu erleichtern, sammle ich zunächst gemeinsam mit dem Team alle vorhandenen Dokumentationsartefakte und charakterisiere sie nach den folgenden sechs Kriterien.

## Zielgruppe
Es ist nur sinnvoll, Informationen schriftlich festzuhalten, wenn diese auch von jemandem gelesen werden. Das klingt trivial, aber ich habe gerade in großen Konzernen zu häufig erlebt, dass Dokumente nur erstellt werden, weil es ein Prozess vorgibt. Daher macht Euch Gedanken, wer eure Zielgruppe ist, bevor Ihr diesen Aufwand treiben. Es gibt aber noch einen weiteren Aspekten, der hier eine Rolle spielt, und zwar die Form der Inhaltsdarstellung. Damit Ihr Eure Leser optimal mit den notwendigen Informationen versorgen könnt, müsst ihr deren Vorkenntnisse zu den behandelten Themen ebenso wie zu den verwendeten Sprache- und Darstellungsmitteln kennen.
Beispielsweise sind die fachlichen Anforderer meist nicht mit der UML-Notation vertraut. Daher kann es hilfreich sein, bewusst die Begriffe der Zielgruppe zu verwenden. Wenn Ihr in einem Betriebshandbuch Begriffe aus dem ITIL-Umfeld wie z.B. Configuration Items verwendet, erleichtert Ihr den Betriebskollegen den Zugang zu Euren Inhalten.

Inhalte
Welche Themen werden behandelt? Welche Fragen werden beantwortet?
Nur wenn wir konkrete den Scope des Dokumentes beschreiben können, verhindern wir, dass wir am Ende wieder eine ausufernde Müllhalde erzeugen. Hier geht es auch um Usability. Zu umfänglich bedeutet, dass der Leser lange benötigt, um an die gewünschte Information zu gelangen. Der Autor auf der anderen Seite kann so gut entscheiden, ob seine Information in dem Dokument gut platziert ist. Wenn wir alle Inhaltsbeschreibungen nebeneinander legen, sehen wir schnell, ob wir den Bedarf abgedeckt haben. Wir können ihn mit dem Bedarf der Zielgruppen abgleichen.  

Werkzeuge
Drei Arten von Werkzeugen sollten hierbei betrachtet werden. Zum einen der Editor, mit dem das Dokument geschrieben wird.
Die verwendeten Werkzeuge müssen für die Autoren leicht zugänglich sein. PlantUML ist sicherlich ein hervorragendes Werkzeug, um UML-Diagramme zu erzeugen. Wenn aber Eure Teamkollegen sich damit schwer tun, verhindert es die Zusammenarbeit. Genauso problematisch ist es, wenn der Editor eine Lizenz benötigt, die nicht allen zur Verfügung steht. Am Ende ist es dann immer nur der eine Kollege mit der Lizeznz, der die Informationen aktualisiert. Wählt also etwas, mit dem alle umgehen können und sich wohl fühlen.

Dasselbe gilt für das Format. Unternehmensweite Templates sind hilfreich, müssen aber auch verstanden werden. A Fool with a Tool is still a Fool.
 alle Die Formate sollten für die Ablagestruktur geeignet sein.

 Zu guter letzt ist ein Verteilungswerkzeug wichtig.und Eine Deploymentprozess unterstützen.

Ablageort
Es ist wichtig, dass sowohl Autoren als auch Leser leichten Zugang zu den Informationen haben. Das heißt keine Autorisierungshürden, aber auch nach an ihrem jeweiligen Arbeitsort. Entwickler beispielsweise verbringen die meiste Zeit in ihrer IDE. Was liegt also näher, als die Dokumente ins Source-Code-Repository zu legen. Betriebsführer auf der Anderen Seite arbeiten viel mit Dashboards und bevorzugen daher sicherlich Inhalte die per Weblink erreichbar sind. Wie man schon sieht, sind die Bedeürfnisse of unterschiedlich. Daher ist es häufig so, dass der Ort der Dokumentsquellen ein anderer ist als der der fertigen Dokumentation. Für letzteren bietet sich die Einbindung in eine Suchmaschine an.
Wo liegen die Quelldateien? Wo befindet sich die Dokumentation?

Aktualisierung
Damit die Inhalte immer auf den neuesten Stand sind müssen sie zuverlässig zeitnah aktualisiert werden. Die beste Weise, das sicherzustellen, ist es diese Tätigkeit fest in Eure Prozesse zu integrieren. So könnt Ihr beispielsweise die Aktualisierung Eurer Architekturdokumentation mit dem Pull Request verbinden und durch den Code Review prüfen lassen.

Review
Wenn Ihr mit mehreren Kollegen eine Dokumentation pflegt, müsst Ihr besonderes Augenmerk auf die Konsistenz legen. Ansonsten läuft Ihr gefahr, dass sich Redundanzen bilden und die Lesbarkeit darunter leidet. Regelmäßig das Dokument sichten, zu überarbeiten und mit Vertretern der Zielgruppe zu reflektieren, ist daher wichtig. Um zu schauen, welche Dokumente mal wieder einen Review benötigen, könnt Ihr einfach Eure Dokumentliste in einer Retrospektive bewerten.

Als Ergebnis erhält man eine Übersicht, anhand derer sich Lücken und Redundanzen gut erkennen lassen. Auf dieser Basis können nun erste Maßnahmen identifiziert werden. Zielgruppen, die nicht berücksichtigt wurden. Inhalte, die fehlen oder redundant gepflegt werden. Insbesondere bei der Aktualisierung und dem Review zeigen sich Lücken.

Nachdem diese offensichtlichen Mängel adressiert wurden, kann man im nächsten Schritt eine Zielstrategie entwickeln. Dazu ist es hilfreich, sich die Kriterien für eine gute Dokumentationsstrategie vor Augen zu führen.

* prägnant
  "Lieber Freund, entschuldige meinen langen Brief, für einen kurzen hatte ich keine Zeit." Gothetl;dr. AUf den Punk zu kommen ist wichtig. Es geht darum die wesentlichen Informationen festzuhalten, nicht das Offensichtliche. Die Entscheidungen sind wichtiger als Klassendiagramme. Informationen müssen schnell gefunden werden.

* aktuell
  Dokumentation ist nur dann hilfreich, wenn die Informationen auf dem aktuellen Stand sind. Im schlimmsten Fall können sie zu Fehlern führen.

* zugänglich
  Der Nutzer sollte die Inhalte gut finden und leicht erreichen können. Anbindung an Suchen sind hier von großem Nutzen. Aber auch für den Autor sollte die Zugangshürde möglichst niedrig sein. Nur so besteht die Chance, dass Informationen auch tatsächlich ihren Weg in das Dokument finden.

Insbesondere die letzten beiden Eigenschaften legen eine Automatisierung nahe. Werkzeuge wie Asciidoc in Kombination mit einer CI/CD-Pipeline.
Auf Basis dieser Betrachtung lässt sich nun eine VIsion für die zukünftige, bessere Strategie entwickeln. Um dahin zu gelangen, verabschiedet man nun geeignete Maßnahmen, die uns Schritt für Schritt dem Ziel näher bringen.

Die gesammelten Maßnahmen wandern in das Improvement Backlog des Teams und werden genau wie die anderen Einträge im Rahmen der Retrospektive nachgehalten.
