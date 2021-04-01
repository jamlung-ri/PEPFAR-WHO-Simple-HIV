Alias:   RXN = http://www.nlm.nih.gov/research/umls/rxnorm
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

CodeSystem: HIVExtendedCodes
Id: HIVExtendedCodes
Title: "HIV Extended Codes"
Description: "Codes defined only in this Implementation Guide and require mapping to a standard semantic terminology."
* #First-time "First-time user of ART" "Client is ART naive, having never taken ART to treat HIV before"
* #Restarting "Restarting ART" "Client is restarting ART after stopping treatment for any reason"

 ValueSet:    ARTStartTypeValues
 Title:       "ART Start Type values"
 Id:          ARTStartTypeValues
 Description: "Codes describing whether the client is ART naive or is restarting ART"
 * codes from system HIVExtendedCodes