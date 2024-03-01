# These can be acquired from the URL
PROJECT_ID=22817
SUITE_ID=22977
RUN_ID=1459171

CRT_BUILD_URL="https://api.eu-robotic.copado.com/pace/v4/projects/$PROJECT_ID/jobs/$SUITE_ID/builds/$RUN_ID"
CRT_ACCESS_KEY="your access key"

BUILD_INFO=$(curl -sS -H "X-Authorization: $CRT_ACCESS_KEY" -H "Content-Type: application/json" -X GET "$CRT_BUILD_URL")
echo $BUILD_INFO

OUTPUT_ENDPOINT=$(echo $BUILD_INFO | grep -Eo '"outputArchive":\{.*\}' | grep -Eo 'https:.*zip')
# you can get the endpoint also with `jq` (usually needs to be installed separately)
# OUTPUT_ENDPOINT=$(echo $BUILD_INFO | jq '.data.outputArchive.location')
echo $OUTPUT_ENDPOINT

curl --location $OUTPUT_ENDPOINT --header "x-authorization: $CRT_ACCESS_KEY" --output output.zip