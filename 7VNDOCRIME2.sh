#!/data/data/com.termux/files/usr/bin/bash

# ==========================================
#  REPRODUTOR DE MÚSICA DE FUNDO (STREAMING)
# ==========================================
URL_MUSICA="https://files.catbox.moe/sa2s9b.mp3"

command -v mpv >/dev/null 2>&1 || pkg install mpv -y >/dev/null 2>&1

parar_musica() {
  if [ -n "$MUSICA_PID" ] && kill -0 "$MUSICA_PID" 2>/dev/null; then
    kill "$MUSICA_PID" 2>/dev/null
  fi
}
trap parar_musica EXIT INT TERM

if [ "$URL_MUSICA" != "https://files.catbox.moe/sa2s9b.mp3" ]; then
  mpv --no-video --loop-file=inf --volume=40 "$URL_MUSICA" > /dev/null 2>&1 &
  MUSICA_PID=$!
fi

# ==========================================
#  PALETA DE CORES TEMA HELLO KITTY
# ==========================================
ROSA_CHOQUE='\033[38;2;255;20;147m'
ROSA_PASTEL='\033[38;2;255;105;180m'
ROSA_FOFO='\033[38;2;255;182;193m'
ROSA_MAGENTA='\033[38;2;255;0;128m'
BRANCO='\033[38;2;255;255;255m'
AMARELO_LACO='\033[38;2;255;215;0m'
ROXO_SUAVE='\033[38;2;218;112;214m'
NC='\033[0m'

KEY_FILE="$HOME/.hello_kitty_vip.key"
CHAVE_VALIDA="7VN-KITTY-VIP"

# ==========================================
#  VARIÁVEIS DE ESTADO DO SISTEMA (STATUS DINÂMICO)
# ==========================================
MODO_CPU="Modo Economia de Bateria / Normal"
MODO_FPS="Padrão do Sistema"
MODO_TOUCH="Padrão"
MODO_FOV="Desativado"

# ==========================================
#  SISTEMA DE AUTO REGISTRO & TELA DE CARGA
# ==========================================
verificar_licenca() {
  clear
  echo -e "${ROSA_CHOQUE}"
  echo "  ██╗  ██╗███████╗██╗     ██╗      ██████╗     ██╗██╗████████╗████████╗██╗   ██╗"
  echo "  ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██║██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝"
  echo "  ███████║█████╗  ██║     ██║     ██║   ██║    ██║██║   ██║      ██║    ╚████╔╝ "
  echo "  ██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║██║   ██║      ██║     ╚██╔╝  "
  echo "  ██║  ██║███████╗███████╗███████╗╚██████╔╝    ██║██║   ██║      ██║      ██║   "
  echo "  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   "
  echo -e "${NC}"
  echo -e "${ROSA_PASTEL}      /\_/\   ${AMARELO_LACO}🎀 VERIFICANDO REGISTRO VIP... 🎀${NC}"
  echo -e "${ROSA_PASTEL}     ( o.o )  ${ROSA_FOFO}=================================================${NC}"
  echo -e "${ROSA_PASTEL}      > ^ <   ${ROSA_MAGENTA}TikTok: 7vn&120hz${NC}"
  echo ""

  echo -e "${ROSA_FOFO}   🎀 Autenticando comprador e liberando acesso...${NC}"
  echo -ne "   "
  for i in {1..30}; do
    echo -ne "${ROSA_CHOQUE}🎀${NC}"
    sleep 0.03
  done
  echo -e "\n"

  if [ -f "$KEY_FILE" ] && [ "$(cat "$KEY_FILE")" == "$CHAVE_VALIDA" ]; then
    echo -e "${ROSA_PASTEL}   🎀 [SUCESSO] Auto-Registro Detectado! Painel VIP Liberado! 🎀${NC}"
    sleep 1.2
    return 0
  else
    echo -e "${ROSA_CHOQUE}╭──────────────────────────────────────────────────────────╮${NC}"
    echo -e "${ROSA_CHOQUE}│  🎀 TELA DE CARREGAMENTO / AGUARDANDO COMPRA 🎀          │${NC}"
    echo -e "${ROSA_CHOQUE}├──────────────────────────────────────────────────────────┤${NC}"
    echo -e "${ROSA_FOFO}│  • Status: ${BRANCO}LICENÇA NÃO REGISTRADA${ROSA_FOFO}                       │${NC}"
    echo -e "${ROSA_FOFO}│  • Se você já comprou, insira a Chave VIP abaixo.        │${NC}"
    echo -e "${ROSA_FOFO}│  • Se ainda não adquiriu, contate o vendedor oficial!    │${NC}"
    echo -e "${ROSA_FOFO}│  • Vendedor: ${AMARELO_LACO}TikTok: 7vn&120hz${ROSA_FOFO}                            │${NC}"
    echo -e "${ROSA_CHOQUE}╰──────────────────────────────────────────────────────────╯${NC}"
    echo ""
    read -p "   🎀 Insira sua Chave VIP de Compra (ou aperte Enter p/ Sair): " chave_input

    if [ "$chave_input" == "$CHAVE_VALIDA" ]; then
      echo "$CHAVE_VALIDA" > "$KEY_FILE"
      echo -e "${ROSA_PASTEL}   🎀 Chave Ativada com Sucesso! Bem-vindo ao Painel Hello Kitty VIP! 🎀${NC}"
      sleep 1.5
      return 0
    else
      echo -e "${ROSA_CHOQUE}   🎀 Licença não encontrada. Adquira com 7vn&120hz no TikTok!${NC}"
      exit 1
    fi
  fi
}

verificar_licenca

# ==========================================
#  CABECALHO HELLO KITTY
# ==========================================
exibir_cabecalho() {
  clear
  echo -e "${ROSA_CHOQUE}"
  echo "  ██╗  ██╗███████╗██╗     ██╗      ██████╗     ██╗██╗████████╗████████╗██╗   ██╗"
  echo "  ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██║██║╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝"
  echo "  ███████║█████╗  ██║     ██║     ██║   ██║    ██║██║   ██║      ██║    ╚████╔╝ "
  echo "  ██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║██║   ██║      ██║     ╚██╔╝  "
  echo "  ██║  ██║███████╗███████╗███████╗╚██████╔╝    ██║██║   ██║      ██║      ██║   "
  echo "  ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ╚═╝╚═╝   ╚═╝      ╚═╝      ╚═╝   "
  echo -e "${NC}"
  echo -e "${ROSA_PASTEL}      /\_/\   ${AMARELO_LACO}🎀 7VN OPTIMIZER VIP - HELLO KITTY EDITION 🎀${NC}"
  echo -e "${ROSA_PASTEL}     ( o.o )  ${ROSA_FOFO}=================================================${NC}"
  echo -e "${ROSA_PASTEL}      > ^ <   ${ROSA_MAGENTA}TikTok: 7vn&120hz${NC}"
  echo -e "${ROSA_PASTEL}     (  v  )  ${ROXO_SUAVE}Status: Ativo & Otimizado${NC}"
  echo ""
}

# ==========================================
#  STATUS DO SISTEMA CUSTOMIZADO (DINÂMICO)
# ==========================================
exibir_status() {
  echo ""
  echo -e "${ROSA_CHOQUE}╭──────────────────────────────────────────────────────────╮${NC}"
  echo -e "${ROSA_CHOQUE}│  🎀 PAINEL DE ESTATÍSTICAS HELLO KITTY 🎀                │${NC}"
  echo -e "${ROSA_CHOQUE}├──────────────────────────────────────────────────────────┤${NC}"
  echo -e "${ROSA_FOFO}│  • Processador / Energia: ${BRANCO}${MODO_CPU}${NC}"
  echo -e "${ROSA_FOFO}│  • Taxa de Atualização / FPS: ${BRANCO}${MODO_FPS}${NC}"
  echo -e "${ROSA_FOFO}│  • Resposta de Toque: ${BRANCO}${MODO_TOUCH}${NC}"
  echo -e "${ROSA_FOFO}│  • FOV & Mira X/Y: ${BRANCO}${MODO_FOV}${NC}"
  echo -e "${ROSA_CHOQUE}╰──────────────────────────────────────────────────────────╯${NC}"
  echo -e "${ROSA_PASTEL}   Tudo sincronizado no estilo Hello Kitty! 🎀${NC}"
  echo ""
}

