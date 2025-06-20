#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ "$EUID" -ne 0 ]]; then
  echo "Por favor, execute como root (use sudo)"
  exit 1
fi

# Lista de pacotes a serem instalados, com comentários explicativos
PACOTES=(

  hyprland                    # Gerenciador de janelas
  hypridle                    # Gerenciador de ociosidade para o Hyprland (bloqueio, suspensão, etc.)
  hyprcursor                  # Utilitário para configurar o cursor no ambiente Hyprland
  hyprpaper                   # Aplicativo para definir e gerenciar wallpapers no Hyprland
  hyprpicker                  # Ferramenta para selecionar cores (color picker) no ambiente Wayland
  waybar                      # Barra de status
  dolphin-plugins             # Plugins adicionais para o gerenciador de arquivos Dolphin (KDE)
  ark                         # Aplicativo para extração e compressão de arquivos (GUI do KDE)
  kio-admin                   # Permite acesso a arquivos como root através do Dolphin
  polkit-kde-agent            # Agente de autenticação para políticas do sistema (necessário para permissões elevadas no KDE/Wayland)
  qt5-wayland                 # Suporte Wayland para aplicativos baseados em Qt5
  qt6-wayland                 # Suporte Wayland para aplicativos baseados em Qt6
  xdg-desktop-portal-hyprland # Suporte para integrações do portal de desktop com o Hyprland
  xdg-desktop-portal-gtk      # Suporte adicional para aplicações GTK que usam xdg-desktop-portal
  dunst                       # Leve daemon de notificações para ambientes gráficos
  cliphist                    # Gerenciador de histórico da área de transferência compatível com wlroots
  pavucontrol                 # Interface gráfica para controle do volume e dispositivos de áudio (Pulseaudio)
  #
  ttf-jetbrains-mono-nerd # Fonte com ícones Nerd, ótima para terminal
  noto-fonts-emoji        # Emojis coloridos
  ttf-dejavu              # Fonte clássica, alta compatibilidade
  ttf-droid               # Fonte legível do Android
  noto-fonts              # Fontes padrão Noto, para muitos idiomas
  noto-fonts-cjk          # Fontes CJK (chinês, japonês, coreano)
  ttf-font-awesome        # Ícones Font Awesome
  nwg-look                # Ferramenta gráfica para configurar GTK
  #
  pipewire         # Servidor multimídia moderno (áudio e vídeo)
  pipewire-alsa    # Suporte ALSA via PipeWire
  pipewire-jack    # Suporte JACK via PipeWire
  pipewire-pulse   # Emula PulseAudio via PipeWire
  wireplumber      # Gerenciador de sessão para PipeWire
  gstreamer        # Framework multimídia
  gst-libav        # Plugin GStreamer com suporte FFmpeg
  gst-plugins-base # Plugins essenciais GStreamer
  gst-plugins-good # Plugins de boa qualidade GStreamer
  gst-plugins-bad  # Plugins experimentais ou menos maduros
  gst-plugins-ugly # Plugins com restrições legais/licença
  ffmpeg           # Ferramenta para manipulação de áudio/vídeo

)

echo "Atualizando o sistema..."
pacman -Syu --noconfirm

echo "Instalando pacotes Hyprland e dependências..."
pacman -S --noconfirm "${PACOTES[@]}"

echo "Instalação concluída com sucesso!"
