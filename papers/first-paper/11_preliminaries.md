
<!-- STORY (OCAR), decided with the author:
O — Seabirds are among the most threatened groups of birds, and the main tool for protecting them at sea is anchored to land: 13.2% of pelagic species fall inside MPAs against 32.5% of coastal ones, so open-ocean users are missed by design. This is the problem the paper opens and closes on.
C — It is unknown where the core areas of Laysan albatross breeding in Mexico are and how much of them existing MPAs cover. The paper asks one question, do Mexico's MPAs cover those core areas, and states the hypothesis after it, that they do not. Every Introduction paragraph must drive toward this question; the umbrella, stakeholder, oceanography, and replication material lives outside the funnel.
A — The Action runs Trust, Place, Define, Measure: 121 individuals from Guadalupe, Clarion, and San Benedicto across 12 breeding seasons (2014–2026) are shown representative (93.4% inclusion, Rep95 = 157; the 2014–2018 five-year claim stays qualitative), the tracks place the birds inside the EEZ, a pooled 50% utilization distribution delineates the core area, and its overlap with MPAs is quantified on the union basis. Figure order is locked (tracks, representativeness, N_IND surface, core area with MPAs); only the prose moves.
R — One percentage, reported everywhere as XXX until authored, is ((core ∪ ring(Guadalupe) ∪ ring(Clarion) ∪ ring(San Benedicto)) ∩ MPA) / (core ∪ rings) × 100 — the same union in both sides, so the retired 10.43% double counting cannot return. The number's meaning is carried by location, not magnitude: the protection is anchored to islands (Revillagigedo's zones, the coastal band) while the core area lies offshore beyond every boundary (Fig 4), so the pelagic gap reproduces as a spatial pattern. The Discussion answers the question, closes the Opening circle spatially with Critchley cited qualitatively (13.2/32.5 open the problem in the Introduction and never return as a numeric comparison), limits the claim to the breeding season, and introduces the core area as a candidate KBA to ground the recommendation; the Conclusion is one take-home sentence.
Register — audience is conservation scientists and MPA practitioners; one story (the deficiency of pelagic coverage), one question, one headline number; the only reported percentage is the union-based coverage, and core area ∩ MPA appears only as a map (Fig 4), never as a standalone number; the object is "core area" everywhere before the Discussion and "potential KBA" only inside it; 10.43% and the 0.6% core-only figure are retired in favor of the union-corrected basis above. -->

<!-- OUTLINE (skeleton — one line per section)
INTRODUCTION — funnel, 8 beats, Challenge-final: hook → pelagic gap → Mexican case (islands in ANPs, sea-use, fleet) → why tracking → concepts compressed → novelty compressed → the gap → question + hypothesis.
METHODS — skeleton in 13_methods.md kept, story-tagged, analysis ordered Trust → Define → Measure: study area → GPS deployment → tracking effort → Trust (representativeness) → Define (track2KBA workflow, 60 km exclusion, 50% UD) → Place (MPA layer, EEZ) → Measure (overlap on the union basis) → ethical considerations.
RESULTS — 7 beats, figures locked: lead (Fig 1) → Trust (Fig 2) → Define i surface (Fig 3) → Define ii naming (core area debuts) → Measure answer (Fig 4, XXX%) → Measure table + colonies → take-home (the sentence Conclusion repeats).
DISCUSSION — 4 moves: answer → circle (spatial, Critchley qualitative) → limitation (breeding season) → contribution (first 12-year analysis; candidate KBA; 30x30 recommendation).
CONCLUSION — one take-home sentence carrying XXX on the union basis; no new number, no future-research sentence.
-->

