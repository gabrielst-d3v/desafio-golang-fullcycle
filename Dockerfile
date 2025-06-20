# Multi-stage build para otimizar o tamanho
FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY main.go .

# Build estático sem dependências externas
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o main main.go

# Imagem final usando scratch (imagem "raiz" vazia)
FROM scratch

# Copia apenas o binário compilado
COPY --from=builder /app/main /main

# Define o comando de execução
CMD ["/main"]