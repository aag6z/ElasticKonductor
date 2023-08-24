#!/bin/bash
set -e
echo "getClusterInfo.sh"
clusternameraw=$(terraform output clustername)
clustername=${clusternameraw//\"/}
regionraw=$(terraform output region)
region=${regionraw//\"/}

echo "getClusterInfo.sh: ip parsing"
ipsplit() { local IFS=.; echo $*; }
kurl=$(kubectl get service eck-kb-http | tail -n -1 | awk {'print $4"" '})
set -- `ipsplit $kurl`
k1=$4.$3.$2.$1

echo "getClusterInfo.sh: get eck-external-es-http"
kurl=$(kubectl get service eck-external-es-http | tail -n -1 | awk {'print $4"" '})
set -- `ipsplit $kurl`
k2=$4.$3.$2.$1

echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Checking if license file is exists
echo ...
echo ...
if test -f ./license/es-license.json; then
  echo License file found and should have been applied to ECK
else
  echo No license file found. Make sure it is named es-license.json and placed under ./eck/license
  echo Enterprise Trial license applied.
fi
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Cluster Info
curl --insecure -u elastic:$(kubectl get secret eck-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode) https://$(kubectl get service eck-external-es-http | tail -n -1 | awk {'print $4"" '}):9200
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "Cluster Name: $clustername"
echo "Region: $region"
echo
echo ES URL: https://$(kubectl get service eck-external-es-http | tail -n -1 | awk {'print $4"" '}):9200
echo or
echo ES URL: https://$k2.bc.googleusercontent.com:9200
echo
echo Kibana URL: https://$(kubectl get service eck-kb-http | tail -n -1 | awk {'print $4"" '}):5601
echo or
echo Kibana URL: https://$k1.bc.googleusercontent.com:5601
echo
echo
echo Kibana UserName: elastic
echo Kibana Password: $(kubectl get secret eck-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)
echo PLEASE NOTE: It may take a few minutes for the kibana UI to come up
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
