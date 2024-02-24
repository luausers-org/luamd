# luamd
**luamd** is a Markdown to HTML renderer written in portable, pure Lua. It's also really easy to use. 

```lua
local luamd = require "luamd"
local html = assert(luamd[[
# This is Some Markdown
Write whatever you want. \*escape\*
* Supports Lists
* And [other] features
<table>
   <td>html. Caution: The HTML is not sanitized. User can <script>inject attacks</script>! Sanitize it before send to browser</td>
</table>
[other]: https://example.com
]])
print(html)
```

_It is recommended that you pass the markdown string to `luamd(...)` using double brackets (`[[ ... ]]` or `[=[ ... ]=]`) instead of quotes (`" ... "`)._

## Install
Copy `luamd.lua` to your project in whatever directory you want.

## Usage in Redbean
Copy `luamd.lua` to `.lua/` directory.

## Features
* **Bold**: \*\*text\*\* or \_\_text\_\_
* *Italic*: \*text\* or \_text\_
* **_Bold + Italic_**: \*\*\_text\_\*\* or \_\_\*text\*\_\_
* ~~Strikethrough~~: `~~text~~`
* `Code`: \`text\`
* Block:<br/>
  \`\`\`\[language\]<br/>
  ...<br/>
  \`\`\`
* Unsanitized HTML:<br/>
  \<tag\><br/>
   ... (requires indent)<br/>
  \</tag\>
* Blockquote:<br/>
  \> text
* Numbered lists:<br/>
  1\. text<br/>
  2\. text
* Regular list:<br/>
  \* text<br/>
  \* text
* Link:<br/>
  \[label\]\(url\)<br/>
  \[reference\]<br/>
  \[url\]
* Reference:<br/>
  \[name\]: value

_All references are returned as the second argument in a table. You can use them as metadata._

```lua
local luamd = require "luamd"
local html, metadata = luamd[[
[document year]: 2024
[website]: http://example.com
Access [website]
]]
print(metadata["document year"]) --> "2024" (as string)
```

_Escape any markdown special char by preceding with \\_

```lua
local luamd = require "luamd"
local html = luamd[[
\*normal\*
]]
print(html) --> <p>&#42;normal&#42;</p>
```

## Use it
Render markdown from a string. On bad input, retuns nil and an error message.
```lua
local html, err_or_metadata = luamd.renderString(str, options)
```

Render markdown from a line iterator. An iterator is a function the returns successive lines
when called repeatedly, and nil when there are no lines left.
```lua
local html, err_or_metadata = luamd.renderLineIterator(iter, options)
```

Render markdown from a list like table of lines.
```lua
local html, err_or_metadata = luamd.renderTable(t, options)
```

Renders strings, iterators, and tables.
```lua
local html, err_or_metadata = luamd.render(object, options)
```

Calling the module as a function will invoke `luamd.render`. This is the easiest way to use the module.

The options table is an optional table of options. The currently supported options are below.
* `tag` - Surrounding HTML tag for HTML fragment.
* `attributes` - A table attributes for the surround HTML node. For example, `{ style = "padding: 10px;" }`.
* `insertHead` - An HTML fragment to insert before the main body of HTML. (Inserted after the wrapping tag, if present.)
* `insertTail` - An HTML fragment to insert after the main body of HTML. (Inserted before the closing tag, if present.)
* `prependHead` - An HTML fragment to insert before the main body of HTML. (Inserted before the opening tag, if present.)
* `appendTail` - An HTML fragment to insert after the main body of HTML. (Inserted after the closing tag, if present.)

Here is a little diagram for where the optional fragments go.
```
** prependHead **
<tag [attributes k1="v1" k2="v2" k3="v3" ...]>
    ** insertHead **

    ... rendered markdown ...

    ** insertTail **
</tag>
** appendTail **
```

## Testing

The file `tests.lua` contains some tests to verify if the parser is working correctly.

Testing can be done by running the testrender.lua script. This
builds HTML files in the test_documents directory that correspond to the markdown source files.
Open these with a web browser and assure that they look fine. To add more test documents, place
a markdown file in the test_documents folder and add it to the documents list in testrender.lua.

## Todo

Needs some good unit testing. :).

Supports most of basic Markdown syntax, but there are some features that need to be implemented.
I haven't implemented them because I don't need them - yet.

- [x] (UNSTRUSTED) HTML and code escapes - Probably the most important one on the list.
- [ ] Some alternative syntax for numbered Lists (using `#.`)
- [ ] Indent style code - I prefer backtick quoted code
- [ ] Tables - GitHub style tables would be cool. (Workaround: Use HTML)
- [ ] Footnotes - Might need them, but not yet.

## Bugs

If anyone wants to use this and finds bugs and issues, let me know! I usually can fix things pretty quickly, 
and I appreciate help.
