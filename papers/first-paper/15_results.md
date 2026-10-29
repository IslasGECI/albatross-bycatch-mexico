
# Results

\FloatBarrier

<!-- R_tracks — Point: Tagged individuals loop counterclockwise from each colony, and only San Benedicto stays inside the EEZ. -->
Fig \ref{fig-tracks} shows the GPS tracks of tagged Laysan albatross from Guadalupe, Clarion, and San Benedicto Islands.
The trajectories follow a counterclockwise pattern, beginning and ending at the corresponding colony.
For Guadalupe and Clarion Islands, the initial heading of the trajectories is toward the northeast, passing along the coast of Baja California.
On their return journey, the trajectories move away from the coast toward international waters.
Before returning to the island, some trajectories reach 165° W.
The trajectories of individuals from San Benedicto Island approach the coast of Baja California Sur and return to the island without leaving the EEZ.
Since the breeding colonies use different areas of the Mexican Pacific, we determined whether the analyzed sample adequately represents the population.

![
GPS tracks of Laysan Albatross (_Phoebastria immutabilis_) from the Guadalupe (green; 2014–2026), Clarion (purple; 2018–2022) and San Benedicto (coral; 2020) colonies.
The blue line delimits Mexico's Exclusive Economic Zone, and green lines outline its protected areas\label{fig-tracks}.
](reports/figures/mexico_eez_bounding_box_zoom_out.png)

<!-- R_representativeness — Point: The analyzed sample adequately represents the population, and the threshold defines the component. -->
The sample of {{n_analyzed_individuals}} individuals has a representativeness of {{representativeness_percent}}%, and the threshold used to define the foraging component is {{foraging_component_threshold_percent}}% of the population.
[[ Schimel §14.1 — "the threshold used to define the foraging component" — the passive hides who defines it; name the actor or let the threshold do the defining ]]
The curve in Fig \ref{fig-representativeness} is flattening at the right, reaching a saturation point.
The representativeness indicates that the sample adequately represents the Laysan albatross population at the three colonies during the breeding season.
[[ Schimel §14.2 — "The representativeness indicates" — indicates masks what the value shows; name the action in a concrete verb ]]

![
Representativeness of the analyzed sample of Laysan Albatross (_Phoebastria immutabilis_) GPS tracks from the Guadalupe, Clarion and San Benedicto colonies (2014–2026).
Gray points show bootstrap estimates of the inclusion rate for each sample size, and the black line shows the fitted saturating curve.
The gray ribbon represents the spread of the bootstrap inclusion rates.
The {{representativeness_percent}}% value is the representativeness achieved with the analyzed sample (n = {{n_analyzed_individuals}} individuals).
The inclusion rate measures how much of the population's distribution the analyzed sample covers\label{fig-representativeness}.
](reports/figures/gps_albatross_50_percent_representative_assessment_ars_all.png)

<!-- R_heavy_use — Point: Heavy use concentrates between Guadalupe and the Baja California coast. -->
Fig \ref{fig-heavy-use} shows that the area between Guadalupe Island and the coast of Baja California is the most used by the Laysan albatross.
A second area of high use is located northwest of Guadalupe Island.

![
Number of tracked Laysan Albatross (_Phoebastria immutabilis_) individuals (n = {{n_analyzed_individuals}}) whose 50% utilization distribution covers each grid cell (range {{n_individuals_per_cell_min}}–{{n_individuals_per_cell_max}})\label{fig-heavy-use}.
](reports/figures/ud_in_grid_map.png)

<!-- R_foraging_component — Point: The most overlapped cells become the delineated foraging component. -->
Fig \ref{fig-foraging-component} shows the area used by at least {{foraging_component_threshold_percent}}% of the population as purple polygons.
This is the area where the greatest number of individual 50% UDs overlap.

![
The foraging component (purple) for Laysan Albatross (_Phoebastria immutabilis_) delineated from pooled tracking data of {{n_analyzed_individuals}} individuals breeding at Guadalupe, Clarion and San Benedicto (2014–2026).
Green surfaces show Mexican marine protected areas, and the blue line delimits Mexico's Exclusive Economic Zone\label{fig-foraging-component}.
](reports/figures/gps_albatross_50_percent_potential_kba_ars_all_with_mpa.png)

<!-- R_measure — Point: The table reports one area per layer, including the part inside MPAs. -->

Table: Areas of the foraging component, the 60-km-radius disks, the core area, and the core area inside MPAs\label{table-core-area}.

| Layer | Area (km$^2$) |
|:--|--:|
| Foraging component | {{foraging_component_km2}} |
| 60-km-radius disks | {{colony_radius_km2}} |
| Core area | {{core_area_km2}} |
| Core area inside MPAs | {{core_area_inside_mpa_km2}} |

<!-- R_measure — Point: A minority of the core area falls inside Mexican MPAs. -->
The foraging component measures {{foraging_component_km2}} km$^2$, and the area within a 60 km radius of the colonies measures {{colony_radius_km2}} km$^2$.
In total, the core area spans {{core_area_km2}} km$^2$, of which {{core_area_inside_mpa_km2}} km$^2$ is inside MPAs.
The overlap index is $\frac{A_{i,j}}{A_i}$ = {{overlap_index_proportion}}; that is, {{overlap_index_percentage}}% of the core area is protected.

\FloatBarrier
