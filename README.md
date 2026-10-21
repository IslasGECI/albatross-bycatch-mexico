<a href="https://www.islas.org.mx/"><img src="https://www.islas.org.mx/img/logo.svg" align="right" width="256" /></a>

# Bycatch risk assessment of the Laysan albatross in the Mexican Pacific

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23485336.svg)](https://doi.org/10.5281/zenodo.23485336)

Maps where Laysan albatrosses forage in the Mexican Pacific and measures how much of that space overlaps fishing grounds and marine protected areas.

## What it does

This project answers two questions about the albatrosses that nest on Guadalupe, Clarion, and San Benedicto:

1. Where are their most important feeding areas at sea, and how much of that area lies inside marine protected areas?
2. How much of the space they use overlaps where longline and trawler vessels fish?

The answers are delivered as two scientific articles, each a PDF with maps and tables. The maps are also saved as separate images for talks and reports.

## How to use it

Ask the project director for the latest PDFs.
The reports and figures rebuild themselves from the data, so what you receive always matches the current analysis.

## Before you start

You need credentials to download the seabird tracking data.
Ask the data steward and keep them in the environment where you run the project.

## Run the project

Docker is the supported way to run this project; it brings every other piece of software with it.

1. Install Docker.
2. Download the project and open a terminal in its folder.
3. Build the article you need:

```bash
docker compose run --rm islasgeci make reports/first_paper.pdf
```

The developer manual lists every other report and figure you can build the same way.

If you prefer to run without Docker, install R and the packages named in the project Dockerfile, then run the same command without its Docker prefix.

## License

This project is released under the [GNU Affero General Public License v3.0](LICENSE).

---

## Authors' affiliation

- [Grupo de Ecología y Conservación de Islas](https://www.islas.org.mx/)

## References

- **Software record.** _This code repository, archived on Zenodo:_ Rojas-Mayoral, E., & Grupo de Ecología y Conservación de Islas, A.C. (2026). _«Bycatch risk assessment of the Laysan albatross in the Mexican Pacific»._ Zenodo. [DOI: 10.5281/zenodo.23485336](https://doi.org/10.5281/zenodo.23485336)
- **Report record.** _Generated artifacts (PDF reports and PNG figures):_ Grupo de Ecología y Conservación de Islas, A.C. (2026). _«Evaluación del riesgo de captura incidental del Albatros de Laysan (Phoebastria immutabilis) en el Pacífico mexicano»._ Zenodo. [DOI: 10.5281/zenodo.18776466](https://doi.org/10.5281/zenodo.18776466)
- **bycatch package.** _The R package used for bycatch risk analysis:_ Ciencia de Datos, GECI (2026). _«bycatch: seabird bycatch risk assessment»._ GitHub. [github.com/IslasGECI/bycatch](https://github.com/IslasGECI/bycatch)
