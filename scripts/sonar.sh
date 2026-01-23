#!/usr/bin/env bash

if [[ ! -v PROJECT_KEY ]]; then
    echo "You need to set PROJECT_KEY"
    exit 1
fi
# if [[ ! -v BRANCH ]]; then
#     echo "You need to set BRANCH"
#     exit 1
# fi

sonar-scanner \
    '-Dsonar.qualitygate.wait=true' \
    '-Dsonar.exclusions=test_reports/output-snyk-*.json,test_reports/snyk-*-results.html,catalog-info.yaml' \
    '-Dsonar.coverage.exclusions=test_reports/output-snyk-*.json,test_reports/snyk-*-results.html,catalog-info.yaml' \
    -D "sonar.projectKey=$PROJECT_KEY" \
    -D "sonar.python.coverage.reportPaths=${REPORT_PATH:-coverage.xml}"
# -D "sonar.branch.name=$BRANCH" \
