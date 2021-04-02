Alias:          LNC = http://loinc.org
Alias:          SCT = http://snomed.info/sct
Profile:        Observation_Key_Pop
Parent:         Observation
Id:             Observation-Key-Pop
Title:          "Observation - Key Population"  
Description:    "The type of  key population that the client is included in"
* code = LNC#95715-9
* value[x] only CodeableConcept
* valueCodeableConcept from KeyPopValues (preferred)

ValueSet:   KeyPopValues
Title:       "Key Population values"
Id:          KeyPopValues
Description: "Codes describing the type of  key population that the client is included in"
* SCT#449344001 "Sex worker (occupation)"
* SCT#76102007  "Male homosexual (finding)"
* SCT#12271241000119109  "Transgender identity (finding)"
* SCT#226034001 "Injecting drug user (finding)"
* SCT#105568001 "In prison (finding)"

