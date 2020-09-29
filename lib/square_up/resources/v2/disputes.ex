defmodule SquareUp.V2.Disputes do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(SquareUp.Client.t(), %{}, %{
          optional(:cursor) => binary(),
          optional(:states) => binary(),
          optional(:location_id) => binary()
        }) :: SquareUp.Client.response(SquareUp.TypeSpecs.list_disputes_response())
  def list(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{})

    params_spec =
      schema(%{
        cursor: spec(is_binary()),
        states: spec(is_binary()),
        location_id: spec(is_binary())
      })

    response_spec = {:delegate, &SquareUp.ResponseSchema.list_disputes_response/0}

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/disputes"
    })
  end
end
