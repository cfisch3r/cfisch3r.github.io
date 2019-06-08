---
layout: post
title: Testabdeckung als KPI
subtitle: sinnvolle Metrik oder Business Theater?
category: "TDD"
fb-img: /images/media/posts/testcoverage.png
ref: test_coverage
description: "Eignet sich die Messung der Testabdeckung zur Steuerung der Codequalität und damit der Produktivität im Unternehmen?"
excerpt_separator: <!--more-->
---

Eignet sich die Messung der Testabdeckung zur Steuerung der Codequalität und damit der Produktivität im Unternehmen? Und wenn nicht, was kann man tun, um beides zu verbessern? Die Meinungen hierzu gehen weit auseinander. Es lohnt sich also, genauer hinzuschauen.

<!--more-->

![Test Coverage](/images/stage/posts/testcoverage.png)

Wer meine Blogbeiträge liest, wird schwerlich übersehen, dass ich ein glühender Verfechter der Testgetriebenen Entwicklung bin. In meinen Augen ist diese Methode einer der größten Hebel zur Produktivitätssteigerung in unserem Handwerk. Keine andere Praktik verbindet Qualitätssicherung, Anforderungsanalyse und Software Design so effizient miteinander wie TDD.

Wenn ich von etwas überzeugt bin, habe ich immer den Wunsch, auch Andere davon zu begeistern. Denn wenn alle Teamkollegen am gleichen Strang ziehen, fällt das Erlernen neuer Praktiken und Technologien viel leichter, da man die Erfahrungen miteinander teilen und sich gegenseitig unterstützen kann. Außerdem stellen sich so Erfolge schneller ein und ermutigen uns, bei der Stange zu bleiben.

Als Entwickler in einem Team gelang es mir meist, meine Kollegen von TDD zu überzeugen, in dem ich selbst meinen Code testgetrieben entwickelt habe. Wenn später einer meiner Kollegen in diesem Code Veränderungen vornehmen musste, konnte er so am eigenen Leib erfahren, um wieviel einfacher das dank der Testabdeckung von der Hand ging. Damit war meist die Neugier und der Wunsch geweckt, diese Methode selbst einmal auszuprobieren. Gerne war ich natürlich bereit, im Pair Programming die Grundlagen zu zeigen und die ersten größeren Hürden zu überwinden, und wer einmal selbst erlebt, wie sich auf diese Weise Stück für Stück ein gutes Software Design und solides Vertrauen in den eigenen Code ergeben, bleibt in der Regel dabei.

Leider konnte ich auf diese Strategie aber nicht mehr zurückgreifen, als ich in das Management wechselte und mit einem Mal die Verantwortung für mehrere Teams übernahm. Nach wie vor war ich überzeugt, dass wir uns und unseren Kunden mit TDD das Leben leichter machen, aber wie sollte ich meine neuen Kollegen jetzt als Manager davon überzeugen. In meiner neuen Rolle konnte ich nicht mehr mit gutem Beispiel vorangehen und meinen Code für mich sprechen lassen, geschweige denn im Pair Programming mitentwickeln.
Also probierte ich es mit dem Klassiker der Führung; ich machte Vorgaben! Von nun an sollte jedes Team ihre Testabdeckung messen und die Vorgabe von 80% erreichen. Das würde sie, so meine naive Idee, schon dazu bringen, sich mit TDD auseinanderzusetzen.

Doch was als frommer Wunsch entstand, entpuppte sich nach einiger Zeit als großer Fehler. Die Werte für die Testabdeckung stiegen zwar kontinuierlich - schließlich wollte jeder beim Chef gut dastehen - aber die Produktivität nahm nicht zu, im Gegenteil. Immer öfter hörte ich, *"Das wird aber länger dauern, weil wir noch Tests schreiben müssen"* oder *"Wir konnten das Sprintziel nicht erreichen, weil wir erst noch die Tests fixen mussten."*.

Bei genauerer Betrachtung wurde mir dann auch klar, was die Ursachen hierfür waren. Im Code fanden sich viele der Muster wieder, die als TDD-Antipattern gelten:  

* Testen von Getter- und Settermethoden  
* Testen von generiertem Code
* exzessives Testen über End-To-End-Tests
* Eine Testklasse pro Implementierungsklasse

Damit wuchs der Aufwand ohne den gewünschten Produktivitätszuwachs zu erreichen. Noch schlimmer, die Kollegen hassten TDD, da sie keinen Mehrwert in dieser Methode erkannten.
(Mehr über diese Antipattern und wie sie sich vermeiden lassen, erfahrt Ihr in meinem [Talk auf der JCON](/events/tdd_sucks_jcon.html)).

Wie kam es dazu? Um meine Vorgabe zu erfüllen, hatten meine Mitarbeiter ihren Fokus und ihre ganze Energie auf die Erfüllung dieser einen Meßgröße "Testabdeckung" gelegt - allerdings zu Lasten der anderen Aspekte einer guten Testimplementierung:

