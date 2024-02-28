package = "luamd"
version = "0.0-3"
source = {
    url = "git://github.com/luausers-org/luamd",
    tag = "0.0-3"
}
description = {
    summary = "Markdown to HTML in pure Lua.",
    detailed = [[
        luamd is a Markdown to HTML renderer written in portable, pure Lua. It's also really easy to use.
    ]],
    homepage = "https://github.com/luausers-org/luamd",
    license = "MIT"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        luamd = "luamd.lua"
    }
}
