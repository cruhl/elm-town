module Roads.Types exposing (Road, Density(..), Section, section)


type alias Road =
    { density : Density
    , sections : List Section
    }


type Density
    = Low
    | Medium
    | High


type alias Position =
    { x : Float
    , y : Float
    }


type alias Section =
    { start : Position
    , end : Position
    , distance : Float
    , angle : Float
    }


section : ( Float, Float ) -> ( Float, Float ) -> Section
section ( startX, startY ) ( endX, endY ) =
    let
        ( start, end ) =
            ( Position startX startY, Position endX endY )

        ( dx, dy ) =
            ( startX - endX, startY - endY )

        distance =
            sqrt (dx ^ 2 + dy ^ 2)

        angle =
            atan2 dy dx
    in
        Section start end distance angle
