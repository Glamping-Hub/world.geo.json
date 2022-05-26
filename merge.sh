#!/bin/bash

FOLDER="countries/USA/"

for d in $FOLDER*/ ; do
    target="${d:0:-1}_counties.geo.json"
    echo "Merging $d into $target"
    echo '{"type":"FeatureCollection","features":' > $target
    jq -c '.features[]' ./$d*.json | jq -s >> $target
    echo '}' >> $target
done
