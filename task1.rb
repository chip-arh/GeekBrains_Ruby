# Task 1

def getSymbol(c,m)    # функция возвращает стандартизованный символ или ошибку 
    cod = c.upcase.ord;
    if (((cod>=65)&(cod<=90))|((cod>=48)&(cod<=57))|((m==1)&(cod>32)&(cod<255)))
        c.upcase; 
    else
        'Error';
    end
end

str = ARGV[0]; # входной параметр
if ((str.length >=1) & (str.length <=10000)) # проверка на соответствие
    str = str.strip;                         # убираем пробелы с краев    
    start_pos = 0;                           # начальная позиция для сравнения
    end_pos = str.length()-1;                # конечная позиция для сравнения
    #puts(str);
    result = 'YES'                           # результат 
    symb1='';                                # инициируем переменные
    symb2='';                                #
    start = 0;
    while ((start_pos<end_pos)&(result=='YES')) #цикл пока позиции не сошлись и строка
        #puts('Start')
        loop do                              # цикл пока не получим нормальный символ
            #puts(start_pos)
            symb1 = getSymbol(str[start_pos],start);
            if symb1 == 'Error'
                start_pos=start_pos+1;
            end
            break if (symb1!='Error') | (start_pos>end_pos)
        end
        #puts('end')
        loop do                             # цикл пока не получим нормальный символ
            #puts(end_pos)
            symb2 = getSymbol(str[end_pos],start);
            if symb2 == 'Error'
                end_pos=end_pos-1;
            end
            break if (symb2!='Error') | (start_pos>end_pos)    
        end
        start = 1;
        #puts("#{symb1} (#{start_pos}) - #{symb2} (#{end_pos})")
        # проверяем символы
        if ((symb1 != symb2) | (symb1 == 'Error'))
            result = 'NO';
        end
        # сдвигаем позиции
        start_pos = start_pos+1;
        end_pos = end_pos-1;
    end;
    puts(result);
else
    puts('1 <= длина строки <= 10000');
end;
        

