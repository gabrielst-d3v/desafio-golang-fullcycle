# Full Cycle Rocks - Go Docker Challenge

Este projeto é uma aplicação Go simples que imprime "Full Cycle Rocks!!" e foi otimizada para gerar uma imagem Docker de menos de 2MB.

## Arquivos

- `main.go`: Aplicação Go que imprime a mensagem
- `Dockerfile`: Multi-stage build otimizado usando imagem scratch

## Como usar

### 1. Build da imagem
```bash
docker build -t <seu-user>/fullcycle .
```

### 2. Executar o container
```bash
docker run <seu-user>/fullcycle
```

**Resultado esperado:** `Full Cycle Rocks!!`

### 3. Verificar o tamanho da imagem
```bash
docker images <seu-user>/fullcycle
```

## Estratégia de otimização

- **Multi-stage build**: Usa `golang:1.21-alpine` para compilar e `scratch` para a imagem final
- **Build estático**: Compila sem dependências externas (`CGO_ENABLED=0`)
- **Imagem scratch**: A menor imagem possível (praticamente vazia)
- **Binário otimizado**: Flags de compilação para reduzir tamanho

## Publicar no Docker Hub

```bash
# Login no Docker Hub
docker login

# Tag da imagem
docker tag <seu-user>/fullcycle <seu-user>/fullcycle:latest

# Push para o Docker Hub
docker push <seu-user>/fullcycle:latest
```

## Resultado

A imagem final terá menos de 2MB e executará perfeitamente o comando solicitado!
