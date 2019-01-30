---
layout: post
title: The Agile QA Shift
subtitle: Auf das Timing kommt es an
category: "Test Driven Development"
ref: agile_qa_shift
fb-img: /assets/agile_qa_shift.png
excerpt_separator: <!--more-->
---
Entwickeln, Testen, Betreiben. Das ist das uralte Mantra der Softwareentwicklung. Wir haben es so oft wiederholt und verinnerlicht, dass wir uns selbst in einem agilen Umfeld nur schwer davon lösen können. Die Tester sind zwar nun Teil des Entwicklungsteams und am Ende eines jeden Sprints  testen diese auch regelmäßig das Produktinkrement, aber nach wie vor findet die Qualitätssicherung fast ausschließlich zwischen der Entwicklung und dem Betrieb statt. Doch wir können noch weitaus mehr von der interdisziplären Ausrichtung agiler Teams profitieren, wenn wir unsere Testaktivitäten aus diesem Silo befreien und sie sowohl in die Entwicklung als auch in den Betrieb verlagern.

<!--more-->

Um zu verstehen, warum diese Verschiebung sinnvoll ist, muss man sich genauer anschauen, worum es bei der Qualitätssicherung eigentlich geht.
Im Wesentlichen beinhaltet sie [zwei Aspekte](https://de.wikipedia.org/wiki/Verifizierung_und_Validierung): 
1. _Die Verifizierung_  
Ziel ist es sicherzustellen, dass wir richtig entwickelt haben. Hierzu prüfen wir das Produkt gegen die Spezifikationen aus den Anforderungen. Liefert die Geschäftslogik die gewünschten Ergebnisse? Arbeitet unsere Software fehlerfrei mit den externen Schnittstellen zusammen? 

2. _Die Validierung_  
Hier geht es darum zu prüfen, ob wir das richtige Produkt entwickelt haben, das die von uns gewünschten Qualitäts- und Leistungsziele erfüllt. Kann der Anwender das Produkt gut nutzen? Erreicht es den Grad an Verfügbarkeit und Skalierbarkeit? Wir prüfen also das Produkt gegen unsere Erwartungen.

Im klassischen Testansatz versuchen wir beiden Aspekte zu einem singulären Zeitpunkt zwischen Entwicklung und Betrieb gerecht zu werden. Doch dieser ist denkbar ungeeignet.

## zu spät 
Dass eine Software neuen Anforderungen genügt, lässt sich nämlich nicht nachträglich hineintesten, sondern muss bereits während der Entwicklung sichergestellt werden. Damit fällt die Verifizierung in den Aufgaben- und Verantwortungsbereich der Entwickler.
Hinzukommt, dass Software nicht per se testbar ist. Wir müssen schon während der Entwicklung dafür sorgen, dass alle Testfälle auch prüfbar sind.
Ansonsten ergeben sich nicht nur blinde Flecke in der Testabdeckung, sondern auch bei der Analysierbarkeit von Fehlerbildern.
Last but not least [wachsen die Fehlerbehebungskosten exponentiell](https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/20100036670.pdf), je mehr Zeit zwischen der Entstehung eines Fehlers und seiner Entdeckung durch den Test liegen. Das liegt zum einen daran, dass der Scope des zu analysierenden Changesets anwächst, zum anderen unterbricht es die Arbeit des Entwicklerteam an neuen Features und führt dadurch zu einem kostenintensivem Context Switch.

## zu früh
Doch auch für die Validierung ist der Zeitpunkt zwischen Entwicklung und Betrieb ungünstig.  Meist geht es hierbei um die Erwartungen an Qualitätsmerkmale wie Usability, Sicherheit, Perfomance, Ausfallsicherheit, etc.. In einer Laborumgebung lassen sich diese aber oft nur lückenhaft oder mit hohem Aufwand testen.

Auch die Formulierung aussagekräftiger Testszenarien gestaltet sich schwierig. Wie heißt es so schön:
In der Theorie sind Theorie und Praxis gleich, aber die Realität sieht dann doch oft anders aus, als wir es erwarten. 

## Die agile Testverschiebung
Um diesem Dilemma zu entkommen, müssen wir geeignetere Zeitpunkte für die Qualitätssicherung finden. Vereinfacht gesagt, verschieben wir so weit wie möglich die Produktverifikation in die Entwicklungsphase und die -validierung in den Betrieb. Welche Testverfahren nach links bzw. nach rechts verlagert werden, können wir mit Hilfe der agilen Testmatritzen von [Lisa Crispin](https://lisacrispin.com/2011/11/08/using-the-agile-testing-quadrants/) und [Gojko Adzic](https://gojko.net/2013/10/21/lets-break-the-agile-testing-quadrants/) entscheiden. Testmethoden die das Team unterstützen bzw. gegen spezifizierte Ergebnisse prüfen wandern in die Entwicklungsphase, Prüfungen, die das Produkt bewerten bzw. beobachtetes Verhalten analysieren, landen im Betrieb.

Die dann noch verbleibenden Testaktivitäten sollten sich auf ein notwendiges Mimimum reduzieren. Was hilft mir die schnellste Deploymentpipeline, wenn ich für die Qualitätssicherung zwischen Entwicklung und Betrieb viele Stunden oder sogar Tage benötige? 

![Agile QA Shift](/assets/agile_qa_shift.png)


## Shift left
Doch wie sieht das Ganze nun in Praxis aus?  Um die Verifikationstests erfolgreich in die Entwicklungsphase verlagern zu können, müssen die qualitätssichernden Maßnahmen nahtlos in die Entwicklungsschritte integriert werden. Die Entwickler müssen dafür neue Methoden wie beispielsweise Testgetriebene Entwicklung und deren Werkzeuge in ihre Praxis übernehmen und eng mit Anforderern und Qualitätsexperten zusammenarbeiten, um geeignete Testszenarien zu definieren. Damit Fehler frühzeitig erkannt werden, ist es darüber hinaus essentiell, die Tests im Rahmen eines Continuous-Integration-Ansatzes regelmäßig auszuführen.

### Methoden
* Test Driven Development
* Test Pyramide
* Specification by Example
* Continuous Integration
* 3-Amigo-Session

### Werkzeuge
* Unit Tests
* Integration Tests
* Acceptance Tests

## Shift right
Auf der anderen Seite müssen wir für die Produktvalidierung im Betrieb Metriken erheben, die es uns erlauben, die Erreichung unserer Qualitätsziele zu überprüfen. Dazu zählen beispielsweise Nutzungsstatistiken oder die Messung von Antwortzeiten. Außerdem müssen wir in regelmäßigen Abständen Grenzsituationen herbeiführen, um sicherzustellen, dass sich unser Produkt auch unter diesem Umständen wie gewünscht verhält. Prominentes Beispiel dieses Ansatzes ist die [Simian Army](https://medium.com/netflix-techblog/the-netflix-simian-army-16e57fbab116) von Netflix, die kontinuierlich Server bis hin zu ganzen Rechenzentren ausschaltet, um die Resilienz der Plattform zu überprüfen. Voraussetzung für diese Testverfahren sind jedoch automatisierte Deployments, die in kürzester Zeit ein [Rollback oder Fix Forward](https://www.linkedin.com/pulse/service-recovery-rolling-back-vs-forward-fixing-mohamed-el-geish/) ermöglichen.

### Methoden
* A/B-Testing
* Chaos Engineering
* Feature Toggles
* Canary Releases
* Shadowing

### Werkzeuge
* Event- und Logfilemonitoring
* Simian Army
* Feature Toggles

## Voraussetzungen
Damit Ihr diese Herangehensweise in Eurem Team etablieren könnt, müsst Ihr jedoch die folgenden Punkte sicherstellen. 

* _Definition Of Test_  
Überlegt Euch, welche Testverfahren Ihr benötigt und wie diese in Euren Entwicklungsprozess integriert werden. Ein guter Startpunkt hierfür sind die bereits erwähnten Testmatritzen.

* _Kompetenzaufbau_  
Eignet Euch das notwendige Know How an. Dazu gehört sowohl Technologiewissen wie beispielsweise über Monitoring- und Testingframeworks als auch handwerkliche Kompetenz wie die Testgetriebene Entwicklung.

* _Inspect & Adapt_  
Überprüft regelmäßig, ob die von Euch gewählte Herangehensweise funktioniert. Erhebt Metriken wie die Mean Time to Recovery, Bugstatistiken, etc. und legt Verbesserungsmaßnahmen in Euren Retrospektiven fest.

## Fazit
Der klassische Ansatz mit der QA-Phase zwischen Entwicklung und Betrieb kommt in einer agilen Produktentwicklung an seine Grenzen. Um auch bei der Qualitätssicherung das volle Potential eines interdisziplinären Teams ausschöpfen zu können, müssen wir möglichst viele unserer Testaktiviäten entweder in die Entwicklung oder den Betrieb verlagern. Die Unterscheidung zwischen Verifikation und Validierung kann uns dabei helfen.


