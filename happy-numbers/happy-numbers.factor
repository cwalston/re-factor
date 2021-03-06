
USING: combinators kernel make math sequences ;

IN: happy-numbers

<PRIVATE

: squares ( n -- s )
    0 [ over 0 > ] [ [ 10 /mod sq ] dip + ] while nip ;

: (happy?) ( n1 n2 -- ? )
    [ squares ] [ squares squares ] bi* {
        { [ dup 1 = ] [ 2drop t ] }
        { [ 2dup = ] [ 2drop f ] }
        [ (happy?) ]
    } cond ;

PRIVATE>

: happy? ( n -- ? )
    dup (happy?) ;

: happy-numbers ( n -- seq )
    [
        0 [ over 0 > ] [
            dup happy? [ dup , [ 1 - ] dip ] when 1 +
        ] while 2drop
    ] { } make ;

: happy2? ( n -- ? )
   {
       { [ dup 1 = ] [ drop t ] }
       { [ dup 4 = ] [ drop f ] }
       [ squares happy2? ]
   } cond ;

