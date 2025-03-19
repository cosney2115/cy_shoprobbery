# Shop Robbery Script for FiveM

A FiveM script that allows players to rob shop cash registers with various features and anti-cheat protections.

## Features

- Multiple robbery locations across the map
- Skill check system for robberies
- Cooldown system per shop
- Police requirement system
- Anti-cheat protections
- Progress bar with animations
- Configurable rewards and timings

## Dependencies

- es_extended (ESX)
- ox_lib
- ox_target
- ox_inventory

## Installation

1. Download the script
2. Place it in your resources folder
3. Add `ensure cy_shoprobbery` to your server.cfg

## Configuration

All configurations can be found in `utils/config.lua`:

### Shop Locations

```lua
CashBox = {
    {
        name = "shop1",
        coords = vec3(x, y, z),
        size = vec3(width, length, height),
        rotation = degrees
    }
}
```
