---
layout: post
title: Developer's Guide to Software Estimation
subtitle: "Episode I: The Basics" 
category: "Software Estimation"
ref: estimationbasics
description: "The basics of Software Estimation"
fb-img: /images/originals/posts/estimation-guide-basics-fb.png
bigimg: /images/originals/posts/estimation-guide-header-background.png
---

Getting asked about estimations was my worst nightmare when I started my career as a software engineer.Writing software was easy for me because I was familiar with design patterns, architecture styles, and principles in software engineering. But when it came to giving a forecast for a new project, I was lost. Where should I start? Where should I end? What principles should I follow and what methods can I use? To make matters worse, there were high expectations for a sound estimate. It was often crucial to the profit of my company. But how can I provide a forecast that meets all expectations and is profound at the same time?

After many years of reading articles and books on this topic and experimenting with different approaches, I came up with 10 basic tips that help me with this challenge. Here is what I've learned so far.

<!--more-->

## Overview
There is a lot of material to cover in software estimation. This is why I am splitting this post into three parts. 
The first one covers **the basics** of estimation, demonstrating the benefits of forecasting and how to approach it strategically. The second article explains **the building blocks** of an estimation and demonstrates how they provide a framework for robust forecasts. The final article will provide hands-on advice on how to work with estimates in **practice**.

## Why should I estimate anyway?
When agile process frameworks like Scrum and Kanban became popular, I was hoping to get rid of this whole estimation business. Instead of trying to create the perfect plan and stick to it, I focused on delivering the highest value (outcome, not output) and constantly adopting the plan. In this context, who needs a reliable forecast that covers several months or even a year, especially when it means spending the precious time of developers on estimating instead of creating value? An example of this change in mind can be found in a story by David J. Anderson about a maintainance team from Microsoft who supported about 80 IT application. Due to long lead times of their support tickets, they had a bad reputation. According to a value stream analysis, it turned out that their estimation efforts were a major contributor to this problem. These insights allowed them to make a significant change.

> The estimates for new incoming work were consuming a lot of effort. We decided to analyze this using some guesswork. Despite being referred to as “rough order of mag- nitude” (ROM) estimates, the customer expectation was actually for a very accurate estimate, and team members had learned to take great care over preparing them. Each one was taking about one day for each developer and tester. We quickly calculated that the estimation effort alone was consuming around 33 percent of capacity, and on a bad month it could be as much as 40 percent. This capacity was allocated in preference to working on coding and testing. Estimating new requests was also apt to randomize plans made for that month.
> 
> -- David J. Anderson, Kanban - Sucessfull Evolutionary Change for Your Technology Business

Finally they achieved an average lead time reduction of 90% of 140 days to 14 days by skipping the estimation work and focusing on always selecting the most important tickets, winning the Engineering Excellence Award.

Having read this story, I was confident that I would finally escape estimation hell, but it turned out that there were still situations where focussing on the most valuable task and being efficient was not enough. When making a decision with serious consequences, you still need to invest time in estimation, if you do not want to leave the outcome to chance, for example:

* Shall we start with this project or do the costs exceed the profit?
* Shall we buy an out-of-shelf software or develop this software by ourself?
* Another Team needs to know when we provide the new interface in order to plan their release date. When will it be ready?

In comparison to just making a random choice, a forecast provides a better chance of picking a good decision even when it comes with a wide error margin. There is no sense in denying an estimation in these situations since reducing failure risks is much more valuable than making a forecast.

With both benefits and costs in mind, I came up with my first tip.

{% include admonition.html type="tip" title="Estimation Tip #1" body="Think twice before you estimate. There should be serious decisions to make that justify the costs." %}

## Only Facts count
Forecasting involves many uncertainties, so it is imperative to take your time and gather as much information as possible. During this task it is important to continually share the collected data with all stakeholders. By doing this, they will be able to verify the data, correct misunderstandings, and contribute missing information.

A checklist tailored to the business context can be helpful in making sure you don't overlook anything important. Over the years, I have come up with these topics that I always keep in mind.

### Functional Behaviour
That is the most obvious aspect when it comes to estimations, at least for the customer. The drivers for the effort are usually not the implementation but the creation of a functional model that includes the various interests of all stakeholders. Domain knowledge has to be explored and transfered into a deterministic set of rules and data models, which represent a good enough abstraction of the business. Therefore a huge impact on the effort comes from the complexity of the domain and the number of domain experts involved as well as their availability. By **gathering the critical use case scenarios and business rules with the stakeholders**, for example, in a domain story telling workshop, I can quantify the effort resulting from the complexity of the business domain.

