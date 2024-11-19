---
layout: post
title: Quality Storming
subtitle: "A Risk based Approach" 
category: "Software Architecture"
ref: riskbasedquality
description: "A Risk Based Appraoch to Quality Storming"
fb-img: /images/originals/posts/risk-quality-storming.png
bigimg: /images/originals/posts/developers-in-war-room.png
---

Quality Storming is a popular workshop format for brainstorming quality scenarios in software development projects. However, creating relevant quality scenarios from a quality model can pose a significant challenge to participants due to its abstract and generic nature. A risk-based approach offers an alternative, that provides a more concrete view of product quality, sharpening the perception of quality scenarios that are crucial for the product to succeed.
<!--more-->

## Quality Scenarios
Quality Scenarios provide a simple template to capture quality requirements for a software product (for an example see box below).

![Quality Scenario Scheme](/images/originals/posts/quality-scenario.png)
They are the de facto standard for this task because of these unique features:

- They are **scenario-based**, ensuring that there's no room for ambiguity or misinterpretation.
- They revolve around **observable behavior**, providing a tangible, measurable aspect.
- They come with **explicit success criteria**, allowing you to easily ascertain whether your requirement has been accurately met.

{% include admonition.html type="example" title="A Quality Scenario Example" body="Consider an online banking system that needs to maintain high performance during peak usage hours (say, between 11 AM -2 PM). Here, the related quality attribute is 'Performance.' However, just focusing on improving performance doesn't provide a concrete action plan. Now let's turn this into a quality scenario: <br><br><i>During peak usage hours (11 AM -2 PM), the system should be able to handle up to 10,000 users simultaneously without slowing down response time below two seconds.</i><br><br>

In this scenario, we have specified: 
<ul>
<li><b>The source of stimulus</b>: Peak usage hours/High number of users.</li>
<li><b>The stimulus</b>: High load on the system.</li>
<li><b>The artifact</b>: The online banking system.</li>
<li><b>The environment</b>: During peak hours.</li>
<li><b>The response</b>: Maintaining response time below two seconds.</li>
<li><b>The response measure</b>: Number of simultaneous users  that can be handled without affecting performance.</li>
</ul>

 By turning the attribute into a scenario, the team can focus on specific, measurable goals and plan actions to achieve them. They can also identify potential risks (like server overload) and devise strategies to mitigate them. This is more effective than just focusing on improving 'Performance,' which is a broad and vague goal." %}

## Quality Storming
A common method for gathering these scenarios is through a workshop format called [Quality Storming](https://www.innoq.com/de/articles/2020/03/quality-storming-workshop/). This interactive session involves all stakeholders and the development team, and its aim is to examine the quality scenarios of a specific software product. The workshop follows this step-by-step process:
1. Presentation of the **product scope** (the features and functionality that the product will include) and the underlying **quality model** (a framework used to assess the quality of a product).
2. A **brainstorming** session where participants come up with different **quality scenarios** based on the attributes defined in the quality model.
3. The **consolidation** of these quality scenarios - basically, merging similar scenarios or grouping related ones together.
4. **Prioritizing** these consolidated scenarios - deciding which scenarios are most important or should be tackled first.

## Challenges
From my observations, the majority of stakeholders find it challenging to conjure up relevant quality scenarios based on a quality model. The reasoning can be traced back to three inherent characteristics of a quality model.
- **Abstraction**: The terminology used in the model is fairly generic and open to interpretation, which often sparks off debates.
- **Comprehensive**: A quality model strives to encompass all potential aspects crucial for a software product. However, this comprehensive nature can lead to wastage of valuable time delving into irrelevant quality attributes for the specific software product.
- **Technology Neutrality**: As they are rooted in problem domains, these quality models do not factor in the solution architecture. Consequently, technology-specific quality attributes, risks, and constraints are left out.

As a result workshop participants are often disappointed by the results of the workshop, casting doubts on whether they have truly unearthed the critical quality requirements for the software product.

## Starting with the Risks
Looking for a way out of this dilemma, I had got the idea to bypass the conventional quality model and kick-start the search for quality scenarios by examining the potential risks linked with the software product. This approach surpasses the constraints of the quality model by leveraging the unique attributes of risks.

- **Tangibility**: Risks are generally more concrete and definite compared to nebulous quality attributes. For example, stakeholders can readily comprehend the threat of a "data breach" or "system downtime" as these are actual issues with apparent consequences.
- **Ease of Prioritization**: The tangible aspect of risks facilitates their ranking based on potential damage and probability. This hierarchy aids in focusing first on the areas that pose the most significant threat.
- **Technologically Informed**: Risks can be explained using real-world instances and past events, making them more relatable. For example, citing a previous data breach incident can help stakeholders understand the gravity and pertinence of security risks.

But where do we find risks that are significant for a software system and that we can use as a starting point for our search for quality scenarios? There are three main sources that I found useful to start from:

- **The Developer's Treasure Trove of Experience**: Developers, with years of experience in their respective fields, have likely encountered the majority of risks prevalent in any development project. By organizing a brainstorming session with these seasoned professionals, you can establish an extensive and relatable groundwork.
- **Corporate Checklists**: Many corporations maintain comprehensive lists of common issues they are cognizant of and wish to address effectively. Using these checklists as a springboard is indeed an excellent strategy.
- **Post Mortems**: Delving deep into the root causes of previous failures provides an invaluable insight into potential risks. Remember, repeating the same mistake twice is not a wise move!


## Risk based Approach
Equipped with the **stereotypical risks** from the above-mentioned sources, we are able to compile a list of risks  that hold relevance to our product and use this product specific **risk model** to find quality scenarios. It unfolds in three stages:

1. **Dive deep into your Product Architecture**, using the **risk model** as a lens to spot product specific risks.
2. **Prioritize the product specific risks** and decide which ones should be covered by quality scenarios.
3. **Specify Quality Scenarios** that serve as effective countermeasures to these risks.

Let's have a closer look at each of these steps.

### Risk Assessment
Examining a software product from the perspective of risks requires the expertise of technical professionals. These experts scrutinize the existing product architecture in relation to the stereotypical risks of the risk model. The most efficient method to undertake this is by conducting a Risk Storming Workshop involving the team responsible for developing the product.

The risk model includes stereotypical risks from a wide range of risk contexts. Some may pertain to software system security, while others could stem from infrastructural issues. Attempting to tackle all these risk contexts at once may lead to confusion and be counterproductive. Therefore, we concentrate on one risk context per workshop and progressively cover all risk contexts through successive workshops. To facilitate this assessment, architectural views specific to the risk context under consideration are provided right at the start.

Let's delve into a practical example to make this concept more understandable. Picture this - a standard 3-Tier-Webapplication that consists of a webclient, a backend application and a database. Now, suppose you want to assess the stereotypical risks related to issues in the system infrastructure. Here is an example of how such a list could look like.

| Title                          | Scenario                                                                      |
| ------------------------------ | ----------------------------------------------------------------------------- |
| Deployment Node Failure        | A Deployment Node (Application Server, Database, etc.) does not respond.      |
| Deployment Node Saturation     | Node Ressources are saturated (CPU, Memory, etc.).                            |
| Communication Channel Failures | Communication between Nodes fails (Network Errors, Connection Failures, etc.) |
| ...                            | ...                                                                           |



To streamline the risk storming process, team members scrutinize the Deployment Diagram of the software to examine the software product against the background of the list above.

![Quality Scenario Scheme](/images/originals/posts/webapp-deployment.png)


The team starts with the first list item. After brainstorming about potential vulnerabilities from the viewpoint of "Deployment Node Failures", they draft a list of these product specific risks.

| Failure ID | Title                     | Scenario             |
|------------|---------------------------|----------------------|
| 1          | Pod Failure               | Pod gets destroyed.  |
| 2          | Container Cluster Failure | Cluster is down.     |
| 3          | DB Instance Failure       | DB Instance is down. |
| 4          | AWS Region Failure        | Region is down.      |

The risk storming continues with the next stereotypical risk until they reach the end of the list.

### Risk Prioritization
Covering all risks found in the process above is commercially not viable. Therefore you have to prioritize them and deliberately decide which one to mitigate with a quality scenario and which can be accepted. Two criteria are relevant for such a decision. The **probability** expresses how likely it is that this scenario occurs compared to others. The **impact** is a measure for the consequences to the business. Adding these to attributes leads us to a rated list of risks.

| ID | Title                     | Probability | Impact |
|----|---------------------------|-------------|--------|
| 1  | Pod Failure               | high        | high   |
| 2  | Container Cluster Failure | low         | high   |
| 3  | DB Instance Failure       | medium      | high   |
| 4  | AWS Region Failure        | low         | high   |

Note: Most times it is impossible to determine the exact values for probability or impact. Therefore we have chosen a simple scale of low, medium and high.

The risk matrix format (see diagram below) can be used for a rough ranking by severity (probability * impact).

![Quality Scenario Scheme](/images/originals/posts/risk-matrix.png)

Based upon this prioritization the team collaborates with stakeholders to determine which risks need to be addressed, leading to a curated shortlist.
### Finding Quality Scenarios
Now, we're all set to outline quality scenarios that specifically target each of these key risks. They are the drivers of architectural decisions, ensuring that the final software architecture possesses the capability to mitigate these risks.

In our example, it was only risk #1 and #3 that succeeded in making the cut for the shortlist. Here are the quality scenarios our team formulated based on these risks.

| Risk ID | Risk Title          | Source + Stimulus   | Artifact + Environement                                | Response + Response Measure                                                    |
| ------- | ------------------- | ------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------ |
| 1       | Pod Failure         | Pod crashes         | Kubernetes Cluster under normal operational conditions | Requests are still served and the previous number of pods are restored in 10s. |
| 3       | DB Instance Failure | DB Instance crashes | AWS RDS under normal operational conditions            | Requests are still served without data loss.                                   |

By aligning the product architecture with these quality scenarios we make sure that all prioritized risks are mitigated and the product is able to achieve its quality goals.

## Wrap up
As we have seen in this example we gradually derive product risks from a risk model and finally identify quality scenarios that serve as effective countermeasures within the product's architecture. The following diagram wraps up this process.

![Quality Scenario Scheme](/images/originals/posts/risk-quality-storming.png)

## Risk vs Quality Model
So, which workshop format should you use for our development project?

The **conventional Quality Storming** begins its journey with a quality model. It is focused on the problem we aim to solve with the software product. Therefore a strong involvement of the stakeholder is crucial to its success.

On the flip side, the **risk based Quality Storming** starts with a model of stereotypical risks. It utilizes the existing product architecture, which calls for a strong involvement of the development team. Both approaches offer unique perspectives on our software product's quality scenarios. 

So, why choose one over the other when we can harness the power of both? I propose that we combine both methods to gain a holistic, 360-degree view of our quality requirements.


