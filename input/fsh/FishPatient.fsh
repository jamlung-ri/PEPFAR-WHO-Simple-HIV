Alias:   SCT = http://snomed.info/sct
Profile:        FishPatient
Parent:         Patient
Id:             fish-patient
Title:          "Fish Patient"
Description:    "A patient that is a type of fish."
* name 1..*
* maritalStatus 0..0
* communication 0..0
* extension contains FishSpecies named species 0..1
    Extension:   FishSpecies
    Id:          fish-species
    Title:       "Fish Species"
    Description: "The species of the fish."
    * value[x] only CodeableConcept
    * valueCodeableConcept from FishSpeciesValueSet (extensible)
ValueSet:    FishSpeciesValueSet
Title:       "Fish Species Value Set"
Id:          fish-species-value-set
Description: "Codes describing various species of fish, taken from SNOMED-CT."
* codes from system SCT where concept is-a #90580008  "Fish (organism)"
Instance: Shorty
InstanceOf: fish-patient
Title: "Shorty Example"
Usage: #example
* name.given = "Shorty"
* name.family = "Koi-Fish"
* extension[FishSpecies].valueCodeableConcept =  SCT#47978005 "Carpiodes cyprinus (organism)"