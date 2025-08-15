---
layout: post
title: Your Domain Knowledge is Scattered Everywhere—The One Step That Brings It Together
subtitle: "Why teams keep building contradictory features and how Model Design prevents implementation chaos" 
category: "Domain-Driven Design"
ref: domainknowledgescattered
description: "The missing step between discovery and implementation that prevents contradictory features and fragmented domain knowledge"
fb-img: /images/originals/posts/business-engineer-workshop-model.png
bigimg: /images/originals/posts/business-engineer-workshop-model.png
---

Picture this: You're in a meeting room where your SEO expert is explaining new URL generation rules for your Web Content Management System. The developers are nodding along, taking notes. Everything seems clear until someone asks the obvious question: "How do these new rules interact with what we've already built?"

Suddenly, everyone's looking at each other. The SEO expert thought the developers knew all the existing rules (they're in the code, right?). The developers assumed the expert had the complete picture of the URL generation system. What followed was the usual knowledge archaeology - everyone digging up fragments of what they could remember and trying to piece together the complete picture.

This isn't just a communication problem—it's a fundamental gap in how we approach domain modeling in enterprise environments. And I bet you've been in this exact meeting.

<!--more-->

## Why Your User Stories Aren't Enough

Here's the reality: you can't validate new requirements against your existing system when your domain knowledge lives scattered across JIRA tickets, old Miro boards, and people's heads. 

Like the team in our SEO story, most development teams jump straight from discovery sessions (Event Storming, Domain Story Telling, stakeholder interviews, etc.) directly into Specifications for the next Sprint Increment. We create Epics, break them into User Stories, and finally run Three Amigos or Example Storming sessions for test case exploration. It feels efficient, but this direct handoff creates predictable problems that every enterprise developer knows by heart:

- **The "it's in the code" syndrome**: Domain knowledge lives only in implementation, making it nearly impossible to reason about business rules without diving into technical details
- **Requirement archaeology**: Every new feature requires detective work to understand how it fits with existing functionality  
- **The alignment gap**: Business experts and developers maintain different mental models with no shared reference point
- **Contradictory implementations**: Features that work individually but create chaos when combined

Sound familiar? These problems persist because we're jumping over a critical phase that should bridge discovery and implementation.

## The Missing Link: Model Design

What we need is an explicit **Model Design** phase between Discovery and Specification. Not more documentation for documentation's sake, but a purposeful activity that creates a single source of truth for business logic.

**Enhanced Approach:**

![Business Engineering Process](/images/originals/posts/Business-Engineering-Process.excalidraw.svg)

Think of it as architecture documentation for your business domain, not your technical stack. And just like we wouldn't build a complex system without architectural blueprints, we shouldn't implement complex business logic without domain blueprints.

## Why This Approach Actually Works

### 1. Requirements Validation That Catches Problems Before They're Expensive

Every new requirement gets evaluated against your documented domain model. No more "oh shit" moments three sprints into development when you realize the new feature completely contradicts what you built last quarter.

Back to our SEO story—if that team had maintained their URL generation model, the conversation would have been completely different. When the expert proposed new rules, developers could have immediately said: "Our current model generates URLs using product names and categories in this specific hierarchy. Your new approach introduces publication dates and campaign identifiers that clash with our existing slug generation logic." Instead of confusion and finger-pointing, they'd have had a structured foundation for discussing how to evolve their model.

Even better, stakeholders can review and validate the documented model itself. You catch missing pieces and misunderstood requirements before they become expensive implementation problems.

### 2. Domain Consistency That Prevents Production Disasters

Here's what happens when you try to document your business rules: contradictions and gaps that hide comfortably in casual conversations suddenly become impossible to ignore. Without this discipline, inconsistencies only surface when your customers hit broken functionality in production.

