defmodule SquareUp.V2.CatalogItems do
  import SquareUp.Client, only: [call: 2]

  @spec search(SquareUp.Client.t(), %{}, SquareUp.TypeSpecs.search_catalog_items_request()) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.search_catalog_items_response())
  def search(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{})
    params_spec = Norm.Delegate.delegate(&SquareUp.NormSchema.search_catalog_items_request/0)

    response_spec = {:delegate, &SquareUp.ResponseSchema.search_catalog_items_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/catalog/search-catalog-items"
    })
  end
end