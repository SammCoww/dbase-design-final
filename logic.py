import mysql.connector


db = mysql.connector.connect(
    host="localhost",
    port=3306,
    user="root",
    password="root",
    database="finaldb"
)


def show_products(search=None, max_price=None):
    query = "SELECT Product_ID, Product_Name, Price, Stocked_Amount FROM Product"
    conditions = []
    values = []

    if search:
        conditions.append("Product_Name LIKE %s")
        values.append(f"%{search}%")
    if max_price is not None:
        conditions.append("Price <= %s")
        values.append(max_price)
    if conditions:
        query += " WHERE " + " AND ".join(conditions)
    query += " ORDER BY Product_Name"

    cursor = db.cursor()
    cursor.execute(query, values)
    products = cursor.fetchall()
    cursor.close()

    if not products:
        print("No products found.")
        return
    for product_id, name, price, stock in products:
        print(f"{product_id}: {name} | ${price:.2f} | {stock} in stock")


def search_products():
    search = input("Search text: ").strip() or None
    max_price = float(input("Maximum price: "))
    show_products(search, max_price)


def add_product():
    name = input("Product name: ").strip()
    price = float(input("Price: "))
    stock = int(input("Stocked amount: "))
    if not name or price < 0 or stock < 0:
        raise ValueError("Name is required; price and stock cannot be negative.")

    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO Product (Product_Name, Price, Stocked_Amount) VALUES (%s, %s, %s)",
        (name, price, stock),
    )
    db.commit()
    print(f"Added product {cursor.lastrowid}: {name}")
    cursor.close()


def show_customer_orders():
    customer_id = int(input("Customer ID: "))
    cursor = db.cursor()
    cursor.execute(
        """
        SELECT pu.Purchase_ID, pu.Purchase_Status, pu.Purchase_Timestamp,
               p.Product_Name, i.Quantity, p.Price
        FROM Customer c
        JOIN Purchase pu ON pu.Customer_ID = c.Customer_ID
        JOIN Item i ON i.Purchase_ID = pu.Purchase_ID
        JOIN Product p ON p.Product_ID = i.Product_ID
        WHERE c.Customer_ID = %s
        ORDER BY pu.Purchase_ID, p.Product_Name
        """,
        (customer_id,),
    )
    orders = cursor.fetchall()
    cursor.close()

    if not orders:
        print("No orders found.")
        return
    for order_id, status, timestamp, name, quantity, price in orders:
        print(f"Order {order_id} | {status} | {timestamp} | {quantity}x {name} (${price:.2f})")


def main():
    print("Connected to MySQL!")
    actions = {
        "1": show_products,
        "2": search_products,
        "3": add_product,
        "4": show_customer_orders,
    }
    while True:
        print("\n1. View products\n2. Search products\n3. Add product\n4. View customer orders\n0. Exit")
        choice = input("Choose an option: ").strip()
        if choice == "0":
            return
        action = actions.get(choice)
        if action is None:
            print("Invalid option.")
            continue
        try:
            action()
        except (ValueError, mysql.connector.Error) as error:
            db.rollback()
            print(f"Error: {error}")


try:
    main()
finally:
    db.close()
