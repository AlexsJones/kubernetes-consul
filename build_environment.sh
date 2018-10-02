#! /bin/bash
#################################################################################
#     File Name           :     build_environment.sh
#     Created By          :     jonesax
#     Creation Date       :     [2017-09-26 21:26]
#     Last Modified       :     [2018-07-10 22:00]
#     Description         :
#################################################################################

set -eu

echo "Building for environment $1"

rm -rf deployment
kubectl create configmap consul --from-file=configs/server.json
vortex --template templates --output deployment -varpath ./environments/"${1}.yaml"
