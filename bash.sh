#!/bin/bash

# Визначення директорій для резервного копіювання
SOURCE_DIR="/path/to/source/directory" # Замість цього шляху вкажіть шлях до вашої вихідної директорії
DEST_DIR="/path/to/destination/directory" # Замість цього шляху вкажіть шлях до вашої цільової директорії

# Створення назви резервної копії з датою та часом
TIMESTAMP=$(date +"%Y%m%d%H%M%S") # Отримання поточної дати та часу в форматі YYYYMMDDHHMMSS
BACKUP_NAME="backup_$TIMESTAMP.tar.gz" # Формування імені резервного файлу

# Перевірка існування вихідної директорії
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Вихідна директорія не існує: $SOURCE_DIR"
  exit 1
fi

# Перевірка існування цільової директорії, створення якщо не існує
if [ ! -d "$DEST_DIR" ]; then
  echo "Цільова директорія не існує. Створюю: $DEST_DIR"
  mkdir -p $DEST_DIR
fi

# Виконання резервного копіювання
tar -czf $DEST_DIR/$BACKUP_NAME -C $SOURCE_DIR .

# Перевірка успішності створення резервної копії
if [ $? -eq 0 ]; then
  echo "Резервне копіювання завершено успішно: $DEST_DIR/$BACKUP_NAME"
else
  echo "Помилка під час резервного копіювання"
  exit 1
fi
