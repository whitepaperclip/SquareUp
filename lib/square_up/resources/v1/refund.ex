defmodule SquareUp.V1.Refund do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec create(
          SquareUp.Client.t(),
          %{required(:location_id) => binary()},
          SquareUp.TypeSpecs.v1_create_refund_request(),
          %{}
        ) :: SquareUp.Client.response(SquareUp.TypeSpecs.v1_refund())
  def create(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{location_id: spec(is_binary())})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.v1_create_refund_request/0)
    query_params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.v1_refund/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v1/{location_id}/refunds"
    })
  end
end
