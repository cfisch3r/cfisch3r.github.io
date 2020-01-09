---
layout: post
title: Simple BDD
subtitle: Specification by Example mit JGiven
category: "TDD"
fb-img: /images/media/posts/jgiven_report.png
ref: simple_bdd
description: "Eine leichtgewichtige Alternative zu Cucumber & Co"
excerpt_separator: <!--more-->
---
Tests lassen sich hervorragend für die Dokumentation und Spezifikation von Software nutzen. Besonders beliebt hierfür sind BDD-Frameworks wie Cucumber, die allerdings zusätzliche Komplexität mit sich bringen. Eine leichtgewichtige Alternative bietet jedoch das JGiven-Framework, das sich auch gut in eine bestehende Codebasis integrieren lässt.

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

Viele BDD-Frameworks wie beispielsweise [Cucumber](https://cucumber.io) parsen die auf diese Weise erstellten Beispieldateien und projizieren sie auf Testanweisungen, die durch die Entwickler zuvor bereitgestellt werden müssen. Das hat den Vorteil, dass die Szenarien auch durch Personen erstellt werden können, die über keine Programmierkenntnisse verfügen. Außerdem ist die Spezifikation so vom Testframework entkoppelt. Allerdings bringt dieser Ansatz auch eine erhöhte Komplexität und mehr Wartungsaufwand durch eine zusätzliche technische Verarbeitungskomponente mit sich. Dieser Mehraufwand lohnt sich in meinen Augen nicht, wenn die Nutzungsszenarien letztendlich doch von den Entwicklern geschrieben werden oder wenn die Applikation bereits über viele Spezifikationen in Form von Unittests verfügt, die man aufwändig umschreiben müsste.

## JGiven
In diesen Fällen empfiehlt es sich, Testframeworks einzusetzen, die die Gherkin-Spezifikation in Form von Testreports generieren können, um sie dann mit den Stakeholdern abstimmen zu können. [Jgiven](http://jgiven.org) ist ein solches Framework, dass ich Euch in diesem Artikel kurz vorstellen möchte.

## Ein Beispiel
Schauen wir uns das Ganze mal am Beispiel des [Gilde-Rose-Kata](https://github.com/emilybache/GildedRose-Refactoring-Kata) an. Es geht dabei um eine Applikation, die einmal täglich den Warenbestand eines Ladens gemäß der Geschäftsregeln aktualisiert. Diese Funktionalität wird von der Klasse `GildedRose` abgebildet, die eine Liste von Warenobjekten der Klasse `Item` entgegennimmt und deren Attribute verändert.

{% highlight java %}
public class GildedRose {

[...]

    public GildedRose(Item[] items) {
        this.items = items;
    }

    public void updateQuality() {
      [...]
    }
}

public class Item {

    public String name;

    public int sellIn;

    public int quality;

    public Item(String name, int sellIn, int quality) {
        this.name = name;
        this.sellIn = sellIn;
        this.quality = quality;
    }

   @Override
   public String toString() {
        return this.name + ", " + this.sellIn + ", " + this.quality;
    }
}

{% endhighlight %}

Ziel des Katas unter anderem ist es, hierfür eine vollständige Testabdeckung zu erreichen. Als Hinweis steht uns noch eine fachliche [Beschreibung der Geschäftslogik](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt) zur Verfügung, die wir als Ausgangspunkt für unsere Tests nutzen können.

Schauen wir uns zunächst mal die grundlegenden Regeln an.
~~~
- All items have a SellIn value which denotes the number of days we have to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item
~~~

Basierend auf dieser Beschreibung können wir nun den ersten Unittest schreiben.

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

Wie sähe nun im Vergleich dazu der Test mit Hilfe des JGiven-Frameworks aus?

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

Der Test erweitert die Basistestklasse `ScenarioTest` und erbt dadurch die vom Framework bereitgestellten Methoden `given`, `when`und `then`, die die jeweiligen Gherkin-Schlüsselwörter repräsentieren. Durch ein Fluent Interface lassen sich darüber die einzelnen Testschritte aufrufen, die in der jeweiligen Phase zur Verfügung stehen. Die Methodenaufrufe selbst werden an die für die jeweilige Phase definierte Stage-Klasse weitergeleitet, die in der generischen Basisklasse des Tests angegeben wurde. In diesem Fall sind es die Klassen `GivenStage`, `WhenStage` und `ThenStage`.

{% highlight java %}
public class GivenStage extends Stage<GivenStage> {

    @ProvidedScenarioState
    List<Item> itemList = new ArrayList<>();

    public GivenStage an_item_with_Sellin_of_$_and_Quality_of_$(int sellIn, int quality) {
        itemList.add(new Item("", sellIn, quality));
        return self();
    }
}

public class WhenStage extends Stage<WhenStage> {

    @ExpectedScenarioState
    List<Item> itemList = new ArrayList<>();

    public WhenStage items_are_updated() {
        GildedRose app = new GildedRose(itemList.toArray(new Item[]{}));
        app.updateQuality();
        return self();
    }
}

public class ThenStage extends Stage<ThenStage> {

    @ExpectedScenarioState
    List<Item> itemList = new ArrayList<>();

    public ThenStage Qualitity_of_the_item_is(int expectedQuality) {
        assertThat(itemList.get(0).quality).isEqualTo(expectedQuality);
        return self();
    }
}
{% endhighlight %}

Sie alle erweitern die generische `Stage`-Klasse und definieren die in Ihrer Phase zur Verfügung stehenden Testschritte als öffentliche Methoden. Da die Liste der Waren in allen drei Phasen benötigt wird, muss diese als gemeinsamer Zustand über alle Stageklassen hinweg geteilt werden. Hierfür wird diese in der `GivenStage`, wo sie erzeugt wird, als Attribut mit der Annotation `@ProvidedScenarioState`definiert. Während der Testdurchführung nimmt dieses Framework nun diese Liste und übergibt sie an alle Stageklassenobjekte, die über ein entsprechendes Attribut mit der Annotation `@ExpectedScenarioState`verfügen.

## Der Testreport
Was haben wir nun gewonnen? Der Benefit wird deutlich, wenn wir uns den generierten Bericht für diesen Test anschauen.
![JGiven Report](/images/originals/posts/jgiven_report.png)

Im Gegensatz zum Junit-Report, bei dem wir lediglich den Methodennamen zur Testbeschreibung nutzen können, stehen uns mit JGiven alle Details des Nutzungsszenarios zur Verfügung. Hinzukommt, dass dieses natürlichsprachlich formuliert ist und so leicht mit allen Stakeholdern geteilt werden kann. Sehr hilfreich ist dabei das JGiven-Feature der [parametrisierten Testschritte](http://jgiven.org/userguide/#_parameterized_steps).

{% highlight java %}
    public GivenStage an_item_with_Sellin_of_$_and_Quality_of_$(int sellIn, int quality) {
      [...]
    }
}
{% endhighlight %}

In den entsprechenden Methoden der Stageklasse können Platzhalter - in diesem Fall `$` - verwendet werden, die dann im Report durch die jeweiligen Parameterwerte ersetzt werden.

## Fazit
Tests eignen sich nicht nur zur Qualitätssicherung, sondern können auch als [lebende Dokumentation]({% post_url 2020-01-20-living-specification %}) genutzt, bis hin zur Erfüllung von [Tracebility-Anforderungen]({% post_url 2019-03-04-agile-traceability-mit-tdd-und-ci %}) im Projekt. Das JGiven-Framework unterstützt Euch dabei, ohne Aufwand für eine zusätzliche Adapterschicht. Es lässt sich so auch einfach nachträglich in eine bereits bestehende Codebasis integrieren.
