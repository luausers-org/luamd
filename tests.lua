
local tests = {
  {[=[]=], [=[]=]},
  {[=[ ]=], [=[]=]},
  {[=[  ]=], [=[]=]},
  {"\t", [=[]=]},
  {"\t ", [=[]=]},
  {[=[a]=], [=[<p>a</p>]=]},
  {[=[a
]=], [=[<p>a</p>]=]},
{[=[
a]=], [=[<p>a</p>]=]},
  {[=[a
 ]=], [=[<p>a</p>]=]},
{[=[ 
a]=], [=[<p>a</p>]=]},
  {[=[ a
]=], [=[<p> a</p>]=]},
{[=[
 a]=], [=[<p> a</p>]=]},
  {[=[abc efg]=], [=[<p>abc efg</p>]=]},
  {[=[abc
efg]=], [=[<p>abc
efg</p>]=]},
  {[=[ abc
 efg]=], [=[<p> abc
 efg</p>]=]},
    {[=[abc

efg]=], [=[<p>abc</p>
<p>efg</p>]=]},
    {[=[abc


efg]=], [=[<p>abc</p>
<p>efg</p>]=]},
{[=[

z

]=], [=[<p>z</p>]=]},
    {[=[abc
x
y
efg]=], [=[<p>abc
x
y
efg</p>]=]},
    {[=[abc
 
 
efg]=], [=[<p>abc</p>
<p>efg</p>]=]},
    {[=[*a*]=], [=[<p><em>a</em></p>]=]},
    {[=[*a**b*]=], [=[<p><em>a</em><em>b</em></p>]=]},
    {[=[*a]=], [=[<p>*a</p>]=]},
    {[=[**a*]=], [=[<p>**a*</p>]=]},
    {[=[* *a*]=], [=[<ul>
<li><em>a</em></li>
</ul>]=]},
    {[=[**a****b**]=], [=[<p><strong>a</strong><strong>b</strong></p>]=]},
    {[=[**a** **b**]=], [=[<p><strong>a</strong> <strong>b</strong></p>]=]},
    {[=[**a* *b**]=], [=[<p><strong>a<em> </em>b</strong></p>]=]},
    {[=[**a**]=], [=[<p><strong>a</strong></p>]=]},
    {[=[**a*]=], [=[<p>**a*</p>]=]},
    {[=[*a**]=], [=[<p><em>a</em>*</p>]=]},
    {[=[***a*]=], [=[<p>**<em>a</em></p>]=]},
    {[=[***a**]=], [=[<p><strong>*a</strong></p>]=]},
    {[=[**_a**]=], [=[<p><strong>_a</strong></p>]=]},
    {[=[**_a_**]=], [=[<p><strong><em>a</em></strong></p>]=]},
    {[=[**_a**_]=], [=[<p><strong>_a</strong>_</p>]=]},
    {[=[***a**b]=], [=[<p><strong>*a</strong>b</p>]=]},
    {[=[***a*b**]=], [=[<p><strong><em>a</em>b</strong></p>]=]},
    {[=[*a**b**c*]=], [=[<p><em>a</em><em>b</em><em>c</em></p>]=]},
    {[=[**a****b****c**]=], [=[<p><strong>a</strong><strong>b</strong><strong>c</strong></p>]=]},
    {[=[*a***b***c*]=], [=[<p><em>a</em><strong>b</strong><em>c</em></p>]=]},
    {[=[**a***b***c**]=], [=[<p><strong>a</strong><em>b</em><strong>c</strong></p>]=]},
    {[=[_a_]=], [=[<p><em>a</em></p>]=]},
    {[=[~~a~~]=], [=[<p><strike>a</strike></p>]=]},
    {[=[__a__]=], [=[<p><strong>a</strong></p>]=]},
    {[=[___a___]=], [=[<p><strong>_a</strong>_</p>]=]},
    {[=[_a*]=], [=[<p>_a*</p>]=]},
    {[=[*a*
*b*
*c*]=], [=[<p><em>a</em>
<em>b</em>
<em>c</em></p>]=]},
    {[=[*a*
*b**d**e*
*c*]=], [=[<p><em>a</em>
<em>b</em><em>d</em><em>e</em>
<em>c</em></p>]=]},
    {[=[`a`]=], [=[<p><code>a</code></p>]=]},
    {[=[`a``b`]=], [=[<p><code>a</code><code>b</code></p>]=]},
    {[=[`a`
`b`]=], [=[<p><code>a</code>
<code>b</code></p>]=]},
    {[=[#a]=], [=[<h1>a</h1>]=]},
    {[=[#a#]=], [=[<h1>a#</h1>]=]},
    {[=[##a]=], [=[<h2>a</h2>]=]},
    {[=[## a]=], [=[<h2>a</h2>]=]},
    {[=[### a]=], [=[<h3>a</h3>]=]},
    {[=[#### a]=], [=[<h4>a</h4>]=]},
    {[=[##### a]=], [=[<h5>a</h5>]=]},
    {[=[###### a]=], [=[<h6>a</h6>]=]},
    {[=[####### a]=], [=[<h6>#a</h6>]=]},
    {[=[# *a*]=], [=[<h1><em>a</em></h1>]=]},
    {[=[ # *a*]=], [=[<h1><em>a</em></h1>]=]},
    {[=[\#a]=], [=[<p>&#35;a</p>]=]},
    {[=[\]=], [=[<p>\</p>]=]},
    {[=[\\]=], [=[<p>&#92;</p>]=]},
    {[=[*\\*]=], [=[<p><em>&#92;</em></p>]=]},
    {[=[*\*]=], [=[<p>*&#42;</p>]=]},
    {[=[*\**]=], [=[<p><em>&#42;</em></p>]=]},
    {[=[\###### a]=], [=[<p>&#35;##### a</p>]=]},
    {[=[\#
##### a]=], [=[<p>&#35;</p>
<h5>a</h5>]=]},
    {[=[\`a`]=], [=[<p>&#96;a`</p>]=]},
    {[=[\`a`b`]=], [=[<p>&#96;a<code>b</code></p>]=]},
    {[=[\`a`b``c`]=], [=[<p>&#96;a<code>b</code><code>c</code></p>]=]},
    {[=[\&#96;]=], [=[<p>&#38;#96;</p>]=]},
    {[=[[a][b][c]]=], [=[<p><a href="a">a</a><a href="b">b</a><a href="c">c</a></p>]=]},
    {[=[![a](b)]=], [=[<p><img alt="a" src="b"></p>]=]},
    {[=[![a](b)![c](d)]=], [=[<p><img alt="a" src="b"><img alt="c" src="d"></p>]=]},
    {[=[[a](1)[b](2)[c](3)]=], [=[<p><a href="1">a</a><a href="2">b</a><a href="3">c</a></p>]=]},
    {[=[[a](1)[b][c](3)]=], [=[<p><a href="1">a</a><a href="b">b</a><a href="3">c</a></p>]=]},
    {[=[[a](1)[b c]]=], [=[<p><a href="1">a</a><a href="b c">b c</a></p>]=]},
    {[=[[a b]: ok
[a b]]=], [=[<p><a href="ok">a b</a></p>]=]},
    {[=[\[a b]: ok
[a b]]=], [=[<p>&#91;a b]: ok
<a href="a b">a b</a></p>]=]},
    {[=[[a b]: ok
![a b]]=], [=[<p><img alt="a b" src="ok"></img></p>]=]},
    {[=[[a b]:
[a b]]=], [=[<p><a href="">a b</a></p>]=]},
    {[=[
[a b]
[a b]: ok]=], [=[<p><a href="ok">a b</a></p>]=]},
    {[=[
[a b]
[a b]: ok
[c]]=], [=[<p><a href="ok">a b</a></p>
<p><a href="c">c</a></p>]=]},
    {[=[---]=], [=[<hr>]=]},
    {[=[a
---]=], [=[<h2>a</h2>]=]},
    {[=[a
===]=], [=[<h1>a</h1>]=]},
    {[=[a

===]=], [=[<p>a</p>
<p>===</p>]=]},
    {[=[[a]: 1]=], [=[]=], {a = "1"}},
    {[=[[a]:1]=], [=[]=], {a = "1"}},
    {[=[
[a]:1]=], [=[]=], {a = "1"}},
    {[=[*a*
[a]:1]=], [=[<p><em>a</em></p>]=], {a = "1"}},
    {[=[[b]:2
[a]:1]=], [=[]=], {a = "1"}},
    {[=[[b]:2
[a]:1]=], [=[]=], {a = "1", b = "2"}},
    {[=[[b]:2
*a*
[a]:1]=], [=[<p><em>a</em></p>]=], {a = "1", b = "2"}},
    {[=[[b]:2
[a]
[a]:1]=], [=[<p><a href="1">a</a></p>]=]},
    {[=[[b]:2
[a][b]
[a]:1]=], [=[<p><a href="1">a</a><a href="2">b</a></p>]=]},
    {[=[[b]:2
[a](3)[b]
[a]:1]=], [=[<p><a href="3">a</a><a href="2">b</a></p>]=]},
    {[=[[b]:2
[a](3)[b]()
[a]:1]=], [=[<p><a href="3">a</a><a href="">b</a></p>]=]},
    {[=[---
===]=], [=[<hr>
<p>===</p>]=]},
    {[=[===
---]=], [=[<h2>===</h2>]=]},
    {[=[<span></span>]=], [=[<span></span>
]=]},
    {[=[<span>
</span>]=], [=[<span>
</span>
]=]},
    {[=[<span>
  <br>
</span>]=], [=[<span>
  <br>
</span>
]=]},
    {[=[<span>
<br>
</span>]=], [=[<span>
<br>
</span>
]=]},
    {[=[<span>
a
</span>]=], [=[<span>
<p>a</p>
</span>
]=]},
    {[=[<span>
 a
</span>]=], [=[<span>
 a
</span>
]=]},
    {[=[<span>
 *a*
</span>]=], [=[<span>
 *a*
</span>
]=]},
    {[=[<span>
*a*
</span>]=], [=[<span>
<p><em>a</em></p>
</span>
]=]},
    {[=[```
```]=], [=[<pre><code></code></pre>]=]},
    {[=[```lua
```]=], [=[<pre><code class="language-lua"></code></pre>]=]},
    {[=[*```lua
*```]=], [=[<p>*<code></code>`lua
*<code></code>`</p>]=]},
    {[=[<html>
]=], [=[<html>
]=]},
    {[=[a<html>
]=], [=[<p>a<html></p>]=]},
    {[=[<html>a
]=], [=[<html>a
]=]},
    {[=[``````
```]=], [=[<pre><code class="language-```"></code></pre>]=]},
    {[=[\``````
\```]=], [=[<p>&#96;<code></code><code></code>`
&#96;<code></code></p>]=]},
    {[=[```
<html>
```]=], [=[<pre><code><html>
</code></pre>]=]},
    {[=[```
<html>
    a
</html>
```]=], [=[<pre><code><html>
    a
</html>
</code></pre>]=]},
    {[=[<html>
```
```
</html>]=], [=[<html>
<pre><code></code></pre></html>
]=]},
    {[=[<html>
    ```
    ```
</html>]=], [=[<html>
    ```
    ```
</html>
]=]},
    {[=[<html>
    \```
    ```
</html>]=], [=[<html>
    &#96;``
    ```
</html>
]=]},
    {[=[> a]=], [=[<blockquote><p>a</p>
</blockquote>]=]},
    {[=[> a
> b]=], [=[<blockquote><p>a
b</p>
</blockquote>]=]},
    {[=[> a

> b]=], [=[<blockquote><p>a</p>
</blockquote><blockquote><p>b</p>
</blockquote>]=]},
    {[=[a
> b]=], [=[<p>a</p>
<blockquote><p>b</p>
</blockquote>]=]},
    {[=[>a

> b]=], [=[<p>>a</p>
<blockquote><p>b</p>
</blockquote>]=]},
    {[=[* a]=], [=[<ul>
<li>a</li>
</ul>]=]},
    {[=[* a
* b]=], [=[<ul>
<li>a</li>
<li>b</li>
</ul>]=]},
    {[=[* *a*
* b]=], [=[<ul>
<li><em>a</em></li>
<li>b</li>
</ul>]=]},
    {[=[1. a]=], [=[<ol>
<li>a</li>
</ol>]=]},
    {[=[1. a
* a]=], [=[<ol>
<li>a</li>

</ol>
<ul>
<li>a</li>
</ul>]=]},
    {[=[1. _a_
* a]=], [=[<ol>
<li><em>a</em></li>

</ol>
<ul>
<li>a</li>
</ul>]=]},
    {[=[`a\[c]b`]=], [=[<p><code>a&#91;c]b</code></p>]=]},
    {[=[[^2]: footnote
[^1][a][c][^2]
[^1]: footnote
[c]:https://google.com]=], [=[<p><a href="#fn1" id="fnref1"><sup>1</sup></a><a href="a">a</a><a href="https://google.com">c</a><a href="#fn2" id="fnref2"><sup>2</sup></a></p>
<hr><p id="fn2"><a href="#fnref2">2</a>: footnote</p><p id="fn1"><a href="#fnref1">1</a>: footnote</p>]=]},
    {[=[[^1]: t]=], [=[<hr><p id="fn1"><a href="#fnref1">1</a>: t</p>]=]},
    {[=[[]]=], [=[<p><a href=""></a></p>]=]},
    {[=[[^1]]=], [=[<p><a href="^1">^1</a></p>]=]},
    {[=[[^*1*]]=], [=[<p>[^<em>1</em>]</p>]=]},
    {[=[[*1*]]=], [=[<p>[<em>1</em>]</p>]=]},
    {[=[[\^1]]=], [=[<p><a href="&#94;1">&#94;1</a></p>]=]},
    {[=[[^1]: t
[^1]]=], [=[<p><a href="#fn1" id="fnref1"><sup>1</sup></a></p>
<hr><p id="fn1"><a href="#fnref1">1</a>: t</p>]=]},
    {[=[[^1]: *t*
[^1]]=], [=[<p><a href="#fn1" id="fnref1"><sup>1</sup></a></p>
<hr><p id="fn1"><a href="#fnref1">1</a>: *t*</p>]=]},
}

local luamd = require "luamd"
for index = 1, #tests do
  local test = tests[index]
  local result, data = luamd(test[1])

  local invalid = false
  if result and test[3] then
    for k,v in pairs(test[3]) do
      if data[k] ~= v then
        invalid = "\nInvalid data:\n'" .. k .. "' = '" .. (data[k] or "") .. "'\nExpected:\t\t'" .. k .. "' = '" .. test[3][k] .. "'"
        break
      end
    end
  end
  
  if type(test[2]) == "string" then
    if result == test[2] then
      --success
    else
      --error
        if not result then
            error("Invalid test match:\nMarkdown:\t\t" .. test[1] .. "\nResult:\t\t\terror ('" .. (type(data) == "string" and data:gsub("^.-%d+:%s*(.*)", "%1") or "no description") .. "')\nExpected:\t\t" .. test[2])
        else
            error("Invalid test match:\nMarkdown:\t\t" .. test[1] .. "\nResult:\t\t\t" .. result .. "\nExpected:\t\t" .. test[2])
        end
    end
  elseif not test[2] then
    if not result then
      --success
      if type(test[3]) == "string" then
        --success
        if data:gsub("^.-%d+:%s*(.*)", "%1") == test[3] then
          --success
        else
          error("Invalid test match:\nMarkdown:\t\t" .. test[1] .. "\nResult:\t\t\terror ('" .. (type(data) == "string" and data:gsub("^.-%d+:%s*(.*)", "%1") or "no description") .. "')\nExpected:\t\terror ('" .. (type(test[3]) == "string" and  test[3] or "no description") .. "')")
        end
      end
    else
      --error
      error("Invalid test match:\nMarkdown:\t\t" .. test[1] .. "\nResult:\t\t\t" .. result .. "\nExpected:\t\terror ('" .. (type(test[3]) == "string" and  test[3] or "no description") .. "')")
    end
  end
  if invalid then
    error(invalid)
  end
end

print(#tests .. " tests passed!")
