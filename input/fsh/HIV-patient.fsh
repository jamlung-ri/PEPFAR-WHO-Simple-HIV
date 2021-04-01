Profile:        HIV_Patient
Parent:         Patient
Id:             HIV-patient
Title:          "HIV Patient"
Description:    "A patient that may be diagnosed with HIV, may have a viral load lab, and may be virally suppressed."
* birthDate 0..1
* gender 0..1
* extension contains estimatedAge named estAge 0..1
    Extension:   Estimated_Age
    Id:          estimatedAge
    Title:       "Estimated Age"
    Description: "Estimated Age of Patient if date of birth is unavailable"
    * value[x] only integer