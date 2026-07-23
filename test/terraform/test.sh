#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

terraform version
terraform-ls version

# Validate a provider-less config so everything stays offline.
cd "$SMOKE_TMP" || exit 1
printf 'output "ok" {\n  value = "ok"\n}\n' > main.tf
terraform fmt -check
terraform init -backend=false
terraform validate
