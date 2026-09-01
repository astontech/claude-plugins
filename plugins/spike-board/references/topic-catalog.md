# Topic catalog — exit questions and bounds

The shared ladder for known topics. Exit questions here are **verbatim standards**: copy them into tickets unchanged so every mentee on a topic faces identical questions. The mentee's self-assessment picks which ones a given ticket covers; the questions themselves never vary per person.

Depth levels: **Aware** = can explain what it is, when a team reaches for it, and when to escalate; couldn't operate it. **Working** = can perform the everyday tasks a dev on a team using it actually does (the default target). **Deep** = design/debug/tradeoff level; almost never a mentee target.

Tracked topics (currently Kafka and CI/CD) assign their exit questions **per track step**: one step = one spike ticket, and a ticket takes its step's questions verbatim. The step split is a default, not a required sequence — planners may hand a mentee any prerequisite-valid subset of steps in any valid order, and entry-point personalization means skipping steps whose questions the mentee can already answer. Out-of-scope fences stay topic-level; the ceiling applies to the whole track.

Topics not in this catalog: draft exit questions in the same style — concrete, answerable, consumer-not-operator — and keep the same section shape (level, exit questions, out of scope, prerequisites, track).

This catalog grows by demand, in both dimensions. When a skill drafts exit questions for an off-catalog topic, flag them to the mentor for promotion into the catalog, so the next mentee on that topic faces the same questions instead of a second independent draft. When a flat topic proves too big in practice — a spike splits at a partial presentation's disposition, or a pivot breaks it up — flag the split for promotion as a track. Promotion is always the mentor's act.

---

## Git beyond the basics — Working

Exit questions:
- What's the difference between merge and rebase, and when does your team care?
- How do you undo: a bad local commit, a bad pushed commit, a file you didn't mean to stage?
- How do you use `git bisect` or `git log -S` to find when a bug was introduced?
- What makes a good commit message and a reviewable PR?

Out of scope: git internals (object model, reflog surgery), custom workflows, submodules.
Prerequisites: none.

## Testing — Working

Exit questions:
- What makes a test good vs. brittle?
- When do you mock, and when is mocking a smell?
- How do you write a unit test with JUnit 5 + Mockito and an integration test with `@SpringBootTest`?
- Given a bug fix, how do you write the test that would have caught it?

Out of scope: mutation testing, property-based testing, performance testing, full TDD dogma.
Prerequisites: none.

## Methodical debugging — Working

Exit questions:
- How do you form and test a hypothesis instead of shotgunning changes?
- How do you use the IDE debugger: breakpoints, conditional breakpoints, evaluate-expression?
- How do you read a Java stack trace bottom-up, including nested causes?
- What do you do when the bug only happens in the deployed environment?

Out of scope: JVM profiling internals, heap dump analysis, native debugging.
Prerequisites: none.

## SQL & relational data — Working

Exit questions:
- How do you write a join across 3+ tables and know which join type you need?
- What does an index do, and how do you tell if a slow query is missing one (`EXPLAIN`)?
- What's a transaction and what does it protect you from?
- What are N+1 queries and how do you spot them in a Spring app?

Out of scope: DBA work (backups, replication, tuning), query planner internals, NoSQL.
Prerequisites: none.

## HTTP & REST — Working

Exit questions:
- What actually happens in an HTTP request/response — methods, status codes, headers, and when each 4xx/5xx is correct?
- What makes an endpoint RESTful vs. RPC-over-HTTP?
- How do you inspect real traffic (browser dev tools, curl, Postman)?
- What's idempotency and why does it matter for retries?

Out of scope: HTTP/2/3 internals, API gateway configuration, gRPC, GraphQL.
Prerequisites: none.

## Java language maturity — Working

Exit questions:
- When do you use streams vs. loops, and what makes a stream chain unreadable?
- How do Optional, generics, and checked vs. unchecked exceptions get used well?
- What's the difference between `equals`/`hashCode`/`==`, and where does it bite?
- What do records and sealed types buy you?

Out of scope: JVM bytecode, classloaders, reflection-heavy metaprogramming, memory model details.
Prerequisites: none.

## Spring Boot mechanics — Working

Exit questions:
- What is dependency injection solving, and what happens when Spring can't wire a bean — how do you read that error?
- How do profiles and `application.yml` configuration layering work?
- What's the request lifecycle from controller annotation to response?
- Where does auto-configuration come from when "it just works"?

Out of scope: writing custom auto-configuration/starters, Spring internals (BeanPostProcessors, AOP weaving), reactive/WebFlux.
Prerequisites: Java language basics.

## Persistence with JPA/Hibernate — Working

Exit questions:
- What does the entity lifecycle (attached/detached) mean in practice?
- What SQL do `@OneToMany`/`@ManyToOne` mappings generate, and how do you check?
- When does lazy loading throw, and what are the fixes?
- When do you drop to a native query?

Out of scope: Hibernate caching layers, custom dialects, exotic mappings, multi-tenancy.
Prerequisites: SQL & relational data (at least the joins and transactions questions).

## Build & dependency management (Maven or Gradle) — Working

Exit questions:
- What happens, in order, when you run a build?
- How do you read the dependency tree and resolve a version conflict?
- Where do transitive dependencies come from, and how do you exclude one?
- How do you add and configure a plugin?

Out of scope: writing custom plugins, multi-repo build orchestration, the build tool your shop doesn't use.
Prerequisites: none.

## Concurrency — Aware (deliberately)

