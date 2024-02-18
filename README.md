# luamd
luamd is a Markdown to HTML renderer written in portable, pure Lua. It's also really easy to use.

```lua
local md = require "md"
local htmlFragment, links = assert(md[[
[my_metadata]: 1
# This is Some Markdown
Write whatever you want. \*escape\*
* Supports Lists
* And [other][1] features
<table>
   <td>html. Caution: The HTML is not sanitized. User can <script>inject attacks</script>! Sanitize it before send to browser</td>
</table>
[1]: https://example.com
]])
print(links["my_metadata"]) --> "1"
```

## Install
Copy `md.lua` to your project in whatever directory you want.

## Use it
Render markdown from a string. On bad input, retuns nil and an error message.
```lua
local html, err_or_metadata = md.renderString(str, options)
```

Render markdown from a line iterator. An iterator is a function the returns successive lines
when called repeatedly, and nil when there are no lines left.
```lua
local html, err_or_metadata = md.renderLineIterator(iter, options)
```

Render markdown from a list like table of lines.
```lua
local html, err_or_metadata = md.renderTable(t, options)
```

Renders strings, iterators, and tables.
```lua
local html, err_or_metadata = md.render(object, options)
```

Calling the module as a function will invoke `md.render`. This is the easiest way to use the module.

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

There is no unit-testing yet, but testing can be done by running the testrender.lua script. This
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
