module Utils exposing (noCmds, (=>), pc, em, px)


noCmds : a -> ( a, Cmd msg )
noCmds model =
    ( model, Cmd.none )


(=>) : String -> String -> ( String, String )
(=>) a b =
    ( a, b )


units : String -> (number -> String)
units unit =
    (\value -> toString value ++ unit)


pc : number -> String
pc =
    units "%"


em : number -> String
em =
    units "em"


px : number -> String
px =
    units "px"
