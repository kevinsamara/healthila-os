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

