---
layout: post
title: Effiziente Dokumentation in Entwicklungsteams
subtitle: mit Strategie zum Erfolg
category: "Agile Team Pattern"
ref: documentation_strategy
fb-img: /assets/docwall.png
excerpt_separator: <!--more-->
---

Kaum ein Entwicklungsteam ist mit seiner Dokumentation glücklich. Oft fehlen dringend benötigte Informationen, können nicht gefunden werden oder sind einfach hoffnungslos veraltet. Dabei wird meistens nicht zu wenig, sondern nur zu ineffizient dokumentiert. Ein Workshop kann Euch dabei helfen, eine gute Dokumentationsstrategie zu finden. Getreu dem agilen Prinzip: "Maximiere die Arbeit, die Du nicht tust."

<!--more-->

## Bestandsaufnahme
 Mir ist noch kein Team begegnet, das nicht in irgendeiner Form wichtige Informationen rund um ihre Produktentwicklung festgehalten hat, egal ob im Wiki, Ticketsystem oder in Chatforen (ja, auch das habe ich schon gesehen :-)).  Daher starte ich immer mit einer Bestandsaufnahme des Ist-Zustands, um dann darauf aufbauend Lücken oder Verbesserungspotentiale finden und geeignete Maßnahmen identifizieren zu können. Um die Analyse des Status Quo zu erleichtern, sammle ich zunächst gemeinsam mit dem Team alle vorhandenen Dokumentationsartefakte und charakterisiere sie nach den folgenden sechs Kriterien.

### Zielgruppe
![Zielgruppe](/assets/audiance.png){: style="float: left"} Es ist nur sinnvoll, Informationen schriftlich festzuhalten, wenn diese auch von jemandem gelesen werden. Das klingt trivial, aber ich habe gerade in großen Konzernen zu häufig erlebt, dass Dokumente nur erstellt werden, weil es ein Prozess vorgibt. Daher macht Euch Gedanken, wer eure Zielgruppe ist, bevor Ihr diesen Aufwand treibt. Es gibt aber noch einen weiteren Aspekten, der hier eine Rolle spielt, und zwar die Form der Inhaltsdarstellung. Damit Eure Leser Euch verstehen, solltet Ihr deren Vorkenntnisse zu den Inhalten des Dokumentes kennen und die Sprache- und Darstellungsmitteln wählen, die Ihnen vertraut sind.
So können die meisten Betriebsführer wenig mit UML-Diagrammen anfangen, Darstellungen und Begriffe aus dem ITIL-Umfeld hingegen sind ihnen vertraut.

### Inhalte
![Inhalte](/assets/content.png){: style="float: left"} Aus der Betrachtung Eurer Zielgruppe könnt Ihr den Informationsbedarf Eurer Leser ermitteln und so den inhaltliche Scope der Dokumente ermitteln. Im Überblick lassen sich dann schnell Informationslücken entdecken.  Die explizite Definitionen der Inhalte schützt Euch darüber hinaus davor, dass die Dokumente mit der Zeit zum Sammelbecken aller Art von Informationen werden. Wer kennt nicht die ausufernden Wikimüllhalden?

### Werkzeuge
![Werkzeuge](/assets/tools.png){: style="float: left"} Effiziente Dokumentation hängt nicht zuletzt von der Auswahl der richtigen Werkzeuge ab. Dazu gehören:
* _Editoren für die Autoren_  
  Idealerweise sind diese ohne großen Aufwand durch die Autoren nutzbar. Umständliche Beschaffungsprozesse, begrenzte Verfügbarkeit (z.B. aufgrund von Lizenzen) oder signifikante Einarbeitungsaufwände sollten vermieden werden, da die Hürde zur Aktualisierung der Dokumente damit steigt.

