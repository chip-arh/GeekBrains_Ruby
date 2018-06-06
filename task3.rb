# Task 3

def getSymbol(c)    # функция возвращает массив [глас, соглас, цифр] символ помещается в
                    # соответсвующий элемент массива
    cod = c.upcase.ord;
    _num = '';
    _glas = '';
    _soglas = '';
    if ((cod>=48)&(cod<=57)) # цифра
        _num=c;
    end
    if ((cod>=65)&(cod<=90)) # символ
        if (['A','E','I','O','U','Y'].index(c.upcase)!=nil) #гласный
            _glas = c;
        else 
            _soglas = c;
        end
    end
    return _glas, _soglas, _num 
end

str = ARGV[0]; # входной параметр
if (str.length>=1)&(str.length<=10000)
    # инициализация переменных
    num='';
    glas = '';
    soglas = '';
    # цикл посимвольно
    str.each_char do |c|
        r = getSymbol(c);       # получили массив
        glas=glas+r[0];         # добавим в соответсвующие переменный
        soglas = soglas+r[1];
        num = num + r[2];
    end
    puts("#{glas} #{soglas} #{num}".strip);
else
    puts("1 <= длина строки <= 10000 - не соблюдается")
end