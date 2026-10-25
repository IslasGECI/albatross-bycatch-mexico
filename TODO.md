# First paper

## Methods

- [ ] Reason for the 60 km removal `XXX` — `13_methods.md:157`.
- [ ] Bias the utilization distribution represents `XXX` — `13_methods.md:159`.

## Results

- [ ] Replace the remaining literal numbers (93.4, 1–36) with mustache variables — `15_results.md:28, 37`.
- [ ] Representativeness `XXX%` — `15_results.md:21`.
- [ ] Area of the potential KBA (km2) — `15_results.md:48`.
- [ ] Area of the 60 km rings around Guadalupe, Clarion, and San Benedicto (km2) — `15_results.md:48`.
- [ ] Total core area (km2): the potential KBA unioned with the rings — `15_results.md:49`.
- [ ] Area of the core area inside Mexican MPAs (km2) — `15_results.md:49`.
- [ ] Percentage of the core area inside Mexican MPAs — `15_results.md:50`.
- [ ] Add the comparison table: potential-KBA and core-area rows, inside-MPA area on the union row `[[ ]]` — `15_results.md:58`.
- [ ] Add the closing Results sentence carrying the union-basis percentage `[[ ]]` — `15_results.md:60`.
- [ ] Deduplicate the core-area definition, which now appears in the Methods and here — `13_methods.md:190`, `15_results.md:45`.

## Discussion

- [ ] Fill `XXX percent` with the Results percentage — `17_discussion.md:6`.
- [ ] Contribution beat: add the knowledge claim ahead of the first 12-year analysis `[[ ]]` — `17_discussion.md:19`.

## Conclusion

- [ ] Fill `XXX%` with the Results percentage — `18_conclusion.md:5`.
- [ ] Add the resolution sentences that synthesize the spatial understanding and close the opening circle `[[ ]]` — `18_conclusion.md:6`.

## Supplementary

- [ ] Fill the permit table `XXX` — `19_supplementary.md:23, 24, 25, 28, 37, 39, 40`.
- [ ] Fill the foraging-trip count `XXX` — `19_supplementary.md:5`.

# Second paper

- [ ] Create the binary hot-spot map script `src/plot_gfw_apparent_fishing_effort_hotspot_binary.R` (not started)
- [ ] Add the Makefile rule that builds the binary hot-spot map (not started)

# Third paper

- (Empty: no tasks yet)

# Not visible in the papers

## Style guide

- [ ] Propose `check_*` to islas.dev/guia_de_estilo/STYLEGUIDE as the level-2 verb for a validator whose artifact is an exit code; until the guide lists it, `AGENTS.md` carries the deviation.

## Makefile

- [ ] Retire or archive the two dangling PNG targets: `reports/figures/kba_and_vms_union_hotspot_map.png` (`Makefile:426`) and `reports/figures/kba_and_gfw_apparent_fishing_effort_hotspot_map.png` (`Makefile:450`) are prerequisites of `reports/second_paper.pdf` but no `papers/**/*.md` file references them.

## README

- [ ] Replace the `bycatch` reference in `README.md` with its Zenodo DOI once the package record exists.

## Zenodo release: Academic record (native GitHub integration)

Released `v0.4.0`: concept DOI `10.5281/zenodo.23485336`, version DOI `10.5281/zenodo.23485337`.

- [ ] Update `version` in `.zenodo.json` and `CITATION.cff` to `0.5.0` at the next tagged release.

## Zenodo release: Report record (out of scope for now)

- [ ] Publish `v0.4.0` of `10.5281/zenodo.18776466` with only the `make all` PDFs and PNGs; supply the consolidated report PDF from a private Docker image or a Google Drive link.
- [ ] Update the report record metadata for conservation managers: report-only description, remove `code:codeRepository`, link it to the academic record, keep CC-BY-4.0, GECI as creator, and `islasgeci`.
- [ ] Decide what to do about the 25 `references/*.pdf` files inside `bycatch_thesis.zip` in `v0.3.0` (request removal from Zenodo support or accept them).

