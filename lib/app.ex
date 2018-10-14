defmodule SampleApp.App do
  use Application
  def start(_type, _args) do
    children = [
      # Define workers and child supervisors to be supervised
      Plug.Adapters.Cowboy2.child_spec(scheme: :http, plug: SampleApp.MyPlug, options: [port: 4000])
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end

