defmodule SquareUp.V2.Dispute do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec retrieve(SquareUp.Client.t(), %{dispute_id: binary()}, %{}) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.retrieve_dispute_response())
  def retrieve(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{dispute_id: spec(is_binary())})
    params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.retrieve_dispute_response/0}

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/disputes/{dispute_id}"
    })
  end

  @spec accept(SquareUp.Client.t(), %{dispute_id: binary()}, %{}) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.accept_dispute_response())
  def accept(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{dispute_id: spec(is_binary())})
    params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.accept_dispute_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/disputes/{dispute_id}/accept"
    })
  end
end