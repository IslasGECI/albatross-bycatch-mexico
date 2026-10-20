
# Methods

## Study Area

<!-- main idea: M1 Study area — scope sentence (marine-coverage question, EEZ); the three colonies ordered by relevance; islands lie in ANPs; those protected areas carry a terrestrial and a marine component; California Current oceanography positioned because it explains where the core areas will sit. Island profiles each gain a connective stating why that island matters to the coverage question. -->
We studied the core areas that Laysan albatrosses use within the Mexican EEZ.
Specifically, we assessed whether Mexican marine protected areas cover the core areas used by the Laysan albatross during its breeding season.
The protected areas relevant for this study have a terrestrial component (the island) and a marine component (the surrounding waters).
There are several islands on which the Laysan albatross breeds: Guadalupe, Clarion, and San Benedicto are the relevant islands for the Mexican Pacific.
The global population size has been estimated to be around 800,000 breeding pairs [@birdlife2018phoebastria].
The biggest nesting colonies are low-lying sites at risk due to sea-level rise associated with climate change [@birdlife2018phoebastria].
Guadalupe Island has high nesting areas that are less affected by sea-level rise, offering a refuge for the species [@hernandez2019sexual].
The location of the islands is relevant to understand the surrounding oceanographic conditions, for instance, the California Current.
These conditions help explain the location of the identified core areas.
Their food availability and distribution (fish, squid, etc.) are determined by oceanographic factors.
The California Current enriches the water with nutrients, which makes food more available.
ENSO variability might increase or reduce food availability in certain areas.
This food availability will affect where the albatrosses feed, which will determine what the core areas are.
We describe each island in order of the relevance of the colonies.

