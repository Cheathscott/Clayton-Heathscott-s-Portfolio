#Clayton Heathscott
#lab2

import itertools
import re

def Open_Parse_file():
    D = str(input("Which file would you like to open?  "))
    t = open(D, "r")
    fh=open("Heathscott-Clayton-output.txt",'w')
    print("\n")
    print("<Tokens>",file=fh)
    count = 0
   
    with open(D) as t: 
     while True:
        encomword = " "
        element  = " "
        count += 1
        line = t.readline()
        line.strip()
        if not line: 
            break
        if line.startswith('//'):
            continue
        elif line.startswith('/*'):
            if line.endswith('*/'):
                continue
            else:
                m = line.endswith('*/\n')
                while not m:
           
                    count += 1
                    line = t.readline()
                    m = line.endswith('*/\n')
        elif line.startswith(' '):
                line = line.strip(' ')
                if line.startswith('//'):
                    continue
                if '//' in line:
                    
                    for element in line: 
                        if element == '/':
                            break
                        else:
                            encomword = encomword + element
                     #print(element, end='')
                    
                  
            #else:
                if element == '/':
                    line = encomword
                #print(line.strip())
                split = line.split(' ')
                alpha = "" 
                num = "" 
                special = " " 
                quote_catch = " "
                fullword = " "
                m = 0
                tempnum = 0
                for i in range(len(line)):
                    if m > 0:
                        i = tempnum
                    if i >= (len(line)):
                        break
                    temp = line[i]
                    if (line[i].isdigit()): 
                        num = num+ line[i]          
                    elif (temp == '"'):
                    
                        m = i
                        m += 1
                        while (line[m] != '"'):
                            fullword = fullword + line[m]
                            m += 1
                        tempnum = m
                    elif((line[i] >= 'A' and line[i] <= 'Z') or
                        (line[i] >= 'a' and line[i] <= 'z')): 
                        alpha = alpha + line[i]
                    else: 
                        special += line[i]
                    if m > 0:
                        tempnum = tempnum + 1
                
                    if fullword != " ":
                        print ("<StringConstant>", fullword, "</StringConstant>",file=fh)
            #checking for keywords
                
            
                    list1=re.findall(r'\b\w+\b',line)
                    list2 = re.findall(r'\b\w+\b',fullword)
                for word in list1:
                    removed = word.replace("\n", " ")
                    word = removed                                 
                    if word == "class":
                     print ("<Keyword>", word, "</Keyword",file=fh)
                    elif word == "void":
                        print("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "function":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "var":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "int":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "let":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "while":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "do":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    elif word == "return":
                        print ("<Keyword>", word, "</Keyword>",file=fh)
                    else:
                        tempword = " "
                        for s in list2:     
                            if word == s:
                                tempword = s
                                break
                        if word == tempword:
                            continue
                        print("<identifier>", word ,"</identifier>",file=fh)
                for ch in special:
                        if ch == '{':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '}':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '(':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == ')':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == ';':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '=':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '+':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '-':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '/':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == ',':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '.':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '[':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == ']':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '<':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                        elif ch == '>':
                            print ("<Symbol>", ch, "</Symbol>",file=fh)
                for i in num:
                    if i == 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9:
                        print("<integerConstant>", i ,"</integerConstant>",file=fh)


            

        else:
            #print(line.strip())
            split = line.split(' ')
            alpha = " " 
            num = " " 
            special = " " 
            quote_catch = " "
            fullword = " "
            m = 0
            tempnum = 0
            for i in range(len(line)):
                if m > 0:
                    i = tempnum
                if i >= (len(line)):
                    break
                temp = line[i]
                if (line[i].isdigit()): 
                    num = num+ line[i]          
                elif (temp == '"'):
                    
                    m = i
                    m += 1
                    while (line[m] != '"'):
                        fullword = fullword + line[m]
                        m += 1
                    tempnum = m
                elif((line[i] >= 'A' and line[i] <= 'Z') or
                    (line[i] >= 'a' and line[i] <= 'z')): 
                    alpha = alpha + line[i]
                else: 
                    special += line[i]
                if m > 0:
                   tempnum = tempnum + 1
                
            if fullword != " ":
                        print ("<StringConstant>", fullword, "</StringConstant>",file=fh)
       
            #checking for keywords
            
            list1=re.findall(r'\b\w+\b',line)
            list2 = re.findall(r'\b\w+\b',fullword)
            for word in list1:
                removed = word.replace("\n", " ")
                word = removed

                
                if word == "class":
                     print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "void":
                    print("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "function":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "var":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "int":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "let":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "while":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "do":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                elif word == "return":
                    print ("<Keyword>", word, "</Keyword>",file=fh)
                else:
                    tempword = " "
                    for s in list2:     
                            if word == s:
                                tempword = s
                                break
                    if word == tempword:
                        continue
                    print("<identifier>", word ,"</identifier>",file=fh)
            for ch in special:
                    if ch == '{':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '}':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '(':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == ')':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == ';':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '=':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '+':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '-':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '/':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == ',':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '.':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '[':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == ']':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '<':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
                    elif ch == '>':
                        print ("<Symbol>", ch, "</Symbol>",file=fh)
            for i in num:
                    if i == 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9:
                        if i == ' ':
                            continue
                        else:
                            print("<integerConstant>", i ,"</integerConstant>",file=fh)
                    else:
                        continue
           

        
    t.close()







    
    
    


Open_Parse_file()


