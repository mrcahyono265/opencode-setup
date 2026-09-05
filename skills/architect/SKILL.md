---

name: architect
description: Design software architecture, evaluate multiple solutions, analyze trade-offs, and recommend maintainable engineering decisions before implementation.
compatibility: opencode
---

# Architect Skill

## Purpose

This skill is responsible for architectural thinking before implementation.

Use this skill whenever a task involves system design, technology selection, software structure, scalability, or significant engineering decisions.

Do not use this skill for small code changes or isolated bug fixes.

---

# When To Use

Use this skill when:

* Starting a new project with meaningful technical decisions
* Designing a feature with meaningful architecture, integration, data, or scalability implications
* Reviewing an existing architecture
* Choosing between multiple technologies
* Refactoring a large module
* Designing APIs
* Designing databases
* Planning deployment architecture
* Evaluating scalability
* Evaluating security architecture

---

# Decision Gate

Before writing any implementation, answer the following questions.

* What problem is being solved?
* What business value does it provide?
* What constraints exist?
* What assumptions are being made?
* Is any important information missing?

If critical information is missing, ask concise clarification questions before continuing.

---

# Architecture Analysis

Identify:

* System boundaries
* Major components
* Responsibilities
* Data flow
* External integrations
* Dependencies
* Risks

Explain them briefly.

---

# Alternative Solutions

When two or more realistic solutions exist, compare the relevant alternatives.

For each solution explain:

* Advantages
* Disadvantages
* Complexity
* Maintainability
* Scalability
* Learning curve

Avoid presenting unrealistic alternatives.

---

# Recommendation

Recommend one solution.

Clearly explain:

* Why it is preferred.
* Why alternatives were rejected.
* Trade-offs.
* Future impact.

Recommendations should optimize for long-term maintainability.

---

# Technology Selection

When selecting technologies:

Prefer:

* Mature ecosystems
* Active communities
* Official documentation
* Long-term maintainability

Avoid choosing technologies solely because they are trendy.

---

# Architecture Patterns

Recommend patterns only when they solve real problems.

Examples:

* Layered Architecture
* Modular Monolith
* Microservices
* Repository Pattern
* CQRS
* Event-Driven Architecture
* Dependency Injection
* Domain Events

Never introduce patterns without justification.

---

# Database Design

Whenever designing a database:

Explain:

* Entity relationships
* Primary keys
* Foreign keys
* Indexes
* Normalization
* Possible bottlenecks

Keep schemas simple.

---

# API Design

Prefer:

* RESTful conventions
* Consistent naming
* Predictable responses
* Proper HTTP status codes
* Validation
* Versioning when necessary

Avoid unnecessary complexity.

---

# Scalability

Evaluate:

* Expected traffic
* Database growth
* Storage requirements
* Background jobs
* Caching opportunities

Only recommend scaling techniques when justified.

Avoid premature optimization.

---

# Security Review

Evaluate:

* Authentication
* Authorization
* Input validation
* Secret management
* Sensitive data exposure
* Common attack vectors

Mention important risks.

---

# Performance Review

Evaluate:

* Database queries
* N+1 problems
* Expensive operations
* Network requests
* Memory usage

Recommend improvements only when meaningful.

---

# Maintainability Review

Evaluate:

* Readability
* Modularity
* Coupling
* Cohesion
* Testability

Favor simpler designs.

---

# Output Format

Whenever using this skill, structure the response as follows.

1. Problem Summary

2. Constraints

3. Assumptions

4. Architecture Analysis

5. Alternative Solutions

6. Recommendation

7. Risks

8. Future Improvements

9. Implementation Strategy

Do not generate implementation code unless explicitly requested.

The purpose of this skill is to improve engineering decisions before coding begins.
