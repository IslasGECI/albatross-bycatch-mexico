
# Methods

## Study Area

<!-- M_study_area — Point: We tested whether Mexico's MPAs contain the core areas used during breeding. -->
We studied the core areas used by Laysan albatross within Mexico's Exclusive Economic Zone (EEZ).
Specifically, during its breeding season, we assessed whether Mexico's MPAs encompass core areas used by the Laysan albatross.
The MPAs of interest for this study were the marine components of three protected natural areas.
Guadalupe Island Biosphere Reserve and Revillagigedo National Park hosted the three albatross colonies.
The Pacific Islands of the Baja California Peninsula Biosphere Reserve lay along the foraging paths used by the albatross during its breeding season.

<!-- M_study_area — Point: The three colonies are described next. -->
Below we describe the three islands where the colonies breed.

### Guadalupe Island
<!-- M_study_area — Point: Guadalupe hosts the largest colony in the eastern Pacific. -->
Guadalupe Island hosts the largest breeding colony of Laysan albatross in the eastern Pacific [@hernandez2019sexual].
According to unpublished authors' monitoring data, in 2025 the island had 4,390 breeding individuals.
Guadalupe Island is an oceanic island of volcanic origin located 300 km west of the coast of Baja California.
It measures 30 km from the southern end to the northern end and has an area of 244 km$^2$.
[[ R48 — "Guadalupe Island" — Mencionar brevemente especies invasoras que le afectan, gatos? O si ya se controlaron también mencionarlo brevemente. ]]

### Clarion Island
<!-- M_study_area — Point: Clarion holds the second largest colony in Mexico. -->
Clarion Island is part of the Revillagigedo Archipelago, located XXX km south of Guadalupe Island, already having a tropical climate.
Clarion is located 700 km from the Mexican mainland.
It has an area of 19.8 km$^2$, measuring 8.6 km from the eastern to the western end.
While considerably smaller, it has the second largest Laysan albatross colony in Mexico.
On Clarion Island, crows and snakes prey on Laysan albatross eggs and newly hatched chicks.
The colony failed to produce any chicks between 2016 and 2023 [@castillo2026breeding].
The colony held about 100 breeding individuals in 2021/22 [@castillo2026breeding].
[[ R49 — "located XXX km south of Guadalupe Island" — el dato quedó como xx km; falta la distancia ]]

### San Benedicto
<!-- M_study_area — Point: Reproductive success on San Benedicto is close to zero. -->
San Benedicto Island is also part of the Revillagigedo Archipelago and shares the same tropical climate.
San Benedicto is located 600 km from the Mexican mainland.
It measures 4.8 km from the northern end to the southern end, being the smallest of the three, with a total area of 10 km$^2$.
On San Benedicto Island, crabs feed on the chicks, and nests can be buried in ash.
The colony holds fewer than 80 breeding individuals.
Reproductive success for Laysan albatross is close to 0%.

## GPS deployment

<!-- M_deployment — Point: Deploying during breeding let us recover every device before migration. -->

We deployed and recovered GPS tracking devices while the individuals were breeding on the island.
The devices were deployed from December to June, covering the breeding season, which generally spans from November to August.
This ensured that we could recover the GPS devices before the individuals migrated, as recovery would not have been possible the next breeding season.

