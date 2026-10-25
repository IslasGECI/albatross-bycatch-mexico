# Developer Manual (AGENTS.md)

## Public Interface

The public interface is the set of `make` targets that a file under `papers/` references. A target that no `papers/` file mentions is not part of the interface. `DOCS.md` lists the current elements; `CHANGELOG.md` records only changes to those elements.

## Environment Setup & Operations

### Build System
- **Docker**: `docker compose run --rm islasgeci`, or `docker exec albatross-bycatch-mexico_ci <command>` in the running container; the image is `islasgeci/albatross-bycatch-mexico:latest`.
- **CI**: `.github/workflows/check.yml` reruns the checks on pushes to `develop`; `render.yml` rebuilds `make all` weekly and pushes the image with `DOCKER_USERNAME`/`DOCKER_PASSWORD`.

### Key Commands
```bash
make reports/first_paper.pdf
make reports/second_paper.pdf
make reports/obsolete_results.pdf
make restore
make format
docker exec albatross-bycatch-mexico_ci make <target>
docker exec albatross-bycatch-mexico_ci Rscript src/foo.R
docker exec albatross-bycatch-mexico_ci src/check_spelling.sh '<glob>' '<es|en>'
docker exec albatross-bycatch-mexico_ci src/check_manuscript_style.sh '<glob>'
.pipelines/check.sh
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
- **`references.bib`**: 17 fields per entry (author, title, year, `category`, 13 screening fields); unwritten values read `not_applicable`, never `NA`.
- **PDF text**: the image lacks `pdftotext`; the PDFs live in the main checkout's ignored `references/`, so extract text there with the host's `pdftotext`.

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
Every script opens with a Spanish header in imperative form: title, context, description, inputs, output, dependencies, notes. Run all `src/` code in the container.

### Placement (`.pipelines/` vs `src/`)
- **The test**: a script belongs to `.pipelines/` only if its own process runs outside the container; a script that Make invokes inside the container belongs to `src/`.
- **Direction**: calls go downhill only — 5 (CI, `.pipelines/`) → 4 (Docker Compose) → 3 (Make) → 2 and 1 (`src/`). Make never calls `.pipelines/`.
- **Reference**: https://islas.dev/guia_de_estilo/arquitectura.
- **Deviations**: `check_*` is this project's level-2 verb for a validator whose artifact is an exit code; `create_*` would promise a file that does not exist. Shell scripts under `src/` keep functions and write no output file, so the linear-code and one-output-file rules bind R analysis scripts only.
- **Git hooks**: `.githooks/pre-push` stays because git pins the path; it delegates to `.pipelines/check.sh`.

### Style Rules
- **Reference**: https://islas.dev/guia_de_estilo/STYLEGUIDE
- **Code**: English variables, Tidyverse, linear (no functions, loops, or conditionals).
- **Names and output**: scripts under `src/` start with a verb, use letters, numbers, and underscores, and write exactly one file.
- **Species names**: use the singular form for any number of individuals of one species, as with fish: `Laysan albatross`, not `Laysan albatrosses`. Verbs follow the number of individuals, and a group of several species keeps the plural.

### Manuscript Structure (first paper)
- `papers/first-paper/OUTLINE.md` is the structural source of truth; it names each section's beats and order.
- The assistant owns the `<!-- ... -->` comments and moves sentences verbatim; `[[ ... ]]`, `XXX`, and `#` headings are the author's.
- **Code availability**: the methods name the analysis package (`track2KBA`) and cite the concept DOI; function detail and repository links stay out.

## Validation & Testing

### Quality Assurance
- `make check` runs spellcheck and style checks; both languages pass.
- **Style**: ≤ 25 words per sentence. The checker counts words per line, so keep one sentence per line; splitting changes no output, because consecutive lines form one paragraph.
- **Comments**: lines starting with `<!--` are not counted.
- **Pre-push**: `.githooks/pre-push` (via `core.hooksPath`, installed by `.pipelines/init.sh`) calls `.pipelines/check.sh`, which runs `make check` in the running `<directory>_ci` container, here `albatross-bycatch-mexico_ci`; start it before pushing. Push with `git push`; there is no `make push`.
- **Placeholders**: `{{ key }}` resolves from `data/processed/methods.json`; unknown keys render empty. `[[ ... ]]` notes are skipped; `XXX` marks a number the author supplies.
- **Annotations**: one `[[ ... ]]` note per line, no `]` inside; `src/create_first_paper_no_annotations.sh` strips them from the DOCX only.
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
