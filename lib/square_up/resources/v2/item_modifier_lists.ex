defmodule SquareUp.V2.ItemModifierLists do
  import SquareUp.Client, only: [call: 2]

  @spec update(SquareUp.Client.t(), %{}, SquareUp.TypeSpecs.update_item_modifier_lists_request()) ::
          SquareUp.Client.response(SquareUp.TypeSpecs.update_item_modifier_lists_response())
  def update(client, path_params \\ %{}, params \\ %{}) do
    path_params_spec = schema(%{})

    params_spec =
      Norm.Delegate.delegate(&SquareUp.NormSchema.update_item_modifier_lists_request/0)

    response_spec = {:delegate, &SquareUp.ResponseSchema.update_item_modifier_lists_response/0}

    call(client, %{
      method: :post,
      path_params: path_params,
      params: params,
      path_params_spec: path_params_spec,
      params_spec: params_spec,
      response_spec: response_spec,
      path: "/v2/catalog/update-item-modifier-lists"
    })
  end
end