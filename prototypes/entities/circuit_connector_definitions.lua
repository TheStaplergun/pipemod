local file_path = "__underground-pipe-pack__/graphics/entity/circuit-connector/"
underground_pump_connector_template =
{
  connector_main =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-base-sequence.png",
    frame_count = 4,
    height = 96,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    scale = 0.5,
    shift = {0, 0.1875},
    width = 96
  },

  connector_shadow =
  {
    draw_as_shadow = true,
    filename = file_path .. "hr-ccm-underground-pump-01-base-shadow.png",
    frame_count = 4,
    height = 5,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    scale = 0.5,
    shift = util.by_pixel(0, 0),
    width = 5
  },

  led_blue_off =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-LED-B-off-sequence.png",
    frame_count = 4,
    height = 26,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    scale = 0.5,
    shift = util.by_pixel(-1.5, 2),
    width = 46
  },

  led_blue =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-LED-B-on-sequence.png",
    frame_count = 4,
    height = 42,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    draw_as_glow = true,
    scale = 0.5,
    shift = util.by_pixel(-1.5, 2),
    width = 60
  },

  led_green =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-LED-G-sequence.png",
    frame_count = 4,
    height = 96,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    draw_as_glow = true,
    scale = 0.5,
    shift = {0, 0.1875},
    width = 96
  },

  led_red =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-LED-R-sequence.png",
    frame_count = 4,
    height = 96,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    draw_as_glow = true,
    scale = 0.5,
    shift = {0, 0.1875},
    width = 96
  },

  wire_pins =
  {
    filename = file_path .. "hr-ccm-underground-pump-01-wire-sequence.png",
    frame_count = 4,
    height = 96,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    scale = 0.5,
    shift = {0, 0.1875},
    width = 96
  },

  wire_pins_shadow =
  {
    draw_as_shadow = true,
    filename = file_path .. "hr-ccm-underground-pump-01-wire-shadow.png",
    frame_count = 4,
    height = 96,
    line_length = 4,
    priority = "extra-high",
    flags = { "low-object" },
    scale = 0.5,
    shift = {0.125, 0.1875},
    width = 96
  },

  wire_offset_hotfix = util.by_pixel(0, 0),
  wire_shadow_offset_hotfix = util.by_pixel(-1, 2),
  light_offset_hotfix = util.by_pixel(0, 0),
  wire_offsets =
  {
    { red = util.by_pixel(15.5, -9), green = util.by_pixel(18.5, -4.5) },
    { red = util.by_pixel(12, -11.5), green = util.by_pixel(17, -8.5) },
    { red = util.by_pixel(20.5, 12), green = util.by_pixel(16, 16) },
    { red = util.by_pixel(-12.5, -10.5), green = util.by_pixel(-18.5, -8.5) }
  },

  wire_shadow_offsets =
  {
    { red = util.by_pixel(21, -9.5), green = util.by_pixel(23.5, -5.5) },
    { red = util.by_pixel(16, -10), green = util.by_pixel(23.5, -9) },
    { red = util.by_pixel(25, 11), green = util.by_pixel(21.5, 17) },
    { red = util.by_pixel(-6.5, -11.5), green = util.by_pixel(-11.5, -7.5) }
  },

  light_offsets =
  {
    { rg = util.by_pixel(-14, -6.5), b = util.by_pixel(-14, -6.5) },
    { rg = util.by_pixel(12, 14), b = util.by_pixel(12, 14) },
    { rg = util.by_pixel(-13, 12.5), b = util.by_pixel(-13, 12.5) },
    { rg = util.by_pixel(-12.5, 12), b = util.by_pixel(-12.5, 12) }
  }
}

circuit_connector_definitions["underground-mini-pump"] = circuit_connector_definitions.create_vector(
  underground_pump_connector_template,
  {
    { variation = 2, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true },
    { variation = 3, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(0, 0), show_shadow = true },
    { variation = 0, main_offset = util.by_pixel(0, -0), shadow_offset = util.by_pixel(0, 0), show_shadow = true },
    { variation = 1, main_offset = util.by_pixel(0, -0), shadow_offset = util.by_pixel(0, 0), show_shadow = true }
  }
)