Exit questions:
- What's a race condition, and can you spot an obvious one?
- What's the difference between a thread, a thread pool, and `CompletableFuture`?
- Why is shared mutable state the root problem?
- When should you say "I need help from a senior" on a concurrency issue?

Out of scope: writing lock-based code, java.util.concurrent internals, reactive streams, virtual-thread tuning. The exit here is recognize-and-escalate, not solve — juniors going deep here produce confidently wrong code.
Prerequisites: Java language maturity.

## Docker — Working

Exit questions:
- What problem do containers solve vs. a VM?
- How do you write a Dockerfile for a Spring Boot app and shrink it (layering, JRE base images)?
- How do you run, inspect, exec into, and read logs from a container?
- What does docker-compose give you for local dev?

Out of scope: orchestration (that's Kubernetes), image internals, registry administration, networking beyond port mapping.
Prerequisites: none.

## CI/CD — Working

Out of scope: self-hosted runner setup, secrets management beyond "they exist and never go in the workflow file", matrix builds, caching optimization.
Prerequisites: Git; Docker for the image-building and later track spikes.

Track:

1. **Build a CI pipeline from scratch** (entry)
   - What is CI actually for — what class of problem does it catch that local development doesn't?
   - What are the stages of your pipeline, in what order, and why that order?
   - When the pipeline fails, how do you tell a compile error from a test failure from an environment problem in the logs?
   - What's a workflow trigger, and when do you run on every push vs. on pull requests?
   - What is a runner, and why might a build pass locally but fail there?

2. **Quality gates: linter, coverage threshold, branch protection** (unlocks after 1)
   - Why gate merges on a green build, and what is branch protection actually enforcing?
   - What does a coverage threshold protect against — and what gaming does it invite?
   - Why fail the build over a lint finding the IDE already shows?

3. **Cloud test environment** (unlocks after 2 · requires: Docker spike)
   - What class of bug does a deployed test environment catch that the CI test stage doesn't?
   - How does your pipeline get the app running somewhere reachable — image build, push, deploy — and in what order?
   - How does the test environment's configuration differ from local, and where do its secrets live?

4. **Automatic deploy on green build** (capstone — unlocks after 3)
   - What has to be true before you trust a green build to ship with no human in the loop?
   - When the deploy itself fails, how do you find out, and what's the rollback story?
   - What's the difference between continuous delivery and continuous deployment — and which did you build?

## Kubernetes — Aware, edging Working

Exit questions:
- What problem does Kubernetes solve that plain Docker doesn't?
- What are a Pod, Deployment, and Service, and how do they relate?
- Given a deployed app, how do you check it's running, read its logs, and get a shell into it (`kubectl get/describe/logs/exec`)?
- How do you deploy a container image you built to a local cluster (minikube/kind) with a basic manifest?
- Your pod is in `CrashLoopBackOff` — what are the first three things you check?

Out of scope: Helm authoring, operators/CRDs, networking internals (CNI, ingress controllers), cluster administration, autoscaling, service mesh.
Prerequisites: Docker (hard requirement — redirect if missing).

## Kafka / messaging — Working

Out of scope: cluster administration, partition rebalancing internals, Kafka Streams / ksqlDB, schema registry and Avro, exactly-once semantics, performance tuning.
Prerequisites: Docker (for the local broker); Spring Boot mechanics.

Track:

1. **Produce and consume messages from a Spring Boot app** (entry)
   - What problem does Kafka solve that a REST call between services doesn't?
   - What are a topic, partition, producer, and consumer, and how do they relate?
   - How do you publish and consume a message with Spring Kafka (`@KafkaListener`, `KafkaTemplate`)?

2. **Consumer groups: run two instances of your consumer and explain who gets what** (unlocks after 1)
   - What is a consumer group, and who gets what when two instances of your consumer are running?
   - What happens when a consumer is down while messages are produced — and what does that tell you about how Kafka differs from a queue?
   - What is an offset, and what does it mean to commit one?

3. **Error handling: retries and dead-letter topics** (unlocks after 2)
   - What does Spring Kafka do by default when your `@KafkaListener` throws, and why is that dangerous?
   - What's the difference between blocking retries and a retry topic, and when is retrying pointless (a poison-pill message)?
   - What is a dead-letter topic, and what belongs on a message when you park it there?
   - Once a message lands in the DLT, what happens next — who notices, and how does it get reprocessed?

## Security fundamentals — Aware (deliberately)

Exit questions:
- What are SQL injection, XSS, and CSRF, and can you spot the vulnerable pattern in code?
- Why do secrets never go in code or logs, and where do they go instead?
- What's the difference between authentication and authorization, and roughly how do JWT/OAuth flows work?
- What would you never roll yourself?

Out of scope: penetration testing, cryptography implementation, Spring Security internals (consuming an existing security config is fine).
Prerequisites: HTTP & REST.

## Code review — Working

Exit questions:
- What do you look for, in what order (correctness → design → style)?
- How do you phrase a critical comment so it lands?
- How do you respond when a reviewer is wrong?
- What makes your own PR easy to review (size, description, self-review first)?

Out of scope: nothing significant — this one is cheap and pays forever. Practice medium is their own spike PRs.
Prerequisites: Git.

## Reading unfamiliar code — Working

Exit questions:
- Given a codebase you've never seen, how do you find where a feature lives (entry points, search strategies, following the request path)?
- How do you use git history and blame to understand *why* code is the way it is?
- How do you build a mental model before changing anything?

Out of scope: full architecture recovery, documentation-writing beyond notes. Good spike form: "trace request X through app Y and diagram it."
Prerequisites: Git.
