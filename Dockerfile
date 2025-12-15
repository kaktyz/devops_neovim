FROM ubuntu:22.04

# Устанавливаем переменные окружения для избежания интерактивных диалогов
ENV DEBIAN_FRONTEND=noninteractive

# Устанавливаем базовые зависимости
RUN apt update && \
    apt install -y --no-install-recommends \
    wget \
    git \
    nodejs \
    npm \
    unzip \
    golang \
    ca-certificates \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем и устанавливаем Neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-arm64.tar.gz && \
    tar xzvf nvim-linux-arm64.tar.gz -C /usr/local --strip-components=1 && \
    rm nvim-linux-arm64.tar.gz

# Клонируем конфигурацию Neovim
RUN git clone https://github.com/kaktyz/devops_neovim.git /root/.config/nvim

# Создаем необходимые директории для Mason
RUN mkdir -p /root/.local/share/nvim/mason /root/.local/state/nvim/mason

# Инициализируем Lazy.nvim и устанавливаем Mason пакеты с проверками
RUN echo "Step 1: Initializing lazy.nvim..." && \
    nvim --headless "+Lazy! sync" +qa && \
    sleep 30 && \
    echo "Step 2: Checking Mason installation..." && \
    nvim --headless "+lua print('Mason path:', require('mason.settings').current.install_root_dir)" +qa && \
    echo "Step 3: Installing Mason packages..." && \
    nvim --headless "+MasonInstallAll" +qa && \
    sleep 60 && \
    echo "Step 4: Verifying installed packages..." && \
    nvim --headless "+Mason" +qa

# Проверяем что установилось
RUN echo "Checking Mason directory structure:" && \
    find /root/.local/share/nvim/mason -type f -name "*" 2>/dev/null | head -20 || echo "No files found in Mason directory" && \
    echo "Mason directory contents:" && \
    ls -la /root/.local/share/nvim/mason/ && \
    echo "State directory contents:" && \
    ls -la /root/.local/state/nvim/mason/ 2>/dev/null || echo "No state directory"

# Очищаем кэш
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаем точку входа для удобного использования
ENTRYPOINT ["nvim"]
CMD ["--help"]
