import mysql.connector

class MyDatabase:
    def open_connection(self):
        connection=mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",
            database="db_restaurante_kerule")

        return connection

    def insert_db(self, menu, bebida, cantidad, precio, subtotal, impuesto, total):
        my_connection = self.open_connection()
        cursor = my_connection.cursor()
        query = "INSERT INTO tbl_menu(COMIDA, BEBIDA, CANTIDAD, PRECIO, SUBTOTAL, IMPUESTO, TOTAL) VALUES (%s,%s,%s,%s,%s,%s,%s)"
        data = (menu, bebida, cantidad, precio, subtotal, impuesto, total)
        cursor.execute(query, data)
        my_connection.commit()
        my_connection.close()
