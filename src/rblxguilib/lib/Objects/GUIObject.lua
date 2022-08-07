local GUIObject = {}
GUIObject.__index = GUIObject
local GUIElement = require(_G.LibraryDir.GUIElement)
local ListFrame = require(_G.FramesDir.ListFrame)
setmetatable(GUIObject,GUIElement)

function GUIObject.new(Parent)
    local self = GUIElement.new(Parent or ListFrame.new().Content)
    setmetatable(self,GUIObject)
    self.Object = nil
    self.MainMovable = nil
    return self
end

function GUIObject:Move(NewFrame, WithFrame)
    local PreviousParent = self.Parent
    self.MainMovable.Parent = NewFrame
    self.Parent = NewFrame
    if PreviousParent:IsA("Frame") and WithFrame then
        for _, i in pairs(PreviousParent:GetChildren()) do
            if i:IsA("Frame") then
                return self.Object
            end
        end
        PreviousParent:Destroy()
    end
end



return GUIObject