FROM ubuntu:22.04

# Устанавливаем переменные окружения для избежания интерактивных диалогов
ENV DEBIAN_FRONTEND=noninteractive

# Устанавливаем базовые зависимости включая timeout (из пакета coreutils)
RUN apt update && \
    apt install -y --no-install-recommends \
    wget \
    git \
    nodejs \
    npm \
    unzip \
    golang \
    ca-certificates \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

# Скачиваем и устанавливаем Neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-arm64.tar.gz && \
    tar xzvf nvim-linux-arm64.tar.gz -C /usr/local --strip-components=1 && \
    rm nvim-linux-arm64.tar.gz

# Клонируем конфигурацию Neovim
RUN git clone https://github.com/kaktyz/devops_neovim.git /root/.config/nvim

# Создаем скрипт для автоматической установки Mason пакетов
RUN cat > /tmp/setup_nvim.sh << 'EOF' \
#!/bin/bash \
# Запускаем nvim в фоновом режиме для инициализации lazy.nvim \
timeout 30s nvim --headless "+Lazy! sync" +qa \
# Ждем завершения инициализации \
sleep 5 \
# Устанавливаем все пакеты через Mason \
nvim --headless "+MasonInstallAll" +qa \
# Даем дополнительное время на скачивание LSP серверов \
sleep 10 \
# Финальная проверка \
nvim --headless "+checkhealth" +qa \
EOF

RUN chmod +x /tmp/setup_nvim.sh

# Запускаем автоматическую настройку
RUN /tmp/setup_nvim.sh

# Очищаем кэш и временные файлы
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt clean

# Устанавливаем рабочую директорию
WORKDIR /app

# Создаем точку входа для удобного использования
ENTRYPOINT ["nvim"]
CMD ["--help"]

