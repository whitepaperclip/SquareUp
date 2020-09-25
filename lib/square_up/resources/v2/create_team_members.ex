defmodule SquareUp.V2.CreateTeamMembers do
  import Norm
  import SquareUp.Client, only: [call: 2]

  @spec bulk(%SquareUp.Client{}, SquareUp.Schema.bulk_create_team_members_request()) ::
          SquareUp.Client.response()
  def bulk(client, params \\ %{}) do
    norm_spec = Norm.Delegate.delegate(&SquareUp.Schema.bulk_create_team_members_request/0)

    call(client, %{
      method: :post,
      params: params,
      spec: norm_spec,
      path: "/v2/team-members/bulk-create"
    })
  end
end
