#!/bin/bash 

TOKENS=(secret99-prod adminKey44-test userToken12-dev)

for item in "${TOKENS[@]}"; do 
        RESULT=${item%-*}
        echo "Raw token payload: $RESULT"
done
