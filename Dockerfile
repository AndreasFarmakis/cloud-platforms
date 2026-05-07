ARG BASE_IMAGE
FROM ${BASE_IMAGE}

USER root

RUN set -eux; \
    if command -v apt-get >/dev/null 2>&1; then \
      apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null 2>&1; then \
      apk add --no-cache curl ca-certificates; \
    elif command -v microdnf >/dev/null 2>&1; then \
      microdnf install -y curl ca-certificates && microdnf clean all; \
    elif command -v dnf >/dev/null 2>&1; then \
      dnf install -y curl ca-certificates && dnf clean all; \
    elif command -v yum >/dev/null 2>&1; then \
      yum install -y curl ca-certificates && yum clean all; \
    else \
      echo "No supported package manager found; skipping curl install"; \
    fi

