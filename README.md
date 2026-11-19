# Trabalho 1 – Fazendeiro, lobo, ovelha e repolho em Prolog

Arthur Cunha de Paula – 23.1.8008 – CSI114 Linguagens de Programação

O fazendeiro precisa atravessar o rio com um lobo, uma ovelha e um repolho, levando no máximo um item por vez.
A ovelha não pode ficar sozinha com o lobo nem com o repolho. O programa encontra uma sequência válida de
estados entre um estado inicial e um final, ou responde `Sem solucao`.

## Como executar

```
swipl trabalho1_prolog.pl
?- resolver(estado(esq, esq, esq, esq), estado(dir, dir, dir, dir)).
```

Cada estado é `estado(Fazendeiro, Lobo, Ovelha, Repolho)`, com cada posição valendo `esq` ou `dir`.
