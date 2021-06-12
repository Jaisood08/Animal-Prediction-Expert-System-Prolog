% Main Tree Function
tree(if_then_else('has fur',
                  if_then_else('has patches',
                               if_then_else('runs fastest',
                                            animal(cheetah),
                                            animal(girrafe)),
                               if_then_else('has stripes',
                                            if_then_else('runs faster',
                                                         animal(tiger),
                                                         animal(zebra)),
                                            false)),
                               
                  if_then_else('has feathers',
                               if_then_else('full time herbivore',
                                            animal(ostrich),
                                            if_then_else('lives on ice',
                                                         animal(penguin),
                                                         animal(albatross))),
                               false))).
                             
% Start Call
animal(A) :-
        tree(T),
        tree_animal(T, A).

% Main Function
% 'COND' -> 'THEN';'ELSE'
% if_then_else is function copied from ->

tree_animal(animal(A), A).
tree_animal(if_then_else(Cond,Then,Else), A) :-
        (   is_true(Cond) ->
            tree_animal(Then, A)
        ;   tree_animal(Else, A)
        ).

% Condition Check 
% True for - yes input only 

is_true(Q) :-
        format("~w?\n", [Q]),
        read(yes).

% Main Driving Call
main:-nl,write("----- Welcome to Animal prediction Expert System ----- "),nl,
    nl,write("\nPlease answer following question as yes/no :-\n"),nl,nl,
    animal(A),
    write("Prediction = "),
    write(A).