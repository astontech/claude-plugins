# Exit questions — the rubric and the research step

Exit questions are the program's standard: what a mentee must be able to answer or do
at the presentation. For catalog topics they are locked and copied verbatim. For
anything else, a skill drafts them — and a drafted question is only as good as what
it was drafted from. This file is how drafted questions get made, and how any
question (drafted or catalog) is judged.

## The research step (required before drafting off-catalog questions)

Never draft exit questions from memory alone. Before Template E in `spike-ticket`
(or any skill that drafts questions for an off-catalog topic), do this, silently —
the mentee sees the questions, not the research:

1. **Official docs, concepts section.** Fetch the technology's official documentation
   and find its concepts / core-concepts / getting-started index. That list is what
   the maintainers think a user must understand first.
2. **One reputable curriculum.** Fetch one of: the vendor's own learning path or
   entry-level certification outline (e.g. the CKAD curriculum, Spring Academy,
   Confluent's developer course), or roadmap.sh for the topic. Take its
   beginner-to-working section only.
3. **Derive candidates** from the overlap of 1 and 2 — the things both consider
   foundational. Ignore anything either source files under administration, operations,
   tuning, internals, or advanced.
4. **Write 4–6 questions** from the candidates, then run every one through the rubric
   below. Drop or rewrite anything that fails.
5. **Record the sources.** Keep the two or three URLs you used; they go in the
   promotion note (below) and in the ticket's Starting resources when they fit.

If the web tools aren't available, say so in the promotion note ("drafted without
the research step — sources not reachable") so the mentor knows to check harder.
Time cap for the whole step: a few minutes. This is orientation, not a literature
review.

## The rubric (every question must pass all six)

1. **Concrete.** It names a specific thing to explain or do — not "understand X" or
   "be familiar with Y".
2. **Answerable at a presentation.** In one or two spoken sentences, or by doing
   something in a live demo. If answering it properly would take a whiteboard
   lecture, it's two questions or it's Deep-level.
3. **Working-level, consumer-not-operator.** It asks what a developer *using* the
   technology on a team does every week — not how a platform team runs it. (Aware
   topics — concurrency, security, Kubernetes — ask "recognize, explain, escalate"
   instead.)
4. **Discriminating.** Someone who skipped the spike couldn't bluff it from a blog
   post's headings. A good test: does answering it well require having *done*
   something?
5. **Independent of the mentee.** Same question for everyone on this topic; nothing
   about their project, team, or codebase in the wording. Personalization lives in the
   Gap and Goal, never in the questions.
6. **Bounded by the fences.** It doesn't quietly require anything the topic's
   out-of-scope list forbids.

## The promotion note (off-catalog topics)

The catalog grows by demand and promotion is the mentor's act. When a skill drafts
questions for an off-catalog topic, its last message to the mentee ends with this
block, verbatim in shape, so the mentor can find it in the ticket and judge it:

```
---
**For the mentor — catalog promotion candidate**
Topic: ⟨topic⟩ · Depth: ⟨Working | Aware⟩
Drafted questions: ⟨the 4–6 questions as filed⟩
Derived from: ⟨URL⟩ · ⟨URL⟩ · ⟨URL⟩
Out of scope as drafted: ⟨the fences⟩
```

The mentee pastes it into the ticket description under the Progress notes section
when filing; that's where the mentor reviews it.