<!-- INTRODUCTION (funnel; 8 beats, one point each; the Question and hypothesis land in the final beat)
I1 Hook — seabirds among the most threatened groups of birds; the main tool for protecting them at sea is anchored to land. Opening sentence; nothing precedes it.
I2 Pelagic gap — 13.2% of pelagic species fall inside MPAs against 32.5% of coastal ones; open-ocean users are missed by design. @critchley2018marine lives here and stays here; Discussion move 2 cites it qualitatively only.
I3 Mexican case — Laysan albatrosses nesting on Mexican Pacific islands (Guadalupe; Clarion and San Benedicto, both inside the Revillagigedo ANP); the islands are protected, the sea around them need not be; a longline fleet works the same waters. Island oceanography and colony profiles belong to Methods (13_methods.md), not here.
I4 Why tracking — to know whether MPAs cover their core areas you must first know where the core areas are; GPS tracking locates them; a long pooled series is required because breeding areas shift between years (wires the 12-year design).
I5 Concepts compressed — core area = 50% utilization distribution (one sentence); MPA vs ANP distinction (one sentence); the 60 km colony zone defined (it returns as the ring in Results). Full definitions live in Methods.
I6 Novelty compressed — first 12-year pooled core-area analysis for Mexico's albatross colonies. One sentence, no citation.
I7 The gap — it is unknown where the core areas of Laysan albatrosses breeding in Mexico are and how much of them existing MPAs cover.
I8 Question + hypothesis — final beat: "Do Mexico's MPAs cover their core areas?", then the hypothesis that they do not. Objectives dissolved into these two sentences.
OUT of the Introduction (per the story): umbrella sentence, stakeholder sentence, oceanography paragraph, replication material.
-->

<!-- METHODS (13_methods.md skeleton kept; beats story-tagged; analysis ordered Trust → Define → Measure)
M1 Study area — scope sentence (marine-coverage question, EEZ); the three colonies ordered by relevance; islands lie in ANPs; those protected areas carry a terrestrial and a marine component; California Current oceanography positioned because it explains where the core areas will sit. Island profiles each gain a connective stating why that island matters to the coverage question.
M2 GPS deployment — capture/attachment/Tesa protocol; December–June window enclosing the breeding season; why devices are recovered within the same season.
M3 Tracking data — 121 individuals pooled (Guadalupe 100, Clarion 26, San Benedicto 4); 12 breeding seasons, 2014–2026; trips per colony; effort concentrated at the largest colony; the 2014–2018 five-year premise stated here and proven by M4.
M4 Trust — representativeness via repAssess: 93.4% inclusion at n = 121 (Rep70 = 20, Rep95 = 157); the 5-year subset was not representative, which is why 12 years are pooled; pooling justified because seasons align and years are comparable.
M5 Define — track2KBA workflow narrated, not bulleted (resolve 13_methods.md:142 note): formatFields → tripSplit → tripSummary → projectTracks → findScale (ARS via First Passage Time) → estSpaceUse → repAssess → findSite. The 60 km-around-the-colony exclusion completed and justified (13_methods.md:137 is an incomplete, load-bearing sentence — the excluded band is re-added as the ring in Results); no resampling under uniform frequency.
M6 Define — core area delineation: KDE per trip → pooled density → 50% UD; why track2KBA (replicable, open-source, built to identify potential KBAs).
M7 Place — the MPA layer (mexico_mpa) inside the EEZ mask; the intersection arithmetic and its units.
M8 Measure — the overlap index on the union basis: (core ∪ 60 km rings of all three colonies) ∩ MPA over (core ∪ 60 km rings); why the ring enters BOTH sides (it was removed for the KDE, so it must return for coverage); this is the paper's only percentage, computed once.
M9 Ethical considerations — permits, minimization, no harm (unchanged).
-->

