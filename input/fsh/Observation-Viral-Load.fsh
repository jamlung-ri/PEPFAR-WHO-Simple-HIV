Alias:          LNC = http://loinc.org
Alias:          SCT = http://snomed.info/sct
Profile:        Observation_Viral_Load
Parent:         Observation
Id:             Observation-Viral-Load
Title:          "Observation - Viral Load Test"  
Description:    "Reason for HIV viral load test"
* code = LNC#25836-8
* value[x] only Quantity
* extension contains VL_reason named estAge 0..1
    Extension:   VL_reason 
    Id:          VL-reason
    Title:       "Reason for HIV viral load test"
    Description: "Whether the viral load is being tested for routine monitoring on a set schedule or for targeted monitoring for suspected treatment failure"
    * value[x] only CodeableConcept
    * valueCodeableConcept from VLReasonValues (required)

ValueSet:    VLReasonValues
Title:       "Reason for HIV viral load test values"
Id:          VLReasonValues
Description: "Codes describing the reason for HIV viral load test"
 * HIVExtendedCodes#Routine
 * HIVExtendedCodes#Targeted

