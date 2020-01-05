---
layout: post
title: Living Specification
subtitle: mit JGiven
category: "TDD"
fb-img: /images/media/posts/testcoverage.png
ref: living_specification
description: ""
excerpt_separator: <!--more-->
---



<!--more-->

## Specification by Example
Behaviour Driven Development (BDD) verfolgt den Ansatz, das gewünschte Verhalten einer Software durch konkrete Nutzungsbeispiele zu spezifizieren. Daher spricht man auch häufig von _Specification by Example_. Diese Art der Spezifikation hat den Vorteil, dass sie automatisiert testbar ist und so die Kluft zwischen Anforderungsmanagement und Qualitätssicherung schließt. Entscheidend ist dabei, dass diese Beispiele möglichst natürlichsprachlich formuliert werden, so dass alle Stakeholder, egal ob Product Owner, Entwickler oder QA Engineer, daran mitwirken können.

## Testautomatisierung durch Gherkin
Um eine Testautomatisierung zu erleichtern, werden die Beispiele meist in einem einheitlichen Schema formuliert. Am weitesten Verbreitet ist die Nutzung der  [Gherkin-Sprache](https://cucumber.io/docs/gherkin/reference/), die Nutzungsszenarien wie folgt beschreibt.

{% highlight gherkin %}
Gegeben sei ein Zustand
Wenn eine Aktion stattfindet
Dann ergibt sich das folgende Ergebnis
{% endhighlight %}

Viele BDD-Frameworks wie beispielsweise [Cucumber](https://cucumber.io) parsen die auf diese Weise erstellten Beispieldateien und projizieren sie auf Testanweisungen, die durch die Entwickler zuvor bereitgestellt werden müssen. Das hat den Vorteil, dass die Szenarien auch durch Personen erstellt werden können, die über keine Programmierkenntnisse verfügen. Außerdem ist die Spezifikation vom Testframework entkoppelt. Allerdings bringt dieser Ansatz erhöhte Komplexität und Wartungsaufwand durch eine zusätzliche technische Verarbeitungskomponente mit sich. Dieser Mehraufwand lohnt sich in meinen Augen nicht, wenn die Nutzungsszenarien von den Entwicklern geschrieben werden oder wenn die Applikation bereits über viele Spezifikationen in Form von Unittests verfügt.

## JGiven
In diesen Fällen empfiehlt es sich, Testframeworks einzusetzen, die die Gherkin-Spezifikation in Form von Testreports generieren können, um sie mit den Stakeholdern abstimmen zu können. [Jgiven](http://jgiven.org) ist ein solches Framework, dass ich Euch an einem Beispiel vorstellen möchte.

{% highlight java %}
public class GeneralItemsUpdateSpecification {

    @Test
    void itemQualityIsReducedOnUpdate() {
        Item item = new Item("", 5, 8);
        GildedRose gildedRose = new GildedRose(new Item[]{item});
        gildedRose.updateQuality();
        assertThat(item.quality).isEqualTo(7);
    }
}
{% endhighlight %}


Schauen wir uns mal einen Test mit diesem Framework an.
{% highlight java %}
class GeneralItemsUpdateSpecification extends ScenarioTest<GivenStage, WhenStage, ThenStage> {

    @Test
    void Item_Quality_is_reduced_on_Update() {
        given().an_item_with_Sellin_of_$_and_Quality_of_$(5,8);
        when().items_are_updated();
        then().Qualitity_of_the_item_is(7);
    }

}
{% endhighlight %}

Der Test erweitert die Basistestklasse `ScenarioTest`und erbt dadurch die vom Framework bereitgestellten Methoden `given`, `when`und `then`, die die jeweiligen Gherkin-Schlüsselwörter repräsentieren. Durch ein Fluent Interface lassen sich darüber die einzelnen Testschritte aufrufen, die in jeweiligen Phase zur Verfügung stehen. Die Methodenaufrufe selbst werden an die für die jeweilige Phase definierte Stage-Klasse weitergeleitet, die in der generischen Basisklasse des Tests angegeben wurde. In diesem Fall sind es die Klassen GivenStage, WhenStage und ThenStage.



## Fazit
