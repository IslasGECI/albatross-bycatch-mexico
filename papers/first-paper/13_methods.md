
# Methods

## Study Area

<!-- main idea: M1 Study area — the spatial frame: the EEZ, the three colonies, the protected areas involved, and the oceanography that places the core areas. -->
We studied the core areas used by Laysan albatross within Mexico's EEZ.
Specifically, we assessed whether Mexico's MPAs encompass core areas used by the Laysan albatross during its breeding season.
The MPAs of interest for this study corresponded to the marine components of three PNAs.
Guadalupe Island Biosphere Reserve and Revillagigedo National Park hosted the three albatross colonies.
The Pacific Islands of the Baja California Peninsula Biosphere Reserve lay along the foraging paths used by the albatross during its breeding season.

The oceanographic conditions of the waters surrounding the breeding colonies determine foraging patterns, which in turn define the albatross core areas.
The California Current and the El Niño-Southern Oscillation (ENSO) phenomenon are examples of such oceanographic conditions.

Below we describe the three islands where the colonies breed.

### Guadalupe Island
Guadalupe Island hosts the largest breeding colony of Laysan albatross in the eastern Pacific [@hernandez2019sexual].
Guadalupe Island is an oceanic island of volcanic origin located 300 km west of the coast of Baja California.
It has an area of 244 km$^2$.
It measures 30 km at its longest part from the southern end to the northern end.
On Guadalupe Island, there were 4,390 breeding individuals in 2025 (unpublished authors' monitoring data).

### Clarion Island
Clarion Island is part of the Revillagigedo Archipelago.
Clarion is located 700 kilometers from the Mexican mainland.
It has a tropical climate.
It has an area of 19.8 km$^2$.
It measures 8.6 km at its longest part from the eastern end to the western end.

Clarion Island has the second largest Laysan albatross colony in Mexico.
On Clarion Island, crows and snakes prey on Laysan albatross eggs and newly hatched chicks.
The colony experienced complete breeding failure between 2016 and 2023 [@castillo2026breeding].
The colony held approximately 100 breeding individuals in 2021/22 [@castillo2026breeding].

### San Benedicto
San Benedicto Island is also part of the Revillagigedo Archipelago and shares the same tropical climate.
San Benedicto is located 600 kilometers from the Mexican mainland.
It has an area of 10 km$^2$.
It measures 4.8 km at its longest part from the northern end to the southern end.

On San Benedicto Island, crabs feed on the chicks, and nests can be buried in ash.
Reproductive success for Laysan albatross is close to 0%.
The colony holds fewer than 80 breeding individuals.

## GPS deployment

<!-- main idea: M2 GPS deployment — capture, attachment, and recovery; the breeding-season window and why devices return within it; the devices and settings across years and islands. -->

We deployed and recovered GPS tracking devices while the individuals were breeding on the island.
The devices were deployed from December to June, covering the breeding season, which generally spans from November to August.
This ensured that we could recover the GPS devices before the individuals migrated, as recovery would not have been possible the next breeding season.

The seabirds were captured by hand at their nests, and the GPS devices were attached to back feathers shed during the non-breeding season.
We attached the GPS loggers using Tesa tape (#4651, Tesa AG, Hamburg, Germany), following the method described in [@hernandez2019sexual].
The individuals were released at the same location immediately after the GPS device was attached or removed.
No albatross were harmed during the study.

The GPS loggers offer the level of accuracy and precision required for this study [@soanes2013many; @clay2023adjustment; @hernandez2019sexual].
We programmed the GPS units to record a position every 10 minutes.
This frequency is high enough to obtain representative data and to identify instances where an individual stops or reduces its speed.
At the same time, it is low enough to ensure the battery lasts for the entire season, allowing for the recording of several trips.

There were variations in the GPS device models across years and islands.

On Guadalupe Island we used the following GPS devices: From 2014 to 2016: model GiSPy-4SB by Techno Smart (Italy).
From 2017 to 2018: i-gotU model GT-120 by Mobile Action (Taiwan).
From 2019 to 2023: ATS1 model Nodo-2018 by ACMOS (Mexico).
From 2025 to 2026: GPS datalogger with accelerometer and UHF model Axy-Trek Remote by Techno Smart (Italy).

On Clarion Island, from 2018 to 2022 we used the following GPS devices: i-gotU model GT-120 by Mobile Action (Taiwan).
CatLog-S, Catnip Technologies (China).
CatLog-S2, Perthold Engineering (USA).

On San Benedicto Island, in 2020, we used the ATS1 model Nodo-2018 by ACMOS (Mexico).

We used different GPS models as new and better technology was available during the {{n_tracking_span_years}}-year period of the study.
Despite model changes, all devices have similar accuracy and were programmed with the same frequency, so the data remain comparable.

## Tracking data

<!-- main idea: M3 Tracking data — tagged individuals per colony across the breeding seasons; trips; effort concentrated at the largest colony; the short-series premise that the trust beat proves. -->
We focused solely on albatross that nest on the islands Guadalupe, Clarion, and San Benedicto.
To identify the core areas that persist across interannual variability, we used a long time series spanning {{n_tracking_span_years}} years.
From the {{tracking_season_span}} seasons, {{n_tracking_seasons}} carried tracking.
We assumed that this dataset would be long enough to capture the patterns that persist despite the interannual variability.
We grouped all {{n_tracking_seasons}} seasons without distinguishing between years.
Because every year covers only the breeding season, which occurs in the same time period, the years are comparable and can be pooled.

Each tracking device records multiple foraging trips during each breeding season.
We tagged {{n_tagged_individuals}} total individuals across the three colonies (Table \ref{table-deployment}), {{n_analyzed_individuals}} of which were analyzed after filtering for data quality and completeness.
The tracking effort was concentrated at the largest colony, Guadalupe Island (Table \ref{table-guadalupe}).
Less effort was allocated at Clarion (Table \ref{table-clarion}) and San Benedicto (Table \ref{table-san-benedicto}), according to the available resources.

Table: Deployment window, tagged individuals, and trips for Laysan albatross, {{tracking_season_span}}\label{table-deployment}.

| Colony | Start date | End date | Tagged individuals | Trips |
|------------------|--------------|--------------|------------------------|--------|
| Guadalupe | {{ guadalupe_min_date }} | {{ guadalupe_max_date }} | {{ guadalupe_n_tagged }} | {{ guadalupe_n_trips }} |
| Clarion | {{ clarion_min_date }} | {{ clarion_max_date }} | {{ clarion_n_tagged }} | {{ clarion_n_trips }} |
| San Benedicto | {{ san_benedicto_min_date }} | {{ san_benedicto_max_date }} | {{ san_benedicto_n_tagged }} | {{ san_benedicto_n_trips }} |
| TOTAL | | | {{n_tagged_individuals}} | {{n_trips_total}} |

Table: Breeding season, deployment window, tagged individuals, and trips for Laysan albatross at Guadalupe Island.
A season without tracking data shows a dash for the dates and zero for the counts\label{table-guadalupe}.

| Season | Start date | End date | Tagged individuals | Trips |
|------------------|--------------|--------------|------------------------|--------|
{{#guadalupe_seasons}}
| {{season}} | {{start}} | {{end}} | {{n_tagged}} | {{n_trips}} |
{{/guadalupe_seasons}}

Table: Breeding season, deployment window, tagged individuals, and trips for Laysan albatross at Clarion Island\label{table-clarion}.

| Season | Start date | End date | Tagged individuals | Trips |
|------------------|--------------|--------------|------------------------|--------|
{{#clarion_seasons}}
| {{season}} | {{start}} | {{end}} | {{n_tagged}} | {{n_trips}} |
{{/clarion_seasons}}

Table: Breeding season, deployment window, tagged individuals, and trips for Laysan albatross at San Benedicto Island\label{table-san-benedicto}.

| Season | Start date | End date | Tagged individuals | Trips |
|------------------|--------------|--------------|------------------------|--------|
{{#san_benedicto_seasons}}
| {{season}} | {{start}} | {{end}} | {{n_tagged}} | {{n_trips}} |
{{/san_benedicto_seasons}}

## Data Processing

<!-- main idea: M3.5 Overview — the workflow narrated step by step without function names; then the detailed steps and the archived analysis code. -->
We followed the track2KBA methodology [@beal2021track2kba].
We standardized the GPS records and split them into individual foraging trips.
We removed incomplete trips and points within a 60 km radius.
We estimated the area-restricted search scale.
We fitted kernel density estimates for each individual.
We assessed sample representativeness.
We then identified the area used by a threshold percentage of the population.
We then defined the core area.
Below, we describe these steps in more detail.
We shared the full analysis code on Zenodo at https://doi.org/10.5281/zenodo.23485336.

<!-- main idea: M4 Trust — what the representativeness assessment answers: whether the sample's areas are valid for the population; the UD rebuilt from a subset of KDEs and the inclusion of locations outside the subsample; the threshold percentage it sets for the foraging component. -->
The representativeness assessment indicates whether the areas identified as important for the sample are valid for the entire population.
The representativeness assessment reconstructs the utilization distribution (UD) from a subset of kernel density estimates (KDEs) obtained by resampling.
It measures the inclusion of locations from the individuals not in the subsample.
It also sets the threshold percentage of the population that we use to define the foraging component.

<!-- main idea: M5 Define — the colony-radius exclusion completed and justified; the excluded band returns as the area within a 60 km radius that, with the foraging component, forms the core area; no resampling under uniform frequency. -->
We removed points falling within a 60 km radius of the colony because XXX.
[[ how the excluded band returns as the area within a 60 km radius ]]
Our methodological approach called for removing incomplete trips to avoid bias in the computed utilization distribution that represents XXX.

We did not resample because all GPS devices were programmed with the same frequency, so the raw data were already homogeneous.

## Data Analysis

### Core areas used by Laysan albatross

<!-- main idea: M6 Define — the foraging component: kernel density per individual, the 50% utilization distribution, and the overlap of individual UDs that defines it; the union with the area within a 60 km radius defines the core area; why track2KBA. -->
We split each record into discrete round trips and analyze each individual as an independent tracking event using KDE [@beal2021track2kba].
We split all tracks into single tracks representing a departure and return of an individual to the nesting colony.
We chose the [@beal2021track2kba] methodology because it is replicable using a single open-source R package (track2KBA).
It allows us to split tracks, estimate UD, and evaluate representativeness, and is explicitly designed to identify important sites for biodiversity from tracking data.

**Measurements and Variables**

The independent variable is the GPS locations of the Laysan albatross.
The dependent variable is the core areas used by the Laysan albatross.
The unit of analysis is an individual, represented by a set of GPS locations.
The individual locations are the input to KDE, and the output is the area used by at least 10% of the population.

**Analysis**

The 50% utilization distribution of an individual is the area containing half of its estimated density.
Each colony hosts multiple individuals; each individual makes multiple foraging trips per season; the individual is the unit of analysis.
To identify that area, we split the tracks into individual trips and perform kernel density estimations for each individual.
KDEs are calculated for each individual.
The Area-Restricted Search scale uses First Passage Time analysis (adehabitatLT).
From the GPS trajectories, we calculated the KDEs to define the individual UDs.
KDE has been widely used to determine UD.
The foraging component is the cells where the individual 50% UDs overlap enough to reach 10% of the population.
The core area is the union of the foraging component and the disk with a radius of 60 km around each colony.
KDE was selected because a wide range of users are familiar with its use, which facilitates the communication of results among decision makers.

### Overlap of core areas with MPAs

<!-- main idea: M7 Place — the MPA layer inside the EEZ mask; the intersection arithmetic and its units. -->
Once the core areas were identified, we quantified their overlap with the existing protected areas.
[[ the MPA layer clipped to the EEZ, and the intersection units ]]
To determine overlap, we intersect the core areas with the MPA polygons and quantify the level of overlap.

**Measurements and Variables**

The independent variables are the core areas used by the Laysan albatross and the MPA polygons.
The dependent variable is the overlap index.
The overlap index is a ratio between the two areas.

<!-- main idea: M8 Measure — the overlap index on the union basis; why the area within a 60 km radius enters both sides. -->
**Analysis**

We calculated the overlap index to quantify the overlap of the core areas with the MPA polygons.
@fieberg2005quantifying quantified home-range overlap using the utilization distribution.
The overlap index is area-based (proportional) overlap: $HR_{i,j} = \frac{A_{i,j}}{A_i}$.
[[ the union basis: core plus the area within a 60 km radius on both sides, and why ]]
This index is directional: $HR_{i,j} \neq HR_{j,i}$.
This measure of core habitat protection coverage tells us what fraction of the animal's most intensively used space is inside the protected area.

## Ethical Considerations

<!-- main idea: M9 Ethical considerations — permits, minimization, no harm. -->
Our study followed necessary ethical guidelines ensuring the welfare of the seabirds during their handling.
We also had all the permits required by the Mexican government.
Permits came from the Ministry of the Interior, the Ministry of Environment and Natural Resources, and the National Commission for Protected Natural Areas.
A complete list of permits by island and year is available in the Supplementary Information.

---

<!-- UNMAPPED -->
The global population size has been estimated to be around 800,000 breeding pairs [@birdlife2018phoebastria].
The biggest nesting colonies are low-lying sites at risk due to sea-level rise associated with climate change [@birdlife2018phoebastria].
Guadalupe Island has high nesting areas that are less affected by sea-level rise, offering a refuge for the species [@hernandez2019sexual].
After processing the data, we analyzed them to identify the core areas.