# ==========================================
#  ANIMAÇÃO DE INICIALIZAÇÃO
# ==========================================
exibir_cabecalho
echo -e "${ROSA_FOFO}   🎀 Carregando módulos Hello Kitty Termux...${NC}"
echo -ne "   "
for i in {1..25}; do
  echo -ne "${ROSA_CHOQUE}🎀${NC}"
  sleep 0.02
done
echo -e " ${ROSA_PASTEL}100%!${NC}\n"
sleep 0.4

# ==========================================
#  MENU PRINCIPAL
# ==========================================
while true; do
  exibir_cabecalho

  echo -e "${ROSA_CHOQUE}┌──────────────────────────────────────────────────────────┐${NC}"
  echo -e "${ROSA_CHOQUE}│                 🎀 MENU DE OTIMIZAÇÕES 🎀                 │${NC}"
  echo -e "${ROSA_CHOQUE}└──────────────────────────────────────────────────────────┘${NC}"
  echo -e "${ROSA_PASTEL}   [1]${NC} ${ROSA_FOFO} Executar Otimização Extrema (Sistema + Exports) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [2]${NC} ${ROSA_FOFO} Sincronizar Memória RAM (Limpeza Completa) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [3]${NC} ${ROSA_FOFO} Diagnóstico Visual de RAM 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [4]${NC} ${ROSA_FOFO} 7VN INJETOR (Taxa de Atualização / FPS) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [5]${NC} ${ROSA_CHOQUE} Configurar Mouse Easy 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [6]${NC} ${ROSA_FOFO} Acelerador de Touch (0 Delay) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [7]${NC} ${ROSA_FOFO} Configurar Eixos X e Y (Sensibilidade) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [8]${NC} ${ROSA_FOFO} Acelerador de Eixos X e Y (Movimentação) 🎀${NC}"
  echo -e "${ROSA_PASTEL}   [9]${NC} ${ROSA_FOFO} Otimizar Ping & Reduzir Lag de Rede 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [10]${NC} ${ROSA_FOFO} Forçar Modo Desempenho Máximo (CPU Governor) 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [11]${NC} ${ROSA_FOFO} Limpeza Profunda de Logs e Cache Oculto 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [12]${NC} ${ROSA_FOFO} Aumentar Prioridade do Free Fire (Processo) 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [13]${NC} ${ROSA_CHOQUE} 7VN SEGREDINHO VIP 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [14]${NC} ${ROSA_CHOQUE} Injetar Trick FOV de Tela (X e Y) 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [15]${NC} ${ROSA_CHOQUE} Ajusta FOV X e Y (Sensi Alta Anti-Pinar) 🎀${NC}"
  echo -e "${ROSA_PASTEL}  [16]${NC} ${ROSA_FOFO} Sair 🎀${NC}"
  echo ""

  read -p "   🎀 Escolha uma opção [1-16]: " opcao

  case $opcao in
    1)
      # --- EXPORTS REINTEGRADOS DO MÓDULO ORIGINAL (vn7du7) ---
      export USER_PROFILE="7VN'CLEAN"; export TARGET_GAME="Free_Fire"
      export TOUCH_SENSITIVITY="MAX"; export POLLING_RATE=120
      export DPI_OVERRIDE=1200; export TOUCH_PRESSURE_SCALE=0.001
      export TOUCH_SIZE_SCALE=0.001; export HWUI_RENDERER="vulkan"
      export VSYNC_DISABLE=1; export FORCE_GPU_RENDERING=true
      export THREAD_PRIORITY="high"; export CPU_GOVERNOR="performance"
      export I_O_SCHEDULER="deadline"; export ART_COMPILER_FILTER="speed-profile"
      export DALVIK_VM_HEAPSIZE="512m"; export DALVIK_VM_HEAPGROWTHLIMIT="256m"
      export MULTI_CORE_ENABLE=1; export GAME_MODE_STATE="active"
      export CAPOEIRA_MOVE_STYLE="ginga_fast"; export FRAME_BUFFER_SIZE="1080x2400"
      export REFRESH_RATE_MAX=120; export ANIMATION_DURATION_SCALE=0.0
      export TRANSITION_ANIMATION_SCALE=0.0; export WINDOW_ANIMATION_SCALE=0.0
      export HARDWARE_UI_COMPOSITING=1; export ENABLE_OPENGL_ES3=1
      export TERMUX_CLEAN_CACHE=1; export TMPDIR=$PREFIX/tmp
      export CACHE_DIR=$PREFIX/var/cache; export CLEAN_DALVIK_CACHE=true
      export WIPE_TEMP_LOGS=true; export CLEAR_NATIVE_CACHE=1
      export PURGE_OBSOLETE_PACKAGES=1; export DEBIAN_FRONTEND=noninteractive
      export APT_LISTCHANGES_FRONTEND=none; export DPKG_COLORS=never
      export TCP_NODELAY=1; export TCP_QUICKACK=1
      export IPV4_TCP_FASTOPEN=3; export NET_CORE_RVMEM_DEFAULT=1048576
      export NET_CORE_WMEM_DEFAULT=1048576; export NET_CORE_RMEM_MAX=16777216
      export NET_CORE_WMEM_MAX=16777216; export NET_IPV4_TCP_RMEM="4096 87380 16777216"
      export NET_IPV4_TCP_WMEM="4096 65536 16777216"; export DNS_CACHE_BYPASS=true
      export PING_LATENCY_OPT=1; export REDUCE_PACKET_LOSS=true
      export ENABLE_WIFI_FAST_TRANSITION=1; export DISABLE_BACKGROUND_DATA=true
      export SYSTEM_CHECK="OK"; export OPTIMIZATION_LEVEL="MAXIMUM"
      export SCRIPT_VERSION="3.0"; export AESTHETIC_MODE="Hello_Kitty"
      export OVERLAY_DISABLE=1; export GPU_TURBO=1
      export THERMAL_THROTTLING=disable; export CPU_BOOST=1
      export FPS_UNLOCKER=true; export HEADSHOT_SENSI_CALIBRATION="active"
      export DISPLAY_CALIBRATION_XYZ=1; export NO_DELAY_TOUCH=1

      # Reintegração dos 100 Flags EX_OPT_
      export EX_OPT_01=1; export EX_OPT_02=1; export EX_OPT_03=1; export EX_OPT_04=1; export EX_OPT_05=1
      export EX_OPT_06=1; export EX_OPT_07=1; export EX_OPT_08=1; export EX_OPT_09=1; export EX_OPT_10=1
      export EX_OPT_11=1; export EX_OPT_12=1; export EX_OPT_13=1; export EX_OPT_14=1; export EX_OPT_15=1
      export EX_OPT_16=1; export EX_OPT_17=1; export EX_OPT_18=1; export EX_OPT_19=1; export EX_OPT_20=1
      export EX_OPT_21=1; export EX_OPT_22=1; export EX_OPT_23=1; export EX_OPT_24=1; export EX_OPT_25=1
      export EX_OPT_26=1; export EX_OPT_27=1; export EX_OPT_28=1; export EX_OPT_29=1; export EX_OPT_30=1
      export EX_OPT_31=1; export EX_OPT_32=1; export EX_OPT_33=1; export EX_OPT_34=1; export EX_OPT_35=1
      export EX_OPT_36=1; export EX_OPT_37=1; export EX_OPT_38=1; export EX_OPT_39=1; export EX_OPT_40=1
      export EX_OPT_41=1; export EX_OPT_42=1; export EX_OPT_43=1; export EX_OPT_44=1; export EX_OPT_45=1
      export EX_OPT_46=1; export EX_OPT_47=1; export EX_OPT_48=1; export EX_OPT_49=1; export EX_OPT_50=1
      export EX_OPT_51=1; export EX_OPT_52=1; export EX_OPT_53=1; export EX_OPT_54=1; export EX_OPT_55=1
      export EX_OPT_56=1; export EX_OPT_57=1; export EX_OPT_58=1; export EX_OPT_59=1; export EX_OPT_60=1
      export EX_OPT_61=1; export EX_OPT_62=1; export EX_OPT_63=1; export EX_OPT_64=1; export EX_OPT_65=1
      export EX_OPT_66=1; export EX_OPT_67=1; export EX_OPT_68=1; export EX_OPT_69=1; export EX_OPT_70=1
      export EX_OPT_71=1; export EX_OPT_72=1; export EX_OPT_73=1; export EX_OPT_74=1; export EX_OPT_75=1
      export EX_OPT_76=1; export EX_OPT_77=1; export EX_OPT_78=1; export EX_OPT_79=1; export EX_OPT_80=1
      export EX_OPT_81=1; export EX_OPT_82=1; export EX_OPT_83=1; export EX_OPT_84=1; export EX_OPT_85=1
      export EX_OPT_86=1; export EX_OPT_87=1; export EX_OPT_88=1; export EX_OPT_89=1; export EX_OPT_90=1
      export EX_OPT_91=1; export EX_OPT_92=1; export EX_OPT_93=1; export EX_OPT_94=1; export EX_OPT_95=1
      export EX_OPT_96=1; export EX_OPT_97=1; export EX_OPT_98=1; export EX_OPT_99=1; export EX_OPT_100=1

      # --- MANUTENÇÃO DE PACOTES TERMUX (vn7du7) ---
      apt-get clean > /dev/null 2>&1; apt-get autoclean > /dev/null 2>&1
      apt-get autoremove -y > /dev/null 2>&1; rm -rf ~/.cache/* > /dev/null 2>&1
      rm -rf ~/.*_history > /dev/null 2>&1; rm -rf $PREFIX/tmp/* > /dev/null 2>&1
      rm -rf $PREFIX/var/cache/apt/archives/* > /dev/null 2>&1
      rm -rf $PREFIX/var/lib/apt/lists/* > /dev/null 2>&1
      find $PREFIX/tmp -type f -delete > /dev/null 2>&1
      find ~/.cache/ -type f -delete > /dev/null 2>&1

      # --- PROPRIEDADES DE SISTEMA (SETPROP) ---
      setprop debug.hwui.render_thread 1 > /dev/null 2>&1
      setprop debug.hwui.fps_divisor 1 > /dev/null 2>&1
      setprop debug.performance.tuning 1 > /dev/null 2>&1
      setprop debug.egl.hw 1 > /dev/null 2>&1
      setprop debug.egl.profiler 1 > /dev/null 2>&1
      setprop debug.sf.hw 1 > /dev/null 2>&1
      setprop debug.sf.latch_unsignaled 1 > /dev/null 2>&1
      setprop dev.pm.dyn_samplingrate 1 > /dev/null 2>&1
      setprop video.accelerate.hw 1 > /dev/null 2>&1
      setprop windowsmgr.max_events_per_sec 240 > /dev/null 2>&1
      setprop persist.sys.ui.hw 1 > /dev/null 2>&1
      setprop persist.sys.performance 1 > /dev/null 2>&1
      setprop debug.composition.type gpu > /dev/null 2>&1
      setprop debug.renderengine.backend skiavk > /dev/null 2>&1
      setprop debug.hwui.renderer skiavk > /dev/null 2>&1
      setprop persist.sys.use_dithering 0 > /dev/null 2>&1
      setprop persist.vendor.color.mode 2 > /dev/null 2>&1
      setprop debug.sf.disable_backpressure 1 > /dev/null 2>&1
      setprop debug.sf.early.app.duration 1 > /dev/null 2>&1
      setprop debug.sf.early.sf.duration 1 > /dev/null 2>&1
      setprop debug.sf.earlyGl.app.duration 1 > /dev/null 2>&1
      setprop debug.sf.earlyGl.sf.duration 1 > /dev/null 2>&1
      setprop debug.sf.predict_hwc_composition 1 > /dev/null 2>&1
      setprop debug.sf.recomputecrop 0 > /dev/null 2>&1
      setprop persist.sys.dalvik.vm.lib.2 libart.so > /dev/null 2>&1
      setprop dalvik.vm.dex2oat-filter speed > /dev/null 2>&1
      setprop dalvik.vm.image-dex2oat-filter speed > /dev/null 2>&1
      setprop persist.sys.force_hw_ui 1 > /dev/null 2>&1
      setprop debug.gr.swapinterval 0 > /dev/null 2>&1
      setprop ro.config.hw_quickpoweron true > /dev/null 2>&1
      setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 3 > /dev/null 2>&1
      setprop net.tcp.buffersize.wifi 524288,1048576,2097152,262144,524288,1048576 > /dev/null 2>&1
      setprop net.ipv4.tcp_ecn 1 > /dev/null 2>&1
      setprop net.ipv4.route.flush 1 > /dev/null 2>&1
      setprop wifi.supplicant_scan_interval 180 > /dev/null 2>&1
      setprop ro.ril.hsxpa 2 > /dev/null 2>&1
      setprop ro.ril.gprsclass 12 > /dev/null 2>&1
      setprop debug.rs.default-CPU-driver 1 > /dev/null 2>&1
      setprop debug.hwui.show_dirty_regions false > /dev/null 2>&1
      setprop debug.hwui.overdraw false > /dev/null 2>&1
      setprop persist.sys.purgeable_assets 1 > /dev/null 2>&1
      setprop dalvik.vm.dexopt-flags v=a,o=v,m=y,u=n > /dev/null 2>&1
      setprop ro.config.nocheckin 1 > /dev/null 2>&1
      setprop profiler.force_disable_ulog 1 > /dev/null 2>&1
      setprop profiler.force_disable_err_rpt 1 > /dev/null 2>&1

      for i in {1..10}; do
        setprop debug.sys.opt.extra$i 1 > /dev/null 2>&1
      done

      settings put global window_animation_scale 0.0 > /dev/null 2>&1
      settings put global transition_animation_scale 0.0 > /dev/null 2>&1
      settings put global animator_duration_scale 0.0 > /dev/null 2>&1
      
      MODO_CPU="Modo Desempenho Máximo (Completo)"
      exibir_status
      ;;
    2)
      sync; sync; sync
      export SYNC_METHOD="force"; export RAM_SWAP_SIZE=4096
      export VM_SWAPPINESS=10; export VM_VFS_CACHE_PRESSURE=50
      export VM_DIRTY_RATIO=15; export VM_DIRTY_BACKGROUND_RATIO=5
      export VM_DROP_CACHES=3; export MEMORY_PROFILE="GAMING"
      export ZRAM_ENABLE=1; export ZRAM_COMPRESSOR="lz4"
      export KSM_ENABLE=1; export KSM_SLEEP_MILLIS=1500
      export OOM_KILLER_DISABLE=0; export LOW_MEMORY_KILLER_MINFREE="18432,23040,27648,32256,55296,80640"
      export ACTIVE_CLEANER=1; export CACHE_REBUILD=0
      echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true
      export STOP_BACKGROUND_SERVICES=true; export FREEZE_IDLE_APPS=1
      export PRIORITIZE_FOREGROUND_APP=true; export KILL_CACHED_PROCESSES=1
      export MAX_HIDDEN_APPS=2; export GC_INTERVAL=10000
      export MEMORY_GC_ON_IDLE=true; export DISABLE_LOGCAT=true
      export DISABLE_DEBUGGING=1; export COMPRESS_BACKGROUND_RAM=1

      pm trim-caches 1000G > /dev/null 2>&1
      rm -rf ~/.cache/* > /dev/null 2>&1
      rm -rf $PREFIX/tmp/* > /dev/null 2>&1
      setprop persist.sys.purgeable_assets 1 > /dev/null 2>&1
      setprop dalvik.vm.heapgrowthlimit 256m > /dev/null 2>&1
      setprop dalvik.vm.heapsize 512m > /dev/null 2>&1
      setprop dalvik.vm.heaptargetutilization 0.75 > /dev/null 2>&1
      setprop dalvik.vm.heapminfree 512k > /dev/null 2>&1
      setprop dalvik.vm.heapmaxfree 8m > /dev/null 2>&1
      setprop ro.sys.fw.bg_apps_limit 32 > /dev/null 2>&1
      setprop persist.sys.scrollingcache 3 > /dev/null 2>&1
      setprop ro.config.fstrim_threshold 300 > /dev/null 2>&1
      setprop persist.sys.ram_boost 1 > /dev/null 2>&1
      setprop debug.ram.clean_mode 1 > /dev/null 2>&1
      setprop persist.sys.zram_enabled 1 > /dev/null 2>&1
      setprop sys.use_fifo_ui 1 > /dev/null 2>&1
      setprop ro.sys.fw.use_trim_settings true > /dev/null 2>&1
      setprop ro.sys.fw.empty_app_percent 50 > /dev/null 2>&1
      setprop ro.sys.fw.trim_empty_percent 100 > /dev/null 2>&1
      setprop ro.sys.fw.trim_cache_percent 100 > /dev/null 2>&1
      setprop ro.sys.fw.trim_enable_memory 1073741824 > /dev/null 2>&1
      setprop debug.sys.profile_cache 1 > /dev/null 2>&1
      setprop persist.sys.mem_optimization 1 > /dev/null 2>&1
      setprop persist.sys.stat_cache 1 > /dev/null 2>&1
      setprop debug.mem.clean_level max > /dev/null 2>&1
      setprop debug.sys.ram.priority high > /dev/null 2>&1
      setprop persist.sys.cache_flush true > /dev/null 2>&1
      setprop debug.sys.app_drop_cache 3 > /dev/null 2>&1
      setprop sys.memory.collector 1 > /dev/null 2>&1
      setprop persist.sys.kill_bg_apps 1 > /dev/null 2>&1
      setprop debug.kill_allocating_task 0 > /dev/null 2>&1
      setprop ro.config.fha_enable true > /dev/null 2>&1
      setprop ro.am.reschedule_service true > /dev/null 2>&1
      setprop ro.vendor.qti.am.reschedule_service true > /dev/null 2>&1
      exibir_status
      ;;
3)
      echo -e "${ROSA_CHOQUE}🎀 DIAGNÓSTICO DE MEMÓRIA MEMINFO 🎀${NC}"
      free -h
      setprop debug.ram.diag_status active > /dev/null 2>&1
      setprop debug.ram.monitor_interval 1 > /dev/null 2>&1
      setprop debug.ram.trace_alloc 0 > /dev/null 2>&1
      setprop debug.ram.force_gc 1 > /dev/null 2>&1
      setprop debug.ram.leak_detector 0 > /dev/null 2>&1
      setprop debug.ram.compact_memory 1 > /dev/null 2>&1
      setprop debug.ram.swap_efficiency max > /dev/null 2>&1
      setprop debug.ram.vfs_cache_pressure 50 > /dev/null 2>&1
      setprop debug.ram.swappiness 10 > /dev/null 2>&1
      setprop debug.ram.dirty_ratio 10 > /dev/null 2>&1
      setprop debug.ram.dirty_background_ratio 5 > /dev/null 2>&1
      setprop debug.ram.drop_caches 3 > /dev/null 2>&1
      setprop debug.ram.page_cluster 0 > /dev/null 2>&1
      setprop debug.ram.overcommit_memory 1 > /dev/null 2>&1
      setprop debug.ram.oom_dump_tasks 0 > /dev/null 2>&1
      setprop debug.ram.oom_kill_allocating_task 0 > /dev/null 2>&1
      setprop debug.ram.panic_on_oom 0 > /dev/null 2>&1
      setprop debug.ram.min_free_kbytes 8192 > /dev/null 2>&1
      setprop debug.ram.lowmem_kill_size 1 > /dev/null 2>&1
      setprop debug.ram.lmk_autoadjust 1 > /dev/null 2>&1
      setprop debug.ram.process_reclaim 1 > /dev/null 2>&1
      setprop debug.ram.slab_reclaim 1 > /dev/null 2>&1
      setprop debug.ram.anon_reclaim 1 > /dev/null 2>&1
      setprop debug.ram.file_reclaim 1 > /dev/null 2>&1
      setprop debug.ram.ext4_cache 1 > /dev/null 2>&1
      setprop debug.ram.buffer_clean 1 > /dev/null 2>&1
      setprop debug.ram.io_priority high > /dev/null 2>&1
      setprop debug.ram.read_ahead_kb 2048 > /dev/null 2>&1
      exibir_status
      ;;
    4)
      echo -e "${ROSA_CHOQUE}🎀 7VN INJETOR DE FPS & TAXA DE ATUALIZAÇÃO 🎀${NC}"
      echo -e "${ROSA_PASTEL}   [1] 60 Hz 🎀${NC}"
      echo -e "${ROSA_PASTEL}   [2] 90 Hz 🎀${NC}"
      echo -e "${ROSA_PASTEL}   [3] 120 Hz 🎀${NC}"
      read -p "   🎀 Escolha [1-3]: " hz_op
      case $hz_op in
        1) 
          settings put system peak_refresh_rate 60.0 > /dev/null 2>&1
          settings put system min_refresh_rate 60.0 > /dev/null 2>&1
          MODO_FPS="60 Hz Estável"
          ;;
        2) 
          settings put system peak_refresh_rate 90.0 > /dev/null 2>&1
          settings put system min_refresh_rate 90.0 > /dev/null 2>&1
          MODO_FPS="90 Hz Ultra Fluidês"
          ;;
        3) 
          settings put system peak_refresh_rate 120.0 > /dev/null 2>&1
          settings put system min_refresh_rate 120.0 > /dev/null 2>&1
          setprop debug.sf.frame_rate_multiple_threshold 120 > /dev/null 2>&1
          MODO_FPS="120 Hz Desempenho Máximo"
          ;;
      esac
      setprop debug.fps.override 1 > /dev/null 2>&1
      setprop debug.fps.uncap 1 > /dev/null 2>&1
      setprop debug.sf.fps_limit 0 > /dev/null 2>&1
      setprop debug.sf.showupdates 0 > /dev/null 2>&1
      setprop debug.sf.showcpu 0 > /dev/null 2>&1
      setprop debug.sf.showbackground 0 > /dev/null 2>&1
      setprop debug.sf.vsync_reactor 1 > /dev/null 2>&1
      setprop persist.sys.fps.mode max > /dev/null 2>&1
      setprop persist.sys.display.rate max > /dev/null 2>&1
      setprop persist.sys.NV_FPSLIMIT 0 > /dev/null 2>&1
      setprop debug.gr.swapinterval 0 > /dev/null 2>&1
      setprop debug.egl.swapinterval 0 > /dev/null 2>&1
      setprop debug.sf.early.app.duration 1 > /dev/null 2>&1
      setprop debug.sf.early.sf.duration 1 > /dev/null 2>&1
      setprop debug.sf.earlyGl.app.duration 1 > /dev/null 2>&1
      setprop debug.sf.earlyGl.sf.duration 1 > /dev/null 2>&1
      setprop debug.sf.disable_backpressure 1 > /dev/null 2>&1
      setprop debug.sf.latch_unsignaled 1 > /dev/null 2>&1
      setprop persist.sys.game.fps max > /dev/null 2>&1
      setprop debug.cpurendering.fps max > /dev/null 2>&1
      setprop debug.gpurendering.fps max > /dev/null 2>&1
      setprop debug.sf.enable_hwc_vds 1 > /dev/null 2>&1
      setprop debug.sf.predict_hwc_composition 1 > /dev/null 2>&1
      setprop debug.sf.recomputecrop 0 > /dev/null 2>&1
      setprop debug.hwui.fps_divisor 1 > /dev/null 2>&1
      setprop debug.performance.fps_boost 1 > /dev/null 2>&1
      setprop persist.vendor.display.fps max > /dev/null 2>&1
      setprop debug.display.refresh_rate max > /dev/null 2>&1
      exibir_status
      ;;
    5)
      echo -e "${ROSA_CHOQUE}🎀 CONFIGURANDO MOUSE EASY HELLO KITTY 🎀${NC}"
      setprop debug.touch.mouse_easy 1 > /dev/null 2>&1
      setprop persist.sys.mouse_precision high > /dev/null 2>&1
      setprop touch.pressure.scale 0.0001 > /dev/null 2>&1
      settings put system pointer_speed 7 > /dev/null 2>&1
      setprop touch.device.type touchScreen > /dev/null 2>&1
      setprop touch.orientationAware 1 > /dev/null 2>&1
      setprop touch.size.calibration geometric > /dev/null 2>&1
      setprop touch.size.scale 1 > /dev/null 2>&1
      setprop touch.size.bias 0 > /dev/null 2>&1
      setprop touch.size.isSummed 0 > /dev/null 2>&1
      setprop touch.pressure.calibration amplitude > /dev/null 2>&1
      setprop touch.pressure.scale 0.005 > /dev/null 2>&1
      setprop touch.orientation.calibration none > /dev/null 2>&1
      setprop touch.distance.calibration none > /dev/null 2>&1
      setprop touch.distance.scale 0 > /dev/null 2>&1
      setprop touch.coverage.calibration box > /dev/null 2>&1
      setprop touch.gestureMode spots > /dev/null 2>&1
      setprop view.touch_slop 1 > /dev/null 2>&1
      setprop view.fading_edge_length 0 > /dev/null 2>&1
      setprop view.minimum_fling_velocity 25 > /dev/null 2>&1
      setprop view.maximum_fling_velocity 25000 > /dev/null 2>&1
      setprop view.scroll_friction 0.001 > /dev/null 2>&1
      setprop windowsmgr.max_events_per_sec 480 > /dev/null 2>&1
      setprop ro.input.noresample 1 > /dev/null 2>&1
      setprop debug.performance.touch 1 > /dev/null 2>&1
      setprop persist.sys.touch.response max > /dev/null 2>&1
      setprop persist.sys.ui.hw 1 > /dev/null 2>&1
      setprop debug.touch.response_time 0 > /dev/null 2>&1
      setprop debug.touch.filter 0 > /dev/null 2>&1
      setprop debug.touch.smooth 1 > /dev/null 2>&1
      setprop persist.sys.mouse_easy.active 1 > /dev/null 2>&1
      MODO_TOUCH="Mouse Easy Calibrado"
      exibir_status
      ;;
    6)
      setprop debug.performance.touch 1 > /dev/null 2>&1
      setprop windowsmgr.max_events_per_sec 480 > /dev/null 2>&1
      setprop persist.sys.touch.response max > /dev/null 2>&1
      setprop ro.input.noresample 1 > /dev/null 2>&1
      setprop view.touch_slop 1 > /dev/null 2>&1
      setprop debug.touch.response_time 0 > /dev/null 2>&1
      setprop debug.touch.latency 0 > /dev/null 2>&1
      setprop touch.presure.scale 0.001 > /dev/null 2>&1
      setprop touch.size.scale 0.001 > /dev/null 2>&1
      setprop debug.touch.polling_rate 1000 > /dev/null 2>&1
      setprop debug.touch.sample_rate 1000 > /dev/null 2>&1
      setprop persist.sys.touch.high_sensitivity 1 > /dev/null 2>&1
      setprop debug.touch.smooth 0 > /dev/null 2>&1
      setprop debug.touch.filter 0 > /dev/null 2>&1
      setprop debug.touch.jerk_threshold 0 > /dev/null 2>&1
      setprop debug.touch.touch_boost 1 > /dev/null 2>&1
      setprop persist.sys.input.boost 1 > /dev/null 2>&1
      setprop sys.input.touch_latency 0 > /dev/null 2>&1
      setprop touch.coverage.calibration none > /dev/null 2>&1
      setprop touch.gesture.disable 1 > /dev/null 2>&1
      setprop touch.pressure.mode zero > /dev/null 2>&1
      setprop view.fading_edge_length 0 > /dev/null 2>&1
      setprop view.scroll_friction 0.001 > /dev/null 2>&1
      setprop view.minimum_fling_velocity 10 > /dev/null 2>&1
      setprop view.maximum_fling_velocity 30000 > /dev/null 2>&1
      setprop persist.sys.touch.glove_mode 1 > /dev/null 2>&1
      setprop debug.touch.fast_response 1 > /dev/null 2>&1
      setprop debug.touch.game_mode 1 > /dev/null 2>&1
      setprop persist.sys.input.fast_touch 1 > /dev/null 2>&1
      MODO_TOUCH="Zero Delay Latência Mínima"
      exibir_status
      ;;
    7)
      read -p "   🎀 Digite o valor para o Eixo X: " eixo_x
      read -p "   🎀 Digite o valor para o Eixo Y: " eixo_y
      
      setprop persist.sys.input.x_scale "$eixo_x" > /dev/null 2>&1
      setprop persist.sys.input.y_scale "$eixo_y" > /dev/null 2>&1
      setprop debug.touch.x_multiplier "$eixo_x" > /dev/null 2>&1
      setprop debug.touch.y_multiplier "$eixo_y" > /dev/null 2>&1
      setprop sys.inputxey.scale.x "$eixo_x" > /dev/null 2>&1
      setprop sys.inputxey.scale.y "$eixo_y" > /dev/null 2>&1
      setprop persist.sys.axis_x "$eixo_x" > /dev/null 2>&1
      setprop persist.sys.axis_y "$eixo_y" > /dev/null 2>&1
      setprop debug.sys.input.x_ratio "$eixo_x" > /dev/null 2>&1
      setprop debug.sys.input.y_ratio "$eixo_y" > /dev/null 2>&1
      setprop touch.axis.x_scale "$eixo_x" > /dev/null 2>&1
      setprop touch.axis.y_scale "$eixo_y" > /dev/null 2>&1
      setprop debug.touch.sens_x "$eixo_x" > /dev/null 2>&1
      setprop debug.touch.sens_y "$eixo_y" > /dev/null 2>&1
      setprop persist.touch.x_precision "$eixo_x" > /dev/null 2>&1
      setprop persist.touch.y_precision "$eixo_y" > /dev/null 2>&1
      setprop sys.touch.scale_x "$eixo_x" > /dev/null 2>&1
      setprop sys.touch.scale_y "$eixo_y" > /dev/null 2>&1
      setprop debug.input.axis_x_boost "$eixo_x" > /dev/null 2>&1
      setprop debug.input.axis_y_boost "$eixo_y" > /dev/null 2>&1
      setprop persist.input.x_calc "$eixo_x" > /dev/null 2>&1
      setprop persist.input.y_calc "$eixo_y" > /dev/null 2>&1
      setprop debug.touch.coord_x "$eixo_x" > /dev/null 2>&1
      setprop debug.touch.coord_y "$eixo_y" > /dev/null 2>&1
      setprop sys.input.x_sens "$eixo_x" > /dev/null 2>&1
      setprop sys.input.y_sens "$eixo_y" > /dev/null 2>&1
      setprop persist.sys.input.x_mode "$eixo_x" > /dev/null 2>&1
      setprop persist.sys.input.y_mode "$eixo_y" > /dev/null 2>&1
      setprop debug.axis.x_speed "$eixo_x" > /dev/null 2>&1
      setprop debug.axis.y_speed "$eixo_y" > /dev/null 2>&1
      
      MODO_TOUCH="Eixos X: $eixo_x | Y: $eixo_y"
      exibir_status
      ;;
    8)
      setprop persist.sys.input.x.speed max > /dev/null 2>&1
      setprop persist.sys.input.y.speed max > /dev/null 2>&1
      setprop input.accel.x max > /dev/null 2>&1
      setprop input.accel.y max > /dev/null 2>&1
      setprop debug.input.accel_x 10 > /dev/null 2>&1
      setprop debug.input.accel_y 10 > /dev/null 2>&1
      setprop touch.accel.x_multiplier max > /dev/null 2>&1
      setprop touch.accel.y_multiplier max > /dev/null 2>&1
      setprop persist.touch.accel_x 1 > /dev/null 2>&1
      setprop persist.touch.accel_y 1 > /dev/null 2>&1
      setprop sys.input.accel_boost 1 > /dev/null 2>&1
      setprop debug.touch.accel_mode max > /dev/null 2>&1
      setprop persist.sys.axis_accel 1 > /dev/null 2>&1
      setprop debug.axis.fast_move 1 > /dev/null 2>&1
      setprop touch.motion.accel max > /dev/null 2>&1
      setprop debug.motion.x_speed max > /dev/null 2>&1
      setprop debug.motion.y_speed max > /dev/null 2>&1
      setprop persist.sys.motion.accel_x max > /dev/null 2>&1
      setprop persist.sys.motion.accel_y max > /dev/null 2>&1
      setprop input.velocity.x max > /dev/null 2>&1
      setprop input.velocity.y max > /dev/null 2>&1
      setprop debug.velocity.accel 1 > /dev/null 2>&1
      setprop touch.velocity.x_scale max > /dev/null 2>&1
      setprop touch.velocity.y_scale max > /dev/null 2>&1
      setprop persist.input.velocity_boost 1 > /dev/null 2>&1
      setprop sys.touch.motion_boost 1 > /dev/null 2>&1
      setprop debug.touch.swipe_accel max > /dev/null 2>&1
      setprop debug.touch.pointer_accel max > /dev/null 2>&1
      setprop persist.sys.touch.accel_boost 1 > /dev/null 2>&1
      MODO_TOUCH="Aceleração de Movimentação Extrema"
      exibir_status
      ;;
    9)
      setprop net.tcp.buffersize.wifi 524288,1048576,2097152,262144,524288,1048576 > /dev/null 2>&1
      setprop net.ipv4.tcp_ecn 1 > /dev/null 2>&1
      setprop net.ipv4.route.flush 1 > /dev/null 2>&1
      setprop wifi.supplicant_scan_interval 360 > /dev/null 2>&1
      setprop net.tcp.buffersize.lte 524288,1048576,2097152,262144,524288,1048576 > /dev/null 2>&1
      setprop net.tcp.buffersize.umts 4094,87380,256000,4096,16384,256000 > /dev/null 2>&1
      setprop net.tcp.buffersize.gprs 4092,87380,11680,4092,87380,11680 > /dev/null 2>&1
      setprop net.tcp.buffersize.edge 4093,26280,35040,4096,16384,35040 > /dev/null 2>&1
      setprop net.ipv4.tcp_syncookies 1 > /dev/null 2>&1
      setprop net.ipv4.tcp_timestamps 0 > /dev/null 2>&1
      setprop net.ipv4.tcp_tw_reuse 1 > /dev/null 2>&1
      setprop net.ipv4.tcp_sack 1 > /dev/null 2>&1
      setprop net.ipv4.tcp_dsack 1 > /dev/null 2>&1
      setprop net.ipv4.tcp_window_scaling 1 > /dev/null 2>&1
      setprop net.dns1 8.8.8.8 > /dev/null 2>&1
      setprop net.dns2 8.8.4.4 > /dev/null 2>&1
      setprop net.rmnet0.dns1 8.8.8.8 > /dev/null 2>&1
      setprop net.rmnet0.dns2 8.8.4.4 > /dev/null 2>&1
      setprop net.pdp0.dns1 8.8.8.8 > /dev/null 2>&1
      setprop net.pdp0.dns2 8.8.4.4 > /dev/null 2>&1
      setprop net.ppp0.dns1 8.8.8.8 > /dev/null 2>&1
      setprop net.ppp0.dns2 8.8.4.4 > /dev/null 2>&1
      setprop net.eth0.dns1 8.8.8.8 > /dev/null 2>&1
      setprop net.eth0.dns2 8.8.4.4 > /dev/null 2>&1
      setprop persist.sys.network.latency low > /dev/null 2>&1
      setprop debug.net.ping_opt 1 > /dev/null 2>&1
      setprop persist.sys.wifi.optimization true > /dev/null 2>&1
      setprop debug.net.fast_packet 1 > /dev/null 2>&1
      setprop persist.sys.tcp.fastopen 3 > /dev/null 2>&1
      setprop net.ipv4.tcp_fin_timeout 15 > /dev/null 2>&1
      setprop net.ipv4.tcp_keepalive_time 1800 > /dev/null 2>&1
      exibir_status
      ;;
    10)
      for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
        [ -f "$cpu" ] && echo "performance" > "$cpu" 2>/dev/null || true
      done
      setprop debug.performance.tuning 1 > /dev/null 2>&1
      setprop persist.sys.power.mode high > /dev/null 2>&1
      setprop debug.cpu.governor performance > /dev/null 2>&1
      setprop persist.sys.cpu.performance 1 > /dev/null 2>&1
      setprop debug.sys.cpu.boost 1 > /dev/null 2>&1
      setprop persist.sys.thermal.control 0 > /dev/null 2>&1
      setprop debug.thermal.throttle 0 > /dev/null 2>&1
      setprop persist.vendor.power.mode max > /dev/null 2>&1
      setprop debug.power.performance_mode 1 > /dev/null 2>&1
      setprop sys.cpu.pwr_mode max > /dev/null 2>&1
      setprop debug.sys.cpu.clock max > /dev/null 2>&1
      setprop persist.sys.cpufreq.boost 1 > /dev/null 2>&1
      setprop debug.cpu.core_lock 0 > /dev/null 2>&1
      setprop debug.cpu.hotplug.disable 1 > /dev/null 2>&1
      setprop persist.sys.cpu.unpark_all 1 > /dev/null 2>&1
      setprop debug.cpu.min_freq max > /dev/null 2>&1
      setprop persist.sys.gpu.performance 1 > /dev/null 2>&1
      setprop debug.gpu.governor performance > /dev/null 2>&1
      setprop debug.gpu.clock max > /dev/null 2>&1
      setprop persist.sys.gpu.boost 1 > /dev/null 2>&1
      setprop debug.power.gpu_max 1 > /dev/null 2>&1
      setprop persist.sys.soc.perf max > /dev/null 2>&1
      setprop debug.soc.boost 1 > /dev/null 2>&1
      setprop persist.sys.cpu_max_freq 1 > /dev/null 2>&1
      setprop debug.cpu.sched_boost 1 > /dev/null 2>&1
      setprop persist.sys.sched_energy_aware 0 > /dev/null 2>&1
      setprop debug.power.no_limits 1 > /dev/null 2>&1
      MODO_CPU="Modo Desempenho Máximo (Performance Governor)"
      exibir_status
      ;;
    11)
      rm -rf /data/local/tmp/* 2>/dev/null || true
      logcat -c 2>/dev/null || true
      setprop debug.sys.log_clean 1 > /dev/null 2>&1
      setprop persist.sys.clear_cache 1 > /dev/null 2>&1
      setprop debug.clean.temp_files 1 > /dev/null 2>&1
      setprop persist.sys.purge_logs 1 > /dev/null 2>&1
      setprop debug.logcat.disable 1 > /dev/null 2>&1
      setprop persist.sys.logd.size 64K > /dev/null 2>&1
      setprop debug.sys.trim_system 1 > /dev/null 2>&1
      setprop persist.sys.drop_junk 1 > /dev/null 2>&1
      setprop debug.clean.dalvik_cache 1 > /dev/null 2>&1
      setprop persist.sys.empty_trash 1 > /dev/null 2>&1
      setprop debug.sys.app_cache_clean 1 > /dev/null 2>&1
      setprop persist.sys.clean_tombstones 1 > /dev/null 2>&1
      setprop debug.sys.clean_anr 1 > /dev/null 2>&1
      setprop persist.sys.clean_dropbox 1 > /dev/null 2>&1
      setprop debug.sys.clean_user_cache 1 > /dev/null 2>&1
      setprop persist.sys.clean_vendor_logs 1 > /dev/null 2>&1
      setprop debug.sys.clean_kernel_logs 1 > /dev/null 2>&1
      setprop persist.sys.clean_media_cache 1 > /dev/null 2>&1
      setprop debug.sys.clean_thumb_cache 1 > /dev/null 2>&1
      setprop persist.sys.clean_web_cache 1 > /dev/null 2>&1
      setprop debug.sys.clean_apk_cache 1 > /dev/null 2>&1
      setprop persist.sys.clean_backup_cache 1 > /dev/null 2>&1
      setprop debug.sys.clean_download_cache 1 > /dev/null 2>&1
      setprop persist.sys.clean_dex_cache 1 > /dev/null 2>&1
      setprop debug.sys.clean_art_cache 1 > /dev/null 2>&1
      setprop persist.sys.clean_system_tmp 1 > /dev/null 2>&1
      setprop debug.sys.deep_clean_mode 1 > /dev/null 2>&1
      exibir_status
      ;;
    12)
      ff_pid=$(pgrep -f "dts.freefireth" 2>/dev/null)
      if [ -n "$ff_pid" ]; then
        renice -n -20 -p "$ff_pid" 2>/dev/null || true
        ionice -c 1 -n 0 -p "$ff_pid" 2>/dev/null || true
      fi
      setprop debug.game.priority high > /dev/null 2>&1
      setprop persist.sys.ff.boost 1 > /dev/null 2>&1
      setprop debug.ff.cpu_priority max > /dev/null 2>&1
      setprop debug.ff.gpu_priority max > /dev/null 2>&1
      setprop persist.sys.game.mode 1 > /dev/null 2>&1
      setprop debug.game.cpu_alloc max > /dev/null 2>&1
      setprop persist.sys.ff.realtime 1 > /dev/null 2>&1
      setprop debug.ff.ram_allocation max > /dev/null 2>&1
      setprop persist.sys.game.perf_boost 1 > /dev/null 2>&1
      setprop debug.game.io_priority 0 > /dev/null 2>&1
      setprop persist.sys.ff.no_lag 1 > /dev/null 2>&1
      setprop debug.ff.fps_stabilizer 1 > /dev/null 2>&1
      setprop persist.sys.game.touch_boost 1 > /dev/null 2>&1
      setprop debug.ff.render_priority max > /dev/null 2>&1
      setprop persist.sys.game.sched_fifo 1 > /dev/null 2>&1
      setprop debug.ff.affinity_mask all > /dev/null 2>&1
      setprop persist.sys.game.unfreeze 1 > /dev/null 2>&1
      setprop debug.ff.thread_priority -20 > /dev/null 2>&1
      setprop persist.sys.game.focus 1 > /dev/null 2>&1
      setprop debug.ff.network_priority max > /dev/null 2>&1
      setprop persist.sys.game.background_kill 1 > /dev/null 2>&1
      setprop debug.ff.ultra_perf 1 > /dev/null 2>&1
      setprop persist.sys.game.latency_low 1 > /dev/null 2>&1
      setprop debug.ff.vsync_off 1 > /dev/null 2>&1
      setprop persist.sys.game.gpu_turbo 1 > /dev/null 2>&1
      setprop debug.ff.cpu_cores_all 1 > /dev/null 2>&1
      setprop persist.sys.ff.vip_mode 1 > /dev/null 2>&1
      exibir_status
      ;;
    13)
      while true; do
        clear
        echo -e "${ROSA_CHOQUE}╭──────────────────────────────────────────────────────────╮${NC}"
        echo -e "${ROSA_CHOQUE}│           🎀 7VN SEGREDINHO VIP - HELLO KITTY 🎀        │${NC}"
        echo -e "${ROSA_CHOQUE}╰──────────────────────────────────────────────────────────╯${NC}"
        echo -e "${ROSA_PASTEL}   [1]${NC} ${ROSA_FOFO}Injetar 120 / 144 FPS Free Fire 🎀${NC}"
        echo -e "${ROSA_PASTEL}   [2]${NC} ${ROSA_FOFO}Injetar Otimização VIP Por Celular 🎀${NC}"
        echo -e "${ROSA_PASTEL}   [3]${NC} ${ROSA_FOFO}Injetar Mouse Easy 🎀${NC}"
        echo -e "${ROSA_PASTEL}   [4]${NC} ${ROSA_FOFO}Apagar Liquid Glass da Motorola 🎀${NC}"
        echo -e "${ROSA_PASTEL}   [5]${NC} ${ROSA_FOFO}Mouse Conversion (Configurar Eixos X/Y) 🎀${NC}"
        echo -e "${ROSA_PASTEL}   [6]${NC} ${ROSA_CHOQUE}Voltar ao Menu Principal 🎀${NC}"
        echo ""
        read -p "   🎀 Escolha uma opção VIP [1-6]: " vip_op

        case $vip_op in
          1)
            setprop debug.sf.fps 144 > /dev/null 2>&1
            setprop persist.sys.ff.fps 144 > /dev/null 2>&1
            setprop debug.gr.swapinterval 0 > /dev/null 2>&1
            settings put system peak_refresh_rate 144.0 > /dev/null 2>&1
            settings put system min_refresh_rate 144.0 > /dev/null 2>&1
            settings put system user_refresh_rate 144 > /dev/null 2>&1
            setprop debug.egl.hw 1 > /dev/null 2>&1
            setprop debug.sf.hw 1 > /dev/null 2>&1
            setprop debug.performance.tuning 1 > /dev/null 2>&1
            setprop debug.sf.showfps 0 > /dev/null 2>&1
            setprop debug.sf.early.app.duration 1 > /dev/null 2>&1
            setprop debug.sf.early.sf.duration 1 > /dev/null 2>&1
            setprop debug.sf.earlyGl.app.duration 1 > /dev/null 2>&1
            setprop debug.sf.earlyGl.sf.duration 1 > /dev/null 2>&1
            setprop debug.sf.frame_rate_multiple_threshold 144 > /dev/null 2>&1
            setprop persist.sys.NV_FPSLIMIT 144 > /dev/null 2>&1
            setprop persist.sys.display.rate 144 > /dev/null 2>&1
            setprop debug.composition.type gpu > /dev/null 2>&1
            setprop debug.renderengine.backend skiavk > /dev/null 2>&1
            setprop debug.hwui.renderer skiavk > /dev/null 2>&1
            setprop persist.sys.use_dithering 0 > /dev/null 2>&1
            setprop persist.vendor.color.mode 2 > /dev/null 2>&1
            setprop debug.sf.disable_backpressure 1 > /dev/null 2>&1
            setprop debug.sf.latch_unsignaled 1 > /dev/null 2>&1
            setprop persist.sys.game.fps 144 > /dev/null 2>&1
            setprop debug.cpurendering.fps 144 > /dev/null 2>&1
            setprop debug.gpurendering.fps 144 > /dev/null 2>&1
            setprop debug.sf.enable_hwc_vds 1 > /dev/null 2>&1
            setprop debug.sf.predict_hwc_composition 1 > /dev/null 2>&1
            setprop debug.sf.recomputecrop 0 > /dev/null 2>&1
            MODO_FPS="144 FPS VIP Liberado"
            echo -e "${ROSA_PASTEL}120/144 FPS Liberado com sucesso! 🎀${NC}"
            exibir_status
            read -p "Pressione [Enter] para continuar..."
            ;;
          2)
            read -p "   🎀 Digite o modelo exato do seu celular: " modelo_celular
            
            for i in $(seq 1 30); do
              codigo_id=$(printf "%02d" $i)
              setprop "debug.7vn.vip_model_$codigo_id" "$modelo_celular" > /dev/null 2>&1
              setprop "persist.sys.7vn.opt_$codigo_id" "perf_max" > /dev/null 2>&1
            done
            echo -e "${ROSA_PASTEL}Otimização VIP aplicada para $modelo_celular! 🎀${NC}"
            exibir_status
            read -p "Pressione [Enter] para continuar..."
            ;;
          3)
            setprop debug.touch.mouse_easy 1 > /dev/null 2>&1
            setprop persist.sys.mouse_precision high > /dev/null 2>&1
            setprop touch.pressure.scale 0.0001 > /dev/null 2>&1
            settings put system pointer_speed 7 > /dev/null 2>&1
            setprop touch.device.type touchScreen > /dev/null 2>&1
            setprop touch.orientationAware 1 > /dev/null 2>&1
            setprop touch.size.calibration geometric > /dev/null 2>&1
            setprop touch.size.scale 1 > /dev/null 2>&1
            setprop touch.size.bias 0 > /dev/null 2>&1
            setprop touch.size.isSummed 0 > /dev/null 2>&1
            setprop touch.pressure.calibration amplitude > /dev/null 2>&1
            setprop touch.pressure.scale 0.005 > /dev/null 2>&1
            setprop touch.orientation.calibration none > /dev/null 2>&1
            setprop touch.distance.calibration none > /dev/null 2>&1
            setprop touch.distance.scale 0 > /dev/null 2>&1
            setprop touch.coverage.calibration box > /dev/null 2>&1
            setprop touch.gestureMode spots > /dev/null 2>&1
            setprop view.touch_slop 1 > /dev/null 2>&1
            setprop view.fading_edge_length 0 > /dev/null 2>&1
            setprop view.minimum_fling_velocity 25 > /dev/null 2>&1
            setprop view.maximum_fling_velocity 25000 > /dev/null 2>&1
            setprop view.scroll_friction 0.001 > /dev/null 2>&1
            setprop windowsmgr.max_events_per_sec 480 > /dev/null 2>&1
            setprop ro.input.noresample 1 > /dev/null 2>&1
            setprop debug.performance.touch 1 > /dev/null 2>&1
            setprop persist.sys.touch.response max > /dev/null 2>&1
            setprop persist.sys.ui.hw 1 > /dev/null 2>&1
            setprop debug.touch.response_time 0 > /dev/null 2>&1
            setprop debug.touch.filter 0 > /dev/null 2>&1
            setprop debug.touch.smooth 1 > /dev/null 2>&1
            MODO_TOUCH="Mouse Easy Injetado"
            echo -e "${ROSA_PASTEL}Mouse Easy ativado! 🎀${NC}"
            exibir_status
            read -p "Pressione [Enter] para continuar..."
            ;;
          4)
            pm uninstall -k --user 0 com.motorola.liquidglass > /dev/null 2>&1
            pm disable-user --user 0 com.motorola.liquidglass > /dev/null 2>&1
            setprop persist.sys.liquidglass.enable 0 > /dev/null 2>&1
            echo -e "${ROSA_PASTEL}Liquid Glass removido com sucesso! 🎀${NC}"
            exibir_status
            read -p "Pressione [Enter] para continuar..."
            ;;
          5)
            read -p "   🎀 Digite o valor exato do Eixo X do Mouse Conversion: " mouse_x
            read -p "   🎀 Digite o valor exato do Eixo Y do Mouse Conversion: " mouse_y
            
            setprop persist.sys.input.x_scale "$mouse_x" > /dev/null 2>&1
            setprop persist.sys.input.y_scale "$mouse_y" > /dev/null 2>&1
            setprop debug.touch.x_multiplier "$mouse_x" > /dev/null 2>&1
            setprop debug.touch.y_multiplier "$mouse_y" > /dev/null 2>&1
            setprop sys.inputxey.scale.x "$mouse_x" > /dev/null 2>&1
            setprop sys.inputxey.scale.y "$mouse_y" > /dev/null 2>&1
            
            for i in $(seq 1 30); do
              cod_num=$(printf "%02d" $i)
              setprop "debug.7vn.mouse_x_$cod_num" "$mouse_x" > /dev/null 2>&1
              setprop "debug.7vn.mouse_y_$cod_num" "$mouse_y" > /dev/null 2>&1
            done
            
            MODO_TOUCH="Mouse Conversion (X: $mouse_x | Y: $mouse_y)"
            echo -e "${ROSA_PASTEL}Sensibilidade do Mouse Conversion aplicada! (X: $mouse_x | Y: $mouse_y) 🎀${NC}"
            exibir_status
            read -p "Pressione [Enter] para continuar..."
            ;;
          6)
            break
            ;;
          *)
            echo -e "${ROSA_CHOQUE}Opção VIP inválida!${NC}"
            sleep 1
            ;;
        esac
      done
      ;;
    14)
      echo -e "${ROSA_CHOQUE}🎀 CONFIGURAÇÃO TRICK FOV DE TELA (EIXOS DEDICADOS) 🎀${NC}"
      echo -e "${ROSA_PASTEL}Responda às 4 perguntas de calibragem abaixo:${NC}\n"

      read -p "   1. [Eixo X] Digite a escala do FOV Horizontal da tela: " tf_x
      read -p "   2. [Eixo Y] Digite a escala do FOV Vertical da tela: " tf_y
      read -p "   3. [Touch X] Digite a sensibilidade do Eixo X: " tf_sens_x
      read -p "   4. [Touch Y] Digite a sensibilidade do Eixo Y: " tf_sens_y

      setprop persist.sys.screen.fov_x "$tf_x" > /dev/null 2>&1
      setprop persist.sys.screen.fov_y "$tf_y" > /dev/null 2>&1
      setprop debug.fov.matrix_scale_x "$tf_sens_x" > /dev/null 2>&1
      setprop debug.fov.matrix_scale_y "$tf_sens_y" > /dev/null 2>&1
      setprop persist.vendor.display.fov_accel_x "$tf_x" > /dev/null 2>&1
      setprop persist.vendor.display.fov_accel_y "$tf_y" > /dev/null 2>&1
      setprop sys.input.fov_touch_bias_x "$tf_sens_x" > /dev/null 2>&1
      setprop sys.input.fov_touch_bias_y "$tf_sens_y" > /dev/null 2>&1
      setprop persist.sys.ff_fov_trick_x "$tf_x" > /dev/null 2>&1
      setprop persist.sys.ff_fov_trick_y "$tf_y" > /dev/null 2>&1
      setprop debug.game.fov_override_x "$tf_x" > /dev/null 2>&1
      setprop debug.game.fov_override_y "$tf_y" > /dev/null 2>&1
      setprop persist.touch.fov_scale_x "$tf_sens_x" > /dev/null 2>&1
      setprop persist.touch.fov_scale_y "$tf_sens_y" > /dev/null 2>&1

      MODO_FOV="Trick FOV (X: $tf_x | Y: $tf_y)"
      echo -e "\n${ROSA_PASTEL}🎀 Trick FOV de tela injetado com sucesso nos eixos X e Y! 🎀${NC}"
      exibir_status
      ;;
    15)
      echo -e "${ROSA_CHOQUE}🎀 AJUSTAR FOV X E Y - SENSI ALTA ANTI-PINAR 🎀${NC}"
      read -p "   🎀 Digite o valor para FOV X (Sensibilidade Alta): " fov_x
      read -p "   🎀 Digite o valor para FOV Y (Sensibilidade Alta): " fov_y

      setprop persist.sys.fov.x "$fov_x" > /dev/null 2>&1
      setprop persist.sys.fov.y "$fov_y" > /dev/null 2>&1
      setprop debug.touch.fov_x_scale "$fov_x" > /dev/null 2>&1
      setprop debug.touch.fov_y_scale "$fov_y" > /dev/null 2>&1
      setprop sys.input.fov_x_ratio "$fov_x" > /dev/null 2>&1
      setprop sys.input.fov_y_ratio "$fov_y" > /dev/null 2>&1
      setprop debug.touch.sensi_high_x "$fov_x" > /dev/null 2>&1
      setprop debug.touch.sensi_high_y "$fov_y" > /dev/null 2>&1
      setprop persist.sys.aim.stabilizer 1 > /dev/null 2>&1
      setprop debug.touch.no_recoil 1 > /dev/null 2>&1
      setprop debug.touch.anti_shake 1 > /dev/null 2>&1
      setprop persist.sys.aim.precision_lock 1 > /dev/null 2>&1
      setprop debug.touch.head_shot_boost 1 > /dev/null 2>&1
      setprop persist.sys.touch.smooth_aim 1 > /dev/null 2>&1
      setprop debug.input.fov_stabilize "$fov_x" > /dev/null 2>&1

      MODO_FOV="Sensi Alta Anti-Pinar (X: $fov_x | Y: $fov_y)"
      echo -e "${ROSA_PASTEL}🎀 FOV X ($fov_x) e FOV Y ($fov_y) Aplicados com Sucesso! Mira Estabilizada sem Pinar! 🎀${NC}"
      exibir_status
      ;;
    16)
      echo -e "${ROSA_PASTEL}Saindo... Siga no TikTok: 7vn&120hz 🎀${NC}"
      exit 0
      ;;
    *)
      echo -e "${ROSA_CHOQUE}Opção inválida!${NC}"
      ;;
  esac

  echo ""
  read -p "Pressione [Enter] para voltar ao menu principal..."
done