<!-- M_deployment — Point: No albatross was harmed. -->
The seabirds were captured by hand at their nests, and the GPS devices were attached to back feathers shed during the non-breeding season.
We attached the GPS loggers using Tesa tape (#4651, Tesa AG, Hamburg, Germany), following @hernandez2019sexual.
The individuals were released at the same location immediately after the GPS device was attached or removed.
No albatross were harmed during the study.

<!-- M_deployment — Point: The recording interval balances detailed data against battery life across the season. -->
The GPS loggers offer the accuracy and precision required [@soanes2013many; @clay2023adjustment; @hernandez2019sexual].
We programmed the GPS units to record a position every 10 minutes.
This frequency is high enough to obtain representative data and to identify when an individual stops or reduces its speed.
At the same time, this frequency is low enough for the GPS units to record several trips per season.
[[ R17 — "The GPS loggers offer the accuracy and precision required" — more details please ]]

<!-- M_deployment — Point: Guadalupe used a different device model in each period. -->
On Guadalupe Island we used the following GPS devices.
From 2014 to 2016: model GiSPy-4SB by Techno Smart (Italy).
From 2017 to 2018: i-gotU model GT-120 by Mobile Action (Taiwan).
From 2019 to 2023: ATS1 model Nodo-2018 by ACMOS (Mexico).
From 2025 to 2026: GPS datalogger with accelerometer and UHF model Axy-Trek Remote by Techno Smart (Italy).

<!-- M_deployment — Point: Clarion used three device models across its tracking seasons. -->
On Clarion Island we used the following GPS devices.
From 2018 to 2022: i-gotU model GT-120 by Mobile Action (Taiwan).
CatLog-S by Catnip Technologies (China).
CatLog-S2 by Perthold Engineering (USA).

<!-- M_deployment — Point: San Benedicto used a single device model. -->
On San Benedicto Island we used the following GPS devices.
In 2020: ATS1 model Nodo-2018 by ACMOS (Mexico).

<!-- M_deployment — Point: Model changes do not compromise comparability across the series. -->
We used different GPS models as new technology was available during the {{n_tracking_span_years}} years this research took place.
Despite model changes, all devices have similar accuracy and were programmed with the same frequency, so the data remain comparable.

## Tracking data

<!-- M_tracking — Point: Breeding-season records are comparable across years and can be pooled. -->
We focused solely on albatross that nest on the Guadalupe, Clarion, and San Benedicto islands.
We used a long time series spanning {{n_tracking_span_years}} years to identify the core areas that persist across interannual variability.
We have tracking data for {{n_tracking_seasons}} of the {{tracking_season_span}} seasons.
While some inherent interannual variability could exist, we assumed that this dataset would be long enough to capture persistent movement patterns representative of the whole Laysan albatross population that nests in Mexico.
We grouped all {{n_tracking_seasons}} seasons without distinguishing between years.
Because we tracked albatross only during the breeding season, which occurs in the same months each year, the years are comparable and can be pooled.

<!-- M_tracking — Point: We tagged more individuals at the largest colony than at the others. -->
Each tracking device records multiple foraging trips during each breeding season.
We tagged {{n_tagged_individuals}} total individuals across the three colonies (Table \ref{table-deployment}), {{n_analyzed_individuals}} of which were analyzed after filtering for data quality and completeness.
We tagged more individuals at the largest colony, Guadalupe Island (Table \ref{table-guadalupe}).
We tagged fewer individuals at Clarion (Table \ref{table-clarion}) and San Benedicto (Table \ref{table-san-benedicto}), according to the available resources.

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

## Data Analysis

### Core areas used by Laysan albatross

<!-- M_overview — Point: We followed track2KBA because one open package makes the analysis replicable. -->
We followed the track2KBA methodology because it is replicable using a single open-source R package [@beal2021track2kba].
It is also explicitly designed to identify important sites for biodiversity from tracking data [@beal2021track2kba].
The full analysis code on Zenodo is available at https://doi.org/10.5281/zenodo.23485336.

<!-- M_overview — Point: The workflow turns records into a core area, step by step. -->
We combined the GPS records and split them into individual trips.
We removed incomplete trips and trips that never reached beyond 60 km of the colony.
We calculated the kernel density estimates for each individual.
We assessed the sample representativeness.
We identified the foraging component used by a threshold percentage of the population.
We defined the core area.
Below, we describe these steps in more detail.
[[ R18 — "We removed incomplete trips and trips that never reached beyond 60 km of the colony" — Rationale and citation backing up this action ]]
[[ R19 — "We calculated the kernel density estimates for each individual..." — Esto es redundante con lo que se explica a mayor detalle en los párrafos siguientes, solo se menciona cada paso una vez, sino es confuso seguir el orden de acciones que se siguieron. ]]

<!-- M_preparation — Point: Trips that return to the colony and leave the 60 km zone count as foraging. -->
We transformed the GPS records to bring them into a single database.
We split all tracks into single trips.
We removed incomplete trips, which are those without a recorded return to the colony.
Following @hernandez2019sexual, we removed trips that never reached beyond 60 km of the colony.
We refer to this as the breeding area, thereafter, representing a disk with a 60-km radius around each colony.
We considered the remaining trips to be foraging trips.
[[ R20 — "We transformed the GPS records..." — Creo que hay información de este párrafo que está repetida con el anterior, integrar en uno solo por favor ]]

<!-- M_kde — Point: Each individual gets one 50% UD, and each grid cell counts the UDs that cover it. -->
We pooled the foraging trips per individual to calculate the kernel density estimates (KDEs).
The area-restricted search (ARS) scale is estimated using first-passage time analysis [@calenge2025adehabitatlt].
We used the ARS scale of {{ars_scale_km}} km as the smoothing parameter of the KDEs.
We assumed that our ARS/First-passage time identifies area-restricted search behavior, which is consistent with foraging but is not a direct observation of feeding.
The 50% utilization distribution (UD) is the region that contains half of the probability mass of the KDE.
We calculated one 50% UD for each individual albatross, thus representing the area within which each individual concentrated 50% of its estimated space use [@beal2021track2kba].
We created a grid of {{n_grid_columns}} × {{n_grid_rows}} cells, each {{cell_side_km}} km per side with an area of {{cell_area_km2}} km$^2$.
For each cell of the grid, we counted the number of individuals whose 50% UD overlapped, yielding an index of individual-level overlap in use areas.
[[ R21 — "We pooled the foraging trips per individual..." — Esto también está repetido de arriba... ]]

<!-- M_representativeness — Point: The representativeness assessment tests whether the sample stands for the population. -->
The representativeness assessment averages the KDEs of a resampled subset of individuals to obtain a UD.
It indicates whether the areas identified as important for the sample are valid for the entire population.
It measures the inclusion of locations from the individuals not in the subsample.
It also sets the threshold percentage of the population that we use to define the foraging component.

<!-- M_core_area — Point: The foraging component and the 60 km disk together form the core area. -->
The foraging component is the cells where the individual 50% UDs overlap enough to reach the threshold set by the representativeness assessment.
We define the core area as the union of the foraging component and the breeding area, as the combination of these two areas would represent core components in the lifecycle of Laysan albatross.
[[ R22 — "breeding area" — Creo que en lugar de referirnos a esto como un "disco con un radio de 60 km" hay que ponerle un nombre más atractivo, sugiero "breeding area" para que sea alusivo a lo que ahí ocurre para la especie, así al unirlos entonces tiene sentido que sea una "core area" ]]
[[ R23 — "the core area as the union of the foraging component and the breeding area" — No entiendo por qué ésta sería la “core area", pensé que la "core area" es la que corresponde al 10% de la UD y que sería solo con base en los viajes, y no necesariamente con el traslape con este disco alrededor de la colonia? Incluso según lo que recuerdo y entiendo del tratamiento de los datos esos 60 km, que corresponden a ese disco de 60 km se eliminaron y no se consideran para el análisis, qué no? ]]
[[ R24 — "the core area" — Creo que ya entendí, pero entonces falta una definición conceptual de la "core area", no una definición técnica, pues a lo que te refieres es que esta core area incorpora el área de relevancia para la anidación, es decir la colina y su zona inmediata (el disco de 60 km) y la zona de alimentación, lo cual tiene sentido, pero eso no está expresado aquí de manera clara, hay que integrarlo. ]]
[[ R41 — "We define the core area as the union of the foraging component and the disk with a 60-km radius around each colony" — En los métodos dices: We define the core area as the union of the foraging component and the disk with a 60-km radius around each colony. Pero no entiendo porqué esta sería la “core area", no esta que corresponde al 10% de la UD sería solo con base en los viajes, y no necesariamente con el traslape con este disco alrededor de la colonia? ]]
[[ R44 — "the core area definition" — Creo que ya al fin me cayó el 20, y creo que en general estoy de acuerdo con la idea, la vdd no recuerdo si lo platicamos antes,…pero entonces en los métodos hace falta una definición conceptual de lo que es una "core area”, ahorita slo está una definición técnica. Y bueno, el otro punto es que el enfoque inicial es identificar las zonas de alimentación, y esas en definitiva no caen dentro de las MPAs, entonces estas core areas siento que pueden dar un mensaje errónea, porque están “cargadas” dentro de las MPAs, pues son las zonas de crianza, no sé, me gustaría que lo platicáramos para estar en el mismo canal. Dejo mi comentario en el documento. ]]

### Overlap of core areas with MPAs

<!-- M_overlap_index — Point: The overlap index gives the fraction of each core area inside MPAs. -->

Once the core areas were identified, we quantified their overlap with the existing MPAs using the overlap index [@fieberg2005quantifying].
The overlap index is defined as $HR_{i,j} = \frac{A_{i,j}}{A_i}$ and is directional ($HR_{i,j} \neq HR_{j,i}$).
In our case, $A_i$ is the core-area size, and $A_{i,j}$ is the size of the core area that lies inside MPAs.
A value of 1 indicates that the core area is entirely inside MPAs, while a value of 0 indicates that it is outside.
This index tells us what fraction of Laysan albatross core areas is inside MPAs.

## Ethical considerations

<!-- M_ethics — Point: The study followed ethical guidelines and held the required permits. -->
We followed all necessary ethical guidelines ensuring the welfare of the seabirds during their handling.
We also had all the permits required by the Mexican government.
Permits came from the Ministry of the Interior, the Ministry of Environment and Natural Resources, and the National Commission for Protected Natural Areas.
A complete list of permits by island and year is available in the Supplementary Information.

