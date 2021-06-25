from tkinter import *
from tkinter import ttk 
#from Database import connection

import mysql.connector

connection =mysql.connector.connect(host="localhost", 
                                  user="root", 
                                  passwd="", 
                                  database="db_demo")

cursor=connection.cursor()
cursor.execute("SELECT NOMBRE, EDAD, GENERO FROM TBL_USUARIOS")
for fila in cursor:
    print(fila)
    print(fila[0])
connection.close() 

window = Tk()
window.title('Mostrar Registros')

my_table = ttk.Treeview(window)

# Define Our Columns 
my_table['columns'] = ('NOMBRE', 'EDAD', 'GENERO')

# Formate Our Columns
my_table.column('#0', width=120, minwidth=50)
my_table.column('NOMBRE', anchor=W, width=120)
my_table.column('EDAD', anchor=W, width=120)
my_table.column('GENERO', anchor=W, width=120)

# Create Headings
my_table.heading('#0', text='ID_CAMPO', anchor=W)
my_table.heading('NOMBRE', text='NOMBRE', anchor=W)
my_table.heading('EDAD', text='EDAD', anchor=W)
my_table.heading('GENERO', text='GENERO', anchor=W)

# Add Data
my_table.insert(parent='', index='end', iid=0, text='1', 
        values=('Sharon', '17', 'F'))
my_table.insert(parent='', index='end', iid=1, text='2', 
        values=('Hector', 'Value 2', 'Value 3')) 
my_table.insert(parent='', index='end', iid=3, text='3', 
        values=('Value 1', 'Value 2', 'Value 3'))
my_table.insert(parent='', index='end', iid=4, text='4', 
        values=('Value 1', 'Value 2', 'Value 3'))           

# Pack to the screen
my_table.pack(pady=20, padx=20)

window.mainloop()