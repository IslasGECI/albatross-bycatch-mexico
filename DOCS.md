# Technical Reference (DOCS.md)

## Makefile Targets

### reports/figures/combined_fishing_distribution_map.png

UDOI-weighted combined fishing distribution for VMS longline and trawler.

- Notes: Produced by `src/plot_combined_fishing_distribution.R`.

### reports/figures/eez_mask_in_grid.png

Binary mask of KDE grid cells inside the Pacific Mexico EEZ and outside the Gulf of California.

- Notes: Produced by `src/plot_eez_mask_in_grid.R`.

### reports/figures/gfw_fishing_effort_pacific_map.png

GFW apparent fishing effort in the Pacific Mexico EEZ after spatial filtering.

- Notes: Produced by `src/plot_gfw_fishing_effort_pacific.R`.

### reports/figures/gfw_longline_hotspot_binary_map_all.png

Binary hot-spot classification (z ≥ 1.96) of GFW longline events.

- Notes: Produced by `src/plot_gfw_longline_hotspot_binary.R`.

### reports/figures/gfw_longline_hotspot_map_all.png

Continuous hot-spot map of GFW longline events.

- Notes: Produced by `src/plot_gfw_longline_hotspot.R`.

### reports/figures/gps_albatross_50_percent_individual_kde_ars_all.png

Individual 50% utilization distributions of the tracked albatrosses.

- Notes: Produced by `bycatch::render_individual_kde`.

### reports/figures/gps_albatross_50_percent_potential_kba_ars_all_with_mpa.png

KBA contour with the MPA intersection overlay.

- Notes: Produced by `src/plot_kba_mpa_intersection.R`.

### reports/figures/gps_albatross_50_percent_potential_kba_ars_all_without_mpa.png

KBA contour on coastline and EEZ context, without the MPA overlay.

- Notes: Produced by `src/plot_potential_kba_all.R`.

### reports/figures/gps_albatross_50_percent_potential_kba_ars_guadalupe_with_mpa.png

Guadalupe KBA contour with the MPA intersection overlay.

- Notes: Produced by `src/plot_kba_guadalupe_mpa_intersection.R`.

### reports/figures/gps_albatross_50_percent_representative_assessment_ars_all.png

Bootstrap representativeness assessment of the tracked sample.

- Notes: Produced by `bycatch::render_representative_assessment`.

### reports/figures/gps_albatross_geographic_points_by_trip_all.png

Foraging trips coloured by trip.

- Notes: Produced by `geci-plot-cli plot-geographic-points-by-trip`.

### reports/figures/gps_albatross_geographic_points_raw_all.png

Raw GPS points for all colonies.

- Notes: Produced by `geci-plot-cli plot-geographic-points`.

### reports/figures/gps_albatross_geographic_points_raw_clarion.png

Raw GPS points for Clarion Island.

- Notes: Produced by `geci-plot-cli plot-geographic-points`.

### reports/figures/gps_albatross_geographic_points_raw_guadalupe.png

Raw GPS points for Guadalupe Island.

- Notes: Produced by `geci-plot-cli plot-geographic-points`.

### reports/figures/gps_albatross_geographic_points_raw_san_benedicto.png

Raw GPS points for San Benedicto Island.

- Notes: Produced by `geci-plot-cli plot-geographic-points`.

### reports/figures/kba_and_gfw_longline_hotspot_map.png

KBA with the GFW longline hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_gfw_longline_hotspot.R`.

### reports/figures/kba_and_radar_signal_hotspot_map.png

KBA with the radar-signal hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_radar_signal_hotspot.R`.

### reports/figures/kba_and_vms_hotspot_map.png

KBA with the VMS traffic hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_vms_hotspot.R`.

### reports/figures/kba_and_vms_longline_hotspot_map.png

KBA with the VMS longline hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_vms_by_gear_hotspot.R longline`.

### reports/figures/kba_and_vms_other_hotspot_map.png

