---------------------------------------------------------
-- Units
---------------------------------------------------------

insert into units(code,name,symbol) values

('pcs','Pieces','pcs'),
('kg','Kilogram','kg'),
('g','Gram','g'),
('box','Box','box'),
('pack','Pack','pack'),
('tray','Tray','tray'),
('bottle','Bottle','btl')

on conflict do nothing;

---------------------------------------------------------
-- Categories
---------------------------------------------------------

insert into categories(code,name) values

('fruit','Fresh Fruit'),
('juice','Cold Pressed Juice'),
('parcel','Fruit Parcel'),
('snack','Healthy Snack')

on conflict do nothing;

---------------------------------------------------------
-- Tags
---------------------------------------------------------

insert into product_tags(code,name) values

('import','Imported'),
('local','Local'),
('organic','Organic'),
('premium','Premium'),
('seasonal','Seasonal')

on conflict do nothing;


---------------------------------------------------------
-- Product Status
---------------------------------------------------------

insert into product_statuses(code,name) values

('draft','Draft'),
('active','Active'),
('inactive','Inactive'),
('discontinued','Discontinued')

on conflict do nothing;

---------------------------------------------------------
-- Storage Types
---------------------------------------------------------

insert into storage_types(code,name) values

('ambient','Ambient'),
('chiller','Chiller'),
('freezer','Freezer')

on conflict do nothing;

---------------------------------------------------------
-- Inventory Strategy
---------------------------------------------------------

insert into inventory_strategies(code,name) values

('fifo','FIFO'),
('fefo','FEFO')

on conflict do nothing;

---------------------------------------------------------
-- Packaging Types
---------------------------------------------------------

insert into packaging_types(code,name) values

('piece','Piece'),
('bag','Bag'),
('net','Net'),
('box','Box'),
('carton','Carton'),
('crate','Crate')

on conflict do nothing;