* Unit of Works als Testgegenstand
* Bewertung der Codekritikalität
* Entkopplung zwischen Test- und Produktivcode
* Berücksichtigung der Testpyramide

Dieser unerwünschte Effekt von Performancemessungen ist auch als
**Incentive Distortion** bekannt. Wenn das Unternehmen Vorgaben einführt, hat es zunächst zwar den gewünschten Effekt, nämlich, dass die Mitarbeiter alles daran setzen, diese zu erfüllen. Um diese Mehraufwände zu kompensieren, reduzieren sie jedoch ihre Anstrengungen für die nicht sichtbaren/gemessenen Aktivitäten.

Als eines der bekanntesten Beispiel gelten die Untersuchungsergebnisse von Peter M. Blau in einem Arbeitsamt. Die Bewertung der Mitarbeiter geschah dort auf Basis der Anzahl der geführten Kundengespräche. Das führte dazu, dass zwar mehr Gespräche stattfanden, allerdings verwendeten die Angestellten auch weniger Zeit auf die Suche nach neuen Jobangeboten, was ja ebenfalls für den Erfolg der Behörde wichtig war. Also erweiterte man die Anzahl der Performanceindikatoren auf acht. Mit der Zeit musste man aber feststellen, dass auch diese Werte zwar stiegen, das Ergebnis sich aber nicht verbesserte. Eine dieser neuen Metriken war beispielsweise der Prozentsatz der Interviews, die zu einer Jobvermittlung geführt haben. Die cleveren Angestellten fanden auch hier einen Weg der Optimierung, indem sie einfach die Protokolle von Gesprächen ohne Vermittlung unter den Tisch fallen ließen.  

Eine ausführliche Beschreibung dieses Falls und eine umfassende Untersuchung zum Thema Performancemessungen findet Ihr im Buch [Measuring and Managing Performance in Organizations](https://www.amazon.de/dp/0932633366/ref=cm_sw_em_r_mt_dp_U_E20-CbXFRPB3W).

Das Beispiel zeigt sehr schön, dass Vorgaben zum Scheitern verurteilt, wenn man nicht alle relevanten Leistungsaspekte berücksichtigt und misst. Wenn wir uns aber die obige Liste für die Merkmale einer gute Testimplementierung anschauen, muss man feststellen, dass eine umfassende Abdeckung mit Metriken schlicht nicht möglich ist, zumal die Liste sicherlich nicht vollständig ist. Mit Vorgaben kam ich hier also nicht weiter.

Was konnte ich aber als Alternative tun? Ganz einfach das, was aus meiner Sicht die wichtigste Aufgabe einer Führungskraft ist: die richtigen Rahmenbedingungen schaffen und den Kollegen die Möglichkeit geben, das notwendige Know How aufzubauen. Konkret bedeutete das:

* **Schutz vor Druck**  
  Immer wenn ich beobachtete, dass der Product Owner oder Kunde das Team dazu drängte, mehr Features zu liefern und die Testabdeckung dafür zu vernachlässigen, habe ich mich in die Diskussion eingeschaltet und dem Team den nötigen Schutzraum gegeben.

* **Mentoring**  
  Die Mitarbeitern, die bereits sehr vertraut mit testgetriebener Entwicklung sind, habe ich unterstützt und ihnen den Freiraum geschaffen, ihr Wissen im Pairprogramming an die anderen Kollegen weiterzugeben.

* **Explizite Trainingszeit**  
  Das Erlernen von TDD erfordert Zeit. Aus diesem Grund habe ich dem Team einen wöchentlichen Timeslot ermöglicht, in dem sie diese Methodik trainieren konnten.


Durch diese Maßnahmen änderte sich natürlich nicht alles von heute auf morgen. Aber im Laufe von zwei Jahren wurden aus Entwicklern gestandene TDD Practioner. Und die Erfolge konnten sich sehen lassen:
* geringe Bugquote
* Keine Releaserollbacks
* weniger Nacharbeiten nach der Storyabnahme

## Fazit
Die Vorgabe der Testabdeckung eignet sich aus meiner Sicht nicht dafür, die Codequalität und Produktivität zu verbessern. Notwendig hierfür sind allein gut ausgebildete Mitarbeiter, die ihren Job in einer unterstützenden Umgebung machen können. Ist die Testabdeckung daher böse? Nein, nicht wenn das Team sie als Feedbackinstrument für ihre kontinuierliche Verbesserung nutzt. Ein weiteres gutes Einsatzgebiet sind Legacyprojekte. Wenn man dort nach der Boy-Scout-Regel die Technischen Schulden abträgt, hat man manchmal den Eindruck, auf der Stelle zu treten. Hier kann es helfen, den Fortschritt durch die Messung der Testabdeckung transparent zu machen. Das schafft Motivation.
