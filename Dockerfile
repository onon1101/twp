FROM alpine:latest

# Install Go-lang
COPY --from=golang:1.21-alpine /usr/local/go /usr/local/go
ENV PATH=$PATH:/usr/local/go/bin

# Install packages
RUN mkdir /app

# Set the Current Working Directory inside the container
COPY . /app
WORKDIR /app

# Expose port 8080 from the container to the host
EXPOSE 8080

# Build the Go app
CMD ["go", "run", "/app/main.go"]