The trading card game industry learned this lesson the hard way. When Pokémon TCG releases new card sets, designers sometimes introduce mechanics that completely break existing gameplay balance. Cards like "Archeops" had to be banned because its ability prevented players from evolving Pokémon—undermining a core game mechanic. "Lysandre's Trump Card" was banned for allowing infinite card recycling, essentially making games unwinnable. Game designers added new rules without fully modeling how they'd interact with the existing system, requiring costly retroactive fixes.

Sound familiar? In our world, these same contradictions show up as conflicting business rules, inconsistent validation logic, or features that work great individually but create chaos when combined. An explicit domain model prevents these issues by forcing you to think through interactions during design rather than discovering them through user reports of broken edge cases.

### 3. Complexity Management That Actually Reduces Technical Debt

Model Design becomes your primary weapon against system complexity. Here's a fundamental truth that most teams ignore: your technical implementation cannot be simpler than the domain model it represents. Investing in model simplicity directly improves code maintainability.

As Antoine de Saint Exupéry observed: "It seems that perfection is attained not when there is nothing more to add, but when there is nothing more to take away."

When documenting your model feels like wrestling with an octopus—when rules seem convoluted or logic paths multiply endlessly—that's a signal. The complexity you're struggling to document often indicates a simpler, more elegant model waiting to be discovered. Fight the complexity at the source, not in your Spring controllers.

### 4. The Complete Picture That Prevents Constant Refactoring

Teams following the traditional Discovery-to-Specification approach often miss crucial context that leads to constant refactoring. Picture developers building a chess application who receive isolated requirements like "implement a piece called 'pawn' that can move two squares forward from the second rank." Without understanding the complete chess rule system, they miss critical interactions: en passant captures, promotion mechanics, how pawns interact with castling rules.

Each new piece type reveals unexpected edge cases and conflicts, forcing architectural changes and code rewrites. Development becomes a series of "surprise! here's another edge case" discoveries rather than systematic implementation.

Contrast this with a team that first models the complete chess rule system. They understand piece interactions, movement constraints, and special case handling before writing any code. Development flows smoothly because the comprehensive model guides implementation decisions rather than forcing teams to discover requirements through trial and error.

This complete picture transforms team dynamics. New developers onboard faster when they can reference a clear domain model rather than reverse-engineering business logic from scattered user stories. Your specifications become more concise and focused because they can reference shared domain concepts rather than repeating context in every JIRA ticket.

## Making This Work in Your Enterprise

### Start Small, Think Git

Don't try to model your entire enterprise domain on day one. Pick the area where you and your business experts have the most communication friction. Create a simple Markdown file documenting what you think you know. Check it into Git. Treat it like code.

### Assign a Business Engineer

Someone needs to own the domain model—not the product owner (they're focused on prioritizing requirements), not the tech lead (they're focused on implementation). You need someone who bridges both worlds and has the authority to say "this change would break our model consistency."

### Establish Review Discipline

Model changes should go through the same rigor as code changes: feature branches, merge requests, required approvals. This isn't bureaucracy—it's treating domain knowledge with the respect it deserves.

## The Enterprise Reality Check

Look, I know what you're thinking: "This sounds great in theory, but we barely have time to write our user stories, let alone maintain domain documentation." I get it. Enterprise life is sprint after sprint of "urgent" features and "critical" bug fixes.

But here's the thing: you're already paying the cost of unclear domain modeling. You're paying it in the form of endless refinement meetings, contradictory implementations, expensive refactoring, and features that work individually but create chaos in combination.

Model Design isn't additional work—it's moving inevitable work earlier in the process where it's cheaper to fix.

## What's Next

I've shown you why Model Design is the missing piece between discovery and implementation, but you're probably wondering: "Okay, this sounds great in theory, but what does domain model documentation actually look like in practice?"

That's exactly what I'll cover in my next post. I'll show you the key components of domain model documentation and how to create them effectively. You'll learn how to work with this documentation in your day-to-day development process. You'll see concrete artifacts that you can adapt for your own enterprise contexts.
