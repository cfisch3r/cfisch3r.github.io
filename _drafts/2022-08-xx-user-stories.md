---
layout: post
title: User Stories
subtitle: ersetzen keine Spezifikation
category: "Software Architecture"
fb-img: /images/media/posts/risk_matrix.png
ref: user_stories
description: ""
excerpt_separator: <!--more-->
---

<!--more-->

Mal Hand aufs Herz! Passen Eure User Stories auf eine Karteikarte, so wie es ursprünglich mal von den postuliert wurde? Nein? Keine Sorge, damit steht Ihr nicht alleine, wenn ich mir die Teams anschaue, mit denen ich bisher zusammengearbeitet habe. Das ist auch nicht weiter verwunderlich, stellt doch die User Story in der Regel die "Single Source of Truth" für die fachliche Spezifikation einer neuen Funktionalität dar und diese ist häufig selbst bei vermeintlich kleinen Features recht umfangreich. Schließlich müssen wir in der Entwicklung nicht nur den Gutfall definieren, sondern auch Randfälle, Missbrauchsszenarien, Qualitätsmerkmale, etc..
Doch warum gibt es dann die geforderte Beschränkung auf die Karteikartengröße? Diese Regel sollte jedem klar machen, dass die User Story NICHT alle Informationen zu einem neuen Feature beinhaltet, sondern nur ein Platzhalter ist, für eine Kommunikation, die später stattfindet. Ja, aber warum? Die User Story ist ein Planungsmittel, mit dem der PO priorisieren kann. Erst kurz bevor wir in die Umsetzung gehen, investieren wir die Zeit und gehen in die Feinspezifikation. Dadurch vermeiden wir Aufwände bei Stories, die nie zur Umsetzung kommen und haben immer die zum Zeitpuntk der Umsetzung aktuellestn Informationen. Die bekannteste Form dieser Kommunikation, sind Test Storimg oder Three-Amigo Session.

Nun könnte man aber einwänden, dass man die Ergebnisse dieser Spezifikationsarbeit ja trotzdem irgendwo festhalten muss und dann kann man es ja einfach mit in die User Story schreiben, frei nach dem Motto "Keep it simple." Doch dabei besteht die Gefahr, dass Informationen lediglich in der Form von Akzeptanzkriterien erheben, anstatt den gesamten Werkzeugkasten der Spezifikation zu nutzen. Und es gibt noch ein weiteres 

Die Frage "Ist es ein Feature oder ein Bug?" ist so alt wie die Softwareentwicklung, letzten Endes ist es aber müßig, sich darüber zu streiten. Das Problem existiert und muss behoben werden. Viel interessanter ist hingegen die Frage, ob wir im Vorfeld die Situation hätten vermeiden können. In der agilen Softwareentwicklung schauen wir dann immer instinktiv auf unsere User Stories und kommen zu dem Schluss, dass offensichtlich die Akzeptanzkriterien nicht umfassend genug waren. Also wird dannim nächsten Refinement noch genauer auf hingeschaut und die Liste der AKs wächst. Irgendwann merkt man da 
