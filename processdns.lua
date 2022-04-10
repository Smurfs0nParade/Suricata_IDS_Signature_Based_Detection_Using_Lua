function init (args)
    local needs = {}
    needs["payload"] = tostring(true)
    return needs
end

function match(args)
    z = tostring(args["payload"])
    if #z> 0 then
    
    
    --print(a:match "%w+%c%w+")
    query = (z:match "%w+%c%w+")
    --print(query)
    i = string.find(query, "www")
    comCheck = (string.len(query) - 2)
    j = string.find(query, "com")
    if (i==1)
    then
    	query = (query .. "com")
    	--print(query)
    	--print("------------------------------------------------------")
    elseif (j == comCheck)
    then
    	query = (query)
    	--print(query)
    	--print("------------------------------------------------------")
    else
    	query = ""
    end
    --print(query)
    --print("------------------------------------------------------")

percentage = ""
--=====================================================================================================

if (query > "2")
then
dnsTest = query
-- Global ariables used
f = 1
h = 1
a = 1
dnsQuery = ""
dnsShort = ""
entropy = 0

-- Function for log base 2
function log2 (x) return math.log(x) / math.log(2) end

-- Eliminates periods from strings
while(f <= string.len(dnsTest))
do
	--print(dnsTest:sub(i,i))
	if(dnsTest:sub(f,f)==".")
	then
		f=f+1
	else
		dnsQuery=(dnsQuery .. dnsTest:sub(f,f))
		f=f+1
	end
end
-- Length of the query
queryLen = string.len(dnsQuery)
-- Equally proportions each character
prob = 1/queryLen

-- Removes duplicates, new string used to compare to old 
while(h <= string.len(dnsQuery))
do
	local g = dnsQuery:sub(h,h)
	if(string.find(dnsShort, dnsQuery:sub(h,h)))
	then
		h=h+1
	else
		dnsShort=(dnsShort .. dnsQuery:sub(h,h))
		h=h+1
	end
end

-- Compares new string to old and determines entropy 
while(a <= string.len(dnsShort))
do
	local b = 0
	local count = 0
	-- Counts the number of times a char appears in a string
	local _, count = string.gsub(dnsQuery, dnsShort:sub(a,a), "")
	b = count * prob
	entropy = (entropy + (b*log2(b)))
	a = a + 1
end

-- Makes entropy not a negative number
entropy = -entropy
--print(entropy)

-- Calculates max string entropy
maxEntropy = log2(queryLen)
--print(maxEntropy)

-- Calculates percentage of max entropy
percentage = entropy/maxEntropy
--print(percentage)

bar = "0.85"

if (percentage > .85)
then
	print(percentage)
end

end
--=====================================================================================================

    end
    return 0
end
return 0

