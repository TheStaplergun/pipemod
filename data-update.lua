itemlist =
{
  "one-to-one-forward-space-pipe",
  "one-to-two-perpendicular-space-pipe",
  "one-to-three-forward-space-pipe",
  "one-to-four-space-pipe",
  "underground-i-space-pipe",
  "underground-L-space-pipe",
  "underground-t-space-pipe",
  "underground-cross-space-pipe",

}

if mods["space-exploration"] then
  require("prototypes.recipes.recipes-space-pipes")
  se_allow_in_space["one-to-one-forward-space-pipe"] = true
end
