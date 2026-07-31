# E-Commerce Database Requirements

## System Overview

The system is a small e-commerce database that stores customers, payment cards, products, purchases, and purchase items. It supports basic product browsing, product management, and customer order history.

## Data Requirements

### Customer

The system must store:

- A unique customer ID
- Customer name
- Phone number
- Shipping address

### Credit Card

The system must store:

- A unique credit-card number
- Name on the card
- CVV
- Expiration date
- Optional PIN
- The customer who owns the card

Each credit card must belong to an existing customer.

### Product

The system must store:

- A unique product ID
- Product name
- Price
- Amount currently in stock

Product price and stock amounts cannot be negative.

### Purchase

The system must store:

- A unique purchase ID
- The customer who placed the purchase
- The credit card used
- The purchase date and time
- The purchase status, such as `Pending`

Each purchase must reference an existing customer and credit card.

### Item

The system must store:

- The purchase containing the item
- The product purchased
- The quantity purchased

Each product can appear only once per purchase. The purchase and product combination uniquely identifies an item.

## Business Rules

1. A customer may own multiple credit cards.
2. A customer may place multiple purchases.
3. A purchase must belong to one customer and use one credit card.
4. A purchase may contain multiple products.
5. A product may appear in multiple purchases.
6. A purchase item must reference an existing purchase and product.
7. Product names are required, and prices and stock amounts must be zero or greater.

## Use Cases

### UC-1: View All Products

**Actor:** Store employee or customer  
**Goal:** View the available products.

1. The actor selects “View products.”
2. The system retrieves each product's ID, name, price, and stock amount.
3. The system displays the products sorted by name.
4. If no products exist, the system displays “No products found.”

### UC-2: Search for Products

**Actor:** Store employee or customer  
**Goal:** Find products by name and maximum price.

1. The actor enters optional search text.
2. The actor enters a maximum price.
3. The system returns matching products whose names contain the search text and whose prices do not exceed the maximum.
4. The system displays the matching products sorted by name.

### UC-3: Add a Product

**Actor:** Store employee  
**Goal:** Add a product to inventory.

1. The employee enters a product name, price, and stock amount.
2. The system validates that the name is present and that price and stock are not negative.
3. The system stores the new product and assigns it a unique product ID.
4. The system confirms that the product was added.

### UC-4: View Customer Orders

**Actor:** Store employee or customer  
**Goal:** Review a customer's purchase history.

1. The actor enters a customer ID.
2. The system finds purchases for that customer.
3. The system displays each order's ID, status, timestamp, product, quantity, and price.
4. If the customer has no orders, the system displays “No orders found.”

## Scope

The current system covers product lookup, product creation, and order-history lookup. Customer registration, checkout processing, payment authorization, inventory deduction, and order-status updates are outside the current scope.
