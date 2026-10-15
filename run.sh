#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./run.sh <programme>"
    exit 1
fi

PROG="$1"

if [ ! -f "$PROG" ]; then
    echo "Erreur : fichier '$PROG' introuvable."
    exit 1
fi

TOTAL=0
PASSED=0

for input_file in $(ls tests/*.in 2>/dev/null | sort); do
    test_id=$(basename "$input_file" .in)
    expected_output="tests/${test_id}.out"

    if [ ! -f "$expected_output" ]; then
        echo "Attention : $expected_output manque, test ignoré."
        continue
    fi

    TOTAL=$((TOTAL + 1))

    actual_output=$(lci "$PROG" < "$input_file" 2>&1)

    if diff -q -Z <(echo "$actual_output") "$expected_output" > /dev/null; then
        echo "[OK]   Test $test_id"
        PASSED=$((PASSED + 1))
    else
        echo "[FAIL] Test $test_id"
        echo "  Entrée   : $(cat "$input_file")"
        echo "  Attendu  : $(cat "$expected_output")"
        echo "  Obtenu   : $actual_output"
    fi
done

echo ""
echo "Résultat : $PASSED / $TOTAL test(s) validé(s)."

[ "$PASSED" -eq "$TOTAL" ] && exit 0 || exit 1