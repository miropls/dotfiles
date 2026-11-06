-- Migrated from the app's shortcut settings (Change Shortcut… / shortcuts.json).
rex.unbind("cmd+/", "client.sidebar.toggle")
rex.bind("cmd+b", "client.sidebar.toggle")
rex.bind("shift+cmd+r", "session.rename")
rex.bind("shift+cmd+q", "session.close")
rex.bind("shift+cmd+c", "session.collapse_others")

rex.bind("ctrl+alt+y", "client.config.reload")

rex.bind("alt+-", "client.font.increase")
rex.bind("alt+=", "client.font.decrease")
rex.bind("alt+0", "client.font.reset")

rex.bind("cmd+w", "client.tab.close")
rex.bind("ctrl+shift+w", "client.tab.close")
rex.bind("ctrl+shift+left", "client.tab.previous")
rex.bind("ctrl+shift+right", "client.tab.next")
rex.bind("cmd+left", "client.tab.previous")
rex.bind("cmd+right", "client.tab.next")
rex.bind("ctrl+shift+.", "client.tab.move", { direction = "backward" })
rex.bind("ctrl+shift+/", "client.tab.move", { direction = "forward" })

rex.bind("alt+cmd+w", "pane.close")
rex.bind("shift+esc", "pane.zoom")

rex.bind("alt+cmd+h", "pane.focus", { direction = "left" })
rex.bind("alt+cmd+j", "pane.focus", { direction = "down" })
rex.bind("alt+cmd+k", "pane.focus", { direction = "up" })
rex.bind("alt+cmd+l", "pane.focus", { direction = "right" })
rex.bind("ctrl+left", "pane.focus", { direction = "left" })
rex.bind("ctrl+down", "pane.focus", { direction = "down" })
rex.bind("ctrl+up", "pane.focus", { direction = "up" })
rex.bind("ctrl+right", "pane.focus", { direction = "right" })

rex.bind("alt+cmd+m", "pane.focus", { direction = "left" })
rex.bind("alt+cmd+n", "pane.focus", { direction = "down" })
rex.bind("alt+cmd+e", "pane.focus", { direction = "up" })
rex.bind("alt+cmd+i", "pane.focus", { direction = "right" })
