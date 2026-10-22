# Developer Manual (AGENTS.md)

Workflow guide to this project's architecture, operations, and standards.

## Public Interface

The public interface is the set of `make` targets that a file under `papers/` references. A target that no `papers/` file mentions is not part of the interface. `DOCS.md` lists the current elements; `CHANGELOG.md` records only changes to those elements.

## Environment Setup & Operations

### Build System
- **Primary**: `make`.
- **Docker**: `docker compose run --rm islasgeci`, or `docker exec albatross-bycatch-mexico_ci <command>` in the running container.
- **Image**: `islasgeci/albatross-bycatch-mexico:latest`.
- **CI**: `.github/workflows/check.yml` reruns the checks on pushes to `develop`; `render.yml` rebuilds `make all` weekly.

### Initial Configuration
- **Registry**: `DOCKER_USERNAME`/`DOCKER_PASSWORD` for pushing images.

### Key Commands
```bash
make reports/first_paper.pdf
make reports/second_paper.pdf
make reports/obsolete_results.pdf
make restore
make format
docker exec albatross-bycatch-mexico_ci make <target>
docker exec albatross-bycatch-mexico_ci Rscript src/foo.R
docker exec albatross-bycatch-mexico_ci .pipelines/check_spelling.sh '<glob>' '<es|en>'
docker exec albatross-bycatch-mexico_ci .pipelines/check_manuscript_style.sh '<glob>'
```

### Make Dependency Gotchas
- **`.PHONY`**: list every phony target as a prerequisite of `.PHONY`; a target left out can be mistaken for an up-to-date file.
- Glob-concatenating rules need the real files via `$(wildcard ...)`.
- Every PNG a paper references must be a prerequisite of its `reports/*_paper.pdf` target.
- `papers/first-paper/first_paper.mustache` is generated from `1?_*.md`; never edit it.

## Data Lifecycle

- **Data**: `data/raw/` is immutable; `create_*()` shapes `data/processed/`, and `render_*()` reads it to write PNGs to `reports/figures/`.
- **Traceability**: `analyses.json` maps each report to its scripts, data, and results.
- **Custom scripts**: some figures use `src/` directly, bypassing `bycatch`.
- **`references.bib`**: unwritten values read `not_applicable`, never `NA`.

### Pipelines

- **EEZ mask**: `export_eez_mask_in_grid.R` → `data/processed/eez_mask_in_grid.gpkg`, column `in_eez_outside_gulf`.
- **UD overlap**: `export_ud_in_grid.R` → `ud_in_grid.gpkg`; `export_ud_vms_longline_udoi.R` → `ud_vms_longline_udoi.gpkg`; `compute_udoi.R` → `longline_udoi.json` (UDOI = n_overlap × Σ(product)); `plot_ud_vms_longline_udoi.R` → map titled from the JSON.
- **GFW hot spots**: `export_longline_events_long.R`; `export_gfw_longline_in_grid.R` → `gfw_longline_in_grid.gpkg`; `compute_gfw_longline_hotspot.R` (Getis-Ord Gi*) → `gfw_longline_hotspot_all.gpkg`; `plot_gfw_longline_hotspot.R`; `plot_gfw_longline_hotspot_binary.R` (z ≥ 1.96).
- **Obsolete results**: `papers/obsolete-results/obsolete-results.md`; `make reports/obsolete_results.pdf`.
- **Figure registration**: every PNG target must be referenced by some `papers/**/*.md`.

## Releases & Archiving

- A GitHub Release archives the tag; pushing a tag alone does nothing. Only `vX.Y.Z` tags create Zenodo versions, which take the version from `.zenodo.json`.
- The release contains exactly the tracked files, so `LICENSE`, `.zenodo.json`, and `CITATION.cff` must be in the tag. Zenodo reads `.zenodo.json`; GitHub reads `CITATION.cff`.
- `10.5281/zenodo.23485336` is the concept DOI and resolves to the latest version; `10.5281/zenodo.23485337` is `v0.4.0`. Cite the concept DOI.
- `references/` is the private nested repository `IslasGECI/bycatch.references`; the public repository ignores it.
- `10.5281/zenodo.18776466` is the manager-facing record for PDFs and PNGs; the software record carries the source. Keep them apart.
- The software record credits GECI as creator, `islasgeci` as community, and R as language.

## Development & Coding Standards

### Script Structure (`src/`)
Every script opens with a Spanish header in imperative form: title, context, description, inputs, output, dependencies, notes. Run all `src/` code in the container; `.pipelines/` scripts may run on the host.

### Style Rules
- **Reference**: https://islas.dev/guia_de_estilo/STYLEGUIDE
- **Code**: English variables, Tidyverse, linear (no functions, loops, or conditionals).
- **Names and output**: scripts under `src/` start with a verb, use letters, numbers, and underscores, and write exactly one file.

### Repository Content
- **KML**: boundaries in `data/raw/` (e.g. `gulf_of_california.kml`) are tracked.

### Manuscript Structure (first paper)
- `papers/first-paper/OUTLINE.md` is the structural source of truth; it names each section's beats and order.
- The assistant owns the `<!-- ... -->` comments and moves sentences verbatim; `[[ ... ]]`, `XXX`, and `#` headings are the author's.
- **Code availability**: the methods name the analysis package (`track2KBA`) and cite the concept DOI; function detail and repository links stay out.

## Validation & Testing

### Quality Assurance
- `make check` runs spellcheck and style checks; both languages pass.
- **Style**: ≤ 25 words per sentence. The checker counts words per line, so keep one sentence per line; splitting changes no output, because consecutive lines form one paragraph.
- **Comments**: lines starting with `<!--` are not counted.
- **Pre-push**: `.githooks/pre-push` (via `core.hooksPath`) runs `make check` in the running `<directory>_ci` container, here `albatross-bycatch-mexico_ci`; start it before pushing. Push with `git push`; there is no `make push`.
- **Placeholders**: `{{ key }}` resolves from `data/processed/methods.json`; unknown keys render empty. `[[ ... ]]` notes are skipped; `XXX` marks a number the author supplies.
- **Annotations**: one `[[ ... ]]` note per line, no `]` inside; `src/remove_annotations_from_paper_for_docx.sh` strips them from the DOCX only.
- **Whitelist**: add tokens to `.github/config/.wordlist-{en,es}.txt` and bump the `personal_ws-1.1` count; `aspell` runs `--ignore-case`, so a plural needs its own entry.
- **Figures**: check a description against the rendered PNG first, then the script and data.
- **Authorship**: the author writes all manuscript prose; the assistant handles structure, questions, and deterministic edits.

## Documentation Map

| File | Audience | Focus |
|------|----------|-------|
| `README.md` | End users | What it is, usage, and its three references |
| `AGENTS.md` | Developers | This manual: build, code, contribute |
| `DOCS.md` | Developers | The public interface: every `make` target a paper references |
| `CHANGELOG.md` | Developers | Changes to those interface elements, by version |
| `TODO.md` | Team | Backlog; work not tied to a manuscript goes under `# Not visible in the papers` |
