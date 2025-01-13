#!/bin/bash

kubectl get ns -o jsonpath='{range .items[*]}{.metadata.name} {.metadata.creationTimestamp}{"\n"}{end}' | while read -r name timestamp; do
        echo "$name" | awk -v current_time=$(date +%s) -v thirtys_days_back=$(date +%s -d "30 day ago") -v ns_time=$(date --date="${timestamp}" +%s) '(current_time - ns_time) >(current_time - thirty_days_back){print $0}';
done

