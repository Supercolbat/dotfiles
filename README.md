
<p align="center">
    <img alt="dotfiles title" src="https://i.ibb.co/hcrTc8F/dotfiles-cover.png">
</p>
<p align="center">
    <img alt="Void Linux" src="https://img.shields.io/badge/Void-GNU/Linux-green.svg?style=flat-square&logo=Void&logoColor=white&color=396d5a&labelColor=222">
    <img alt="Last commit" src="https://img.shields.io/github/last-commit/Supercolbat/dotfiles?style=flat-square&color=396d5a&labelColor=222">
    <img alt="Repo size" src="https://img.shields.io/github/repo-size/Supercolbat/dotfiles?style=flat-square&color=396d5a&labelColor=222">
</p>
<p align="center">  
    <a href="#computer-system-information"><img alt="System Information" src="https://img.shields.io/badge/System%20Information-2f5f4d?style=for-the-badge"></a>
    <a href="#camera-screenshots"><img alt="Screenshots" src="https://img.shields.io/badge/Screenshots-2f5f4d?style=for-the-badge"></a>
    <a href="#-installation"><img alt="Information" src="https://img.shields.io/badge/Installation-2f5f4d?style=for-the-badge"></a>
    <a href="#credits"><img alt="Credits" src="https://img.shields.io/badge/Credits-2f5f4d?style=for-the-badge"></a>
    <a href="#memo-notes"><img alt="Notes" src="https://img.shields.io/badge/Notes-2f5f4d?style=for-the-badge"></a>
</p>

Hello! This is my second attempt at making decent dotfiles.

Insert some long paragraph about something here.

Any and all* contributions are welcome!

\* most

> *"time to show the whole world how messy i am"* ~ me

## :computer: System Information

* **Linux Distribution:** [Void Linux](https://voidlinux.org/)
* **Display Server**: [X.Org](https://x.org/wiki)
* **Window Manager:** [BSPWM](https://github.com/baskerville/bspwm)
* **Window Compositor**: [Picom](https://github.com/yshui/picom)
* **Application Launcher:** [rofi](https://github.com/davatorium/rofi)
* **Shell:** ZSH
  * [Oh My ZSH](https://ohmyz.sh)
  * **Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* **Hotkey Daemon:** [SXHKD](https://github.com/baskerville/sxhkd)

### Desktop applications
* **Terminal:** [kitty](https://github.com/kovidgoyal/kitty)
* **Text Editors:**
  * [VSCodium](https://github.com/VSCodium/vscodium)
  * [NeoVim](https://github.com/neovim/neovim)
* **Browsers**
  * Firefox
* **File manager**:
  * Thunar but im probably gonna switch
  * [ranger](https://github.com/ranger/ranger)
* **Capturing software**
  * [Flameshot](https://github.com/flameshot-org/flameshot)
  * [OBS](https://github.com/obsproject/obs-studio)

### Terminal applications
* **Fetch**:
  * [Neofetch](https://github.com/dylanaraps/neofetch)
* **Clocks**p
  * [peaclock](https://github.com/octobanana/peaclock)
* **Eye candy**
  * [CMatrix](https://github.com/abishekvashok/cmatrix)

## :camera: Screenshots

![screenshot of my current desktop (it's crazy)](https://via.placeholder.com/600x400)

nice isn't it?

## 🔧 Installation

Install the things

```bash
sudo xbps-install -Sy bspwm sxhkd zsh kitty neovim mpd mpc ncmpcpp
```

Install the fonts
```bash
# Go to https://github.com/ryanoasis/nerd-fonts/releases/latest
# and install the latest Meslo.zip
# Unzip the contents to ~/.local/share/fonts/Meslo
```
<!--
Easter egg? I tried making a command for this but as you can see, I can't.

```bash
# As of version 2.1.0, this command... won't work
# because im bad at making commands
# I'll fix it soon:tm:
mkdir -p ~/.local/share/fonts/Meslo
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip\
     --output - | unzip -\
     -d ~/.local/share/fonts/Meslo
```
-->

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
cp -r config/* ~/.config
cp -r wallpapers ~
```

#### Finishing NeoVIM setup
First install VimPlug to support installing packages.
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Once that finishes, launch NeoVim and ignore the countless warnings. Execute `:PlugInstall` to install the required packages.

#### Other steps
For **mpd** (music player daemon) to work, you have to put music in your \~/Music directory. You can change where mpd will look by changing `music_directory` in `~/.config/mpd/mpd.conf`.

## Credits

janleigh/dotfiles ([github](https://github.com/janleigh/dotfiles)) ([reddit](https://www.reddit.com/r/unixporn/comments/v0xy1o/bspwm_comfy_waves))
* The ultimate rice.
* What inspired my new rice 
* The best Linux rice

mf-dots ([github](https://github.com/obliviousofcraps/mf-dots)) ([reddit](https://www.reddit.com/r/unixporn/comments/o9fa24/openbox_eww_not_again_its_pastel_once_more))
* This rice looks *really* good. This was my first inspiration for wanting to use [Eww](https://github.com/elkowar/eww).
*  I also liked their README, so you'll definitely be seeing similarities between theirs and mine

The amazing people at [r/unixporn](https://www.reddit.com/r/unixporn)
* It's shocking to see how good people can make their desktops look. If I see a rice that I really like, I'll try to implement that into my desktop.

*more coming soon:tm: :P*

# :memo: Notes
* Rather than copying the default configs (i.e. `/usr/share/examples/picom/picom.sample.conf`)and modifying them, I instead opted in to rewriting them in a way that made sense to me. I also abused a [nifty vim feature](https://vim.fandom.com/wiki/Folding) to make everything much easier to read. Thanks kitty config for enlightening me!

