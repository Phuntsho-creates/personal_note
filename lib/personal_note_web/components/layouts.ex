defmodule PersonalNoteWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use PersonalNoteWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="navbar px-4 sm:px-6 lg:px-8">
      <%!-- <div class="flex-1">
        <a href="/" class="flex-1 flex w-fit items-center gap-2">

          <span class="text-sm font-semibold">v{Application.spec(:phoenix, :vsn)}</span>
        </a>
      </div> --%>
      <%!-- <div class="flex-none">
        <ul class="flex flex-column px-1 space-x-4 items-center">
          <li>
            <a href="https://phoenixframework.org/" class="btn btn-ghost">Website</a>
          </li>
          <li>
            <a href="https://github.com/phoenixframework/phoenix" class="btn btn-ghost">GitHub</a>
          </li>
          <%!-- <li>
            <.theme_toggle />
          </li> --%>
          <%!-- <li>
            <a href="https://hexdocs.pm/phoenix/overview.html" class="btn btn-primary">
              Get Started <span aria-hidden="true">&rarr;</span>
            </a>
          </li>
        </ul>
      </div> --%>
    </header>

    <main class="px-4 py-20 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-2xl space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="dark"
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end
  def nav(assigns) do
  ~H"""
  <div class={[
        "fixed top-0 left-10 right-10 mt-10 z-10 transition-all duration-500 rounded-xl dark:bg-gray-100",
        "bg-base-content/50 dark:bg-gray-100 backdrop-blur-md shadow-lg"
      ]}>
    <ul class="border bg-base-200 flex justify-center gap-5 p-8 rounded-xl shadow-2xl border-base-100 text-l font-bold">

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-translate-y-1 hover:scale-105">
      <.link navigate={~p"/"}>Features</.link></li>

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-translate-y-1 hover:scale-105">
      <.link navigate={~p"/"}>Reviews</.link></li>

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-transalte-y-1 hover:scale-105">
      <.link navigate={~p"/"}>FAQs</.link></li>

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-transalte-y-1 hover:scale-105">
      <.link navigate={~p"/"}>Contact Us</.link></li>

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-transalte-y-1 hover:scale-105">
        <.link navigate={~p"/login"}>
          <.icon name="hero-user" /> Log in
        </.link>
      </li>

      <li class="shadow-2xl hover:shadow-2xl transition transform hover:-transalte-y-1 hover:scale-105">
        <.link navigate={~p"/register"}>
          <.icon name="hero-user" /> Register
        </.link>
      </li>

      <.theme_toggle />

    </ul>
  </div>
  """
end

def footer(assigns)do
  ~H"""
  <footer class="mt-12 text-lg p-10 shadow-2xl border-shadow-2xl mb-2 bg-base-300">

   <h1 class="flex justify-center text-red-900"> © 2026 Personal Notes App</h1>
  <p class="dark:text-base-content">Company</p>
  <hr>
  <p class="text-green-900 dark:text-base-content">Contact Us </p>
  <p class="text-green-900 dark:text-base-content">About Us</p>
  <p class="text-green-900 dark:text-base-content">Privicy Policy</p>
  <p class="text-green-900 dark:text-base-content">Terms And Conditions</p>
  </footer>
  """
end
end
