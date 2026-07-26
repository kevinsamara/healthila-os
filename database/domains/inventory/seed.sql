
---------------------------------------------------------
-- Allocation Strategies
---------------------------------------------------------

insert into allocation_strategies(code,name) values

('fefo','First Expired First Out'),
('fifo','First In First Out'),
('lifo','Last In First Out'),
('manual','Manual Allocation')

on conflict do nothing;

