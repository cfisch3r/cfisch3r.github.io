---
layout: post
title: Test Pyramid and Testing Trophy
subtitle: Friends or Foes?
category: "Test Pyramid"
fb-img: /images/media/posts/pyramid_vs_trophy/pyramid_vs_trophy.png
ref: pyramid_vs_trophy
locale: "en_GB"
description: ""
excerpt_separator: <!--more-->
---

Is the Test Pyramid wrong and should we write more Integration Tests than Unit Tests as suggested by alternatives like the Testing Trophy? Let's have a closer look and see what is behind these test strategies.
<!--more-->

## Test Pyramid
Since a long time the Test Pyramid was the common sense approach for an efficient and effective test strategy. Martin Fowler summarized its core statements in his [blog post](https://martinfowler.com/articles/practical-test-pyramid.html#TheTestPyramid) as follows:

> 1. Write tests with different granularity
> 2. The more high-level you get the fewer tests you should have

But in recent years critical voices have been raised, especially in regards to the test distribution across the different scope levels. One of the most popular representatives of these alternatives is the Testing Trophy fron Kent C. Dodds.

{% twitter https://twitter.com/kentcdodds/status/960723172591992832 %}

In contrast to the Test Pyramid Kent favours Integration Tests over Unit Tests for Javascript Frontend Applications. In his [blog post](https://kentcdodds.com/blog/write-tests) he explains his considerations and brings up the following two arguments.

### Integration Tests have a higher Confidence Quotient than Unit Tests.
This aspect is perfectly demonstrated by this tweet frm Randy Olson.

{% twitter https://twitter.com/randal_olson/status/779671851819819008 %}

If we really want to be confident that our product works as intended from a user perspective it is not sufficient to only test its components. Even if each part is working properly that doesn't mean that when we put all components together the behaviour is still correct. From that angle the confidence quotient of Integration Tests certainly is higher than that of Unit Tests.  But what about the other argument?

### High Level Tests can replace Lower Level Tests when they are fast, reliable and cheap to modify
In this context Kent refers to this quote from Martin Fowlers [blog post](https://martinfowler.com/articles/practical-test-pyramid.html#TheTestPyramid).

> If my high level tests are fast, reliable, and cheap to modify - then lower-level tests aren't needed. 

This statement addresses three major problems that come with integration tests and forces us to prefer tests on lower scope levels.

- **higher execution time** resulting from extensive test setups
- **lower stability** due to side effects
- **higher maintainance costs** caused by changes to the test fixture

The main reason for these drawbacks are the complex test fixtures necessary in integration tests, but nowadays these effects are reduced by more efficient implementation technologies.
Modern Applications Frameworks usually come with powerful Test Frameworks and light-weight in-memory mocks for external interfaces making Integration Tests nearly as fast and reliable as Unit Tests.
But does this mean that we can now just skip our low level tests?

## Everything comes with a price tag
From my perspective there are two aspects that make Low level tests still crucial.

### Low Level Tests have a higher significance
When a test on a low scope level fails, the root cause analysis is faster than on a higher level just because the code base under test is smaller. Time consuming Debugging should be an exception in a development process. 

### Low Level Tests have a smaller combinatory Complexity
I would like to explain what I mean by that with the aid of an example. Let's say we have implemented an use case for creating loan offers where you can put in amounts in different currencies ang get the corresponding interest rate in return. According to the single responsibility principle we split the code into two different modules, one which converts the amount into a default currency (in this case EUR) and the other one which calculates the interest rate based on the amount in default currency.

Following the classical approach of the Test Pyramid we would write 4 Unit Test Cases for each module und one Integration Test Case to prove that both modules work together in a correct way. Altogether we have to write 9 Test Cases. 

![Unit Test Cases](/images/postinline/posts/pyramid_vs_trophy/unit_tests.png)


When we skip the Unit Tests and only write Integration Tests, the combination of Test Cases for both modules will lead to a higher number of Integration Test Cases; actually we have 4*4 = 16 of them.

![Integration Test Cases](/images/postinline/posts/pyramid_vs_trophy/integration_test.png)

We could reduce this number using our knowledge about the module design of the Code under Test but ideally our tests should be agnostic about implementation details and focus on the expected behaviour.

This gap for the number of test cases will even grow exponentially with the number of modules covered by the integration test. If you are interested in the details about this math have a look at the excellent talk    
 [Integrated Tests are a Scam](https://www.youtube.com/watch?v=VDfX44fZoMc) by J.B. Reinsberger.

## Conclusion
Even in times, where Integration Tests are continuously getting faster an more reliable, Unit Tests are still essential.
They provide a higher significance and lower combinatory complexity than tests on higher scope levels. For these reasons I usually prefer Unit Tests over Integration Tests, but it is still a tradeoff between a higher Confidence Quotient on the one hand and higher significance and lower complexity on the other. So you have to evaluate the situation for your concrete product and this is what Kent did for Javascript Frontend Applications and why he came up with his Testing Trophy. From my perspective there is no contradiction to the classical approach, it is just an adaption to a specific scenario. So my answer to the question in the headline of this post is: **Test Pyramid and Testing Trophy: Brothers in Spirit!**