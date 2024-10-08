timestamp = fn -> # for use in your prompt
  {_date, {hour, minute, _second}} = :calendar.local_time
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

IEx.configure(
  default_prompt: 
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",
  inspect: [
    custom_options: [sort_maps: true]
  ]
)

defmodule TelemetryHelper do
  @moduledoc """
  Helper functions for seeing all telemetry events.
  Only for use in development.
  """

  @doc """
  attach_all/0 prints out all telemetry events received by default.
  Optionally, you can specify a handler function that will be invoked
  with the same three arguments that the `:telemetry.execute/3` and
  `:telemetry.span/3` functions were invoked with.
  """
  def attach_all(function \\ &default_handler_fn/3) do
    # Start the tracer
    :dbg.start()

    # Create tracer process with a function that pattern matches out the three arguments the telemetry calls are made with.
    :dbg.tracer(
      :process,
      {fn
         {_, _, _, {_mod, :execute, [name, measurement, metadata]}}, _state ->
           function.(name, metadata, measurement)

         {_, _, _, {_mod, :span, [name, metadata, span_fun]}}, _state ->
           function.(name, metadata, span_fun)
       end, nil}
    )

    # Trace all processes
    :dbg.p(:all, :c)

    # Trace calls to the functions used to emit telemetry events
    :dbg.tp(:telemetry, :execute, 3, [])
    :dbg.tp(:telemetry, :span, 3, [])
  end

  def stop do
    # Stop tracer
    :dbg.stop()
  end

  defp default_handler_fn(name, metadata, measure_or_fun) do
    # Print out telemetry info
    IO.puts(
      "Telemetry event:#{inspect(name)}\nwith #{inspect(measure_or_fun)} and #{inspect(metadata)}"
    )
  end
end

