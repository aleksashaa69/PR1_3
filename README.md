# Руководство по стилю

## 1. Цветовая палитра
- **Основной фон:** белый (#FFFFFF)
- **Основной текст:** чёрный (#000000)
- **Акцентный цвет:** синий, например, корпоративный оттенок (#0033A0)

## 2. Шрифты и типографика
- **Основной шрифт:** Times New Roman  
  _Размер: 14 pt для основного текста_
- **Заголовки:** Times New Roman Bold  
  _Размер: 16 pt для основных заголовков, 18 pt для разделов_
- **Интерлиньяж и отступы:**
  - Межстрочный интервал: 1,5
  - Отступ первой строки абзаца: 1,25 см

## 3. Элементы интерфейса
- **Кнопки:**
  - Фон: акцентный синий (#0033A0)
  - Текст: белый (#FFFFFF)
  - Скруглённые углы: 5 px
- **Поля ввода:**
  - Рамка: 1 px, серый (#CCCCCC)
  - Внутренние отступы: 8 px

## 4. Отступы и размеры
- **Стандартный отступ:** 10 px со всех сторон для элементов
- **Минимальная высота элементов управления:** 40 px

## 5. Пример CSS для кнопки (при использовании веб-технологий)
```css
button {
    background-color: #0033A0;
    color: #FFFFFF;
    border: none;
    border-radius: 5px;
    padding: 10px;
    font-family: "Times New Roman", serif;
    font-size: 14pt;
}
