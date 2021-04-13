library HIV_Indicator_AV3 version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR

// inclusive (closed) boundaries are indicated with square brackets,
// and exclusive (open) boundaries are indicated with parentheses
parameter MeasurementPeriod default Interval[@1970-01-01, @2021-01-01)
//parameter MeasurementPeriod default Interval[@2000-01-01, @2021-01-01)

// SNOMED-CT, International Edition
codesystem "SNOMED-CT": 'http://snomed.info/sct' version 'http://snomed.info/sct/900000000000207008'
code "HIV Positive": '86406008' from "SNOMED-CT" display 'HIV Positive'
codesystem "RxNorm": 'http://www.nlm.nih.gov/research/umls/rxnorm'
code "ART": '1234' from "RxNorm" display 'RxNorm Code'
codesystem "LOINC": 'http://loinc.org'
code "HIV1 RNA # Spec NAA+probe": '25836-8' from "LOINC" display 'HIV 1 RNA NAA+probe (Specimen) [#/Vol]'
codesystem "Custom": 'http://example.org/fhir/fish/CodeSystem/HIVExtendedCodes'
code "Routine": 'Routine' from "Custom" display 'Routine viral load test'


/*
@description: Returns any US Core extensions defined on the given resource with the specified id.
@comment: NOTE: Extensions are not the preferred approach, but are used as a way to access
content that is defined by extensions but not yet surfaced in the CQL model info.
*/
define function HIVExtensions(domainResource DomainResource, id String):
  domainResource.extension E
      where E.url = ('https://build.fhir.org/ig/jamlung-ri/PEPFAR-WHO-Simple-HIV/branches/main/' + id)
        return E

/*
@description: Returns the single US Core extension (if present) on the given resource with the specified id.
@comment: This function uses singleton from to ensure that a run-time exception is thrown if there
is more than one extension on the given resource with the specified url.
*/
define function HIVExtension(domainResource DomainResource, id String):
  singleton from HIVExtensions(domainResource, id)

context Patient

define "Living":
      Patient.deceased is null
      or (Patient.deceased as FHIR.boolean).value is false
      or (Patient.deceased as FHIR.dateTime).value before Today()

define "HIV Condition":
  exists ["Condition": "HIV Positive"]

define "On ART": //patients on ART that started 6+ months before end of reporting period
  exists ["MedicationRequest": "ART"] MedicationRequest
  where MedicationRequest.authoredOn < (end of MeasurementPeriod - 6 months)
  //(start of MeasurementPeriod <= MedicationRequest.authoredOn <= end of MeasurementPeriod)

/* define "Routine VL Result in Reporting Period":
  exists ["Observation":"HIV1 RNA # Spec NAA+probe"] O
  where MeasurementPeriod includes O.effective   */

define "Routine VL Result in Reporting Period":
  exists ["Observation":"HIV1 RNA # Spec NAA+probe"] O
  where O.effective before end of MeasurementPeriod and O.effective after or on start of MeasurementPeriod
  and HIVExtension("http://example.org/fhir/fish/StructureDefinition/VL-reason",valueCodeableConcept) is "Routine"


//define "Race": USExtensions(Patient, 'us-core-race')

 /* define TestSimpleExtensions:
  Patient P
    let birthsex: singleton from (P.extension E where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex')
    where birthsex.value = 'M' */

/* define TestComplexExtensions:
  Patient P
    let
      race: singleton from (P.extension E where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'),
      ombCategory: race.extension E where E.url = 'text'
      //detailed:, race.extension E where E.url = 'detailed'
    where ombCategory.value contains 'White'
      //and detailed.value contains 'Alaska Native' */

//define "White": TestComplexExtensions = 'White'

define "Female": Patient.gender = 'female'
