equal([],[]).
equal([X|Z],[Y|T]) :-
  X == Y,
  equal(Z,T).
