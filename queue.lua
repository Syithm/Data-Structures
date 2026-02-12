local queue_class = {}

queue_class.__index = queue_class

function queue_class.new()
    local self = setmetatable({}, queue_class)
	self.queue = {}
	self.front = 1

    return self, self.queue
end

function queue_class:enqueue(val)
    table.insert(self.queue, val)
end

function queue_class:peek()
    return self.queue[self.front]
end

function queue_class:dequeue()
    local val = self.queue[self.front]

    if val ~= nil then
        self.queue[self.front] = nil

        self.front = self.front + 1
        
        if self.front > #self.queue then
            table.clear(self.queue)
            self.front = 1
        end
    end

    return val
end

return queue_class.new()
