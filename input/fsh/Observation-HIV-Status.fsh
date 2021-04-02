Alias:          LNC = http://loinc.org
Alias:          SCT = http://snomed.info/sct
Profile:        Observation_HIV_Status
Parent:         Observation
Id:             Observation-HIV-Status
Title:          "Observation - HIV Status"  
Description:    "HIV status reported after applying the HIV testing algorithm. No single HIV test can provide an HIV-positive diagnosis. "
* code = LNC#75622-1
* value[x] only CodeableConcept
* valueCodeableConcept from HIVStatusValues (required)

ValueSet:   HIVStatusValues
Title:       "HIV Status values"
Id:          HIVStatusValues
Description: "Codes describing whether the client received a positive HIV test result"
* SCT#165816005 "Human immunodeficiency virus infection (disorder)"
* SCT#165815009 "Human immunodeficiency virus negative (finding)"
* SCT#419984006 "Inconclusive (qualifier value)"
