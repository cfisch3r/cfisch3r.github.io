---
layout: post
title: TDD with Spring Boot
subtitle: Best Practices
category: "TDD"
lang: "en"
excerpt_separator: <!--more-->
---

[Spring Boot](https://spring.io/projects/spring-boot) is one of the application frameworks with the best support for Test Driven Development. It comes with a lot of test tools and strategies for our daily development business. But what is the most effective and efficient way to use them? Over the last few years some basic principles emerged from my work on different Spring Boot projects which I would like to share with you.

<!--more-->

## 1. Use the Full Stack Application for Acceptance Tests
First thing I do when I start implementing a new feature is to write a blackbox end-to-end acceptance test. This means the whole application has to start before the first test can run including my own application components as well as all other framework related modules like for example the embedded web server. This is the only way to make sure that all configurations and interactions are tested properly.

As a consequence I have to use a test framework like [REST-assured](http://rest-assured.io) with a HTTP client to connect to the application and perform the requests.

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
 
## 2. Minimize the test scope for components
When developing single application components the test scope should be limited to the corresponding unit of work. This eliminates side effects from other modules and test failures only arises from the code under test. 
Therefore I don't use the `@SpringBootTest` Annotation when implementing new Spring components, because the Testrunner searchs for context configurations in the classpath and then instantiates the associated beans.

A typical minimal test fixture for a REST controller in my projects looks like this.

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

## 3. Use transactions for database operations
A complete test coverage of course includes the persistence layer of the application. Writing tests for it is quite challenging since the implied CRUD operations (**CR**eate **U**pdate **D**elete) change the state of the system and can lead to side effects between the tests. To avoid this problem I use database transactions to roll back any changes to the database made during a test. Spring provides an annotation (what else? :-)) to do this automatically on a test class oder method level: `@Transactional`.

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

**Please note:** You have to activate transactions in your database to make this work. For Mysql for example you have to set the property `hibernate.dialect` to `org.hibernate.dialect.MySQL5InnoDBDialect` at the JPA Vendor Adaptor.

## 4. Separate Business Logic from Application Code
Spring Boot tests are quite fast compared to other application frameworks but still for each test class a Spring context has to be started. While your application grows your build time will continuously increase.
Therefore you should align your test strategy with the [Test Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html) and aim for a broad foundation of unit tests. The best approach to do this is to separate your business logic code from your application code as proposed in the [Hexagonal Architecture](https://blog.octo.com/en/hexagonal-architecture-three-principles-and-an-implementation-example/) by Alistair Cockburn.

The integration can then be done by a bean factory method.

```java
@SpringBootApplication
public class MyApplication {

   @Bean
   public MyBusinessLogic businessLogic () {
       return new MyBusinessLogic();
   }
}
```

## Conclusion
It is quite easy to develop Spring Boot Application in a test driven approach thanks to the excellent test tool support. The presented principles have helped me over the year to do this more efficiently. I am sure that there a a lot of other best practices in this context und would like hear from your experiences!
