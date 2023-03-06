——
layout: post
title: How to write an Architecture Decision Record
subtitle: The ADR process in a nutshell
category: „Software Architecture“
fb-img: /images/media/posts/rewind.png
ref: write_an_adr
description: „The process of writing an ADR explained.“
excerpt_separator: <!—more—>
——

[Architecture Decision Records](https://github.com/joelparkerhenderson/architecture-decision-record) (ADRs) are not only a great way to keep track of the choices you make while evolving your product architecture. It can also guides you and your team through the decision process when you face new architectural challenges. Basically, it is a 5-step process.

<!—more—>

Let's have a closer look at each task.

### What's your problem, dude?

Developers are good at jumping straight into solution space when we hear about a problem. Taking your time and writing a clear and precise **problem statement** makes sure that everyone involved in the decision process has the same understanding of the subject at hand. It also defines what is in and, even more importantly, what is out of scope. Last but not least it should explain the consequences of the decision and the reason for making it right now. 

> [!tip]
> - Make it short: 3-5 sentences should be sufficient.
> - Explain the need for a decision: Why can't we wait any longer?
> - Don't tell the history: Nobody cares about why the problem came up. You are here to find a solution and not the culprit.

### You can't always get what you want

Decisions always occur in a specific organisational and technical context that restricts your solution space. For example, there are compliance policies,  decision deadlines, and budget limits, just to name a few. So make sure you catch all **constraints**, otherwise you might need to revoke your decision later.

> [!tip]
> - ask **all** of your stakeholders for constraints
> - it should be easy and unambiguous to check an alternative against constraints
> - if you transcribe constraints from older ADRs check if they are still valid.


### What really matters
To make solution alternatives comparable you need to evaluate them against a list of **decision criteria**. They are a measurement how good your requirements are met by an option, similar to the [fitness functions](https://medium.com/nerd-for-tech/what-are-the-fitness-functions-8ffbc852c6e1) of your quality scenarios, which by the way are a good starting point when looking for decision criteria. 
To make a criterion more tangible you can add a scenario decribing how it manifests in the context of your problem.

> [!example]
> ## Criteria: Steep learning curve
> The new Framework should be easily adaptable by developers.
> ### Scenario
> *After a 2-hour introduction workshop, a developer can write a simple REST Service.*

### So many choices 

Finding a good set of **solution alternatives** on your own can be tricky. By sharing your problem with others, you can benefit from their experience and avoid missing an opportunity. After selecting the most promising options, each must be evaluated against your decision criteria. In addition to this, you can provide further aspects of the alternative using a [SWOT-Matrix](https://en.wikipedia.org/wiki/SWOT_analysis).

> [!tip]
> - Keep the solution description short. Reference details by links.
> - Be specific when describing how an alternative fits the criterion.
> - Icons or colors can be helpful to get a quick impression of how well a criterion is matched by a solution and where tradeoffs have to be accepted.

### Make your choice

When evaluating the different alternatives it can be challenging to find the right moment to decide. There are always aspects which can be researched and spikes to be done. But be aware of the [analysis paralisys](https://en.wikipedia.org/wiki/Analysis_paralysis). You can always revisit your decision. Done is better than perfect.  

> [!tip]
> - State your decision in a single sentence to keep the ADR overview brief.
> - Explain the reasons for your decision; what are the key aspects that lead to your decision?

### Everything comes with a price tag

Each decision comes with **risks**. So, as the last step in your decision process, write them down to make sure you keep an eye on them.

> [!tip]
> - It's hard to identify all risks which come with a decision. Use the collective intelligence of your team to find them. 
> - Risk Storming is a well-established method to find risks.
> - Include the risks in your product-level risk management.

## Conclusion

Following this simple process when writing your ADR lets you focus on the decision without the fear of missing an important aspect. As a result all your ADRs will show the same high quality. Like most processes in a complex environment, following a strict order, like in a waterfall process, isn't a good idea. So feel free to switch between tasks when new aspects arise.