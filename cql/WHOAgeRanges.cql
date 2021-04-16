library WHOAgeRanges version '0.1.0'

using FHIR version '4.0.1'

codesystem "WHO HIV Age Periods": 'http://who.int/CodeSystem/who-hiv-age-periods' // { 'P0Y--P1Y', 'P1Y--P5Y', ... }

// Age Groups
code "P0Y--P4Y": 'P0Y--P4Y' from "WHO HIV Age Periods" display '0-4 years'
code "P5Y--P9Y": 'P5Y--P9Y' from "WHO HIV Age Periods" display '5-9 years'
code "P10Y--P14Y": 'P10Y--P14Y' from "WHO HIV Age Periods" display '10-14 years'
code "P15Y--P19Y": 'P15Y--P19Y' from "WHO HIV Age Periods" display '15-19 years'
code "P20Y--P24Y": 'P20Y--P24Y' from "WHO HIV Age Periods" display '20-24 years'
code "P25Y--P29Y": 'P25Y--P29Y' from "WHO HIV Age Periods" display '25-29 years'
code "P30Y--P34Y": 'P30Y--P34Y' from "WHO HIV Age Periods" display '30-34 years'
code "P35Y--P39Y": 'P35Y--P39Y' from "WHO HIV Age Periods" display '35-39 years'
code "P40Y--P44Y": 'P40Y--P44Y' from "WHO HIV Age Periods" display '40-44 years'
code "P45Y--P49Y": 'P45Y--P49Y' from "WHO HIV Age Periods" display '45-49 years'
code "P50Y--P9999Y": 'P50Y--P9999Y' from "WHO HIV Age Periods" display '50+ years'

//parameter MeasurementPeriod default Interval[@1970-01-01, @2021-01-01)
parameter MeasurementPeriod default Interval[@2000-01-01, @2021-01-01)

context Patient

// Age Group
define "WHO Age Group":
  case
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[0, 5) then "P0Y--P4Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[5, 10) then "P5Y--P9Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[10, 15) then "P10Y--P14Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[15, 20) then "P15Y--P19Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[20, 25) then "P20Y--P24Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[25, 30) then "P25Y--P29Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[30, 35) then "P30Y--P34Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[35, 40) then "P35Y--P39Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[40, 45) then "P40Y--P44Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[45, 50) then "P45Y--P49Y"
    when AgeInYearsAt(start of MeasurementPeriod) in Interval[50, null] then "P50Y--P9999Y"
    else null
  end
