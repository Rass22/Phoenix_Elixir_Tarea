defmodule TareaPetHealthExpertWeb.VeterinarioControllerTest do
  use TareaPetHealthExpertWeb.ConnCase

  import TareaPetHealthExpert.PetHealthExpertFixtures

  @create_attrs %{age: 42, email: "some email", especialidad: "some especialidad", name: "some name", sex: "some sex"}
  @update_attrs %{age: 43, email: "some updated email", especialidad: "some updated especialidad", name: "some updated name", sex: "some updated sex"}
  @invalid_attrs %{age: nil, email: nil, especialidad: nil, name: nil, sex: nil}

  describe "index" do
    test "lists all veterinarios", %{conn: conn} do
      conn = get(conn, Routes.veterinario_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Veterinarios"
    end
  end

  describe "new veterinario" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.veterinario_path(conn, :new))
      assert html_response(conn, 200) =~ "New Veterinario"
    end
  end

  describe "create veterinario" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.veterinario_path(conn, :create), veterinario: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.veterinario_path(conn, :show, id)

      conn = get(conn, Routes.veterinario_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Veterinario"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.veterinario_path(conn, :create), veterinario: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Veterinario"
    end
  end

  describe "edit veterinario" do
    setup [:create_veterinario]

    test "renders form for editing chosen veterinario", %{conn: conn, veterinario: veterinario} do
      conn = get(conn, Routes.veterinario_path(conn, :edit, veterinario))
      assert html_response(conn, 200) =~ "Edit Veterinario"
    end
  end

  describe "update veterinario" do
    setup [:create_veterinario]

    test "redirects when data is valid", %{conn: conn, veterinario: veterinario} do
      conn = put(conn, Routes.veterinario_path(conn, :update, veterinario), veterinario: @update_attrs)
      assert redirected_to(conn) == Routes.veterinario_path(conn, :show, veterinario)

      conn = get(conn, Routes.veterinario_path(conn, :show, veterinario))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, veterinario: veterinario} do
      conn = put(conn, Routes.veterinario_path(conn, :update, veterinario), veterinario: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Veterinario"
    end
  end

  describe "delete veterinario" do
    setup [:create_veterinario]

    test "deletes chosen veterinario", %{conn: conn, veterinario: veterinario} do
      conn = delete(conn, Routes.veterinario_path(conn, :delete, veterinario))
      assert redirected_to(conn) == Routes.veterinario_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.veterinario_path(conn, :show, veterinario))
      end
    end
  end

  defp create_veterinario(_) do
    veterinario = veterinario_fixture()
    %{veterinario: veterinario}
  end
end
