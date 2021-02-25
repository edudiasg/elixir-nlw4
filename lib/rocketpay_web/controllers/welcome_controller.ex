defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  # toda funcao e um controller recebe dois params:
  # underline diz que nao fara nada com o parametro
  # |> IO.inspect() -- verificar a saida
  def index(conn, %{"filename" => filename}) do
    # text(conn, "Welcome to the Rocketpay API")
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to the Rocketpay API. Here is your number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
