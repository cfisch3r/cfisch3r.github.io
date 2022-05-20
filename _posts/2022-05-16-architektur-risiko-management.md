---
layout: post
title: Risikomanagement in der Architekturarbeit
subtitle: mit Transparenz Gefahren meistern
category: "Software Architecture"
fb-img: /images/media/posts/risk_matrix.png
ref: architecture_risk_management
description: ""
excerpt_separator: <!--more-->
---

Softwareentwicklung ist nichts für Feiglinge! Als Entwickler wissen wir, was so alles schiefgehen kann in den Produkten, die wir bauen. Immer wieder gehen wir in der Entwicklung Kompromisse ein, sei es um Aufwände zu sparen oder aber schlichtweg, weil die technischen Mittel nicht ausreichen, um allen Anforderungen uneingeschränkt gerecht zu werden. Doch sind diese Schwachstellen unserer Software Architektur auch unseren Product Ownern bewusst? Schließlich sind sie es ja, die am Ende des Tages die damit verbundenen Risiken tragen müssen?
Ein einfaches Risikomanagement in der Architekturarbeit kann hier die notwendige Transparenz schaffen.

<!--more-->

Doch warum sollten wir überhaupt unseren Product Owner über die Risiken aufklären? Es sollte doch jedem klar sein, dass Entwicklung und Betrieb eines Softwareproduktes mit Risiken verbunden sind und es bleibt ihm meist ja eh keine andere Wahl, als diese zu akzeptieren. Im Grunde geht es darum, dass derjenige, der Risiken eingeht, dieses im vollen Bewusstsein tut, damit er sie gegen die damit verbundenen Chancen abwägen und sich auf die Konsequenzen vorbereiten kann. Ähnlich wie Ärzte, die ihre Patienten vor jedem Eingriff detailliert über die Risiken aufklären, sollten auch wir als Entwickler unseren Product Owner informieren.

Um das tun zu können, müssen wir im Entwicklungsteam Risiken als "First Class Citizen" unseres Entwicklungsprozesses verstehen. Drei Schritte sind dafür zu tun.

## Risiken identifizieren  
Während unserer Architekturarbeit stoßen wir immer wieder auf Risiken, zum Beispiel, wenn wir uns im Rahmen eines ADRs für eine Lösungsvariante entscheiden oder wir eine technische Schuld entdecken bzw. eingehen. Wichtig ist dabei, dass wir sie sofort an zentraler Stelle dokumentieren, damit sie nicht in Vergessenheit geraten. Wenn Ihr Eure Architektur mit Hilfe des [ARC42-Templates](https://www.arc42.de/) dokumentiert, könnt Ihr sie beispielsweise einfach dort im Kapitel "Risiken und Technische Schulden" erfassen. 

## Risiken bewerten  
Damit der Product Owner etwas mit dem Risiko anfangen kann, muss dieses durch das Team bewertet werden, zum Beispiel im Rahmen des Refinementtermins. Folgende Kriterien sollten dabei betrachtet werden.

Auswirkung  
: Risiken sind abstrakt, solange wir nicht die konkreten Folgen für das Unternehmen benennen, wenn sie eintreffen. Das können sowohl finanzielle Konsequenzen sein, aber auch immaterielle wie der Vertrauensverlust der Nutzer.

Wahrscheinlichkeit  
: Meist ist es schwierig, eine genaue Eintrittswahrscheinlichkeit des Risikos zu ermitteln, weil in der Regel Erfahrungswerte fehlen. Daher bleibt oft nichts anderes übrig, als eine Schätzung im Team abzugeben. Entscheidend ist aber, zuverlässige Mechanismen parat zu haben, die bemerken, wenn ein Risiko eintritt. So kann man später anhand dieser Daten die Schätzung überprüfen und gegebenenfalls korrigieren.

Mitigation  
: Zur Abschwächung des Risiko sind zwei Blickwinkel zu betrachten; zum einen können wir Maßnahmen treffen, die die Eintrittswahrscheinlichkeit reduzieren, zum anderen sollten wir uns Gedanken machen, wie wir bei Eintritt des Risikos die Auswirkungen auf ein Minimum begrenzen können.

Mit Hilfe dieser Charakterisierung ist der Product Owner in der Lage, das Risiko in seiner Produktplanung zu berücksichtigen. Dabei kann es hilfreich sein, die Risikoliste zusätzlich noch anhand der Risikomatrix zu priorisieren. Dabei werden Risikowahrscheinlichkeit und -auswirkung in einer Skala bewertet und die Priorität als Produkt ermittelt.

![Risikomatrix](/images/postinline/posts/risk_matrix.png)

## Risiken managen
Mit der Bewertung der Risiken ist es aber leider nicht getan. Wir müssen kontinuierlich im Blick behalten, wie sich die Risiken entwickeln und ob sie über die Zeit in einem akzeptablen Rahmen bleiben. Ansonsten besteht die Gefahr: Aus den Augen, aus dem Sinn. Es empfiehlt sich also, den Blick auf die Risikoliste in die bereits etablierten Zeremonien des Teams zu integrieren; zum Beispiel als festen Bestandteil des Refinement Meetings. Zusätzlich kann es hilfreich sein, einen aktuellen Risikobericht quartalsweise im Zuge des Reviews mit den Stakeholdern zu teilen.

## Fazit
Zur professionellen Softwareentwicklung gehört ein transparenter Umgang mit den architektonischen Risiken, damit der Product Owner diese bewusst im Blick behalten kann. Das Identifizieren, Bewerten und Managen der Risiken sollte daher integraler Bestandteil der Architekturarbeit sein. Ein guter Startpunkt, um damit zu beginnen, kann ein gemeinsames [Risk Storming](http://www.codingthearchitecture.com/2012/07/11/risk_storming.html) in Eurem Produktteam sein. 

