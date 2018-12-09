---
layout: post
title: TDD mit Spring Boot
subtitle: Best Practices
category: "TDD"
excerpt_separator: <!--more-->
---

Es gibt wohl wenige Frameworks, die eine testgetriebene Vorgehensweise so gut unterstützen wie [Spring Boot](https://spring.io/projects/spring-boot). Dem Entwickler bieten sich eine ganze Reihe verschiedener Testwerkzeuge und -strategien, aus denen er sich bedienen kann. Doch wie kann ich diese am effektivsten und effizientesten im Rahmen eines TDD-Ansatzes einsetzen? Über die Jahre haben sich bei mir einige Grundprinzipien herauskristallisiert, die ich gerne mit Euch teilen möchte.

<!--more-->

## 1. Verwende die Full-Stack-Applikation für Akzeptanztests
Wie immer, wenn ich ein neues Feature testgetrieben entwickle, starte ich mit einem Blackbox End-to-End Akzeptanztest. Dafür muss die gesamte Applikation zu Beginn der Tests gestartet werden. Dieses umfasst nicht nur die eigenentwickelten Module sondern auch alle Frameworkbestandteile wie beispielsweise den eingebetteten Webserver. Nur so kann ich sichergehen, dass das Zusammenspiel aller Applikationskomponenten vollständig getestet wird.

Das bedeutet auch, dass ich ein Testframework wie beispielsweise [REST-assured](http://rest-assured.io) verwende, dass auf einem richtigen HTTP-Client basiert und das System von außen aufruft.

```java
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = RANDOM_PORT,classes = MyApplication.class)
public class CalculatingPricesAcceptanceTest {

    @LocalServerPort
    int port;

    @Test
    public void shouldRespondToContentRequest() {
        given()
                .port(port)
        .when()
                .post("/content")
        .then().assertThat()
                .statusCode(OK.value());
   }
}
```
 

## 2. Minimiere den Testscope für Einzelkomponenten
Im Gegensatz zu den Akzeptanztests möchte ich den Scope bei der testgetriebenen Entwicklung einer einzelnen Springkomponente möglichst klein halten. Dadurch vermeide ich unerwünschte Nebeneffekte und kann sichergehen, dass die Tests nur aufgrund genau dieser Komponente fehlschlagen. 
Aus diesem Grund verzichte ich für diese Art der Tests auf die Verwendung der `@SpringBootTest` Annotation, da dabei nach einer Kontextkonfiguration im Klassenpfad gesucht und diese ausgeführt wird, was wiederum zur Folge hat, dass weitere Beans ebenfalls instantiiert werden.

Das Test Fixture für einen REST Controller sieht daher bei mir wie folgt aus:

```java
public class MyControllerIntegrationTest {

    private MockMvc mvc;

    @Before
    public void setUp() {
        this.mvc = MockMvcBuilders
		.standaloneSetup(new MyController())
		.build();
    }

    @Test
    public shouldRespondToContentRequest() {
        mvc.perform(get("/content"))
		.andExpect(status().isOk());
    }

}
```

## 3. Nutze Transaktionen für Datenbankoperationen
Wenn meine Applikation über eine eigene Persistenzschicht verfügt, muss ich diese natürlich auch in meinen Tests berücksichtigen. Eine besondere Herausforderung stellen hierbei die CRUD-Aufrufe (**CR**eate **U**pdate **D**elete) da, da sie den Zustand des Systems verändern und so unerwünschte Nebenwirkungen auf andere Tests haben können. Um dieses Problem zu umgehen, verwende ich beim Einsatz einer Relationalen Datenbank Transaktionen, mit denen ich die im Zuge eines Test gemachten Änderungen einfach wieder rückgängig machen kann. Spring unterstützt diese Vorgehensweise durch eine eigene Annotation (wie sollte es auch anders sein :-)): `@Transactional`.

Damit kann ich auf Klassen- oder Methodenebene definieren, dass nach der Durchführung eines Tests automatisch ein Rollback erfolgt.

```java
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = MyRepositoryConfiguration.class)
@Transactional
public class MyRepositoryIntegrationTest {

    @Autowired
    private MyRepository repository;

    @Test
    public void shouldSaveItem() {
	var newItem = new Item();
        repository.save(newItem);
	var savedItem = repository.get(newItem.getId());
	assertThat(savedItem).isEqualTo(newItem);
    }

}
```

**Wichtig:** Damit das Ganze auch klappt, müsst Ihr sicherstellen, dass Eure Datenbank auch Transaktionen unterstützt. Im Falle von Mysql könnt Ihr das beispielsweise erreichen, indem Ihr die Property `hibernate.dialect` im JPA Vendor Adaptor auf `org.hibernate.dialect.MySQL5InnoDBDialect`setzt.


## 4. Trenne die Geschäftslogik vom Applikationscode
Auch wenn die Startzeit des Springkontextes im Vergleich zu anderen Applikationsframeworks recht kurz ist, sollte Ihr euch davor hüten, alle Tests ausschließlich in diesem Kontext auszuführen, ansonsten steigt die Ausführungszeit rasant an und eine Testzyklen werden immer länger. Deshalb solltet Ihr euch auch hier an die Testpyramide halten und die Mehrzahl der Tests als frameworkunabhängige Unit Tests implementieren. Dafür ist es notwendig, Ihr Eure Geschäftslogik vom Applikationscode trennt und diese unabhängig vom Spring Framework haltet. Die Integration könnt ihr dann einfach per Bean-Factory-Methode durchführen.

```java
@SpringBootApplication
public class MyApplication {

   @Bean
   public MyBusinessLogic businessLogic () {
       return new MyBusinessLogic();
   }
}
```


## Fazit
Spring-Boot-Applikationen lassen sich hervorragend testgetrieben entwickeln. Um dabei die Wartbarkeit und Effizienz sicherzustellen, haben sich für mich die vorgestellten Prinzipien bewährt. Sicherlich gibt es noch viele weitere Best Practices. Ich würde mich freuen, von Euren zu erfahren!
