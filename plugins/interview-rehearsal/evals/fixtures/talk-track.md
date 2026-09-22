# Talk track — Parts inventory platform

Senior Java developer · built 2026-09-22

The scripts are openers. The interviewer picks one line and pulls it ten minutes deep. Rehearse the fact sheet, not the script.

## The opening  (45–60 s)

I'm a senior Java backend developer, about six years in. Most of that has been Spring Boot services on the JVM, and for the last few years event-driven work on Kafka and AWS: EKS, Lambda, MSK, S3.

Since May 2024 I've been at Nissan on their parts inventory platform. It's the system of record for part counts across the US supply chain, and we're pulling it out of a monolith into microservices on AWS. I've built the warehouse adapter, worked on the inventory ledger, and own the replenishment Lambdas end to end. That's the work I know best, so I'm happy to go as deep as you'd like.

*Stop. Let them pick the depth.*

## The project in three depths

### Depth 3 — what I owned  (4–5 min)

The warehouse adapter turns warehouse events into our canonical event model and puts them on Kafka. What took the time was ⟪the hard part⟫.

The replenishment Lambdas: when the ledger emits a low-stock event, a Lambda picks it up through an MSK event source mapping, works out whether to propose buying more and how much, and sends the proposal to procurement. I recommended Lambda because the workload is a few hundred events a day, bursty, and latency tolerant.

## The fact sheet

| Fact | What to have ready |
|---|---|
| What the system is for | System of record for part counts by location and state. |
| Why it was prioritized | ⟪Why Nissan broke up the monolith.⟫ |
| Who the customer is | Procurement; ⟪who else⟫ |
| Exactly what you built | WMS adapter (shared), ledger (part), replenishment Lambdas (end to end). |
| Scale | About 11 distribution centers, 1–2 million events a day. |
| Alternatives rejected | Lambda over an always-on consumer for replenishment. |
| Who pushed back | ⟪nobody named yet⟫ |
| What broke | ⟪a production problem⟫ |

## Before you rehearse

1. Why the migration was prioritized.
2. Who else consumes the counts.
3. What was hard in the adapter.
4. Who pushed back on Lambda.
5. A production problem with your name on it.
