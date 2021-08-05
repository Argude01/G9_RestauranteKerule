from tkinter import *
from tkinter import ttk
import menu_db
from PIL import ImageTk, Image

window = Tk()
frame_tit = Frame(window, width=1000, height=600, bg="white")
frame_tit.pack()
frame_men = Frame(frame_tit, width=350, height=499, bg="white")
frame_men.place(x=0, y=130)
menu=StringVar()
bebida=StringVar()
cantidad=StringVar()
precio=StringVar()
subtotal=StringVar()
impuesto=StringVar()
total=StringVar()

def facturar():
    if m.get()=="Menú KeRule":
        p.set(220)
    elif m.get()=="Carne Asada con Tajadas":
        p.set(100)
    elif m.get()=="Pescado Frito con Tajadas":
        p.set(200)
    elif m.get()=="Ensalada KeRule":
        p.set(170)
    elif m.get()=="Baleadas":
        p.set(20)    
    s.set(float(c.get()) *  float(p.get()))
    i.set(float(s.get()) * 0.15)
    t.set(float(i.get()) + float(s.get()))
    
def enviar():
    menu = menu_box.get()
    bebida = bebida_box.get()
    cantidad = entry_cantidad.get()
    precio = entry_precio.get()
    subtotal = entry_subtotal.get()
    impuesto = entry_impuesto.get()
    total = entry_total.get()
    
    menu_data = menu_db.MyDatabase()
    menu_data.insert_db(menu, bebida, cantidad, precio, subtotal, impuesto, total)
    
    
import mysql.connector
connection =mysql.connector.connect(host="localhost", 
                                  user="root", 
                                  passwd="", 
                                  database="db_restaurante_kerule")

cursor = connection.cursor()
cursor.execute("SELECT COMIDA, BEBIDA, CANTIDAD, PRECIO, SUBTOTAL, IMPUESTO, TOTAL FROM TBL_MENU")

my_table = ttk.Treeview(window)
    
registro=0
for fila in cursor:
    registro=registro+1
    print(str(registro) + "-"+str(fila))
    menu = fila[0]  
    bebida = fila[1]
    cantidad = fila[2]
    precio = fila[3]
    subtotal = fila[4]
    impuesto = fila[5]
    total = fila[6]
    my_table.insert(parent="", index="end", iid=registro, text=str(registro),
        values=(menu, bebida, cantidad, precio, subtotal, impuesto, total))
connection.close() 

my_table['columns'] = ('MENU', 'BEBIDA', 'CANTIDAD', 'PRECIO', 'SUBTOTAL', 'IMPUESTO', 'TOTAL')
        
my_table.column('#0', width=120, minwidth=30)
my_table.column('MENU', anchor=W, width=60)
my_table.column('BEBIDA', anchor=W, width=60)
my_table.column('CANTIDAD', anchor=W, width=60)
my_table.column('PRECIO', anchor=W, width=60)
my_table.column('SUBTOTAL', anchor=W, width=60)
my_table.column('IMPUESTO', anchor=W, width=60)
my_table.column('TOTAL', anchor=W, width=60)

my_table.heading('#0', text='ID_CAMPO', anchor=W)
my_table.heading('MENU', text='MENU', anchor=W)
my_table.heading('BEBIDA', text='BEBIDA', anchor=W)
my_table.heading('CANTIDAD', text='CANTIDAD', anchor=W)
my_table.heading('PRECIO', text='PRECIO', anchor=W)
my_table.heading('SUBTOTAL', text='SUBTOTAL', anchor=W)
my_table.heading('IMPUESTO', text='IMPUESTO', anchor=W)
my_table.heading('TOTAL', text='TOTAL', anchor=W)

my_table.place(x=400, y=350)

title = Label(frame_tit,text="ALMUERZO",font=("Century Gothic", "22", "bold"), fg="#AAA65F", bg="white")
title.place(x=0, y=30)
img = ImageTk.PhotoImage(Image.open("Imagen2.png"))
imglabel = Label(frame_tit, image=img, width=175, height=100, bg="white").place(x=165, y=0)  
Label(frame_tit, width=600, height=10, bg="black").place(x=0, y=101)

frame_men = Frame(frame_tit, width=350, height=519, bg="white")
frame_men.place(x=0, y=110)

img2 = ImageTk.PhotoImage(Image.open("Imagen1.jpg"))
imglabel = Label(frame_men, image=img2, width=350, height=519, bg="white").place(x=-2, y=-2)


m=StringVar()
Label(frame_men,text="MENÚ:",font=("Century Gothic", "8", "bold"), fg="Black", bg="#58D68D").place(x=59, y=50)
menu_box=ttk.Combobox(frame_men ,width="29", textvariable=m)
menu_box["values"]=("Menú KeRule","Carne Asada con Tajadas","Pescado Frito con Tajadas","Ensalada KeRule","Baleadas")
menu_box.place(x=100,y=50)

b=StringVar()
Label(frame_men,text="BEBIDA:",font=("Century Gothic", "8", "bold"), fg="Black", bg="#58D68D").place(x=53, y=90)
bebida_box=ttk.Combobox(frame_men ,width="29", textvariable=b)
bebida_box["values"]=("Refresco 500ml","Limonada","Fresco Tamarindo","Jamaica","Fresco de Nance")
bebida_box.place(x=100,y=90)

c=StringVar()
Label(frame_men,text="CANTIDAD:",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=15, y=131)
entry_cantidad = Entry(frame_men, justify=LEFT, width=18, font=("Century Gothic", "14"), textvariable=c)
entry_cantidad.place(x=100, y=130)

p=StringVar()
Label(frame_men,text="PRECIO:",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=36, y=181)
entry_precio = Entry(frame_men, justify=LEFT, width=18, font=("Century Gothic", "14"), textvariable=p)
entry_precio.config(state='disabled')
entry_precio.place(x=100, y=180)

s=StringVar()
Label(frame_men,text="SUBTOTAL:",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=20, y=231)
entry_subtotal = Entry(frame_men, justify=LEFT, width=18, font=("Century Gothic", "14"), textvariable=s)
entry_subtotal.config(state='disabled')
entry_subtotal.place(x=100, y=230)

Label(frame_men,text="IPSV/15%",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=25, y=281)

i=StringVar()
Label(frame_men,text="IMPUESTO:",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=19, y=331)
entry_impuesto = Entry(frame_men, justify=LEFT, width=18, font=("Century Gothic", "14"), textvariable=i)
entry_impuesto.config(state='disabled')
entry_impuesto.place(x=100, y=330)

t=StringVar()
Label(frame_men,text="TOTAL:",font=("Century Gothic", "11", "bold"), fg="Black", bg="#58D68D").place(x=48, y=381)
entry_total = Entry(frame_men, justify=LEFT, width=18, font=("Century Gothic", "14"), textvariable=t)
entry_total.config(state='disabled')
entry_total.place(x=100, y=380)

button_enviar = Button(frame_men, text="ENVIAR", font=("Century Gothic", "11", "bold"), command=enviar)
button_enviar.place(x=250, y=430)

button_total = Button(frame_men, text="FACTURA", font=("Century Gothic", "11", "bold"), command=facturar)
button_total.place(x=30, y=430)

window.mainloop()
