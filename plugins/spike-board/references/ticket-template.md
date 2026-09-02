# The spike ticket template — canonical field descriptions

What each section is for. The output format in SKILL.md shows the shape; this explains the intent behind each field so generated tickets keep the spirit, not just the structure.

**Title** — `Spike: <topic> — <specific question or skill>`. The title names the skill, never just the technology. `Spike: Docker — containerize a Spring Boot app`, not `Spike: Docker`. If you can't title it this way, the scope isn't specific enough yet.

**Gap** — What skill or knowledge gap this spike closes, in one or two sentences, in the mentee's own situation ("our platform teams use event-driven patterns and I can't read code that touches them"), not a generic statement about the technology.

**Goal** — The specific question they'll be able to answer, or thing they'll be able to do, when done. One sentence. If the sentence needs "and", it's two spikes.

**Time-box** — Working days, full-time: the spike is the trainee's sole focus while it runs. Default 2 days; 1 for narrow gaps, 3 for meatier topics, 5 (a full week) only for advanced material. A cap, not a target: when it runs out, the spike gets presented with whatever was found — partial findings are a valid outcome, and grinding silently past the cap is the anti-pattern. The disposition of an incomplete spike (split, prerequisite, new approach, or park) is decided at that presentation.

**Exit questions** — 3–6 concrete questions the mentee must be able to answer (or tasks they must be able to do) at the end. These are the standard, drafted per `exit-question-rubric.md`. These are what the mentee answers, in their own words, at the presentation.

**Out of scope** — Named things NOT to pursue, even when they look interesting: the nearest rabbit holes. Always end with: hitting these isn't failure — note it in a ticket comment and move on.

**Deliverable (Definition of Done)** — Every spike closes with a presentation to the group at any meeting once the spike is ready. No time limit on the presentation. It must cover: the gap, the exit questions answered in their own words, a live demo or walkthrough (scripted in the ticket where possible), what surprised them, and what's still fuzzy. A presentation passes when the answers are concrete and the demo holds up; otherwise it gets a targeted follow-up on just what fell short. The supporting artifact is linked in a ticket comment before presenting. Every spike documents itself as a Confluence page in the Spike Board space (see `atlassian-conventions.md`): for write-up or diagram spikes the page is the artifact; for hands-on spikes it's a short companion to the demo repo, which stays in git. Done = presented, passed, artifact linked. Not done = hours spent.

**Starting resources** — 2–3 real links: a starting point so hour one isn't spent searching, not required reading. Official docs and quickstarts first. Point at artifacts from the mentee's previous spikes when this one can build on them.

**Progress notes** — Standing instruction to comment on the ticket while working, dead ends included. "Spent an hour stuck on X" is useful signal, not failure — and it's the ambient evidence that the honor-system hours are real.
