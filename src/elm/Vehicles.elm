module Vehicles exposing (Model, Msg, init, update)


type alias Model =
    { vehicles : List Vehicle }


type alias Vehicle =
    { kind : VehicleKind }


type VehicleKind
    = Car


type Msg
    = NoOp


init : Model
init =
    Model [ Vehicle Car ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model
