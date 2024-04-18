<div align="center">

 ![docker](https://upload.wikimedia.org/wikipedia/commons/e/ea/Docker_%28container_engine%29_logo_%28cropped%29.png)

# Limarka Docker

</div>

Esse repositório é responsável por contém imagens básicas do Docker para Limarka.

## Tags suportadas e respectivos links Dockerfile

Formato de tags:

- alpine: imagens base, suporte para o Alpine.

## Referência rápida

- [Documentação](https://reinanhs.github.io/limarka-template-docs/)

## Como usar esta imagem

```shell
docker run --rm -it -v $(pwd):/usr/src/trabalho \ 
    --entrypoint="/bin/bash" \
    reinanhs/limarka-help:1.0.0 \
     -c "limarka --version"
```

## Changelog

Por favor, veja [CHANGELOG](CHANGELOG.md) para obter mais informações sobre o que mudou recentemente.

## Seja um dos contribuidores

Quer fazer parte desse projeto? Clique AQUI e leia [como contribuir](CONTRIBUTING.md).

### Licença

Esse projeto está sob licença. Veja o arquivo [LICENÇA](LICENSE) para mais detalhes.
