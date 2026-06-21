## My Personal Nix Config

---

### Configuration:

- **Flake-based**
- Home-manager
- Hyprland
- Nixvim
- Zen browser with modification
- Many [CLI](./home/programs/core/cli/) tools
- etc.

### Components

- [`flake.nix`](./flake.nix)

  _**Config entrypoint**_: This flake contains.

- [`system/`](./system/)

  _**System configs**_: Configure various system components, like core configuration and services, home-manager, software, system-wide packages, etc.

- [`home/`](./home/)

  _**HM Modules**_: User specific configuration managed with home-manager

- [`extraconfig/`](./extraconfig/)

  _**Non-Nix config**_: This doesn't configured with nix and doesn't include/depend pn this config. 

---
