---
layout: post
title: Besser Entwickeln mit TDD
subtitle: Stressfreie Programmierung mit Plan
category: "TDD"
ref: tdd_multi_tasking
fb-img: /assets/tdd_cycle.png
excerpt_separator: <!--more-->
---

Wenn wir programmieren, müssen wir ständig viele Aspekte gleichzeitig im Blick behalten. Da sind zum einen die fachlichen Anforderungen, dann die Details der eingesetzten Technologien und schließlich soll der Code auch noch gut wartbar und erweiterbar sein. Wie schaffen wir es, dem gerecht zu werden, ohne dass uns irgendetwas durchrutscht? Wieder einmal ist es die Testgetriebene Entwicklung, die uns hierauf eine Antwort liefert, indem sie uns dabei hilft, den Überblick zu bewahren und nicht im Multitasking unterzugehen.

<!--more-->

Dass wir nicht so gut darin sind, mehrere Dinge gleichzeitig zu tun, ist sicherlich nichts Neues. Etliche Studien belegen den negativen Einfluss, den das Multitasking auf unsere Leistungsfähigkeit hat. Manche gehen dabei sogar so weit und vergleichen den Effekt auf unsere analytischen Fähigkeiten mit denen des [Mariuhanakonsums](https://www.forbes.com/sites/vanessaloder/2014/06/11/why-multi-tasking-is-worse-than-marijuana-for-your-iq/#3d662e7c11b3).
Hinzukommt kommt, dass unser Stresslevel steigt, wenn wir versuchen, mehrere Dinge gleichzeitig zu tun.
Grund genug also, bei unserer täglichen Arbeit darauf zu achten, möglichst nur einer Aufgabe gleichzeitig unsere volle Aufmerksamkeit zu schenken.

## Teile und herrsche
Doch was hat das nun mit Testgetriebener Entwicklung zu tun? Werfen wir dafür zunächst mal einen Blick auf die Herausforderungen, die uns beim Programmieren erwarten. Im Wesentlichen geht es um die folgenden drei Aufgabenbereiche:

1. **Problemanalyse**  
Wir müssen verstehen, welches Ergebnis der Code liefern muss und woran wir das korrekte Verhalten unserer Software festmachen.

2. **Implementierung**  
Wir müssen die eingesetzten Technologien richtig verwenden und sicherstellen, dass sie das gewünschte Ergebnis liefern.

3. **Code Design**  
Der Programmcode muss für andere Entwickler gut verständlich sein, damit er in der Zukunft wartbar ist. Das Design sollte darüberhinaus künftige Erweiterungen erleichtern.

Wenn wir jetzt versuchen, diesen Anforderungen gleichzeitig gerecht zu werden, laufen wir Gefahr, genau in die eingangs beschriebenen Effekte des Multitaskings zu laufen. Wir sind also gut beraten, die Aufgabenbereiche nacheinander anzugehen und genau das tun wir in der Testgetriebenen Entwicklung. Jede TDD-Phase adressiert dabei genau eines der drei Aufgabenfelder:

* **Test First**  
In der ersten Phase formulieren wir die Tests und konzentrieren uns nur darauf, das Problem zu beschreiben. Wir definieren die Kernfunktionalität ebenso wie mögliche Grenzfälle.

* **Make it work**  
Im zweiten Schritt konzentrieren wir uns ausschließlich darauf, den Test erfolgreich laufen zu lassen. Wir wählen den einfachsten Implementierungsansatz, der zum gewünschten Ergebnis führt.

* **Refactoring**  
Im letzten Teil schließlich kümmern wir ums um das Design unseres Codes. Welche Entwurfsmuster eignen sich am besten? Wie muss der Code gestaltet werden, um guten Designprinzipien zu genügen und so die Wartbarkeit sicherzustellen.

![TDD Zyklus](/assets/tdd_cycle.png)

Die explizite Trennung der drei Phasen ermöglicht es uns, den Fokus vollständig auf die jeweils anliegende Aufgabe zu lenken.

## Auf die Reihenfolge kommt es an
Der TDD-Prozess teilt aber nicht nur die Aufgabengebiete voneinander, sondern gibt auch eine klare Reihenfolge vor. Zunächst müssen wir das Problem **verstehen**, dann erst können wir es **lösen** und zum Schluss gilt es, das Design zu **optimieren**. Das schützt uns davor, vorzeitig von der Analyse in die Lösung zu springen und dabei wesentliche Aspekte der Aufgabenstellung zu übersehen. Und indem wir die Optimierung ans Ende stellen, verhindert TDD eine [vorzeitige Optimierung](http://wiki.c2.com/?PrematureOptimization), die ja bekanntlich die Wurzel allen Übels ist.

Am Ende jeder Phase steht zudem ein konkretes Ergebnis, in dem wir alle gewonnenen Erkenntnisse festhalten. So können wir den Kopf wieder frei machen für den nächsten Prozessschritt.

Last but not least erleichtert uns der definierte Ablauf der Testgetriebenen Entwicklung, uns jeden Schritt bewusst vor Augen zu führen. Das ist eine wichtige Voraussetzung dafür, den Entwicklungsprozess kontinuierlich verbessern zu können. Das ist ähnlich wie bei Spitzensportlern. Ein Weitspringer beispielsweise zerlegt seinen Bewegungsablauf in Anlauf-, Sprung-, Flug- und Landephase. Dadurch kann er jeden dieser Schritte gezielt optimieren.

## Fazit
Die Testgetriebene Entwicklung hilft Euch dabei, Multitasking in der Programmierung zu vermeiden und effektiv und effizient zu einem Ergebnis zu kommen. Nicht zuletzt bedeutet das weniger Stress bei der täglichen Arbeit, und wer wünscht sich das nicht.
