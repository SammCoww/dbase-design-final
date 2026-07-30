# Relational Schema

### Customer
| Attribute | Key |
| :--- | :--- |
| `CustomerID` | PK |
| `Name` | |
| `PhoneNumber` | |
| `ShippingAddress` | |

### Credit Card
| Attribute | Key |
| :--- | :--- |
| `CreditCardNumber` | PK |
| `NameOnCard` | |
| `CVV` | |
| `ExpirationDate` | |
| `Pin` | |
| `CustomerID` | FK |

### Product
| Attribute | Key |
| :--- | :--- |
| `ProductID` | PK |
| `ProductName` | |
| `AmountInStock` | |
| `Price` | |

### Purchase
| Attribute | Key |
| :--- | :--- |
| `PurchaseID` | PK |
| `CustomerID` | FK |
| `CreditCardNumber` | FK |
| `Timestamp` | |
| `Status` | |

### Item
| Attribute | Key |
| :--- | :--- |
| `PurchaseID` | PK, FK |
| `ProductID` | PK, FK |
| `Quantity` | |
