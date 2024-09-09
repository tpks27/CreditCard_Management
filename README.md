## CreditCard_Management

## Example Usuage:

### 1
Insert Credit Card Information into Credit_Card_Info
First, insert information about the credit cards.

  ```
   INSERT INTO Credit_Card_Info (card_name, card_number, credit_limit) 
   VALUES ('Mastercard-1', '0027', 5500.00),
          ('Discover-Prabha-1', '0022', 1000.00);
```

### 2
Insert Initial Balance for Prabha into Card_Balance
Now, insert Prabha's initial balance for her credit cards.

```
INSERT INTO Card_Balance (person_name, card_id, remaining_balance)
VALUES ('Prabha', 1, 246.51), 
       ('Prabha', 2, 5810.00);
```

### 3
Insert Expenses for Prabha into Expenses
```
INSERT INTO Expenses (person_name, expense_date, week_of_year, year, expense_category, amount, card_id, notes)
VALUES ('Prabha', '2024-09-07', 36, 2024, 'Internet', 75.32, 2, 'Comcast Bill');
```

### 4 
Insert Payments for Prabha into Payments
Prabha makes a $50 payment toward her Mastercard-1.
```
INSERT INTO Payments (person_name, payment_date, amount_paid, card_id, notes)
VALUES ('Prabha', '2024-09-09', 50.00, 1, 'Payment towards some amount of bill');
```

### 5 
Query the Card_Balance table to see the updated balance after the expenses and payments:
```
SELECT * FROM Card_Balance;
```
