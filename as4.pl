% CPSC 3740 Assignment 4
% By Vincent Cote

% Question 1 - Checks if 2 lists are the same by checking each element one at a time
equal([],[]).
equal([X|Z],[Y|T]) :-
  X == Y,
  equal(Z,T).


% Question 2 - Returns the height of tree into T
height([],0).
height([X|Y], T) :-
  ( isList(X)
  -> (height(X, D), T is D + 1, height(Y,Z), max(T,Z,S), T = S)
  ; height(Y,T)
  ).

% Helper function to get the max of 2 values
max(X,Y,Z) :-
    (  X =< Y
    -> Z = Y
    ;  Z = X  
     ).

% Helper function to check if X is a list
isList(X) :-
        var(X), !,
        fail.
isList([]).
isList([_|T]) :-
        isList(T).

% Question 3
% Helper function to see if a leaf is a terminal leaf
isTerminal([_, Y, Z|_]) :-
  Y == [],
  Z == [].

% Pass a tree and a sum, returns true if there is a node to leaf
% route that returns the sum, false otherwise.
sum(T,S) :-
  [X|Y] = T,
  (isList(X)
  -> ((sum(X,S) ; sum(Y,S)))
  ; (isTerminal(T)
    -> (D is S - X, D == 0)
    ; ( C is S - X, sum(Y,C)))
  ).


%[1,[2,[3,[],[]],[4,[],[]]],[15,[],[]],[16,[],[]]]
% [1,[],[]]