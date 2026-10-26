# Developer Manual (AGENTS.md)

## Public Interface

The public interface is the `make` targets a `papers/` file references; one no paper mentions is not an element. Papers reference figures, not report PDFs, so the PDF targets are not elements. `DOCS.md` lists the elements, `CHANGELOG.md` their changes; the PNG paths under `papers/` must match the `###` headings in `DOCS.md`.

## Environment Setup & Operations

### Build System
- **Docker**: `docker compose run --rm islasgeci`, or `docker exec albatross-bycatch-mexico_ci <command>` in the running container; image `islasgeci/albatross-bycatch-mexico:latest`.
- **CI**: `check.yml` reruns the checks on pushes to `develop`; `render.yml` rebuilds `make all` weekly and pushes the image with `DOCKER_USERNAME`/`DOCKER_PASSWORD`.

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
- **PNG registration**: every PNG target must be referenced by some `papers/**/*.md`, and every referenced PNG must be a prerequisite of its `reports/*_paper.pdf` target.
- `papers/first-paper/first_paper.mustache` and `reports/*.md` are generated; never edit them.

## Data Lifecycle

- **Data**: `data/raw/` is immutable; `create_*()` shapes `data/processed/`, and `render_*()` writes PNGs to `reports/figures/`.
- **Traceability**: `analyses.json` maps each report to its scripts, data, and results.
- **`references.bib`**: every entry fills author, title, year, `category`, and the screening fields; unwritten values read `not_applicable`, never `NA`.
- **PDF text**: no `pdftotext` in the image; use the host's on `references/`.

### Pipelines

- **EEZ mask**: `export_eez_mask_in_grid.R` → `data/processed/eez_mask_in_grid.gpkg`, column `in_eez_outside_gulf`.
- **UD overlap**: `export_ud_in_grid.R` → `ud_in_grid.gpkg`; `export_ud_vms_longline_udoi.R` → `ud_vms_longline_udoi.gpkg`; `compute_udoi.R` → `longline_udoi.json` (UDOI = n_overlap × Σ(product)); `plot_ud_vms_longline_udoi.R` titles from the JSON.
- **GFW hot spots**: `export_longline_events_long.R`; `export_gfw_longline_in_grid.R` → `gfw_longline_in_grid.gpkg`; `compute_gfw_longline_hotspot.R` (Getis-Ord Gi*) → `gfw_longline_hotspot_all.gpkg`; plots with `plot_gfw_longline_hotspot*.R`, binary at z ≥ 1.96.

## Releases & Archiving

- The release holds only tracked files, so `LICENSE`, `.zenodo.json`, and `CITATION.cff` must be in the tag; Zenodo reads `.zenodo.json` and GitHub reads `CITATION.cff`.
- Cite the concept DOI `10.5281/zenodo.23485336`; the manager-facing record `10.5281/zenodo.18776466` holds the PDFs and PNGs, the software record the source. Keep them apart.
- `references/` is the private nested repository `IslasGECI/bycatch.references`; the public repository ignores it.

## Development & Coding Standards

### Script Structure (`src/`)
Every `src/` script opens with a Spanish, imperative header: title, context, description, inputs, output, dependencies, notes; run in the container.

### Placement (`.pipelines/` vs `src/`)
- **The test**: a script used outside the container belongs to `.pipelines/`; one Make invokes inside belongs to `src/`.
- **Direction**: calls go downhill only — 5 (CI, `.pipelines/`) → 4 (Docker Compose) → 3 (Make) → 1–2 (`src/`); Make never calls `.pipelines/`.
- **Reference**: https://islas.dev/guia_de_estilo/arquitectura.
- **Validator naming**: `check_*` names a level-2 validator whose artifact is an exit code; `create_*` is for the scripts that write a file.

### Style Rules
- **Reference**: https://islas.dev/guia_de_estilo/STYLEGUIDE
- **Code**: English variables, Tidyverse, and linear R scripts (no functions, loops, or conditionals); shell scripts use functions or input guards.
- **Names and output**: `src/` scripts start with a verb, use letters, numbers, and underscores, and write one file.
- **Species names**: singular for any number of individuals of one species, as with fish: `Laysan albatross`, never `Laysan albatrosses`; verbs follow the count, and mixed groups keep the plural.

### Manuscript Structure (first paper)
- `papers/first-paper/OUTLINE.md` is the structural source of truth; it names each section's beats and order, in ≤30 words per line counting bullet, label, and dash.
- The assistant owns the `<!-- ... -->` comments and moves sentences verbatim; existing `[[ ... ]]`, `XXX`, and `#` headings are the author's.
- **Point comments**: one `<!-- point: … -->` per paragraph, unquoted, one sentence of ≤20 words stating the idea, so a prose edit leaves it true.
- **Code availability**: the methods name `track2KBA` and cite the concept DOI; function detail and links stay out.
- **Counts**: report exactly two, tagged individuals summed over seasons and colonies and analyzed individuals with a kernel density surface; drop identifier and reconciliation counts.
- **Colony radius**: the 60 km zone is a radius, never a ring or a circle, following Beal et al.; `disk` appears once, in the core-area definition.
- **Core area**: the Methods defines it once as the foraging component united with the 60 km disk; the Introduction names it, the Results uses it.
- **Foraging component**: the cells where individual 50% UDs overlap enough to reach 10% of the population; full phrase until a sentence exceeds 25 words, then the term; never a KBA.

## Validation & Testing

### Quality Assurance
- `make check` runs spellcheck and style checks; both languages pass.
- **Style**: ≤ 25 words per sentence, one sentence per line; the checker counts words per line and skips `<!--` lines.
- **Pre-push**: `.githooks/pre-push` (via `core.hooksPath`, set by `.pipelines/init.sh`) runs `make check` in the running `<directory>_ci` container; there is no `make push`.
- **Placeholders**: `{{ key }}` resolves from `data/processed/first_paper_values.json`, unknown keys empty; `[[ ... ]]` notes are skipped; `XXX` marks an author-supplied number; `src/create_first_paper_values.R` generates that JSON, so a new key starts there.
- **Annotations**: one `[[ ... ]]` note per line, no `]` inside; prose passes add `[[ Schimel §… — "target" — what to fix ]]`, the author rewrites and commits between steps; `src/create_first_paper_no_annotations.sh` strips them from the DOCX only.
- **Whitelist**: add tokens to `.github/config/.wordlist-{en,es}.txt` and bump the `personal_ws-1.1` count; `aspell` ignores case, so a plural needs an entry.
- **Figures**: check a description against the PNG, then the script and data.
- **Authorship**: the author writes the prose; the assistant handles structure, questions, and deterministic edits.

## Documentation Map

`README.md` serves end users; `AGENTS.md` developers; `DOCS.md` the interface; `CHANGELOG.md` its changes; `TODO.md` the backlog, with non-manuscript work under `# Not visible in the papers`. Every item carries a `Test:` line that fails while it is open, and names files, not line numbers.
