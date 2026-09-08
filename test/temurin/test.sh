#!/bin/sh
. "$(dirname "$0")/../_global/common.sh"

java -version
javac -version

# JAVA_HOME must point at the JDK the editor and build tools resolve.
test -n "$JAVA_HOME"
test -x "$JAVA_HOME/bin/java"

# Compile, package and run a stdlib-only class to prove the JDK works end to end.
cd "$SMOKE_TMP" || exit 1
cat > Smoke.java <<'EOF'
public class Smoke {
    public static void main(String[] args) {
        if (1 + 1 != 2) {
            throw new AssertionError("arithmetic is broken");
        }
        System.out.println("smoke ok");
    }
}
EOF
javac Smoke.java
java Smoke
jar --create --file smoke.jar --main-class Smoke Smoke.class
java -jar smoke.jar
