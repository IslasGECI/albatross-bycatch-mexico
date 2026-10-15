# Bycatch risk assessment of the Laysan albatross in the Mexican Pacific

Maps where Laysan albatrosses forage and measures how much of that space overlaps fishing grounds and marine protected areas in the Mexican Pacific.

## What it does

This project produces two scientific articles:

1. **First paper** — locates the critical foraging areas (Key Biodiversity Areas) of Laysan albatrosses and measures how much of those areas falls inside marine protected areas
2. **Second paper** — quantifies the spatial overlap between where albatrosses spend their time and where fishing vessels operate

Each article is delivered as a PDF with embedded maps and tables, and the figures are kept as separate image files for reuse in talks and reports.

## How to use it

Request the latest PDFs from the project director.
The figures and reports rebuild themselves whenever the underlying data or analysis code changes, so what you receive always matches the current data.

## Before you start

You need credentials to download the seabird tracking data.
Ask the data steward for them, and keep them in the environment where you run the project.

## Run the project

Docker is the supported way to run this project; it brings every other piece of software with it.

1. Install Docker.
2. Download the project and open a terminal in its folder.
3. Start the project container, then build the article you need.

```bash
docker compose up --detach
docker exec bycatch_thesis_ci make reports/first_paper.pdf
```

The developer manual lists every other report and figure you can build this way.
If you prefer to run without Docker, install R and the packages named in the project Dockerfile, then run the same commands directly.
