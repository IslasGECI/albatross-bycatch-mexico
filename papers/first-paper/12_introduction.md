
# Introduction

<!-- I_hook — Point: Seabirds are among the most threatened birds, and several human pressures drive their decline. -->
Seabirds are one of the most threatened groups of birds globally.
Bycatch from fishing activities [@birdlife2018phoebastria; @naughton2007conservation; @safina1995world; @mendez2022population], introduced predators [@birdlife2018phoebastria; @naughton2007conservation; @mendez2022population], as well as direct feather and egg harvesting [@birdlife2018phoebastria; @naughton2007conservation] have reduced seabird numbers.
Industrial fishing has depleted fish stocks worldwide [@safina1995world].
Forage-fish depletion below about one-third of maximum prey biomass reduces seabird breeding success [@cury2011global; @votier2023overview].
Globally, an estimated 31% of seabird species are threatened and 47% are in decline [@dias2019threats].

<!-- I_pelagic_gap — Point: MPAs protect coastal species better than pelagic ones, which the reserves seldom reach. -->
To address these impacts, bycatch mitigation, invasive species control or eradication, legal and area protection, monitoring, biosecurity, and education are among the strategies implemented [@naughton2007conservation; @mendez2022population; @dias2019threats; @phillips2024incidental].
In particular, marine protected areas (MPAs) are considered an important tool for seabird conservation [@critchley2018marine].
However, protected areas for seabirds usually only include nesting colonies on land and extend from the coast towards a relatively small marine area around a colony [@critchley2018marine].
This is even more critical for pelagic species, such as albatrosses, which given their wide-ranging movements and migratory habits receive even less protection through MPAs than coastal species do [@critchley2018marine; @lascelles2012hotspots].
Protecting habitats near colonies may not safeguard the seabirds most at risk, especially pelagic species whose offshore feeding grounds shift with ocean conditions [@critchley2018marine; @lascelles2012hotspots].

<!-- I_mexican_case — Point: The three Mexican colonies sit in protected areas, and their adjacent waters are fished. -->
In Mexico, the Laysan albatross nests on the islands of Guadalupe, Clarion, and San Benedicto [@pitman2004population].
All three islands are within protected areas, and their surrounding waters are MPAs [@castillo2026breeding; @mendez2022population].
Guadalupe Island is part of the Guadalupe Island Biosphere Reserve, while Clarion and San Benedicto are part of the Revillagigedo National Park [@mendez2022population; @castillo2026breeding].
While no fisheries are allowed within the latter, the waters within the former MPA are subject to commercial fishing.
The fishing on Guadalupe Island is restricted to artisanal low impact fishing for abalone (_Haliotis_ spp.) using hookah diving and lobster (_Panulirus interruptus_) trapping.
To our knowledge, no negative interaction has been reported between Guadalupe Island artisanal fishing and seabirds, although such bycatch is often unreported [@pott2017information; @pereira2025seasonal].

The Laysan albatross is a large seabird, with a widespread oceanic distribution, and remains on the open ocean most of its life, only returning to land to breed [@pitman2004population].
Albatrosses are renowned for long-distance trips that can span thousands of kilometers [@jouventin1990satellite].
During the breeding season, Laysan albatross nest on islands where males and females take turns taking care of their nests.
While some of their colonies are within protected areas where strict conservation measures are implemented (e.g. low ecotourism is allowed, invasive species removal, etc.), once they venture into the open ocean it is likely that a large portion of their travels falls outside protected areas [@croxall2005global].
Given that Laysan albatross depends on the success of these trips to ensure the survival of the next generation, understanding where they are traveling to, and identifying critical grounds (e.g. feeding, resting areas, etc.) during these trips is warranted.
Moreover, exploring the overlap of seabirds and marine protected areas would provide information to better design targeted conservation and management strategies for this species as well as for seabirds with similar life cycles.

<!-- I_why_tracking — Point: Telemetry identifies the areas seabirds use, making protected-area coverage testable. -->
Identification of those critical grounds for seabirds is done by tracking them using satellite telemetry [@lascelles2016applying].
This analysis helps to understand ecological processes like competition and partitioning of foraging space.
For instance, telemetry has revealed how gannets use and divide the sea for foraging [@gremillet2004offshore; @wakefield2013space].
With the important areas identified, it is possible to compare them against the MPAs, providing a testable evaluation based on tracking data.

While these protected areas in the Mexican Pacific offer relevant protection to breeding Laysan albatross, they were not delineated based on seabird tracking data [@mendez2022population].
Ideally, marine protected areas should incorporate information on the level of protection they offer to the overall cycle of species of interest, such as Laysan albatross [@critchley2018marine; @lascelles2016applying].
Therefore, we do not know whether the MPAs in the Mexican Pacific cover the areas important for Laysan albatross.
Without this information, we cannot determine whether the MPAs are spatially adequate or if additional conservation measures are needed for the adequate protection and management of the species.

<!-- I_novelty — Point: This study pools three colonies over a longer series and applies track2KBA for the first time. -->
@hernandez2019sexual identified a 50% kernel composed of three areas based on a 5-year time series from the colony on Guadalupe Island.
The largest is located northwest of Cedros Island, close to the coast of the Baja California Peninsula.
The medium-sized one is found northwest of Guadalupe Island, and the smallest is located off the port of Ensenada.
@castillo2026breeding identified areas based on a 4-year time series from the colony on Clarion Island.
This study incorporates and extends the data from these studies.
This study is the first to use {{n_tracking_span_years}} years of tracking data from three colonies to identify the areas important for Laysan albatross in Mexico.
Furthermore, it is the first to use *track2KBA* [@beal2021track2kba] to identify the Laysan albatross core areas.
[[ R14 — "@castillo2026breeding identified areas based on a 4-year time series from the colony on Clarion Island" — Idem que el comentario anterior ]]
[[ R15 — "the first to use track2KBA" — Por qué usar track2KBA es relevante, qué ventaja tiene, por qué vale la pena mencionarlo? ]]

<!-- I_question — Point: We ask where the core area lies and how much of it MPAs cover, expecting limited coverage. -->
We asked two questions: where is the Laysan albatross core area in the Mexican Pacific, and what proportion of it falls inside MPAs?
Given that the MPAs were not designed with these core areas in mind, we hypothesize that this proportion will be low.
To answer them, we delineate the core area from pooled GPS tracking and measure its overlap with the MPA layer.
[[ R16 — "core area" — Esto lo definimos hasta abajo, entonces o se elimina, o se define desde aquí o mejor desde aquí le llamamos solo foraging area a donde comen, al breeding el área alrededor de la colonia de 60km, y al core area a la combinación, como sugiero en los métodos, pero aquí solo decir que identificaremos como estas tres areas ]]
[[ R45 — "the manuscript" — Yo considero que hay que diferenciar entre foraging, breeding y core áreas, y el manuscrito y la discusión toma avenidas diferentes dependiendo de cuál sea el principal enfoque, en lo personal, y con base en lo que se platicó desde el principio el enfoque debería ser sobre las "foraging areas", pues así tiene mayor aplicación el enfoque de la metodología usada y permite la crítica a las MPAs y el pase al siguiente capítulo, decirle "core areas" y hacer sobre eso la discusión nos obliga a tener que separar de nuevo y considero es muy confuso. Este cambio permea en todo el manuscrito, entonces aunque creo que hice mis observaciones para que hiciéramos los cambios pertinentes y hubiera consistencia por favor revisa con cuidado todo el texto para que así sea. ]]
