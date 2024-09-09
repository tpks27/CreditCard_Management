--Create Triggers for Automatic Balance Updates
--Trigger for Updating Card_Balance After an Expense
--This trigger updates the remaining balance in the Card_Balance table after an expense is added.

CREATE TRIGGER update_card_balance_after_expense
ON Expenses
AFTER INSERT
AS
BEGIN
    DECLARE @card_id INT, @amount DECIMAL(10, 2);
    
    -- Get the card_id and amount from the inserted row
    SELECT @card_id = card_id, @amount = amount FROM inserted;
    
    -- Update the remaining balance in the Card_Balance table
    UPDATE Card_Balance
    SET remaining_balance = remaining_balance + @amount
    WHERE card_id = @card_id;
    
    -- Update the balance_to_be_paid_card in the Expenses table
    UPDATE Expenses
    SET balance_to_be_paid_card = (SELECT remaining_balance FROM Card_Balance WHERE card_id = @card_id)
    WHERE expense_id IN (SELECT expense_id FROM inserted);
END;

--Trigger for Updating Card_Balance After a Payment
--This trigger updates the remaining balance in the Card_Balance table after a payment is made.
CREATE TRIGGER update_card_balance_after_payment
ON Payments
AFTER INSERT
AS
BEGIN
    DECLARE @card_id INT, @amount_paid DECIMAL(10, 2), @payment_date DATE;
    
    -- Get the card_id, amount_paid, and payment_date from the inserted row
    SELECT @card_id = card_id, @amount_paid = amount_paid, @payment_date = payment_date FROM inserted;
    
    -- Update the remaining balance in the Card_Balance table
    UPDATE Card_Balance
    SET remaining_balance = remaining_balance - @amount_paid,
        last_payment_date = @payment_date,
        last_payment_amount = @amount_paid
    WHERE card_id = @card_id;
END;