### Quality scenarios
When customers request an estimate, they usually focus on feature requests, but quality aspects can easily outweigh the effort in implementing them. Think about multi-tenancy or real-time data processing. This is why I am always insistent on **capturing quality requirements** explicitly. One popular way to do this is to capture them **as quality scenarios**.

### Interfaces
The technical side of connecting with other systems is complex. You must deal with all the different scenarios that come along with communication protocols, but there are also organizational challenges involved. A contract must be created, tests coordinated, and an operational model must be developed. By **listing all the 3rd party interfaces involved**, I can get a better idea of the associated integration efforts.

### Constraints
There are always circumstances that restrict how you develop a solution, and therefore have an impact on the effort, even when you start a greenfield project. Technology portfolios and development and build processes are determined by **technical constraints**. **Organizational constraints** affect communication paths, handovers and decision-making processes. **Regulatory constraints** can have you preparing and studying a lot of documents. It takes some time to research all constraints, especially if it is my first time in this specific environment, but it prevents me from being caught off guard later.

### Assumptions
Forecasts are always based on assumptions, which are volatile by nature. You have to make assumptions about interfaces, business models, delivery times. In case these assumptions are wrong, the whole forecast can be rendered obsolete. In order to ensure stakeholders can check their validity and see that the forecast may not work out, I summarize them in an overview and **make these hypotheses transparent** for them.

### Exclusions and Risks
As a result of my investigation of the previous aspects of estimation subject, there are **requirements that present risks or have to be excluded due to high uncertainties**. This information should be shared with stakeholders so that disappointments can be avoided and risk associated with the forecast can be understood. Furthermore, this is a call for them to manage these risks.

Altogether this is summarized in my second advise.

{% include admonition.html type="tip" title="Estimation Tip #2" body="Gather all information about the estimation subject, including assumptions, constraints and risks, and let stakeholders confirm them." %}

## Estimating, not guessing
People have often argued, _"Why bother with a good estimate? They're always wrong anyway."_.Their image of a forecast seems to have their origins in quizzes or competitions where you have to answer a guess question, which is quite different from an estimation used in software development. An episode of the TV series Monk illustrates the difference quite well.

In _"Mr. Monk goes to the Carnival"_ Benjy, the son of his assistant, enters a contest where he can win a boombox if he correctly guesses how many jellybeans there are in a jar. Monk gives him the correct answer without even seeing the jar, and Benjy wins the contest. At the end of the episode Monk explains how he could make such a good estimation. When he arrived at the carnival he noticed six jellybean boxes on a pile of garbage. The labels on these boxes said that each of them contains 1,400 jellybeans, which means a sum of 8,400 beans altogether. Assuming the organizer of the competition ate a handful or two he came to his estimation of 8,385 beans.
By simply putting together **observations, assumptions and simple math** Monk was able to achieve a tremendously better result than the other competitors.

In the context of software development, such a systematic approach to forecasting is exactly what we need. Fortunately, there are a whole range of methods available in this area, so there's no reason to guess.

Using one of these methods gives me a clear process to follow, ensuring it can be reproduced. In this way, I can apply the method over and over, gather data, and continuously improve it for the specific context. Furthermore, using estimation methods protects me from my own biases. Since I love starting new projects and I am enthusiastic about them, I tend to be overly optimistic about estimates. From my observation, I am not the only one; according to a project manager I once met, he always triples the developers' estimates and increases the order of magnitude by one to get a realistic estimate. :-)

This leads me to my next tip.

{% include admonition.html type="tip" title="Estimation Tip #3" body="Don't rush. Select a well established estimation method and never make a wild guess." %}

## What's next?
Now that I know these tips, I am completely relaxed and confident when I am asked for an estimation. I never make estimates based on habit or ritual, but rather question the reasons for them and balance their value with the estimation effort. What's the point of estimating story points for each backlog item in a refinement meeting if nobody ever uses this information and creates forecasts for the stakeholders?

I also always take my time and define all aspects of the estimation subject together with the stakeholder before I create a forecast. If it doesn't justify this time, the forecast shouldn't be done!

Last but not least, I have an arsenal of estimation methods at my fingertips that provide a systematic estimation approach rather than making wild guesses like in a quiz show.

In the next article we will take a deep dive into the building blocks of estimations and learn about the characteristics of professional forecasts. So stay tuned.
