# Linker
### Библиотека для ComputerCraft на ярлыки
## Установка
1. Напишите команду `pastebin get 02TU98wh linker_installer`
2. После установки инсталлера напишите `linker_installer <Папка, в которой будет папка linker>`
3. Готово! Вы установили Linker🎉!
## Документация
### linker.Create(string linkName, string filePath[, string iconPath]) - return table {bool Error, string InvalidArgument} || nil
Создать ярлык, по открытию которого перенесёт в filePath(Может быть и папкой) с иконкой iconPath
### linker.openLnk(string lnkFile) - return table{bool Error, string InvalidArgument} || nil
Открыть ярлык lnkFile
### linker.getIconPath(string lnkFile) - return table {bool Error, string InvalidArgument}, string IconPath
Возвращает путь до иконки
### linker.getPath(string lnkFile) - return table {bool Error, string InvalidArgument}, string filePath
Возвращает путь до файла