KBA with the VMS other-gear hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_vms_by_gear_hotspot.R other`.

### reports/figures/kba_and_vms_purse_seine_hotspot_map.png

KBA with the VMS purse-seine hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_vms_by_gear_hotspot.R purse_seine`.

### reports/figures/kba_and_vms_trawler_hotspot_map.png

KBA with the VMS trawler hot-spot overlay.

- Notes: Produced by `src/plot_kba_and_vms_by_gear_hotspot.R trawler`.

### reports/figures/longline_events_map.png

GFW longline fishing events.

- Notes: Produced by `src/plot_longline_events.R`.

### reports/figures/mexico_eez_bounding_box_zoom_in.png

Zoom-in map of the EEZ bounding box.

- Notes: Produced by `src/plot_mexico_eez_bounding_box_intersection.R`.

### reports/figures/mexico_eez_bounding_box_zoom_out.png

Zoom-out map of the EEZ bounding box with GPS tracks and MPAs.

- Notes: Produced by `src/plot_mexico_eez_bounding_box_union.R`.

### reports/figures/mexico_eez.png

Mexico Exclusive Economic Zone.

- Notes: Produced by `src/plot_mexico_eez.R`.

### reports/figures/mexico_map.png

Mexico base map.

- Notes: Produced by `src/plot_mexico_map.R`.

### reports/figures/mexico_mpa.png

Mexican marine protected areas.

- Notes: Produced by `src/plot_mexico_mpa.R`.

### reports/figures/mexico_naturalearth.png

Mexico from Natural Earth.

- Notes: Produced by `src/plot_mexico_naturalearth.R`.

### reports/figures/mexico_naturalearth_pro.png

Projected Mexico from Natural Earth.

- Notes: Produced by `src/plot_mexico_naturalearth_pro.R`.

### reports/figures/mexico_pna.png

Federal Protected Natural Areas.

- Notes: Produced by `src/plot_mexico_pna.R`.

### reports/figures/radar_signal_geographic_points_albatross_guadalupe.png

Radar-signal points of Guadalupe albatrosses.

- Notes: Produced by `geci-plot-cli render-radar-signal-geographic-points`.

### reports/figures/radar_signal_geographic_points_in_eez.png

Radar-signal points within the EEZ.

- Notes: Produced by `geci-plot-cli render-radar-signal-geographic-points`.

### reports/figures/ud_in_grid_map.png

Continuous N_IND count per KDE grid cell.

- Notes: Produced by `src/plot_ud_in_grid.R`.

### reports/figures/ud_vms_all_gear_classification_map.png

UDOI classification by percentile for all gears.

- Notes: Produced by `src/plot_ud_vms_all_gear_classification.R`.

### reports/figures/ud_vms_all_gear_udoi_map.png

Joint albatross–all-gear UDOI per KDE grid cell.

- Notes: Produced by `src/plot_ud_vms_all_gear_udoi.R`.

### reports/figures/ud_vms_longline_udoi_map.png

Joint albatross–longline UDOI per KDE grid cell.

- Notes: Produced by `src/plot_ud_vms_longline_udoi.R`.

### reports/figures/ud_vms_trawler_udoi_map.png

Joint albatross–trawler UDOI per KDE grid cell.

- Notes: Produced by `src/plot_ud_vms_trawler_udoi.R`.

### reports/figures/vms_hotspot_binary_map.png

Binary VMS hot-spot classification.

- Notes: Produced by `src/plot_vms_hotspot_binary.R`.

### reports/figures/vms_hotspot_map.png

Getis-Ord Gi* hot-spot map of VMS vessel traffic.

- Notes: Produced by `src/plot_vms_hotspot.R`.

### reports/figures/vms_longline_n_points_map.png

VMS longline point count per KDE grid cell.

- Notes: Produced by `src/plot_vms_longline_n_points.R`.

### reports/figures/vms_trawler_n_points_map.png

VMS trawler point count per KDE grid cell.

- Notes: Produced by `src/plot_vms_trawler_n_points.R`.
