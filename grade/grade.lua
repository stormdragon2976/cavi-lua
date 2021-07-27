function average(...)
    local count = 0
    local grades = {...}
    local total = 0
    for i, j in pairs(grades) do
        if tonumber(j) then
            count = count + 1
            total = total + j
        else
            print("Entry " .. i .. " with value " .. j .. " is not numeric, skipping.")
        end
    end
    return math.ceil(total / count)
end


if #arg == 0 then
    print("Usage grade.lua grade 1, grade 2, etc.")
else
    print("Grade average is " .. average(table.unpack(arg)))
end