* _Vorlagen_  
  Für zahlreiche geläufige Dokumentationstypen gibt es etablierte Standards, wie beispielsweise [ARC42](http://arc42.de) für die Architekturbeschreibung. Diese geben durch ihre Struktur den Autoren eine gute Checkliste und meist auch weitere Hilfestellungen an die Hand.

* _Dokumentationsgeneratoren_  
  Gerade im Bereich der technischen Dokumentation haben sich Werkzeuge etabliert, die durch die Trennung von Dokumentationserstellung und -präsentation sowohl den Autoren als auch den Lesern eines Dokumentes eine optimale Nutzbarkeit bieten. Beipiele sind hier [AscciiDoc](http://asciidoc.org) und [reStructuredText](http://docutils.sourceforge.net/rst.html).  

### Ablageort
![Ablageort](/assets/location.png){: style="float: left"} Der Zugang zur Dokumentation sollte für die Leser so einfach wie möglich sein. Idealerweise sind die Inhalte in einer Suchmaschine indiziert und können so schnell gefunden werden. Da sich die Dokumentation meist auf einen genau definierten Softwarestand bezieht, muss der Ablageort eine Versionierbarkeit sowie die Zuordnung zu Releaseständen sicherstellen. Im einfachsten Fall befinden sich die Dokumente bzw. ihre Quelldateien gemeinsam mit der Software im selben VCS-Repository.  


### Aktualisierung
![Aktualisierung](/assets/update.png){: style="float: left"} Damit die Inhalte immer auf den neuesten Stand sind, müssen sie zuverlässig und zeitnah aktualisiert werden. Die beste Weise, das sicherzustellen, ist es, diese Tätigkeit fest in Eure Prozesse zu integrieren. So könnt Ihr beispielsweise die Aktualisierung Eurer Architekturdokumentation mit dem Pull Request verbinden und durch den Code Review prüfen lassen. Um sicherzugehen, dass Ihr nichts vergessen habt, empfiehlt es sich, eine Dokumentationscheckliste in Eure Definition of Done aufzunehmen.

### Review
![Review](/assets/review.png){: style="float: left"} Eure Dokumente sollten die benötigten Informationen in einer konsistenten Form bereitstellen. Gerade wenn ihr mit mehreren Kollegen daran arbeitet, bilden sich schnell Redundanzen und Ungleichförmigkeiten. Gleichzeitig kann sich der Bedarf der Zielgruppe ändern; wichtige Informationen fehlen oder sind nicht anwendbar. Daher solltet Ihr Eure Dokumente regelmäßig überprüfen und anpassen. Das kann beispielsweise im Rahmen Eurer Retrospektiven erfolgen oder durch Umfragen bei den Lesern. Auch eine Kommentarfunktion kann schon sehr hilfreich sein.

## Verbesserungspotentiale nutzen
Als Ergebnis dieser Bestandsaufnahme erhält man eine Übersicht, anhand derer sich nun Lücken, Redundanzen und Optimimierungspotential gut erkennen lassen.

![Wand mit Postits](/assets/docwall.png)

Diese Betrachtung solltet Ihr vor dem Hintergrund der folgenden Kriterien für eine gute Dokumentation durchführen:

* **prägnant**  
  Niemand liest gerne ein Dokument mit Hunderten von Seiten. Je länger der Text ist, umso geringer ist die Chance, die benötigte Information darin zu finden. Versucht also einen klaren Dokumentationsscope einzuhalten und Euch auf die wesentlichen, nicht offensichtlichen Informationen zu beschränken. So interessiert di meisten Leser einer Architekturbeschreibung, welche Entscheidungen Ihr getroffen habt und weniger die Darstellung von Klassenhierarchien, die sie sich selbst im Code erzeugen können.

* **aktuell**  
  Dokumentation ist nur dann hilfreich, wenn die Informationen auf dem aktuellen Stand sind. Im schlimmsten Fall können veraltete Inhalte zu falschen Entscheidungen mit gravierenden Folgen führen. Um das zu erreichen, muss die Aktualisierung möglichst zeitgleich zu einer Änderung in der Software erfolgen und durch eine Checkliste in Erinnerung gerufen werden. Dokumentation im VCS-Repository und die Definition of Done sind hier gute Hilfsmittel.

* **zugänglich**  
  Der Nutzer sollte die Inhalte gut finden und leicht erreichen können. Anbindung an Suchmaschinen sind hier von großem Nutzen. Aber auch für den Autor sollte die Zugangshürde möglichst niedrig sein. Nur so besteht die Chance, dass Informationen auch tatsächlich ihren Weg in das Dokument finden.


Wenn Ihr diese Analyse zum ersten Mal durchführt, wird es sicherlich eine ganze Reihe von Verbesserungen geben, die Ihr angehen wollt. Ihr solltet diese genau wie andere Maßnahmen auch in Eurem Improvement Backlog sammeln. So könnt Ihr diese dann angemessen priorisieren und im Rahmen der Retrospektiven nachhalten.

## Fazit
Mit einem überschaubaren Aufwand - in der Regel dauert ein solcher Workshop zwei Stunden - könnt Ihr in Eurem Team eine gemeinsame Strategie entwickeln, wie Ihr den Dokumentationsanforderungen gerecht werdet, ohne Euch unnötig viel Arbeit zu machen. Und was Ihr einmal so festgehalten habt, lässt sich auch einfacher kontinuierlich anpassen und verbessern.
