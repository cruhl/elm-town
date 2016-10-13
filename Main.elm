module Main exposing (main)

import Mouse exposing (Position)
import Html.App exposing (program)
import Html exposing (Html, div, text)
import Cursor


main : Program Never
main =
    program
        { init = ( init, Cmd.none )
        , subscriptions = \_ -> Mouse.moves MoveMouse
        , update = update
        , view = view
        }


type alias Model =
    { mousePosition : Position }


type Msg
    = MoveMouse Position


init : Model
init =
    Model
        (Position 0 0)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MoveMouse toPosition ->
            let
                newPosition =
                    updateMousePosition model.mousePosition toPosition
            in
                ( { model | mousePosition = newPosition }, Cmd.none )


updateMousePosition : Position -> Position -> Position
updateMousePosition position { x, y } =
    { position | x = x, y = y }


view : Model -> Html Msg
view { mousePosition } =
    div []
        [ Cursor.view mousePosition ]