<!-- RESULTS (7 beats; figures locked; several scaffold Qs rewritten or retired by the author's decisions)
R1 Lead (Fig 1) — the sample and its geography: 121 individuals, three colonies, 12 breeding seasons; where they went (compass, offshore distance, relation to the colonies). Carries Q1–Q3.
R2 Trust (Fig 2) — 93.4% inclusion and what it means in plain words; 60% would have licensed a different claim; Rep95 = 157; the 2014–2018 subset only as a qualitative counterpoint. Carries Q4–Q6.
R3 Define i (Fig 3) — the N_IND surface, LD first: a shared core of heavily used cells; then the 1–36 range, the inverse relation between N_IND and polygon size, and the sparseness fact. Carries Q7–Q9. NOTE: Q8's "4.8% of 215,430 cells" is a percentage and collides with the one-percentage rule — state it in counts ("10,417 of 215,430 cells") or drop it (author's call). The Clarion max 3 / San Benedicto max 1 seeds of Q18 rest here in data terms.
R4 Define ii — "core area" debuts: the move from the continuous N_IND surface to the delineated 50% UD polygons. Carries Q10.
R5 Measure — the answer (Fig 4): the paper's only percentage, XXX = ((core ∪ 3 rings) ∩ MPA) / (core ∪ 3 rings) × 100, with every qualifier attached (pooled across three colonies, breeding season, inside the EEZ). The core area itself sits offshore beyond the boundaries — the map carries the deficiency the single percentage alone cannot show. Rewrites Q11; absorbs the 5-of-22 count and the island-edge location (Q13–Q14). WATCH: 17_discussion.md:6 and 18_conclusion.md:4 both say "core area falls inside MPAs" — both carry the union basis, not the retired core-only figure.
R6 Measure — table + colonies: rows are Core area and Core ∪ 60 km rings (three colonies); cores area (km²) and, on the union row only, the inside-MPA area (km²); the percentage sits in prose beside the union row. No standalone ring row, no standalone core ∩ MPA row (author's rule). Prose walks numerator and denominator. Clarion and San Benedicto delineate no core — their tracks feed the pooled surface, their protection shows only through the union (Q18 and Q19 become prose here, never reported as standalone ring percentages). NOTE: the 66,933 km² union and 27,417.5 km² overlap are this session's geodesic approximations; the author's own computation supersedes them, and the percentage stays XXX meanwhile.
R7 Take-home — one final sentence carrying XXX, one idea, no interpretation; the sentence 18_conclusion.md:4 will repeat. Rewrites Q20.
Retired from Results: Q12's 10.43% walkthrough (union replaces it), Q15 (Critchley comparison → Discussion move 2, qualitative), Q16 (its LD beat is folded into R3/R5), Q17's area-based overlap index (an index definition, not a reported percentage; it lives in Methods M8).
-->

<!-- DISCUSSION (4 moves; 17_discussion.md material re-arranged)
D1 Answer — the question answered in one sentence: XXX (union basis), then the spatial answer: the core area lies offshore while the MPA coverage hugs islands (17_discussion.md:4–8 supply the material). The redundant re-question at 17_discussion.md:10 is dropped.
D2 Circle (spatial; Critchley qualitative) — the aggregate hides placement: protection is anchored to islands (Revillagigedo's near-full zones, the coastal band) while the core area sits beyond every boundary (Fig 4). The pelagic coverage gap reproduces in the Mexican Pacific as a location, not as a low total. @critchley2018marine is cited for this pattern; the 13.2/32.5 figures appear only in the Introduction. Rewrites 17_discussion.md:12–13; no numeric comparison with Critchley anywhere.
D3 Limitation — the data cover the breeding season only; conclusions apply to that period; the breeding season is when the population is most vulnerable, so it is also the most relevant period for protection (17_discussion.md:17–19, unchanged).
D4 Contribution — first 12-year pooled core-area analysis for Mexico's albatross colonies; the core area introduced as a candidate KBA, the term debuting here with a one-sentence definition; grounded recommendation: under 30×30 commitments, expand MPAs to encompass the core areas and explore open-ocean management approaches — where the main threat is fisheries, giving a clean pass to the next paper. Rewrites 17_discussion.md:15, 21–22 following the note at :22; the future-research sentence at :24 is demoted, not kept.
-->

<!-- CONCLUSION (one beat)
C1 — One take-home sentence: restate the only percentage (XXX, union basis) and the deficiency it locates. 18_conclusion.md:4 currently reads "the intersection between the core area and the MPAs is XXX%" — that basis was retired; the sentence must be rewritten to ((core ∪ 3 rings) ∩ MPA) / (core ∪ 3 rings). No new number, no future-research sentence.
-->

# Abstract

