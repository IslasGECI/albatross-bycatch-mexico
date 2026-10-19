# First paper

## Introduction

- [ ] Threatened-species causes and consequences `[[ ]]` — `12_introduction.md:6`.
- [ ] Citation for strategies to prevent collapse `[[ ]]` — `12_introduction.md:9`.
- [ ] References for MPAs as a conservation strategy `[[ ]]` — `12_introduction.md:10`.
- [ ] Concept beat: MPA versus ANP distinction, offshore byproduct, KBA seed `[[ ]]` — `12_introduction.md:37`.
- [ ] Decide the home of the sentences parked in the UNMAPPED block — `12_introduction.md:76`.

## Methods

- [ ] GPS accuracy basis `[[ ]]` and `XXX m` — `13_methods.md:85`.
- [ ] Reason for the 60 km removal `XXX` — `13_methods.md:150`.
- [ ] Bias the utilization distribution represents `XXX` — `13_methods.md:151`.
- [ ] Narrate the track2KBA function list instead of bullets `[[ ]]` — `13_methods.md:153`.

## Results

- [ ] Replace all literal magical numbers (121, 93.4, etc) with mustache variables — `15_results.md`.
- [ ] Representativeness `XXX%` — `15_results.md:21`.
- [ ] Area of the 50% UD (km2), from the pooled KBA polygons — `15_results.md:48`.
- [ ] Area of the 60 km rings around Guadalupe, Clarion, and San Benedicto (km2) — `15_results.md:48`.
- [ ] Total core area (km2): the 50% UD unioned with the rings — `15_results.md:49`.
- [ ] Area of the core area inside Mexican MPAs (km2) — `15_results.md:49`.
- [ ] Percentage of the core area inside Mexican MPAs — `15_results.md:50`.
- [ ] Add the comparison table: core area and core-plus-rings rows, inside-MPA area on the union row `[[ ]]` — `15_results.md:58`.
- [ ] Add the closing Results sentence carrying the union-basis percentage `[[ ]]` — `15_results.md:60`.

## Discussion

- [ ] Fill `XXX percent` with the Results percentage — `17_discussion.md:6`.
- [ ] Contribution beat: add the knowledge claim ahead of the first 12-year analysis `[[ ]]` — `17_discussion.md:19`.
- [ ] Rewrite the 30x30 paragraph as alternatives `[[ ]]` — `17_discussion.md:26`.
- [ ] Decide the home of the sentences parked in the UNMAPPED block — `17_discussion.md:23`.

## Conclusion

- [ ] Fill `XXX%` with the Results percentage — `18_conclusion.md:5`.
- [ ] Add the resolution sentences that synthesize the spatial understanding and close the opening circle `[[ ]]` — `18_conclusion.md:6`.

## Supplementary

- [ ] Fill the permit table `XXX` — `19_supplementary.md:23, 24, 25, 28, 37, 39, 40`.
- [ ] Fill the foraging-trip count `XXX` — `19_supplementary.md:5`.
- [ ] Fill the tracked-individual count `XXX` — `19_supplementary.md:9`.

## Data

- [ ] Reconcile the tracked-individual numbers: 154 identifier-seasons, 130 identifier strings, 129 with at least one trip, 122 with at least one complete trip, 121 with a KDE surface (the 121 `repAssess` sees), 116 the largest evaluated subsample — `data/processed/`.

# Second paper

- [ ] Create the binary hot-spot map script `src/plot_gfw_apparent_fishing_effort_hotspot_binary.R` (not started)
- [ ] Add the Makefile rule that builds the binary hot-spot map (not started)

# Zenodo release

## Academic record (native GitHub integration)

- [ ] Create the private repository `IslasGECI/bycatch.references` with the `references/*.pdf` reading copies.
- [ ] Rewrite the history to drop every `references/*.pdf` from all commits and tags, then force-push `develop` and the tags.
- [ ] Add `LICENSE` (AGPL-3.0-only), `.zenodo.json`, and `CITATION.cff`; tag `v0.4.0` at that commit and rebase `develop` onto it.
- [ ] Enable the repository in Zenodo's GitHub integration and create the GitHub Release `v0.4.0`.
- [ ] Verify the record metadata, license, creators, contributors, and keywords.
- [ ] Request inclusion in the `islasgeci` Zenodo community, whose submission policy is closed.
- [ ] Add the concept DOI to `README.md` and `CITATION.cff` in the next release, because the archived tag cannot contain the DOI it mints.
- [ ] Add the code-availability sentence at `papers/first-paper/13_methods.md:153`, citing the concept DOI (author-written prose).

## Report record (out of scope for now)

- [ ] Publish `v0.4.0` of `10.5281/zenodo.18776466` with only the `make all` PDFs and PNGs; supply the consolidated report PDF from a private Docker image or a Google Drive link.
- [ ] Update the report record metadata for conservation managers: report-only description, remove `code:codeRepository`, link it to the academic record, keep CC-BY-4.0, GECI as creator, and `islasgeci`.
- [ ] Decide what to do about the 25 `references/*.pdf` files inside `bycatch_thesis.zip` in `v0.3.0` (request removal from Zenodo support or accept them).

## Repository housekeeping

- [ ] Update the GitHub repository description, which still says "Tesis sobre captura incidental de aves marinas".
