defmodule SquareUp.V1.Settlements do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(SquareUp.Client.t(), %{location_id: binary()}, %{
          order: binary(),
          begin_time: binary(),
          end_time: binary(),
          limit: integer(),
          status: binary(),
          batch_token: binary()
        }) :: SquareUp.Client.response([SquareUp.TypeSpecs.v1_settlement()])
  def list(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{location_id: spec(is_binary())})

    params_spec =
      schema(%{
        order: spec(is_binary()),
        begin_time: spec(is_binary()),
        end_time: spec(is_binary()),
        limit: spec(is_integer()),
        status: spec(is_binary()),
        batch_token: spec(is_binary())
      })

    response_spec = [{:delegate, &SquareUp.ResponseSchema.v1_settlement/0}]

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v1/{location_id}/settlements"
    })
  end
end