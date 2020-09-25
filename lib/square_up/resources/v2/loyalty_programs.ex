defmodule SquareUp.V2.LoyaltyPrograms do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec list(SquareUp.Client.t(), %{}, %{}) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.list_loyalty_programs_response())
  def list(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{})
    params_spec = schema(%{})

    response_spec = {:delegate, &SquareUp.ResponseSchema.list_loyalty_programs_response/0}

    call(client, %{
      method: :get,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/loyalty/programs"
    })
  end
end