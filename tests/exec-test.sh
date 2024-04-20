#!/bin/bash

limarka --version
git --version
pandoc --version

git clone https://github.com/abntex/trabalho-academico-limarka.git
cd trabalho-academico-limarka

echo "Executando teste de execução do Limarka"
limarka exec

ls xxx-* -l

TOTAL=$(ls *.pdf | wc -l)
if [ $TOTAL -eq 1 ]; then
    echo "Teste executado com sucesso!"
    exit 0
else
    echo "Erro ao executar teste!"
    exit 1
fi

