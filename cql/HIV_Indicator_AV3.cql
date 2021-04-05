library HIV_Indicator_AV3 version '0.1.0'

using FHIR version '4.0.1'


include FHIRHelpers version '4.0.1'
include FHIRCommon version '0.1.0' called FC
include AgeRanges version '0.1.0' called AR
include estimatedAge version '0.1.0'

// inclusive (closed) boundaries are indicated with square brackets,
// and exclusive (open) boundaries are indicated with parentheses
parameter MeasurementPeriod default Interval[@1970-01-01, @2021-01-01)

context Patient
