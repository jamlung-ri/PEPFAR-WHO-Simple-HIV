Alias:          RXN = http://www.nlm.nih.gov/research/umls/rxnorm
Profile:        HIV_MedicationStatement
Parent:         MedicationStatement
Id:             HIV-MedStatement
Title:          "HIV MedicationStatement - ART"
Description:    "A summary of the ART medication being taken by an HIV patient"
* medicationCodeableConcept = RXN#1234
* effectiveDateTime 0..1
* effectivePeriod 0..1


 * extension contains ARTStartType named ARTStartType 0..1
     Extension:   ARTStartType
     Id:          ARTStartType
     Title:       "ART Start Type"
     Description: "Whether the client is ART naive or is restarting ART"
     * value[x] only CodeableConcept
     * valueCodeableConcept from ARTStartTypeValues (extensible)

 ValueSet:    ARTStartTypeValues
 Title:       "ART Start Type values"
 Id:          ARTStartTypeValues
 Description: "Codes describing whether the client is ART naive or is restarting ART"
 * HIVExtendedCodes#First-time
 * HIVExtendedCodes#Restarting