### Guadalupe Island
Guadalupe Island hosts the largest breeding colony of Laysan albatross in the eastern Pacific [@hernandez2019sexual].
Guadalupe Island is an oceanic island of volcanic origin located 300 km west of the coast of Baja California.
It has an area of 244 km$^2$.
It measures 30 km at its longest part from the southern end to the northern end.
On Guadalupe Island, there were 2,195 breeding pairs of Laysan albatross in 2025 (unpublished authors' monitoring data).

### Clarion Island
Clarion Island is part of the Revillagigedo Archipelago.
Clarion is located 700 kilometers from the Mexican mainland.
It has a tropical climate.
It has an area of 19.8 km$^2$.
It measures 8.6 km at its longest part from the eastern end to the western end.
Clarion Island has the second largest Laysan albatross colony in Mexico.
On Clarion Island, crows and snakes prey on Laysan albatross eggs and newly hatched chicks.

### San Benedicto
San Benedicto Island is also part of the Revillagigedo Archipelago and shares the same tropical climate.
San Benedicto is located 600 kilometers from the Mexican mainland.
It has an area of 10 km$^2$.
It measures 4.8 km at its longest part from the northern end to the southern end.
On San Benedicto Island, crabs feed on the chicks, and nests can be buried in ash.
On both Clarion and San Benedicto islands, reproductive success for Laysan albatross is close to 0%.
The number of nests is low (less than 40 for San Benedicto).

## GPS deployment

<!-- main idea: M2 GPS deployment — capture/attachment/Tesa protocol; December–June window enclosing the breeding season; why devices are recovered within the same season. -->
We installed and recovered GPS tracking devices while individuals were breeding on the island.
Devices were deployed from December to June to encompass the breeding season that usually runs from November to July.
This ensured that we were able to retrieve GPS devices before individuals migrated off the islands, since they cannot be recovered the next breeding season.
Seabirds were captured by hand at the nest, and GPS devices were attached to feathers that are molted during the non-breeding season.
We attached the GPS loggers to the albatrosses with Tesa tape (#4651, Tesa AG, Hamburg, Germany).
The GPS was attached to the back feathers following [@hernandez2019sexual].
The capture is brief and harmless, and the individuals were released on site immediately after attaching or removing the GPS device.
No albatross individuals were harmed during the study.

## Tracking data

<!-- main idea: M3 Tracking data — N_TAGGED tagged (Guadalupe N_GUADALUPE, Clarion N_CLARION, San Benedicto N_SAN_BENEDICTO) and N_ANALYZED retained for analysis; 12 breeding seasons, 2014–2026; trips per colony; effort concentrated at the largest colony; the 2014–2018 five-year premise stated here and proven by M4. -->
We split each record into discrete round trips and analyze each trip as an independent tracking event using KDE [@beal2021track2kba].
We focus solely on albatross that nest on the islands Guadalupe, Clarion, and San Benedicto.
To identify the core areas that persist, we use a long time series of tracking data from 2014 to 2026 to capture interannual variability.
Each tracking device records multiple foraging trips during each breeding season.
and the representativeness assessment checks that the sample is sufficient.
We assume that a 12-year tracking dataset would be long enough to capture the patterns that persist despite the interannual variability.
We also confirmed that a 5-year dataset (2014-2018) was not long enough to be representative of the population.
We grouped all 12 years without distinguishing between years.
Because every year covers only the breeding season, which occurs in the same time period, the years are comparable and can be pooled.

The table shows the deployment window for each colony.

| Colony | Start | End |
|--------|----------|----------|
| Guadalupe | {{ guadalupe_min_date }} | {{ guadalupe_max_date }} |
| Clarion | {{ clarion_min_date }} | {{ clarion_max_date }} |
| San Benedicto | {{ san_benedicto_min_date }} | {{ san_benedicto_max_date }} |

We attached GPS units to {{ guadalupe_n_total }} Laysan albatross individuals on Guadalupe Island from {{ guadalupe_min_year }} to {{ guadalupe_max_year }}.
Additionally, we attached GPS units to {{ clarion_n_total }} individuals on Clarion Island from {{ clarion_min_year }} to {{ clarion_max_year }}.
We also attached GPS units to {{ san_benedicto_n_total }} individuals on San Benedicto Island in {{ san_benedicto_min_year }}.
Sampling effort was implemented according to the available resources.

GPS loggers have the appropriate accuracy and precision for the study given that [[ indicate here the basis for this argument, for example, location accuracy is down to XXX m (citation of study or GPS logger technical detail for example) ]].
Other devices, such as GLS loggers, are not accurate enough to determine core areas.
We programmed the GPS to record one position every 10 minutes.
The 10-minute frequency allows recording multiple trips per individual per season.
This frequency is high enough for the data to be representative and identify moments when the individual stops or goes slow.
Also, this frequency is low enough for the battery to last the whole season and track multiple trips.
The GPS needed to be securely attached during the whole breeding season.

There were variations in the GPS device models across years and islands.
On Guadalupe Island we used the following GPS devices: From 2014 to 2016: model GiSPy-4SB by Techno Smart (Italy).
From 2017 to 2018: i-gotU model GT-120 by Mobile Action (Taiwan).
From 2019 to 2023: ATS1 model Nodo-2018 by ACMOS (Mexico).
From 2025 to 2026: GPS datalogger with accelerometer and UHF model Axy-Trek Remote by Techno Smart (Italy).
On Clarion Island, from 2018 to 2022 we used the following GPS devices: i-gotU model GT-120 by Mobile Action (Taiwan).
CatLog-S, Catnip Technologies (China).
CatLog-S2, Perthold Engineering (USA).

We used different GPS models as new and better technology was available during the 12-year period of the study.
Despite model changes, all devices have similar accuracy and were programmed with the same frequency, so the data remain comparable.

The following tables show the number of individuals tracked per season at each colony.

**Guadalupe Island**

| Season | Start date | End date | Number of individuals | Number of trips |
|--------|------------|----------|----------------------|-----------------|
{{#guadalupe_seasons}}
| {{season}} | {{start}} | {{end}} | {{n}} | {{trips}} |
{{/guadalupe_seasons}}

**Clarion Island**

| Season | Start date | End date | Number of individuals | Number of trips |
|--------|------------|----------|----------------------|-----------------|
{{#clarion_seasons}}
| {{season}} | {{start}} | {{end}} | {{n}} | {{trips}} |
{{/clarion_seasons}}

**San Benedicto Island**

| Season | Start date | End date | Number of individuals | Number of trips |
|--------|------------|----------|----------------------|-----------------|
{{#san_benedicto_seasons}}
| {{season}} | {{start}} | {{end}} | {{n}} | {{trips}} |
{{/san_benedicto_seasons}}

The tracking effort was concentrated at the largest colony, Guadalupe Island, and less effort was invested in the smallest colonies, Clarion and San Benedicto islands.

The data from Guadalupe Island include {{ guadalupe_n_trips }} complete trips, Clarion {{ clarion_n_trips }}, and San Benedicto {{ san_benedicto_n_trips }}.

## Data Processing

<!-- main idea: M3.5 Overview — track2KBA workflow narrated in five steps without function names; the detailed steps follow, and the full analysis code is archived at the concept DOI. -->
We used the R package track2KBA [@beal2021track2kba] and followed its methodology.
We standardized the GPS records and split them into individual foraging trips.
We projected the tracks and estimated the area-restricted search scale.
We fitted kernel density estimates for each individual.
We assessed sample representativeness.
We then identified potential core areas.
Below, we describe these steps in more detail; the full analysis code is archived on Zenodo at https://doi.org/10.5281/zenodo.23485336.

<!-- main idea: M4 Trust — representativeness via repAssess: REPRESENTATIVENESS inclusion at n = N_ANALYZED (Rep70 = REP70, Rep95 = REP95); the 5-year subset was not representative, which is why 12 years are pooled; pooling justified because seasons align and years are comparable. -->
We verified this assumption with a representativeness analysis.
We then assessed sample representativeness and determined the core areas (potential key biodiversity areas).
The representativeness assessment tells us whether the core areas calculated from the sample are valid for the whole population.
It would not make sense to calculate core areas if their results could not be inferred to the entire population.
Representativeness refers to how well the sample represents the population.
The representativeness assessment rebuilds the UD from a resampled subset of the KDEs and measures out-of-sample inclusion.
For this purpose, individual trips are subsampled, and KDEs are calculated and combined to obtain the UD.
From the resulting area, we evaluate how many data points not selected in the subsample fall outside.
That indicates whether the sample size is sufficiently representative of the population for the results to be valid for the entire population.

<!-- main idea: M5 Define — 60 km-around-the-colony exclusion completed and justified (the excluded band is re-added as the ring that, with the offshore component, forms the core area); no resampling under uniform frequency. -->
We removed points within 60 km around the colony because XXX.
Our methodological approach called for removing incomplete trips to avoid bias in the computed utilization distribution that represents XXX.

We did not resample because all GPS devices were programmed with the same frequency, so the raw data were already homogeneous.
After processing the data, we analyzed them to identify the core areas.

## Data Analysis

### Core areas used by Laysan albatross

<!-- main idea: M6 Define — offshore component delineation: KDE per trip → pooled density → 50% UD; then the union with the 60 km colony rings defines the core area; why track2KBA (replicable, open-source, built to identify potential KBAs). -->
We split all tracks into single tracks representing a departure and return of an individual to the nesting colony.
We then calculated the Kernel Density Estimation (KDE), and found core areas (50% UD; potential KBA).
We chose the [@beal2021track2kba] methodology because it is replicable using a single open-source R package (track2KBA).
It allows us to split tracks, estimate UD, and evaluate representativeness, and is explicitly designed to identify potential key biodiversity areas from tracking data.

**Measurements and Variables**

The independent variable is the GPS locations of the Laysan albatross.
The dependent variable is the core areas used by the Laysan albatross.
The unit of analysis is an individual trip, which is a set of GPS locations.
The individual trips are the input to KDE, and the core areas are the output of the UD analysis.

**Analysis**

To identify core areas, we split the tracks into individual trips and perform kernel density estimations for each trip.
Each colony hosts multiple individuals; each individual makes multiple foraging trips per season; the foraging trip is the unit of analysis.
Core areas refer to the 50% Utilization Distribution (UD).
From the GPS trajectories, we calculated kernel density estimation (KDE) to define the core areas.
KDE has been widely used to determine UD.
The Area-Restricted Search scale uses First Passage Time analysis (adehabitatLT).
KDEs are calculated for individual trips.
Then the KDEs from individual trips are combined to obtain a pooled density, from which the core area (50% UD) is obtained.
KDE was selected because a wide range of users are familiar with its use, which facilitates the communication of results among decision makers.
Once the core areas were identified, we quantified their overlap with the existing protected areas.

### Overlap of core areas with MPAs

<!-- main idea: M7 Place — the MPA layer (mexico_mpa) inside the EEZ mask; the intersection arithmetic and its units. -->
To determine overlap, we intersect the core areas with the MPA polygons and quantify the level of overlap.

**Measurements and Variables**

The independent variables are the core areas used by the Laysan albatross and the MPA polygons.
The dependent variable is the overlap index.
The overlap index is a ratio between the two areas.

<!-- main idea: M8 Measure — the overlap index on the union basis: (core ∪ 60 km rings of all three colonies) ∩ MPA over (core ∪ 60 km rings); why the ring enters BOTH sides (it was removed for the KDE, so it must return for coverage). -->
**Analysis**

We calculated the overlap index to quantify the overlap of the core areas with the MPA polygons.
@fieberg2005quantifying quantified home-range overlap using the utilization distribution.
The overlap index is area-based (proportional) overlap: $HR_{i,j} = \frac{A_{i,j}}{A_i}$.
This index is directional: $HR_{i,j} \neq HR_{j,i}$.
This measure of core habitat protection coverage tells us what fraction of the animal's most intensively used space is inside the protected area.

## Ethical Considerations

<!-- main idea: M9 Ethical considerations — permits, minimization, no harm (unchanged). -->
Our study followed necessary ethical guidelines ensuring the welfare of the seabirds during their handling.
We also had all the permits required by the Mexican government.
Permits came from the Ministry of the Interior, the Ministry of Environment and Natural Resources, and the National Commission for Protected Natural Areas.
A complete list of permits by island and year is available in the Supplementary Information.
