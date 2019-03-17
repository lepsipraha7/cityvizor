#!/bin/bash

PROFILE_ID="5971ca164e7b8d5ea27f0488"

wget -O profile.json "https://www.cityvizor.cz/exports/v1/profiles/$PROFILE_ID"
wget -O item_names.json "https://www.cityvizor.cz/exports/v1/codelists/item-names"
wget -O paragraph_names.json "https://www.cityvizor.cz/exports/v1/codelists/paragraph-names"
wget -O budgets.json "https://www.cityvizor.cz/exports/v1/profiles/$PROFILE_ID/budgets"

current_year=`date +"%Y"`
for YEAR in $(seq 2017 $current_year)
do
  mkdir $YEAR
  wget -O $YEAR/budgets.json "https://www.cityvizor.cz/exports/v1/profiles/$PROFILE_ID/budgets/$YEAR"
  wget -O $YEAR/events.json "https://www.cityvizor.cz/exports/v1/profiles/$PROFILE_ID/events/$YEAR"
  wget -O $YEAR/payments.json "https://www.cityvizor.cz/exports/v1/profiles/$PROFILE_ID/payments/$YEAR"
done

git add .
git commit -am "Fetched"
