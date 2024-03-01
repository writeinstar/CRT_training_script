#!/bin/bash
export LC_ALL=en_US.utf8;
PROJECT_ID=1785
SUITE_ID=5392
CRT_API_URL="https://api.robotic.copado.com/pace/v4/projects/${PROJECT_ID}/jobs/${SUITE_ID}/builds"
CRT_ACCESS_KEY=epx2DSYbait1BxcuXhiJfcSG9cCgvzI3jrlmfaOtFkjnnskwmiJz
# Start the build
BUILD=$(curl -sS -H 'X-Authorization: '"${CRT_ACCESS_KEY}"'' -d '{"branch":"master","inputParameters": [{"key":"-A", "value":"crt-training/files/environments/UAT-chrome.txt"},{"key":"-i","value":"TE-0000001"},{"key":"-i","value":"TE-0000002"}]}' -H "Content-Type: application/json" -X POST ${CRT_API_URL})
printf "\n\n${BUILD}"

BUILD_ID=$(echo "${BUILD}" | grep -o -E '[0-9]+' | head -1)

printf "\n\n${BUILD_ID}"
if [ -z "${BUILD_ID}" ]; then
  echo -n "Build ID was not captured. Check your shell script."
  exit 1
fi

printf "\n\nExecuting tests "
STATUS="status\":\"executing"
# Poll every 10 seconds until the build is finished
while [ "${STATUS}" == "status\":\"executing" ]; do
  sleep 10
  RESULTS=$(curl -sS -H 'X-Authorization: '"${CRT_ACCESS_KEY}"'' ${CRT_API_URL}/${BUILD_ID})
  printf "\n\n$RESULTS"
  STATUS=$(echo "${RESULTS}" | grep -o -E status\":\"'[a-z]+' | head -1)
  printf "\n\n$STATUS"
done
printf "\n\ndone!"
FAILURES=$(echo ${RESULTS} | grep -o -E '"failures":[0-9]+')
LOG_REPORT_URL=$(echo "${RESULTS}" | grep -o -E 'logReportUrl\":\"https://[./A-Za-z0-9-]+"')
printf "\n\nReport URL: ${LOG_REPORT_URL}"
                                              
# {
#   "branch": "string",
#   "buildSnapshotId": "string",
#   "inputParameters": [
#     {
#       "key": "string",
#       "type": "clp",
#       "value": "string"
#     }
#   ],
#   "record": "all",
#   "runType": "development",
#   "stream": true,
#   "tag": "string"
# }