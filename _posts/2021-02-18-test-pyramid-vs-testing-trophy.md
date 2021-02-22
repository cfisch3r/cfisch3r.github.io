---
layout: post
title: Test Pyramide und Testing Trophy
subtitle: Freunde oder Gegner?
category: "Test Pyramid"
fb-img: /images/media/posts/pyramid_vs_trophy/pyramid_vs_trophy.png
ref: pyramid_vs_trophy
description: ""
excerpt_separator: <!--more-->
---

Ist die Testpyramide falsch und sollten wir lieber mehr Integration als Unit Tests schreiben, wie die alternative Test Trophy es vorsieht? Zeit für einen genaueren Blick auf diese beiden Teststrategien. 

<!--more-->

## Die Testpyramide in der Kritik
Lange galt die Test Pyramide unumstritten als der Königsweg für eine effiziente und effektive Teststrategie. Ihre Kernaussage hat Martin Fowler gewohnt treffend in seinem [Blogartikel](https://martinfowler.com/articles/practical-test-pyramid.html#TheTestPyramid) wie folgt zusammengefasst:

> 1. Write tests with different granularity
> 2. The more high-level you get the fewer tests you should have

Doch in den letzen Jahren kam vermehrt Kritik insbesondere zur Testverteilung auf. Einer der populärsten Verteter dieser neuen Sichtweise ist sicherlich Kent C. Dodds mit seinem Gegenentwurf der Testing Trophy.

{% twitter https://twitter.com/kentcdodds/status/960723172591992832 %}

Im Gegensatz zur Testpyramide favorisiert Kent die Integrationstests gegenüber den Unit Tests auf der darunterliegenden Ebene. In seinem [Blogartikel](https://kentcdodds.com/blog/write-tests) begründet er diese Entscheidung im Wesentlichen mit zwei Argumenten:

### Integration Tests haben einen größeren "Konfidenzquotienten" als Unit Tests. 
Was er damit meint, wird einem am besten bewusst, wenn wir uns diesen Tweet von Randy Olson anschauen.

{% twitter https://twitter.com/randal_olson/status/779671851819819008 %}

Wenn wir wirklich wissen wollen, ob unser Produkt vom Nutzer wie beabsichtigt verwendet werden kann, müssen wir es beim Testen als Ganzes betrachten. Funktionierende Einzelteile alleine sagen nichts darüber aus, ob unser Produkt letztendlich korrekt arbeitet. Es ist also nicht von der Hand zu weisen, dass Integration Tests mir eine höhere Zuversicht in die Aussagekraft meiner Testresultate geben. Wie sieht es aber mit dem zweiten Argument aus?

### High Level Tests können Lower Level Tests ersetzen, solange sie schnell, zuverlässig und einfach zu ändern sind.
Kent bezieht sich dabei auf ein Zitat von Martin Fowler aus bereits erwähntem [Blogartikel](https://martinfowler.com/articles/practical-test-pyramid.html#TheTestPyramid).

> If my high level tests are fast, reliable, and cheap to modify - then lower-level tests aren't needed. 

Drei häufig auftretende Probleme von Integrationstests auf höherer Ebene werden hier angesprochen, die sich durch die zunehmende Komplexität im Test Fixture ergeben und uns dazu nötigen, vornehmlich auf niedrigeren Stufen zu testen:

- **niedrige Geschwindigkeit** aufgrund längerer Testlaufzeiten
- **geringere Zuverlässigkeit** durch Nebeneffekte
- **höhere Wartungsaufwände** durch Anpassungen des Test Fixtures

Heutzutage bringen moderne Application Frameworks jedoch meist sehr leistungsfähige Integrationtestframeworks mit, die diese Nachteile auf ein Minimum reduzieren. In der Regel kann die gesamte Applikation in wenigen Sekunden mit all ihren Komponenten gestartet werden und es existieren In-Memory-Mocks für alle gängigen externen Schnittstellen. Bedeutet das aber nun, dass wir einfach unsere Lower Level Tests ersetzen können?

## Zwei Seiten einer Medaille
Aus meiner Sicht werden zwei wesentliche Vorteile von Lower Level Tests außer Acht gelassen.

### Lower Level Tests haben eine höhere Signifikanz
Schlägt ein Test auf einer niedrigen Ebene fehl, ist die Ursachenanalyse deutlich einfacher, da der Code under Test einen geringeren Umfang hat. Wir müssen deutlich weniger Code analysieren und vermeiden meist aufwändige Debugging Sessions.

### Lower Level Tests haben eine geringere kombinatorische Komplexität.

Diesen Aspekt möchte ich gerne anhand eines Beispiels erläutern. Angenommen wir haben einen Anwendungsfall zur Berechnung eines Kreditangebots implementiert, bei dem Beträge in verschiedenen Währungen eingegeben werden und als Resultat der geltende Zinssatz zurückgegeben wird. Wir haben die Logik in zwei Module unterteilt, eines zur Konvertierung des Betrags auf eine Standardwährung (in diesem Fall Euro) und das andere zur Ermittlung der Zingsrate auf Basis des Betrags in der Standardwährung.

Mit dem klassischen Ansatz der Testpyramide hätten wir für jedes der Module jeweils 4 Testfälle auf der Unit Test Ebene, sowie einen Integration Testfall, der das Zusammenspiel der beiden Komponenten prüft. In Summe wären es also 9 zu implementierende Testfälle.

![Unit Test Cases](/images/postinline/posts/pyramid_vs_trophy/unit_tests.png)

Beschränken wir uns hingegen auf die Integration Testebene, ergäbe sich aus der Kombinatorik der weggefallenen Unitttestfälle eine deutlich höhere Zahl an Testfällen, nämlich 4*4 = 16 Testfälle. 

![Integration Test Cases](/images/postinline/posts/pyramid_vs_trophy/integration_test.png)

Die Zahl ließe sich reduzieren, wenn wir implizit das Wissen über den Modulschnitt bei der Testfallerstellung mit einfließen lassen würden. Allerdings sollten unsere Tests im Idealfall nur das Verhalten prüfen und keine Annahmen über die Implementierungsdetails treffen.

Diese Zunahme der Testfälle auf Integrationtestebene wächst zudem noch exponentiell mit der Anzahl der darin enthaltenen Module. Zu dieser Thematik empfehle ich den großartigen Talk [Integrated Tests are a Scam](https://www.youtube.com/watch?v=VDfX44fZoMc) von J.B. Reinsberger.

## Fazit
Auch in Zeiten immer schneller und zuverlässiger laufender Integration Tests haben Unit Tests weiterhin ihre Bedeutung und bieten vor allem eine höhere Signifikanz und geringere kombinatorische Komplexität. Aus diesen Gründen ziehe ich sie in der Regel den darüber liegenden Tests vor, auch wenn ihr Konfidenzquotient sicherlich geringer ist. Für Softwareprodukte, wo sich die Gewichtung des Konfidenzquotienten gegenüber der Signifikanz und kombinatorischer Komplexität zu Gunsten von höher gelegenen Testebenen verschiebt, mag aber eine andere Testverteilung sinnvoller sein. Im konkreten Falle von Javascript-Frontend-Applikationen kann sich dann ein Bild wie die Test Trophy von Kent C Dodds ergeben. Für mich ergibt sich dadurch kein Widerspruch zur Testpyramide, sondern eine spezielle Ausprägung für ein konkretes Einsatzszenario. Meine Antwort auf die eingangs gestellte Frage lautet daher: **Test Pyramide und Testing Trophy: Brüder im Geiste!**