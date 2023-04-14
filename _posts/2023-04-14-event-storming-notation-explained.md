---
layout: post
title: Event Storming Notation explained
subtitle: Your process as a sequence of state transitions
category: "Domain Driven Design"
fb-img: /images/media/posts/Event-storming-elements-legend.excalidraw.png
ref: eventstormingnotation
description: "Event Storming Notation explained"
---

In learning about event storming, the hardest part for me was memorizing the order in which the different card types appear along the time line. As a result, I usually carried a cheat sheet like this with me.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-legend.excalidraw.png)

I was bothered by its logic, however. It took me a while to figure out what it was about. I was able to make sense of it only after following the design process step by step for the first time. I would like to share this experience with you in this article by looking at an online shop's order process.

<!--more-->

## Tell me what happened

The first thing we do is to look at a typical run-through of the process, as in a post mortem. What milestones did the order pass through? These milestones are the first items we write down. After that, we arrange them chronologically.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-example-step1.excalidraw.png)

## How does it happen?

Afterward, we look at what caused each of these events. The first option is a command handled by our system, such as placing an order or starting a shipment. An external system may also emit an event if it follows a particular internal process. As an example, the logistics company sends an event when the products are delivered to the customer.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-step2.excalidraw.png)

## Consistent State Changes

The data in our system needs to be changed consistent when commands are handled. These state transitions must conform to the business invariances. For example, the shipment cannot be closed before it has been started. We add an aggregate card just below the corresponding command and event to represent consistency rules and the involved data for a state transition.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-step3.excalidraw.png)

Looking at the model now, we can see that it is made up of three internal state changes and one external state change.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-step3-1.excalidraw.png)

## Connecting the state transitions

It is necessary to create links between these transitions to establish a process flow. Let us begin with the first state change, placing an order. The customer sends a command to the system that triggers the order. So we add the customer to our model as an **actor**.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-actor.excalidraw.png)

Our next step is to link the "Order placed" event from the first state transition to the "start shipment" event from the second state transition to keep the process running. Once again, this command is sent by an actor, this time by the picker in storage. But how does he know which orders are ready to be shipped? Using the "order placed" events, he needs a list of all orders. This data view is called a **read model**.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-readmodel.excalidraw.png)

But wait! The picker cannot see if an order has not yet been shipped if the order list has not been updated by the event "shipment started". So let's add this dependency to our model.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-readmodel-2.excalidraw.png)

Next, the event "shipment started" from our system triggers a process in the external system of the logistics company. The connection is established by sending the command "start Delivery".

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-externalcommand.excalidraw.png)

Last but not least, the event "Delivery completed" triggers the command "close shipment", which happens automatically, according to our system **policy**: "Every time a delivery is completed, the shipment must also be closed."

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-policy.excalidraw.png)

Voilà! We've established a process that starts with a customer placing an order and ends with the shipment closing.

![Event Storming Legend](/images/postinline/posts/Event-storming-elements-example.excalidraw.png)

## Conclusion

Event Storming at the Design Level can be divided roughly into two phases. First we identify state transitions along the time line. These can be classified into two types:

- An  _Internal State Transition_ , which is caused by a **command** affecting an **aggregate** and finally producing an **event**.
- An _External State Transition_ , which is represented by an **external system** and the **event** it publishes.

In the second phase we bridge the gap between these state transitions, choosing between three options.

- a decision, taken by an **actor** based on a **Read Model** 
- a **command**, sent to an external system
- an automatically evaluated **policy** 
