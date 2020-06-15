#!/bin/bash

PROFILE_ID="4"

wget -O years.json "https://www.cityvizor.cz/api/exports/profiles/$PROFILE_ID/years"

current_year=`date +"%Y"`
for YEAR in $(seq 2017 $current_year)
do
  mkdir $YEAR
  wget -O $YEAR/accounting.json "https://www.cityvizor.cz/api/exports/profiles/$PROFILE_ID/accounting/$YEAR"
  wget -O $YEAR/events.json "https://www.cityvizor.cz/api/exports/profiles/$PROFILE_ID/events/$YEAR"
  wget -O $YEAR/payments.json "https://www.cityvizor.cz/api/exports/profiles/$PROFILE_ID/payments/$YEAR"
done
