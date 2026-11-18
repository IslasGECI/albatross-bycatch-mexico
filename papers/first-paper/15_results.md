
# Results

\FloatBarrier

<!-- R_tracks — Point: Tagged individuals loop counterclockwise from each colony, and only San Benedicto stays inside the EEZ. -->
The trajectories of Laysan albatross tagged at Guadalupe, Clarion, and San Benedicto islands follow a counterclockwise pattern, beginning and ending at the corresponding colony (Fig. \ref{fig-tracks}).
For Guadalupe and Clarion Islands, the initial heading is toward the northeast, passing along the coast of Baja California.
On their return journey, the trajectories move away from the coast toward international waters.
Before returning to the island, some trajectories reach 165° W.
[[ R25 — "Before returning to the island, some trajectories reach 165° W" — grupo de islas o lugar de USA o de Canadá frente al cual "pasen" solo para dar idea de lo norteño del desplazamiento ]]
[[ R26 — "some trajectories reach 165° W" — puede ser interesante mencionar esto también ]]

The trajectories of individuals from San Benedicto Island approach the coast of Baja California Sur and return to the island without leaving Mexico's EEZ (Fig. \ref{fig-tracks}).
Since the breeding colonies use different areas of the Mexican Pacific, we determined whether the analyzed sample adequately represents the population.

![
GPS tracks of Laysan albatross (_Phoebastria immutabilis_) from the Guadalupe (green; 2014–2026), Clarion (purple; 2018–2022), and San Benedicto (coral; 2020) colonies.
The blue line delimits Mexico's Exclusive Economic Zone, and green lines outline its protected areas\label{fig-tracks}.
](reports/figures/mexico_eez_bounding_box_zoom_out.png)

<!-- R_representativeness — Point: The analyzed sample adequately represents the population, and the threshold defines the component. -->
The sample of {{n_analyzed_individuals}} individuals from the three colonies that likely use different areas of the Mexican Pacific has a representativeness of {{representativeness_percent}}%, and the threshold that defines the foraging component is {{foraging_component_threshold_percent}}% of the population (Fig. \ref{fig-representativeness}).
After this sample size, the inclusion rate curve flattens at the right, reaching a saturation point.
This analysis suggests that our tracking sample adequately represents the foraging trip distribution of the Laysan albatross population from the three colonies during their breeding season.
[[ R27 — "the inclusion rate curve" — Tiene sentido esto que agregué? En específico creo que sería bueno decir qué es la "inclusion rate" el número de viajes, de individuos de viajes por individuos? ]]

![
Representativeness of the analyzed sample of Laysan albatross (_Phoebastria immutabilis_) GPS tracks from the Guadalupe, Clarion, and San Benedicto colonies (2014–2026).
Gray points show bootstrap estimates of the inclusion rate for each sample size, and the black line shows the fitted saturating curve.
The gray ribbon represents the spread of the bootstrap inclusion rates.
The {{representativeness_percent}}% value is the representativeness achieved with the analyzed sample (n = {{n_analyzed_individuals}} individuals).
The inclusion rate measures how much of the population's distribution the analyzed sample covers\label{fig-representativeness}.
](reports/figures/gps_albatross_50_percent_representative_assessment_ars_all.png)

<!-- R_heavy_use — Point: Heavy use concentrates between Guadalupe and the Baja California coast. -->
Our results show that, based on the 50% of utilization distribution of individuals tracked, Laysan albatross have a spread foraging area along Mexico's Exclusive Economic Zone, as well as into USA's EEZ.
However, the area between Guadalupe Island and the coast of Baja California is the most used by the Laysan albatross.
A second area of high use is northwest of Guadalupe Island, well within Mexico's EEZ (Fig. \ref{fig-heavy-use}).
In addition, most of the area used by at least 10% of the population (i.e. the core area), falls within Mexico's EEZ (Fig. \ref{fig-foraging-component}).

![
Number of tracked Laysan albatross (_Phoebastria immutabilis_) individuals (n = {{n_analyzed_individuals}}) whose 50% utilization distribution covers each grid cell (range {{n_individuals_per_cell_min}}–{{n_individuals_per_cell_max}})\label{fig-heavy-use}.
](reports/figures/ud_in_grid_map.png)

<!-- R_foraging_component — Point: The most overlapped cells become the delineated foraging component. -->

![
The core area (purple) for Laysan albatross (_Phoebastria immutabilis_) delineated from pooled tracking data of {{n_analyzed_individuals}} individuals breeding at Guadalupe, Clarion, and San Benedicto (2014–2026).
The purple circumferences mark the breeding areas around the three colonies, and the filled patches mark the foraging component.
Green surfaces show Mexican marine protected areas, and the blue line delimits Mexico's Exclusive Economic Zone\label{fig-foraging-component}.
](reports/figures/gps_albatross_50_percent_potential_kba_ars_all_with_mpa.png)
[[ R28 — "The core area (purple)" — Pero no esta sería solo el área del "foraging component"? ]]
[[ R42 — "The core area (purple)" — y es que en la Figura 4, dices que la “core area" son los polígonos púrpura, lo cual me hace sentido, pero eso precisamente no corresponde al traslape entre el disco de 60 km y el 10% del UD ]]

<!-- R_measure — Point: The table reports one area per layer, including the part inside MPAs. -->

Table: Areas of the foraging component, the breeding area, the core area, and the core area inside MPAs\label{table-core-area}.

| Layer | Area (km$^2$) |
|:--|--:|
| Foraging component | {{foraging_component_km2}} |
| Breeding area | {{colony_radius_km2}} |
| Core area | {{core_area_km2}} |
| Core area inside MPAs | {{core_area_inside_mpa_km2}} |
| Foraging component inside MPAs | XXX |

[[ R29 — "Foraging component" — Duda, por qué "foraging component", por qué no "foraging area"? Así le llaman en otros estudios usando este tipo de análisis? ]]
[[ R30 — "Foraging component inside MPAs" — Calcular este valor para el argumento que estoy sugiriendo incluyamos. ]]

<!-- R_measure — Point: A minority of the core area falls inside Mexican MPAs. -->
The area of the foraging component is {{foraging_component_km2}} km$^2$, and the area of the breeding area is {{colony_radius_km2}} km$^2$.
In total, the core area spans {{core_area_km2}} km$^2$, of which {{core_area_inside_mpa_km2}} km$^2$ is inside MPAs.
The overlap index is $\frac{A_{i,j}}{A_i}$ = {{overlap_index_proportion}}; that is, {{overlap_index_percentage}}% of the core area is inside MPAs.

\FloatBarrier
