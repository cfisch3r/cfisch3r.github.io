---
layout: post
title: Service Level Management the DevOps Way
subtitle: Service Level Indicators and Objectives in Action
category: "Site Reliability Engineering"
ref: sliandslo
description: "Service Level Management the DevOps Way"
---

With the shift to DevOps product teams take responsibility for the overall reliability of a system. As a consequence they need a service level management that goes beyond merely measuring the availability and uptime of servers. Service Level Indicators and Objectives help them to achieve this by specifying and monitoring reliability from a user perspective. Together with methods from software architecture and domain driven design this approach can be seamlessly integrated into the accustomed development process.
 
<!--more-->

When things went wrong with your Software Systems back when operations and development were separate, playing the blame game was quite popular. I remember a post mortem after a disastrous release of a web system ending with a complete rollback. The ops guys opened the meeting with the statement: "From the ops perspective it was a perfect release yesterday!". Yieks! As well as this, it also worked the other way around. Ever heard of the classic "Worked on my machine" statement from a developer? Nowadays, product teams are responsible for the overall reliability of a system thanks to DevOps.

## Reliability vs Availability
However, there is still the possibility of disappointment if customers and DevOps Team don't understand what to expect from the system in terms of reliability. Often it is expressed by simple metrics such as availability and uptime, but does this really represent what your customer wants? Google's Site Reliability Engineers summarized this mismatch as follows:

> It doesn‘t matter if you can point to zero errors in your logs, or perfect availabilty metrics, or incredible uptime; if your user don't think you're being reliable, you're not.
>
> -- “Implementing Service Level Objectives“, Alex Hidalgo

According to their definition, reliability consists of the following: 

> A measurement of the time an individual service is actually able to perform the duties it was designed to do.
>
> -- “Implementing Service Level Objectives“, Alex Hidalgo

That's a good starting point, but it's still quite abstract. How can we measure whether a service fulfills these duties? So let's grab a cup of tea and dig into it.

## Duties of the Service
Defining a service's duty requires identifying the business capabilities it supports as well as their quality attributes. The best way to get this information is to ask our stakeholders what they expect. A domain story telling workshop can accomplish this by having each participant describe a typical use case scenario in a narrative style. Let's see how it works with an example.

Let's say we want to describe the duties of a reservation system for a train company. One of the scenarios is making a seat reservation after buying a ticket. The story of this scenario could be told like this.

*The customer requests a reservation for a ticket id from the reservation system. The reservation system then requests the corresponding train connection for the ticket id from the booking system sending the train connection information back. The reservation system shows the seat plan for the connection to the customer. The customer picks a seat from the plan for reservation.
Finally the reservation system sends a reservation confirmation to the customer.*

Using the Domain Story Modeler Tool we can capture this story in the following diagram:

![Domain Story](/images/originals/posts/domain-story-for-slis.png)

The quality attributes associated with the business capabilities of the service must be investigated once the business capabilities have been described. Software architecture uses quality scenarios as a well-known way to capture them. Based on all interactions in our domain story, we identify quality scenarios that characterize a reliable system behavior.

| System             | Quality Scenario        | Covered Step IDs | Quality Attribute |
|------------------|-----------------------|----------------|-----------------|
| Reservation System | View Seat Plan          | 1,4              | Availibilty       |
|                    |                         |                  | Latency           |
|                    |                         |                  | Data Actuality    |
|                    | Make Reservation        | 5,6              | Availability      |
|                    |                         |                  | Latency           |
| Booking System     | Lookup Train Connection | 2,3              | Availybility      |
|                    |                         |                  | Latency           |

## Service Level Indicators and Objectives
Having identified what makes a system reliable or not, we need metrics to measure these attributes. That's where Service Level Indicators (SLI) come in. They are defined as follows: 

> [...] we defined a meaningful SLI as a „metric that tells you how your service is operating from the perspective of your users“.
> 
> -- “Implementing Service Level Objectives“, Alex Hidalgo  

The last step is to establish the range of measured values for which the system is considered to be performing its duties. These are Service Level Objectives (SLO) associated with each SLI.

> They are targets for how often you can fail or otherwise not operate properly and still ensure that your users aren‘t meaningfully upset.
>
> -- “Implementing Service Level Objectives“, Alex Hidalgo

To return to our reservation system example, we came up with the following SLIs and SLOs following discussion with our stakeholders.

| Quality Scenario         | Quality Attribute | SLI                                            | SLO  |
| ------------------------ | ----------------- | ---------------------------------------------- | ---- |
| View Seat plan           | Availability      | Rate of successful responses               | > 99% |
|                          | Data Actuality    | Time between Plan update and display           |  < 20 min    |
|                          | Latency           | 90% Percentile for response times for requests | < 3s |
| Make Reservation Request | Availability      | Rate of successful responses                   | > 99%     |
|                          | Latency           | 90% Percentile for response times for requests | < 3s |

## Managing dependencies
So far, we have examined the reliability scenarios for the reservation system, but what about those for the booking system? Our SLOs depend on them as well. In order to satisfy our SLO for viewing a seat plan, the search for a train connection must guarantee a certain performance. Our service level agreement with the booking system must therefore match our specifications.

## Conclusion
In order to build and maintain a reliable system for your customers, it is not enough to measure its availability. Service Level Indicators and Objectives based on the crucial use case scenarios provide a more detailed and realistic view and help to specify and manage the system's service level. 