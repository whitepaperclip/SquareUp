defmodule SquareUp.V1.Orders do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(SquareUp.Client.t(), %{required(:location_id) => binary()}, %{
          optional(:order) => binary(),
          optional(:limit) => integer(),
          optional(:batch_token) => binary()
        }) :: SquareUp.Client.response([SquareUp.TypeSpecs.v1_order()])
  def list(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{location_id: spec(is_binary())})

    params_spec =
      schema(%{
        order: spec(is_binary()),
        limit: spec(is_integer()),
        batch_token: spec(is_binary())
      })

    response_spec = [{:delegate, &SquareUp.ResponseSchema.v1_order/0}]

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v1/{location_id}/orders"
    })
  end
end
