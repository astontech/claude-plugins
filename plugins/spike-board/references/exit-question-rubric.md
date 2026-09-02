# Exit questions — the rubric and the research step

Exit questions are the program's standard: what a mentee must be able to answer or do
at the presentation. Every skill that writes or revises a ticket drafts them fresh for
that topic — there is no catalog — and a drafted question is only as good as what it
was drafted from. This file is how questions get made, and how any question is judged.

## Depth levels

**Aware** = can explain what it is, when a team reaches for it, and when to escalate;
couldn't operate it. **Working** = can perform the everyday tasks a dev on a team using
it actually does — the default target. **Deep** = design/debug/tradeoff level; almost
never a mentee target. Some topics stop at Aware deliberately (concurrency, security):
a junior going deep there produces confidently wrong work, so the exit is
recognize-explain-escalate. The skill decides the level; never ask the mentee.

## The research step (required before drafting)

Never draft exit questions from memory alone. Before showing a mentee any questions,
do this, silently — the mentee sees the questions, not the research:

1. **Official docs, concepts section.** Fetch the technology's official documentation
   and find its concepts / core-concepts / getting-started index. That list is what
   the maintainers think a user must understand first.
2. **One reputable curriculum.** Fetch one of: the vendor's own learning path or
   entry-level certification outline (e.g. the CKAD curriculum, Spring Academy,
   Confluent's developer course), or roadmap.sh for the topic. Take its
   beginner-to-working section only — unless the floor rule (below) says the mentee
   is past it, in which case take the next section up.
3. **Derive candidates** from the overlap of 1 and 2 — the things both consider
   foundational. Ignore anything either source files under administration, operations,
   tuning, internals, or advanced; those become the out-of-scope fences.
4. **Size the topic.** Most topics are one spike. Split into steps only when the
   candidates are more than one spike carries — more than about six questions' worth,
   or a clear prerequisite ordering among them (produce and consume before consumer
   groups before error handling). Each step is one ticket with 3–5 questions,
   sequenced by prerequisite under one epic (see the conventions).
5. **Write 4–6 questions** (3–5 per step for a split topic) from the candidates, then
   run every one through the rubric below. Drop or rewrite anything that fails.
6. **Name the prerequisites.** The one or two technologies the spike can't be done
   without, from what the docs' getting-started assumes (a Kubernetes spike needs
   Docker; a Spring Kafka spike needs Spring Boot). Mark each **hard** — redirect to
   a prerequisite spike if the mentee has never used it — or **soft** — a named
   question leans on it, nothing more.
7. **Record the sources.** Keep the two or three URLs you used; they go in the
   ticket's Starting resources.

If the web tools aren't available, say so in the ticket's Progress notes ("drafted
without the research step — sources not reachable") so the mentor knows to check
harder. Time cap for the whole step: a few minutes. This is orientation, not a
literature review.

## The floor

Questions target what the mentee can't do yet, one rung above where they are. A
mentee who has used a technology daily for months doesn't get its getting-started
questions: pitch at the next rung (for SQL that's index design and query plans, not
joins; for Git it's rebase and bisect, not commit and push). The self-assessment in
each skill catches the rest — a question the mentee answers concretely is dropped
from the ticket, never rewritten easier.

## The rubric (every question must pass all six)

1. **Concrete.** It names a specific thing to explain or do — not "understand X" or
   "be familiar with Y".
2. **Answerable at a presentation.** In one or two spoken sentences, or by doing
   something in a live demo. If answering it properly would take a whiteboard
   lecture, it's two questions or it's Deep-level.
3. **Working-level, consumer-not-operator.** It asks what a developer *using* the
   technology on a team does every week — not how a platform team runs it. (Aware
   topics — concurrency, security — ask "recognize, explain, escalate" instead.)
4. **Discriminating.** Someone who skipped the spike couldn't bluff it from a blog
   post's headings. A good test: does answering it well require having *done*
   something? "Show…", "Demo…", "Given a…" beat "What is…".
5. **Independent of the mentee.** Nothing about their project, team, or codebase in
   the wording. Personalization lives in the Gap and Goal, never in the questions.
6. **Bounded by the fences.** It doesn't quietly require anything the ticket's
   out-of-scope list forbids.
