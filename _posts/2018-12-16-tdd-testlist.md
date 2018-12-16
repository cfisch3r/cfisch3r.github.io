---
layout: post
title: The TDD Testlist
subtitle: Plan and navigate your test route
category: "Test Driven Development"
ref: tdd_testlist
locale: en_GB
fb-img: /assets/tdd_mountain.png
excerpt_separator: <!--more-->
---

When we start with a new feature development - test driven of course - we have to come up with a first test case. In coding dojos I see most people to simply choose the first test which comes into their mind. But is this really the best starting point which leads to smooth and short TDD iterations?
Creating a testlist first helps you to make a more profound decision on how to evolve your code and where to start.

<!--more-->

I learned about the testlist when reading the book "TDD by example" from Kent Beck where he used it to plan his next tests. The idea behind this technique is quite simple. Instead of just rushing into coding we spent some time to partition the problem into small chunks and express these as test cases. Finally we prioritize them so that the implementation steps between two tests become as small as possible. 
In this way we reduce the TDD cycle times and can evolve our code in small, easy iterations. 

![mountain with route](/assets/tdd_mountain.png)

This is similar to a route to a mountain top where the final working code waits for us. The test cases are just camps on the way up helping me to break down the long journey into small and easier sections. As in the real world there are different alternative routes I can take in my test list. When I get stuck in a dead end where I cannot find a good next test, which is easy to implement, I just go back some tests and try a different test order.

It is almost impossible to find all necessary tests upfront. During the implementation I continously learn more about my problem and I usually discover additional test cases. To keep my focus on the current task I put them at the end of the test list. As soon as the current TDD cycle is completed I decide at which point in the list I would like to insert the new test.  

## Benefits
- Conceptual errors in user stories quickly become visible when you write down test cases and can be fixed before implementation starts. 
- With a test list you can involve more people in the test case creation and improve the coverage.
- It's easy to get distracted when you find new test cases during implementation. The test list helps you to keep your focus.

## Practical Tips
- The first draft of your test list can be created in a [Three Amigos Session](https://www.agilealliance.org/glossary/three-amigos/) with Product Owner, QA Engineer and developers.
- If you are working in a SCRUM Team you can use a timebox per user story in your planning meeting to find test cases in a brain storming session.
- You can keep your test list in the comment block of your test class or simply use paper and pen.
- Commit your code at least at the end of each TDD cycle. In this way you can easily rollback and try another route when you get stuck in a dead end.
