/* SQL version used 8.x */
-- PLEASE PASTE YOUR SQL IN THE SECTIONS BELOW

-- 1. How much revenue (in GBP) and how many spenders did each game have for each day?

SELECT  distinct game_id,count( distinct uid ),sum(amount_gb_pounds),date(spend_datetime)  as day 
from geektastic_sql_challenge.geekcoin_wallet_transaction 
group by game_id,day order by day;



-- 2. How many of each item was sold on each day, and how much revenue (in GBP) did each item generate on each day?

/*SELECT avg(virtual_currency_purchased/amount_gb_pounds)FROM geektastic_sql_challenge.geekcoin_wallet_transaction;
- Find how much  roughly 1 GBP is worth in virtual currency. 
We cannot use joins here as joins would have to be done on both uid and game_id and the values of the combined fields do not match in both tables*/

SELECT distinct item_id,count(item_id),sum(item_cost_in_virtual_currency/1000.58) as GBP,
date(item_purchase_datetime) as day from in_game_item_purchase 
group by item_id;


-- 3. What items do users buy first, after having converted real money to GeekCoins for the first time? Answer for each user, including the time and amount of their first conversion of real money into GeekCoins, and also the time and which item was purchased first after this transaction.
SELECT distinct geekcoin_wallet_transaction.uid,date(spend_datetime) as 'first conversion date',time(spend_datetime) as 'first conversion time'
,amount_gb_pounds as ' amount of pounds converted',date(item_purchase_datetime)as 'first purchase date'
,time(item_purchase_datetime)as' first purchase time',item_id  
from in_game_item_purchase join geekcoin_wallet_transaction on in_game_item_purchase.uid=geekcoin_wallet_transaction.uid group by uid;

Notes
For each question please provide a single executable query that shows the relevant values for all available data.

