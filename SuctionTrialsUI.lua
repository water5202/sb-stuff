local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
Fluent:Notify({
        Title = "Interface",
        Content = "Getting Glove...",
        SubContent = "",
        Duration = 3
})
fireclickdetector(workspace["plunger glove"].ClickDetector)
task.wait(1)
Fluent:Notify({
        Title = "Interface",
        Content = "Success!",
        SubContent = "",
        Duration = 3
})
