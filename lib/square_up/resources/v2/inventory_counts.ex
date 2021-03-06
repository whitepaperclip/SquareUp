defmodule SquareUp.V2.InventoryCounts do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec batch_retrieve(
          SquareUp.Client.t(),
          %{},
          SquareUp.TypeSpecs.batch_retrieve_inventory_counts_request(),
          %{}
        ) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.batch_retrieve_inventory_counts_response())
  def batch_retrieve(client, path_params \\ %{}, params \\ %{}, query_params \\ %{}) do
    path_params_spec = schema(%{})

    params_spec =
      Norm.Delegate.delegate(&SquareUp.NormSchema.batch_retrieve_inventory_counts_request/0)

    query_params_spec = schema(%{})

    response_spec =
      {:delegate, &SquareUp.ResponseSchema.batch_retrieve_inventory_counts_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      query_params: query_params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      query_params_spec: query_params_spec,
      response_spec: response_spec,
      path: "/v2/inventory/batch-retrieve-counts"
    })
  end
end
