# Tmux Config

## Prefix Key

`Ctrl+a` (instead of default `Ctrl+b`)

## Keybindings

### Pane Navigation (vim-style)

| Key | Action |
|-----|--------|
| `Ctrl+a h` | Move left |
| `Ctrl+a j` | Move down |
| `Ctrl+a k` | Move up |
| `Ctrl+a l` | Move right |

### Pane Resizing

| Key | Action |
|-----|--------|
| `Ctrl+a H` | Resize left |
| `Ctrl+a J` | Resize down |
| `Ctrl+a K` | Resize up |
| `Ctrl+a L` | Resize right |

## Status Bar

```
┌──────────────────────────────────────────────────────────────────┐
│   SESSION  │ 0 | bash │ 1 | nvim │ 󰂞 2 | htop │    󰃰 2024-01-08 │
└──────────────────────────────────────────────────────────────────┘
     ↑              ↑          ↑           ↑              ↑
   session     inactive    active    notification      date/time
```

### Window States

| State | Background | Indicator |
|-------|------------|-----------|
| Inactive | Dark | - |
| Active | Lavender (bright) | - |
| Has activity | Grey | 󰂞 (red bell icon) |

## File Structure

```
tmux/
├── .tmux.conf                 # Main config
└── .tmux/
    ├── status.conf            # Status bar layout
    └── colors/
        └── catppuccin-mocha.conf  # Color theme
```

## Theme Colors (Catppuccin Mocha)

Edit `.tmux/colors/catppuccin-mocha.conf` to customize:

| Variable | Color | Used For |
|----------|-------|----------|
| `@thm_background` | `#1e1e2e` | Status bar background |
| `@thm_foreground` | `#cdd6f4` | Default text |
| `@thm_element_background_default` | `#313244` | Inactive windows |
| `@thm_element_background_active` | `#b4befe` | Active window |
| `@thm_element_background_bell` | `#585b70` | Window with notification |
| `@thm_bell_icon_color` | `#f38ba8` | Bell icon (red) |

## Reload Config

```bash
tmux source-file ~/.tmux.conf
```

## Dependencies

- [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [Nerd Font](https://www.nerdfonts.com/) - For icons
