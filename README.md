<p align="center">
    <img alt="dotfiles title" src="https://i.ibb.co/hcrTc8F/dotfiles-cover.png">
</p>
<p align="center">
    <img alt="Fedora 34" src="https://img.shields.io/badge/Fedora-v34-green.svg?style=flat-square&logo=Fedora&logoColor=white&color=396d5a&labelColor=222">
    <img alt="Last commit" src="https://img.shields.io/github/last-commit/Supercolbat/dotfiles?style=flat-square&color=396d5a&labelColor=222">
    <img alt="Repo size" src="https://img.shields.io/github/repo-size/Supercolbat/dotfiles?style=flat-square&color=396d5a&labelColor=222">
</p>
<p align="center">  
    <a href="#computer-system-information"><img alt="System Information" src="https://img.shields.io/badge/System%20Information-2f5f4d?style=for-the-badge"></a>
    <a href="#camera-screenshots"><img alt="Screenshots" src="https://img.shields.io/badge/Screenshots-2f5f4d?style=for-the-badge"></a>
    <a href="#-installation"><img alt="Information" src="https://img.shields.io/badge/Installation-2f5f4d?style=for-the-badge"></a>
    <a href="#credits"><img alt="Notes" src="https://img.shields.io/badge/Notes-2f5f4d?style=for-the-badge"></a>
    <a href="#memo-notes"><img alt="Notes" src="https://img.shields.io/badge/Notes-2f5f4d?style=for-the-badge"></a>
</p>

### Notice: these configs are old now. I'm busy setting up a new Linux distro with a new set of configs (this time clean and readable!?)

Hello! These are the configs I use in my Fedora system. I've been taking [inspiration](#credits) from other people's setups and dotfiles and ended up producing this mess.

While I may not be the most creative or artistic person, I still enjoy the challenge of customizing my desktop. However, as my first rice, things are going to be a bit rusty.

Any and all contributions are welcome!

> *"time to show the whole world how messy i am"* ~ me

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
  * [Doom Emacs](https://github.com/hlissner/doom-emacs)
* **Browsers**
  * Firefox
  * [Brave Browser](https://github.com/brave/brave-browser)
* **File manager**: Nautilus (GNOME default)
* **Screenshot Tool**: [Flameshot](https://github.com/flameshot-org/flameshot)

### Terminal applications
* **Fetch**:
  * [Neofetch](https://github.com/dylanaraps/neofetch)
  * [uwuFetch](https://github.com/TheDarkBug/uwufetch) :3
* **Clocks**
  * [tty-clock](https://github.com/xorg62/tty-clock)
  * [peaclock](https://github.com/octobanana/peaclock)
    * plan on using this one but i cant compile it :(
* **Decoration**
  * [Bash pipes](https://github.com/pipeseroni/pipes.sh )
  * [CMatrix](https://github.com/abishekvashok/cmatrix)

## :camera: Screenshots

![screenshot of my current desktop](https://i.ibb.co/80mMhwH/image.png)
**Notes**:
* The left round module on the workspace bar (bottom) has an annoying 2-pixel gap
* When you highlight an edge workspace, the rounded edge won't highlight because its a seperate module.
* The MPD module looks really dumb when there is no song playing

## 🔧 Installation

### ~~Automatic:~~ not yet

### Manual:

Install the required packages

```bash
sudo dnf install bspwm sxhkd polybar dunst zsh alacritty neovim mpd mpc ncmpcpp -y

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

Install Oh My ZSH + Powerlevel10k + Plugins
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Copy the configs and folders
```bash
git clone https://github.com/Supercolbat/dotfiles
cd dotfiles
cp -r .config/* ~/.config
cp -r wallpapers ~
```

#### Finishing NeoVIM setup
First install VimPlug to support installing packages.
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Once that finishes, launch NeoVIM and ignore the countless warnings. Execute `:PlugInstall` to install the required packages.

#### Other steps
For **mpd** (music player daemon) to work, you have to put music in your \~/Music directory. You can change where mpd will look by changing `music_directory` in `~/.config/mpd/mpd.conf`.

## Credits

[[bspwm] Pretty Nordy & Rusty (First rice)](https://www.reddit.com/r/unixporn/comments/oayp27/bspwm_pretty_nordy_rusty_first_rice/)
* Main inspiration for the theme (most notably the terminal). Change the color theme a bit and boom!
* would like to point out that their **first** rice ***looks amazing*** compared to mine (which is my first rice) :(

[bspwm-dotfiles](https://github.com/AP2008/bspwm-dotfiles)
* I tweaked it's rofi config a tiny bit to make it fit better with my desktop

[polybar-themes](https://github.com/adi1090x/polybar-themes) (colorblocks)
* I like how this theme looked, but there were a few things I didn't like about it. I ended up using this as inspiration and *mostly* (cough `.config/polybar/scripts/rofi/*.rasi` cough cough) writing the bar from scratch.

[mf-dots](https://github.com/obliviousofcraps/mf-dots)
* [reddit post](https://www.reddit.com/r/unixporn/comments/o9fa24/openbox_eww_not_again_its_pastel_once_more/)
* This rice looks *really* good. I'm probably going to be using [Eww](https://github.com/elkowar/eww) once I finally get around compiling it
*  I also liked their README so you'll definitely be seeing similarities between their's and mine

The amazing people at [r/unixporn](https://www.reddit.com/r/unixporn)
* It's shocking to see how good people can make their desktops look. If I see a rice that I really like, I'll try to implement that into my desktop.

*more coming soon:tm: :P*

# :memo: Notes
* I'm planning on using [Eww](https://github.com/elkowar/eww) to add a little bit more to my desktop
* A wiki (don't ask) will probably come out soon:tm:, but it may take a while until I finally get around doing it.

# TODO
- [ ] document **everything**
- [ ] `INSTALL.sh` script
- [ ] stop procrastinating
