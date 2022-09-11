local Json = require('plugins/lunajson')
local math = require('math')

local M = {}

function readJsonFile(fileName)
    open = io.open

    local file = open(fileName, "r")
    local content = file:read "*a"
    file:close()

    content = Json.decode(content)

    return content
end

function M.randomQuote()
    data = readJsonFile("lua/plugins/fortunes.json")

    len = #data.quotes

    ind = math.random(0, len)

    return data.quotes[ind]
end

return M

