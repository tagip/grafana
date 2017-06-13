defmodule Grafana.Panel.Embed do
  def api_host, do: Application.get_env(:grafana, :api_host)
  def username, do: Application.get_env(:grafana, :username)
  def password, do: Application.get_env(:grafana, :password)

  # model
  # <iframe src="http://xxx.xxx.xxx.xxx:3000/dashboard-solo/db/worldping-endpoint-ping?panel_id=1" width="450" height="200" frameborder="0"></iframe>
  defp build_src(uri, panel_id, refresh, from, to) do
    "#{api_host()}/dashboard-solo/db/#{uri}?panelId=#{panel_id}&refresh=#{refresh}&from=#{from}&to=#{to}"
  end

  defp build_src(uri, panel_id) do
    "#{api_host()}/dashboard-solo/db/#{uri}?panelId=#{panel_id}"
  end

  def get_html(uri, panel_id, width, height, border, refresh, from, to) do
    src = build_src uri, panel_id, refresh, from, to
    "<iframe src=\"#{src}\" width=\"#{width}\" height=\"#{height}\" frameborder=\"#{border}\"></iframe>"
  end

  def get_html(uri, panel_id, width, height, border) do
    src = build_src uri, panel_id
    "<iframe src=\"#{src}\" width=\"#{width}\" height=\"#{height}\" frameborder=\"#{border}\"></iframe>"
  end

  def model(uri, panel_id, width, height, border, refresh, from, to) do
    src = build_src uri, panel_id, refresh, from, to
    %{src: src, width: width, height: height, frameborder: border, refresh: refresh, from: from, to: to}
  end

  def model(uri, panel_id, width, height, border) do
    src = build_src uri, panel_id
    %{src: src, width: width, height: height, frameborder: border}
  end

end
