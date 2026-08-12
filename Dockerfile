# ====================================================================
# Create database migration image
# ====================================================================

FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /app

# Copy binary from builder
COPY db        .
COPY data-sync .

# Use a non-root user for security
USER nonroot:nonroot

ENTRYPOINT ["/app/data-sync", "migrate"]
