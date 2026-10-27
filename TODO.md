# First paper

## Results

- [ ] State that the threshold the representativeness assessment yields is 10% of the population, and render 10% from a mustache variable — `15_results.md`.
  Test: 15_results.md states the threshold as 10% of the population. The Fig 4 sentence carries a key from first_paper_values.json, and grep finds no literal `10%`.

## Discussion

- [ ] Fill `XXX percent` with the Results percentage — `17_discussion.md`.
  Test: The Discussion states the same percentage as the Results. Grep 17_discussion.md for XXX and find none.
- [ ] Contribution beat: add the knowledge claim ahead of the first 12-year analysis `[[ ]]` — `17_discussion.md`.
  Test: The contribution paragraph opens on a knowledge claim before the first 12-year sentence. No [[ ]] marker remains in 17_discussion.md.

## Conclusion

- [ ] Fill `XXX%` with the Results percentage — `18_conclusion.md`.
  Test: The Conclusion states the same percentage as the Results. Grep 18_conclusion.md for XXX and find none.
- [ ] Add the resolution sentences that synthesize the spatial understanding and close the opening circle `[[ ]]` — `18_conclusion.md`.
  Test: The Conclusion restates the spatial understanding and closes the opening circle. No [[ ]] marker remains in 18_conclusion.md.

## Supplementary

- [ ] Fill the permit table `XXX` — `19_supplementary.md`.
  Test: Every row of the permit table lists a permit number. Grep 19_supplementary.md for XXX and find none.
- [ ] Fill the foraging-trip count `XXX` — `19_supplementary.md`.
  Test: The supplementary text states the foraging-trip count as a number. Grep 19_supplementary.md for XXX and find none.

# Second paper

- [ ] Create the binary hot-spot map script `src/plot_gfw_apparent_fishing_effort_hotspot_binary.R` (not started)
  Test: The file src/plot_gfw_apparent_fishing_effort_hotspot_binary.R exists. A paper cites the map it writes.

# Third paper

- (Empty: no tasks yet)

# Not visible in the papers

## Style guide

- [ ] Propose `check_*` to islas.dev/guia_de_estilo/STYLEGUIDE as the level-2 verb for a validator whose artifact is an exit code; until the guide lists it, `AGENTS.md` carries the deviation.
  Test: The STYLEGUIDE lists check_* among its level-2 verbs. Open islas.dev/guia_de_estilo/STYLEGUIDE and look under Level 2.

## Figures

- [ ] Retitle the two unused first-paper figures to the foraging component and update their DOCS lines — `reports/figures/gps_albatross_50_percent_potential_kba_ars_all_without_mpa.png`, `reports/figures/gps_albatross_50_percent_potential_kba_ars_guadalupe_with_mpa.png`, `src/plot_potential_kba_all.R`, `src/plot_kba_guadalupe_mpa_intersection.R`, `DOCS.md`.
  Test: Grep DOCS.md and the two figure paths for potential_kba and find none. Both headings name the foraging component.

## Bycatch package

- [ ] Make `bycatch::compute_potential_kba()` write `threshold_population_percent` as an attribute of `kba_polygons_all.gpkg`, then delete `src/create_foraging_component_threshold.R` and read the attribute from `data/processed/kba_polygons_all.gpkg` — `Dockerfile`, `Makefile`, `src/create_first_paper_values.R`.
  Test: `kba_polygons_all.gpkg` carries `threshold_population_percent` and `src/create_foraging_component_threshold.R` no longer exists.

## Makefile

- [ ] Retire or archive the two dangling PNG targets: `reports/figures/kba_and_vms_union_hotspot_map.png` and `reports/figures/kba_and_gfw_apparent_fishing_effort_hotspot_map.png` are prerequisites of `reports/second_paper.pdf` but no `papers/**/*.md` file references them — `Makefile`.
  Test: Grep papers/ and DOCS.md for each dangling name. Either a paper cites it or the Makefile drops it.

## README

- [ ] Replace the `bycatch` reference in `README.md` with its Zenodo DOI once the package record exists.
  Test: The bycatch entry in README.md carries a Zenodo DOI. Grep README.md for zenodo in that entry and find it.

## Zenodo release: Academic record (native GitHub integration)

Released `v0.4.0`: concept DOI `10.5281/zenodo.23485336`, version DOI `10.5281/zenodo.23485337`.

- [ ] Update `version` in `.zenodo.json` and `CITATION.cff` to `0.5.0` at the next tagged release.
  Test: Grep .zenodo.json and CITATION.cff for the version and find 0.5.0. The tag v0.5.0 exists.

## Zenodo release: Report record (out of scope for now)

- [ ] Publish `v0.4.0` of `10.5281/zenodo.18776466` with only the `make all` PDFs and PNGs; supply the consolidated report PDF from a private Docker image or a Google Drive link.
  Test: The Zenodo record 10.5281/zenodo.18776466 shows version 0.4.0. It holds only the PDFs and PNGs from make all.
- [ ] Update the report record metadata for conservation managers: report-only description, remove `code:codeRepository`, link it to the academic record, keep CC-BY-4.0, GECI as creator, and `islasgeci`.
  Test: The report record metadata shows no code:codeRepository. It links to the academic record and still reads CC-BY-4.0.
- [ ] Decide what to do about the 25 `references/*.pdf` files inside `bycatch_thesis.zip` in `v0.3.0` (request removal from Zenodo support or accept them).
  Test: bycatch_thesis.zip in the report record no longer holds the 25 reference PDFs. Or a note records that we accepted them.

