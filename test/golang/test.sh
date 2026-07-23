#!/bin/sh
. "$(dirname "$0")/common.sh"

go version
gopls version

# Compile and run a stdlib-only test to prove the toolchain works end to end.
cd "$SMOKE_TMP" || exit 1
go mod init smoke
cat > smoke_test.go <<'EOF'
package smoke

import "testing"

func TestSmoke(t *testing.T) {
	if 1+1 != 2 {
		t.Fatal("arithmetic is broken")
	}
}
EOF
go test ./...
