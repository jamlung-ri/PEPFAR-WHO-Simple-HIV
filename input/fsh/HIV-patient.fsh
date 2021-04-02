Alias:          GND = http://hl7.org/fhir/administrative-gender
Alias:          SCT = http://snomed.info/sct
Profile:        HIV_Patient
Parent:         Patient
Id:             HIV-patient
Title:          "HIV Patient"
Description:    "A patient that may be diagnosed with HIV, may have a viral load lab, and may be virally suppressed."
* birthDate 0..1
* gender from HIVGender (required)
* extension contains estimatedAge named estAge 0..1
    Extension:   Estimated_Age
    Id:          estimatedAge
    Title:       "Estimated Age"
    Description: "Estimated Age of Patient if date of birth is unavailable"
    * value[x] only integer

ValueSet: HIVGender
Title: "Gender values"
Id: HIVGender
Description: "Codes describing the gender of the client"
* include GND#male
* include GND#female
* include SCT#12271241000119109 "Transgender identity (finding)"
* include GND#other