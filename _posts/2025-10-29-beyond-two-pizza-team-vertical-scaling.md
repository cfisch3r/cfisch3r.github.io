---
layout: post
title: "Beyond the Two-Pizza Team: Vertical Scaling Without the Pain"
subtitle: "What AI collaboration can teach us about scaling development teams in enterprise environments" 
category: "Domain-Driven Design"
ref: verticalscaling
description: "Applying Spec Driven Development patterns from AI collaboration to solve the challenges of vertical team scaling"
fb-img: /images/originals/posts/vertical-scaling-team-split-warm.png
bigimg: /images/originals/posts/vertical-scaling-team-split-warm.png
---

A few weeks ago, I sat in a meeting with colleagues from one of our product teams. We were discussing how to support them with an additional feature team to make faster progress on their backlog, and I could feel the reluctance about this proposal. It wasn't about technical challenges or architecture decisions. It was about something more fundamental: control.

"A feature team doesn't reduce our workload," one developer said. "We need to tell them exactly how to implement the new features so that they fit into our architecture. Furthermore, we have to review all of their changes in detail to make sure we understand their code. We are accountable for this product and have to handle any problems later on."

As they spoke, something clicked. I'd felt this exact same anxiety before—not with other teams, but with AI coding assistants. That nagging worry: "Is this generated code reliable, and can I fix or extend it if necessary?" The loss of control when delegating implementation to something (or someone) else.

But things changed when I recently started using Spec Driven Development with AI, and it transformed that anxiety into confidence. Suddenly, I wondered: could this same pattern work for team collaboration?

<!--more-->

## The Scaling Dilemma

Let me set the stage. We're in the middle of incrementally replacing a legacy system. Following Domain-Driven Design principles, we've organized our new system into products aligned with subdomains, each developed by a self-organized DevOps team. This strategy allowed us to scale with a minimum of organizational and technical dependencies between the teams.

The problem? One product in our core domain sits squarely on the critical path for turning off the old system. And it's packed with complex business rules that need implementing. This product has become our bottleneck.

Our first idea was to split the bounded context, but that would create mutual dependencies between teams and organizational nightmares. Setting up a completely new product would also be overkill. The only obvious way left was to scale vertically and add more developers to the product team. But anyone who's tried this knows the brutal reality:

**Onboarding Hell**: New developers need to learn both the problem domain and the technical implementation. That's overhead for everyone and a breeding ground for misunderstandings about both the *what* and the *how*.

**Verification Frustration**: Code written by temporary developers transfers to the product team when the work is done. That requires serious verification and approval—the developers of the product team need to review an extensive amount of new code, which is a tedious and annoying task. Any issue they find has the risk that it leads to expensive rework of the new code. This leads to frustration and often outweighs the benefits from the support by the temporary developers.

**Coordination Overhead**: More developers mean exponentially more communication paths, which makes the information flow within the team much harder. As a separate effect, a greater number of developers working together makes it much more difficult to align their schedules so that they can work together effectively.

## Lessons from AI Collaboration

Here's where it gets interesting. When I work with an AI coding assistant, I face exactly the same challenges:

- **Onboarding**: I need to provide context so the AI understands what to build
- **Verification**: I have to review and approve everything it generates because I'm still responsible
- **Coordination**: I need an efficient workflow to guide the AI through the implementation

Spec Driven Development emerged as the solution to these challenges. It's built on three documents that layer on top of each other:

### Product Requirements Document (PRD)

Defines the scope and desired behavior after implementation:

- Problem statement
- Solution approach
- Constraints and interfaces
- Use cases
- Quality scenarios

### Implementation Instructions

Describes technical constraints and solution design:

- System architecture overview
- Technologies and frameworks
- Development guidelines
- Technical solution design
- Testing concept
- Cross-cutting technical concerns

### Implementation Plan

Breaks the work into sequential, checkable tasks that can be followed step by step.

Using these documents had an enormous impact on my collaboration with the AI. The onboarding becomes explicit, coordination becomes structured, and verification happens at clear checkpoints in the form of small, manageable merge requests. My anxiety about loss of control disappears because I'm orchestrating the process, not just hoping for the best.

## The Pattern Transfer

So a new idea came to mind: What if we treat feature team collaboration like AI collaboration?

The **product team** takes the role of the human developer—they're responsible for the product and maintain control through documentation and review.

The **feature team** takes the role of the AI assistant—they implement according to specifications, with clear boundaries and checkpoints.

Here's how it works:

**The Documents**: Feature and product teams collaborate on maintaining three living documents—the PRD, Implementation Instructions, and Implementation Plan. The feature team owns the implementation of the new feature; the product team acts as a stakeholder who reviews and provides input. These aren't heavyweight bureaucracy; they're concise summaries of agreements about scope, constraints, design, and an incremental delivery plan.

**Weekly Alignment Meetings**: Delegates from both teams meet to review and update all three documents. These are working meetings. When there's disagreement, the product team delegates have the final say—they're accountable for the product, after all.

**The Development Cycle**: Between alignment meetings, the feature team works through tasks from the Implementation Plan. When they complete a task, they deliver it as a merge request referencing that task. Product team delegates review and merge the changes.

**When Things Go Wrong**: If a merge request gets rejected, the feature team fixes the issues until it's acceptable. In the next alignment meeting, both teams investigate whether the PRD or Implementation Instructions need improvement. This creates a feedback loop that makes the collaboration better over time.

**Knowledge Transfer**: The feature team doesn't just deliver code—they contribute to the living documentation (architecture docs, development guidelines, ADRs). These changes come through as part of the merge requests, ensuring their knowledge doesn't evaporate when they move on.

## Making It Work: Practical Tips

**Invest in Living Documentation**: We follow the docs-as-code strategy, writing markdown documentation as part of feature development. Our typical docs include arc42 architecture documentation with ADRs, a runbook, a developer guide, and a business model document. This dramatically reduces how often the feature team needs to interrupt product team developers with questions. Furthermore, any extensions to the product documentation by the feature team can be reviewed in the same way as the code as part of a merge request.

**Minimize Product Team Involvement**: Designate specific developers from the product team as points of contact. This avoids pulling the entire team into large meetings and creates clear communication channels.

**Prepare the Ground**: Before the feature team starts, do a preparatory refactoring. As Kent Beck says: "Make the change easy, then make the easy change."

For example, we're planning to introduce the classes of our new design without changing current behavior. Then the feature team can add new functionality to these classes. Alternatively, we might introduce a modular application design with explicit interfaces—something like Spring Modulith—where the new feature becomes a new module. Either way, we're creating clean boundaries before inviting others into our codebase.

## The Deeper Insight

What strikes me most about this pattern is what it reveals about software development in 2025. The challenges of human-AI collaboration and human-human collaboration are converging. The solutions we're discovering for working with AI—explicit context, structured handoffs, verification checkpoints—turn out to be exactly what we need for scaling teams.

Perhaps we've been solving team collaboration the wrong way. Instead of informal communication and tribal knowledge, maybe we need the same rigor we're learning to apply with AI assistants. Clear specifications, structured workflows, documented decisions.
