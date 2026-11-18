---
description: Ingest a co-author's review, applying every change and itemizing every comment as an annotation.
---

# Ingest Review

Read one co-author's review and fold it into the manuscript sources: apply every change the
reviewer made, and turn every comment, observation, and question into an item you can walk.

This is an external-reader command. Read `~/.config/opencode/prose-options.md`. Never author
or rephrase prose: the reviewer's words are transcribed, not rewritten.

## Scope

One review round, one manuscript. The durable result is edits to `papers/<manuscript>/1?_*.md`
or `2?_*.md`, plus `[[ ... ]]` annotations and, only as a last resort, items in `TODO.md`.
Never edit `reports/*`, `papers/*.mustache`, `references.bib`, or `OUTLINE.md`.

## Inputs

The review as it arrives in the session: a reviewed `.docx`, pasted email text, pasted chat
messages, or any mix. If no source is present, ask for it and stop.

Infer the manuscript from the DOCX and the conversation; ask once if it stays ambiguous. The
sources are `papers/<manuscript>/1?_*.md` with `10_metadata.yaml`, or `2?_*.md` with
`20_metadata.yaml`; the report is `reports/<name>.docx`. A file that is not a DOCX is
reported as unsupported.

## Gate

Run `git status --porcelain`. If it prints anything, report and stop: the baseline is HEAD,
and a clean start makes every write reversible. Never stage or commit.

## Baseline

Unzip the review under `/tmp/opencode/ingest-review/` and read `word/document.xml` and
`word/comments.xml`. Render the current sources to a temporary base DOCX with the pandoc flags
the `reports/<name>.docx` rule in the `Makefile` uses. Both texts must come from the same
pipeline, so citations, references, and figure text match and can anchor the mapping.

## Inventory

Before writing anything, show one table and wait for approval:

- every tracked change: file, target, before → after;
- every difference that is not a tracked change: the same columns;
- every comment: ID, channel, target, verbatim text, planned action, flags.

Actions are `edit`, `annotation`, `XXX`, or `TODO`. Flags include `resolved in Word`,
`stale`, `bracket substituted`, and `already present`.

Check the row count against `comments.xml`; a comment with no row is a missing comment, not a
silent one. Report unattributed or unresolvable rows. The inventory may span several messages;
there is one approval, not one per item.

## Changes

Apply word-level diffs, never whole-paragraph replacement. Locate each hunk by its unchanged
context in the Markdown source; keep citations, `\ref`, figure blocks, and tables intact.

Apply every difference between the base and the reviewed file, whether Word marked it or not.
Apply emphasis changes; ignore Word-only formatting such as font or colour and report it.

A difference is stale when applying it would make a paragraph equal to an earlier committed
version while HEAD differs. List those rows, write nothing, and stop; continue with the rest
only on explicit instruction.

When a change mixes a real edit with a question, a bare citation, or a missing number, apply
the representable words and turn the rest into an annotation at that point, or `XXX` when the
author must supply a value. Never write the question itself as prose.

If a context matches more than one place, list it and stop rather than guess.

## Comments

After the paragraph, figure caption, or table the comment targets, on its own line:

```
[[ R1 — "the exact words the comment points at" — the reviewer's comment verbatim ]]
```

Tag a resolved comment: `[[ R3 · resolved in Word — "target" — comment ]]`.

One ID per thread; put each reply inline, in order, with its author label. A comment whose
text the reviewer deleted stays where the text stood and quotes the deleted words. A comment
with no anchor goes at the end of the section it names. Only a whole-manuscript or metadata
remark becomes a `TODO.md` item, under the manuscript's heading, with a concrete `Test:` line
that you propose in the inventory.

Number with one `R` sequence, continuing from the highest existing `R` in the manuscript.
Replace every `]` inside an annotation with `)` and report each substitution. Keep one
annotation per line.

If the reviewer supplies a citation, do not invent a citekey: annotate the request and leave
the prose unchanged.

## Verify

Run `make check` and report failures without repairing them: accepted wording wins, the check
is a report. Prove every annotation parses with the annotation stripper the `Makefile` provides
(for the first paper, `make reports/first_paper_no_annotations.md`); if there is none, check
each annotation line against `\[\[[^]]*\]\]`. Confirm each inventory row landed exactly once.
Print the iteration order — the `1?_*.md` file order, then `TODO.md` — and
`git grep -n '\[\[ R' papers/`.

Report: items by channel, edits, annotations, TODO items, stale rows, bracket substitutions,
check failures, and the first file to walk.

## Idempotency

A second run with the same source skips an item whose target and verbatim text already
exist, whatever its ID, and reports the skip. A later channel continues the sequence without
touching earlier annotations. Once every item is written, a rerun on the same work is a no-op.
