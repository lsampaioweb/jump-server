#!/bin/bash
set -e # Abort if there is an issue with any build.

# $1 plan, apply or destroy.
# $2 staging, production.
# $3 -auto-approve.

terraform $1 $3 -var-file=$2/vars.tfvars -state=$2/terraform.tfstate
