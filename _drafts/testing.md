---
layout: post
title: Agile Teststrategie
subtitle: Mit Strategie zum Erfolg
category: "Agile Methoden"
excerpt_separator: <!--more-->
---

Karl Lagerfeld hat mal gesagt: "Wer Jogginghosen trägt, hat die Kontrolle über sein Leben verloren."
Übertragen auf uns Entwickler könnte man sagen: "Wer keine Tests hat, hat die Kontrolle über sein Produkt verloren".
Doch was soll man nun alles testen und wie? Klar ist, alles zu testen ist unmöglich. Nichts zu testen aber auch keine Alternative, möchte man nicht irgendwann in der Zeitung stehen. Irgendwo dazwischen liegt irgendwo die Wahrheit. Gibt es vielleicht eine Methode, mit der man sich annähern kann?
<!--more-->

Auf dem Weg zu einer guten Teststrategie gilt es im ersten Schritt erstmal herauszufinden, welche Tests wir für unser Produkt überhaupt benötigen. Hierbei kann uns die von Lisa Crispin erstellten Agilen Testmatrix helfen. Sie kategierisiert die Testarten anhand zweier Dimensionen. Zum einen unterscheidet sie zwischen Tests, die die Qualitätseigenschaften des Gesamtproduktes prüfen und denen, die dem Team bei der Produktentwicklung unterstützen. Zum anderen trennt sie technologisch von fachlichen orientieren Tests.

Aus dieser Betrachtung ergeben sich somit vier Quadranten, in die sich die verfügbaren Testtypen einordnen lassen.

## Q1: technisch orientierte, Team unterstützend
Diese Tests unterstützen unmittelbar bei der sicheren Entwicklung der Produktkomponenten. Sie gewährleisten, dass bei Codeänderungen keine unerwünschten Nebenwirkungen auftreten. Außerdem überprüfen sie die korrekte Zusammenarbeit zwischen den Modulen. Last but not least bieten sie den Entwicklern ein Sicherheitsnetz, um kontinuierlich durch refactorings den Code zu verbessern und ermöglichen so die Entstehung eines emergenten Code Designs.
Die Erstellung und Ausführung der Tests ist sehr eng mit dem Programmierprozess verbunden, häufig in Form eines Testgetriebenen Entwicklungsvorgehens (TDD).

### Testtypen
- Unit Test
- Component Test
- Integration Test
- Contract Test

### Werkzeuge
- Xunit
- Docker Rule
- wiremock


## Q2: fachlich orientiert, Team unterstützend
Die Testmethoden in diesem Quadranten stellen sicher, dass die Entwicklung die fachliche geforderten Funktionalitäten erfüllt. Sie helfen dabei, gemeinsam mit der Fachseite die Anforderungen über Testfälle zu konkretisieren. Bei deren Formulierung kommen häufig Beschreibungssprachen wie Gherkin zum Einsatz, um das gemeinsame Verständnis von Fachbereich und Entwicklern zu fördern. Dadurch lassen Lücken und Inkonsistenzen im Fachkonzept bereits vor der Implementierung erkennen und aufwändige Nacharbeiten vermeiden. Durch die Fokussierung auf das fachlichen Anforderungen lassen sich die Tests darüber hinaus auch für die  Dokumentation des funktionalen Leistungsumfangs des Produktes verwenden.

### Testtypen
- Acceptance Test
- Journey Test
- Smoke Test

### Werkzeuge
- Selenium
- Fitness
- Cucumber

## Q3 - fachlich orientiert, Produkt prüfend
Der Fokus dieser Kategorie liegt auf den fachlich geprägten Qualitätsmerkmale des Produktes. Vornehmlich handelt es sich dabei um Eigenschaften, die sich aus der Interaktion zwischen Nutzer und Produkt ergeben. Hierzu zählen neben generellen Usabilityaspekten auch Barrierefreiheit, Fehlertoleranz und rechtliche Anforderungen wie beispielsweise Datenschutz. Der Automatisierungsgrad bei diesen Tests ist nahezu null.

### Testtypen
- A/B Test
- Usability Test
- Explorative Test

### Werkzeuge
- User Lab
- Optimizely
- Crowd Testing

## Q4: technisch orientiert, Produkt prüfend
Testgegenstand sind die nichtfunktionale Anforderungen an das Produkt wie Verfügbarkeit, Kapazität, Antwort- und Lastverhalten, etc. Aufgrund des starken Infrastrukturcharakters erfordern diese Testmethoden meist einen hohen organisatorischen Aufwand. Außerdem haben sie Lange laufzeiten. Umso wichtiger dass sie regelmäßig laufen. Und früh geplant werden. Teilweise sind die Setups für realistische Szenarien so aufwändig, dass die nur nach dem Release in der Produktion laufen können. Ein Beispiel ist die Simian Army von Netflix, die nach zufälligem Muster Server oder auch ganze Rechenzentren ausschaltet, um die Robustheit der Plattform zu prüfen.

### Testtypen
- Load Test
- Pen Test
- Failover Test

### Werkzeuge
- Gatling
- Simian Army
- OWASP 10


die für eine  
Zunächst einmal geht es bei einrDas Ziel einer guten Strategie ist es, eine möglichst gute Testabdeckung zu erreichen und dabei den Kostennutzenverhältnis im Blick zu habenWie schon bei den User Stories ist es wichtig, alle Produktaspekte zu berücksichtigen. Kompromisse kann man dann in Bezug auf die Tiefe treffen. Breite also vor Tiefe. Was hilft es mir, wenn ich perfekt hinsichtlich Sicherheit bin, das Produkt aber bei jedem zweiten Request eine Fehlermeldung bringt. Nur wenn alle Aspekte ausreichen abgedeckt sind, entsteht ein Nutzwert.

Lisa Crispins Agile Testmatrix kann gut als Ausgangspunkt für das Sammeln der Kriterien genutzt werden.

Team/Technisch
hilft das Produkt zu bauen. Code Design, Überprüfbarkeit, Refactoring

Beispiele:
- Unit/Komponeten Tests
- Assembly test
- Containertests
- Contract Tests
