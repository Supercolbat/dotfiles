<p align="center">
    <img alt="dotfiles title" src="https://i.ibb.co/hcrTc8F/dotfiles-cover.png">
</p>
<p align="center">
    <img alt="Fedora 34" src="https://img.shields.io/badge/Fedora-v34-green.svg?style=flat-square&logo=Fedora&logoColor=white&color=5a927d&labelColor=222">
    <img alt="Last commit" src="https://img.shields.io/github/last-commit/Supercolbat/dotfiles?style=flat-square&color=437864&labelColor=222">
    <img alt="Repo size" src="https://img.shields.io/github/repo-size/Supercolbat/dotfiles?style=flat-square&color=2f5f4d&labelColor=222">
</p>
<p align="center">  
    <a href="#System_Information"><img alt="System Information" src="https://img.shields.io/badge/System%20Information-4d8570?style=for-the-badge" target="_blank"></a>
    <a href="#Screenshots"><img alt="Screenshots" src="https://img.shields.io/badge/Screenshots-4d8570?style=for-the-badge" target="_blank"></a>
    <a href="#Installation"><img alt="Information" src="https://img.shields.io/badge/Installation-4d8570?style=for-the-badge" target="_blank"></a>
    <a href="#Notes"><img alt="Notes" src="https://img.shields.io/badge/Notes-4d8570?style=for-the-badge" target="_blank"></a>
</p>

Hello! These are the configs I use in my Fedora system. I've been taking [inspiration](#Credits) from other people's setups and dotfiles and ended up producing this mess.

While I may not be the most creative or artistic person, I still enjoy the challenge of customizing my desktop. However, as my first rice, things are going to be a bit rusty.

Any and all contributions are welcome!

> *"time to show the whole world how messy i am"*
> ~ \~ me

## :computer: System Information

* **Linux Distribution:** Fedora Linux
* **Display Server**: [X.Org](https://x.org/wiki)
* **Window Manager:** [BSPWM](https://github.com/baskerville/bspwm)
* **Window Compositor**: [Picom-Ibhagwan](https://github.com/ibhagwan/picom)
* **Application Launcher:** [rofi](https://github.com/davatorium/rofi)
* **Shell:** ZSH
  * [Oh My ZSH](https://ohmyz.sh)
  * **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* **Notification daemon**: [dunst](https://github.com/dunst-project/dunst)
* **Hotkey Daemon:** [SXHKD](https://github.com/baskerville/sxhkd)

### Desktop applications
* **Terminal:** [Alacritty](https://github.com/alacritty/alacritty)
* **Text Editors:**
  * [Sublime Text 4](https://www.sublimetext.com)
  * [NeoVIM](https://github.com/neovim/neovim)
* **Browsers**
  * Firefox
  * [Brave Browser](https://github.com/brave/brave-browser)
* **File manager**: Nautilus (GNOME default)
* **Screenshot Tool**: [Flameshot](https://github.com/flameshot-org/flameshot) (excluded from configs)

### Terminal applications
* **Fetch**:
  * [Neofetch](https://github.com/dylanaraps/neofetch)
  * [uwuFetch](https://github.com/TheDarkBug/uwufetch) :3
    * has a better fedora logo than neofetch *and it's not because of the >ω<, it's because it fits better in my terminal* >:C
* **Clocks**
  * [tty-clock](https://github.com/xorg62/tty-clock)
  * [peaclock](https://github.com/octobanana/peaclock)
    * plan on using this one but i cant compile it :(
* **Eyecandy**
  * [Bash pipes](https://github.com/pipeseroni/pipes.sh )
  * [CMatrix](https://github.com/abishekvashok/cmatrix)

## :camera: Screenshots

![screenshot of my current desktop](https://i.ibb.co/42zxxXb/1.png)

## 🔧 Installation

### ~~Automatic:~~ not yet

### Manual:

Install the required packages.

```bash
sudo dnf install bspwm sxhkd polybar dunst zsh alacritty neovim -y

# install picom
sudo dnf install dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel mesa-libGL-devel meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel

mkdir ~/src
cd ~/src

git clone --single-branch --branch next-rebase --depth=1 https://github.com/ibhagwan/picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
```

Install fonts
```bash
sudo dnf install powerline-fonts
curl -sL https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/lib/i_all.sh | bash
# TODO: include nerd fonts
```

Install Oh My ZSH + Powerlevel10k
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Copy the configs from the repo into your config folder.

```bash
git clone https://github.com/Supercolbat/dotfiles
cd dotfiles
cp -r .config/* ~/.config
```

## Credits

[[bspwm] Pretty Nordy & Rusty (First rice)](https://www.reddit.com/r/unixporn/comments/oayp27/bspwm_pretty_nordy_rusty_first_rice/)
* Main inspiration for the theme (most notably the terminal). Change the color theme a bit and boom!
* also for a first rice, ***thats amazing***

[bspwm-dotfiles](https://github.com/AP2008/bspwm-dotfiles)
* I tweaked it's rofi config a tiny bit to make it fit better with my desktop

[polybar-themes](https://github.com/adi1090x/polybar-themes) (colorblocks)
* I like how this theme looked, but there were a few things I didn't like about it. I ended up using this as inspiration and *mostly* (.config/polybar/scripts/rofi/\*.rasi) writing the bar from scratch.

[mf-dots](https://github.com/obliviousofcraps/mf-dots)
* [reddit post](https://www.reddit.com/r/unixporn/comments/o9fa24/openbox_eww_not_again_its_pastel_once_more/)
* This rice looks *really* good. I'm probably going to be using [Eww](https://github.com/elkowar/eww) once I finally get around compiling it
*  I also liked their README so you'll definitely be seeing similarities between their's and mine

The amazing people at [r/unixporn](https://www.reddit.com/r/unixporn)
* It's shocking to see how good people can make their desktops look. If I see a rice that I really like, I'll try to implement that into my desktop.

*more coming soon :P*

# :memo: Notes

* As of right now, the workspace module in polybar is... less than adequate. I've just been procrastinating on fixing it. I mean, why fix that when you can upload your dotfiles to Github write a whole README document (and a wiki)? The reason for the wiki is to organize information I'm trying to cram in here without cluttering it too much. Is it necessary? No. Is it cool? Probably.

# TODO
- [ ] comment **everything**
- [ ] `INSTALL.sh` script
- [ ] stop procrastinating
