% Estado: estado(Fazendeiro, Lobo, Ovelha, Repolho), cada um em esq ou dir.

oposta(esq, dir).
oposta(dir, esq).

% A ovelha não pode ficar com o lobo ou com o repolho sem o fazendeiro.
seguro(estado(F, L, O, R)) :-
    \+ (L == O, F \== O),
    \+ (O == R, F \== O).

% O fazendeiro atravessa sozinho ou levando um item que está na sua margem.
mover(estado(F, L, O, R), estado(F2, L, O, R)) :- oposta(F, F2).
mover(estado(F, F, O, R), estado(F2, F2, O, R)) :- oposta(F, F2).
mover(estado(F, L, F, R), estado(F2, L, F2, R)) :- oposta(F, F2).
mover(estado(F, L, O, F), estado(F2, L, O, F2)) :- oposta(F, F2).

% Busca em profundidade; Visitados impede repetir estados do caminho.
caminho(Final, Final, Visitados, Caminho) :- reverse(Visitados, Caminho).
caminho(Atual, Final, Visitados, Caminho) :-
    mover(Atual, Proximo),
    seguro(Proximo),
    \+ member(Proximo, Visitados),
    caminho(Proximo, Final, [Proximo | Visitados], Caminho).

resolver(Inicial, Final) :-
    seguro(Inicial),
    seguro(Final),
    caminho(Inicial, Final, [Inicial], Caminho), !,
    imprimir(Caminho).
resolver(_, _) :- write('Sem solucao'), nl.

imprimir([]).
imprimir([E | Resto]) :- write(E), nl, imprimir(Resto).
