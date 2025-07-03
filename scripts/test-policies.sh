#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
POLICY_DIR="${ROOT_DIR}/terraform/policies"
VALID_DIR="${ROOT_DIR}/manifests/valid"
INVALID_DIR="${ROOT_DIR}/manifests/invalid"

GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[1;36m'
NC='\033[0m'

if ! command -v kyverno &> /dev/null; then
    echo -e "${RED}✖ kyverno CLI is not installed. Install it from https://kyverno.io/docs/kyverno-cli/${NC}"
    exit 1
fi

echo -e "${CYAN}🔍 Running Kyverno policy tests...${NC}\n"

echo -e "${CYAN}✅ Valid manifests (should PASS):${NC}"
for file in "$VALID_DIR"/*.yaml; do
    echo -e "→ Testing: $file"
    if kyverno apply "$POLICY_DIR" --resource "$file" 2>&1 | grep -q "pass:"; then
        echo -e "${GREEN}✔ Passed as expected${NC}\n"
    else
        echo -e "${RED}✖ FAILED unexpectedly${NC}\n"
    fi
done

echo -e "${CYAN}❌ Invalid manifests (should FAIL):${NC}"
for file in "$INVALID_DIR"/*.yaml; do
    echo -e "→ Testing: $file"
    if kyverno apply "$POLICY_DIR" --resource "$file" 2>&1 | grep -q "fail:"; then
        echo -e "${GREEN}✔ Rejected as expected${NC}\n"
    else
        echo -e "${RED}✖ Unexpectedly PASSED${NC}\n"
    fi
done

echo -e "${CYAN}✅ Kyverno CLI testing complete.${NC}"
