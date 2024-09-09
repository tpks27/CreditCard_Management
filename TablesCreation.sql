---Create Tables---
--This table will store information about each credit card--
CREATE TABLE Credit_Card_Info (
    card_id INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each card
    card_name VARCHAR(100) NOT NULL,        -- Name of the card, e.g., "Visa", "Mastercard"
    card_number VARCHAR(16) NOT NULL,       -- Partially masked card number or full card number
    credit_limit DECIMAL(10, 2) NOT NULL    -- Credit limit of the card
);
--This table will store the remaining balance for each credit card for each person--
CREATE TABLE Card_Balance (
    balance_id INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each balance entry
    person_name VARCHAR(100) NOT NULL,         -- Name of the person using the card
    card_id INT NOT NULL,                      -- Foreign key to `Credit_Card_Info`
    remaining_balance DECIMAL(10, 2) DEFAULT 0.00, -- Current remaining balance
    last_payment_date DATE,                    -- Date of the last payment made
    last_payment_amount DECIMAL(10, 2),        -- Amount of the last payment made
    FOREIGN KEY (card_id) REFERENCES Credit_Card_Info(card_id)
);
--This table will store expense details made using the credit cards--
CREATE TABLE Expenses (
    expense_id INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each expense
    person_name VARCHAR(100) NOT NULL,         -- Name of the person making the expense
    expense_date DATE NOT NULL,                -- Date of the expense
    week_of_year INT NOT NULL,                 -- Week of the year for the expense
    year INT NOT NULL,                         -- Year when the expense was made
    expense_category VARCHAR(100),             -- Category of the expense, e.g., "Groceries", "Gas"
    amount DECIMAL(10, 2) NOT NULL,            -- Expense amount
    card_id INT NOT NULL,                      -- Foreign key to `Credit_Card_Info`
    notes TEXT,                                -- Optional notes or comments
    balance_to_be_paid_card DECIMAL(10, 2),    -- Balance on the card after this expense
    FOREIGN KEY (card_id) REFERENCES Credit_Card_Info(card_id)
);
--This table will store payment details made towards the credit cards--
CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier for each payment
    person_name VARCHAR(100) NOT NULL,         -- Name of the person making the payment
    payment_date DATE NOT NULL,                -- Date of the payment
    amount_paid DECIMAL(10, 2) NOT NULL,       -- Payment amount
    card_id INT NOT NULL,                      -- Foreign key to `Credit_Card_Info`
    notes TEXT,                                -- Optional notes
    FOREIGN KEY (card_id) REFERENCES Credit_Card_Info(card_id)
);
