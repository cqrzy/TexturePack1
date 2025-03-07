                task.spawn(function()
                    local Players = players
                    local ReplicatedStorage = repstorage
                    if objs then
                        objs[1].Parent = nil
                    end
                    objs = game:GetObjects("rbxassetid://10976374981")
                    local Workspace = workspace
                    objs[1].Parent = repstorage

                    local function weldmodel(model)
                        for i,v in pairs(model:GetDescendants()) do
                            if v:IsA("Part") then
                                weld = Instance.new("WeldConstraint", model)
                                weld.Part0 = model.PrimaryPart
                                weld.Part1 = v
                                v.Anchored = false
                                v.CanCollide = false
                            end
                        end
                    end
                    local texturetype = (TextureStyle.Value == "Normal" and "" or TextureStyle.Value == "Intent" and "2" or TextureStyle.Value == "BrettHax" and "3" or TextureStyle.Value == "Rach" and "4" or TextureStyle.Value == "Wooms" and "5" or TextureStyle.Value == "32x" and "6" or "")
                    index = {
                        wood = {
                            "wood_sword",
                            [2] = TextureStyle.Value == "32x" and objs[1].wood..texturetype or objs[1].wood
                        },
                        stone = {
                            "stone_sword",
                            [2] = TextureStyle.Value == "32x" and objs[1].stone..texturetype or objs[1].stone
                        },
                        iron = {
                            "iron_sword",
                            [2] = TextureStyle.Value == "32x" and objs[1].iron..texturetype or objs[1].iron
                        },
                        diamond = {
                            "diamond_sword",
                            [2] = TextureStyle.Value == "32x" and objs[1].diamond..texturetype or objs[1].diamond
                        },
                        emerald = {
                            "emerald_sword",
                            [2] = TextureStyle.Value == "32x" and objs[1].emerald..texturetype or objs[1].emerald
                        },
                        rageblade = {
                            "rageblade",
                            [2] = TextureStyle.Value == ("32x") and objs[1].rageblade..texturetype or objs[1].rageblade
                        },
                        iron_currency = {
                            "iron",
                            objs[1].iron_currency
                        },
                        diamond_currency = {
                            "diamond",
                            objs[1].diamond_currency
                        },
                        emerald_currency = {
                            "emerald",
                            objs[1].emerald_currency
                        },
                        shears = {
                            "shears",
                            objs[1].shears
                        },
                        wood_axe = {
                            "wood_axe",
                            objs[1].wood_axe
                        },
                        stone_axe = {
                            "stone_axe",
                            objs[1].stone_axe
                        },
                        iron_axe = {
                            "iron_axe",
                            objs[1].iron_axe
                        },
                        diamond_axe = {
                            "diamond_axe",
                            objs[1].diamond_axe
                        },
                        wood_pick = {
                            "wood_pickaxe",
                            objs[1].wood_pick
                        },
                        stone_pick = {
                            "stone_pickaxe",
                            objs[1].stone_pick
                        },
                        iron_pick = {
                            "iron_pickaxe",
                            objs[1].iron_pick
                        },
                        diamond_pick = {
                            "diamond_pickaxe",
                            objs[1].diamond_pick
                        },
                        fireball = {
                            "fireball",
                            objs[1].fireball
                        },
                        telepearl = {
                            "telepearl",
                            objs[1].telepearl
                        },
                        wood_crossbow = {
                            "wood_crossbow",
                            objs[1].Crossbow
                        },
                        wood_bow = {
                            "wood_bow",
                            objs[1].Bow
                        },
                        tactical_crossbow = {
                            "tactical_crossbow",
                            objs[1].tactical_crossbow
                        },
                        snowball = {
                            "snowball",
                            objs[1].snowball
                        },
                    }
                   
                    local VM = cam:FindFirstChild("Viewmodel")
                    weldconnection = VM.ChildAdded:Connect(function()
                        for i,v in pairs(VM:GetChildren()) do
                            for _,indexed in pairs(index) do
                                if indexed[1] == v.Name then
                                    local new = indexed[2]:Clone()
                                    weldmodel(new)
                                    for i,v in pairs(v:GetDescendants()) do
                                        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                                            v.Transparency = 1
                                        end
                                    end
                                    new.Parent = v
                                    new.PrimaryPart.CFrame = v.Handle.CFrame * CFrame.Angles(0,math.rad(90),0)
                                    local weld1 = Instance.new("WeldConstraint",v)
                                    weld1.Part0 = new.PrimaryPart
                                    weld1.Part1 = v.Handle
                                    local ThirdPersonItem = entity.Character:FindFirstChild(v.Name)
                                    if ThirdPersonItem then
                                        local CharacterItem = indexed[2]:Clone()
                                        weldmodel(CharacterItem)
                                        for i,v in pairs(ThirdPersonItem:GetDescendants()) do
                                            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                                                v.Transparency = 1
                                            end
                                        end
                                        CharacterItem.Parent = ThirdPersonItem
                                        CharacterItem.PrimaryPart.CFrame = ThirdPersonItem.Handle.CFrame * CFrame.new(0,-0.45,0) * CFrame.Angles(0,math.rad(90),0)
                                        local weld2 = Instance.new("WeldConstraint",CharacterItem)
                                        weld2.Part0 = CharacterItem.PrimaryPart
                                        weld2.Part1 = ThirdPersonItem.Handle
                                    end
                                end
                            end
                        end
                    end)
                end)
            else
                if weldconnection then
                    weldconnection:Disconnect()
                end
            end
        end
