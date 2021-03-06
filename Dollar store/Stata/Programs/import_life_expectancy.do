// This file spatially joins xy data to shapefiles

* set up
clear
set type double
cd "C:\Users\perez_g\Desktop\Data_vis_wa\data_vis_wa\Dollar store\Stata\Programs"

gl root "C:\Users\perez_g\Desktop\Data_vis_wa\data_vis_wa\Dollar store"
gl GIS "$root\GIS"
gl Stata "$root\Stata"
gl Data "$Stata\Data"
gl Dollar_data "$root\Dollar store data"
gl Electoral_data "$root\Electoral data"
gl Citylab_data "$root\City lab data"


* import harvard congressional election data set
import delimited "$Electoral_data\District_life_expectancy.csv", clear
//rename
ren (v1 v2 v3) (district state life_expectancy)
//create district var
replace district = subinstr(district, "Congressional District ","",.)
replace district = subinstr(district, "ï»¿", "",.)
replace district = subinstr(district, " ","",.)
replace district = "0"+ district if length(district) == 1
replace district = "AL" if district == "(atlarge)"
drop if state == "District of Columbia"

replace state = "CA" if state == "California"
replace state = "NY" if state == "New York"
replace state = "VA" if state == "Virginia"
replace state = "NJ" if state == "New Jersey"
replace state = "MD" if state == "Maryland"
replace state = "MA" if state == "Massachusetts"
replace state = "TX" if state == "Texas"
replace state = "CT" if state == "Connecticut"
replace state = "IL" if state == "Illinois"
replace state = "WA" if state == "Washington"
replace state = "MN" if state == "Minnesota"
replace state = "GA" if state == "Georgia"
replace state = "MO" if state == "Missouri"
replace state = "CO" if state == "Colorado"
replace state = "MI" if state == "Michigan"
replace state = "PA" if state == "Pennsylvania"
replace state = "NC" if state == "North Carolina"
replace state = "KS" if state == "Kansas"
replace state = "AZ" if state == "Arizona"
replace state = "HI" if state == "Hawaii"
replace state = "WI" if state == "Wisconsin"
replace state = "NH" if state == "New Hampshire"
replace state = "FL" if state == "Florida"
replace state = "IN" if state == "Indiana"
replace state = "OR" if state == "Oregon"
replace state = "OH" if state == "Ohio"
replace state = "RI" if state == "Rhode Island"
replace state = "NV" if state == "Nevada"
replace state = "ME" if state == "Maine"
replace state = "NE" if state == "Nebraska"
replace state = "SC" if state == "South Carolina"
replace state = "IA" if state == "Iowa"
replace state = "VT" if state == "Vermont"
replace state = "AL" if state == "Alabama"
replace state = "AK" if state == "Alaska"
replace state = "LA" if state == "Louisiana"
replace state = "UT" if state == "Utah"
replace state = "DE" if state == "Delaware"
replace state = "ND" if state == "North Dakota"
replace state = "WY" if state == "Wyoming"
replace state = "NM" if state == "New Mexico"
replace state = "KY" if state == "Kentucky"
replace state = "SD" if state == "South Dakota"
replace state = "TN" if state == "Tennessee"
replace state = "OK" if state == "Oklahoma"
replace state = "ID" if state == "Idaho"
replace state = "AR" if state == "Arkansas"
replace state = "MT" if state == "Montana"
replace state = "WV" if state == "West Virginia"
replace state = "MS" if state == "Mississippi"

replace district = state + "-" + district
drop state

save "$Data\District_LE", replace


