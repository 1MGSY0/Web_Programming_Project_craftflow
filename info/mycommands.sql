javac -cp .;c:\myWebProject\tomcat\lib\servlet-api.jar
javac -cp .;c:\myWebProject\tomcat\lib\servlet-api.jar Products.java ShoppingCart.java

<input type=file name="image">
<input type=submit value="Add Image">

cd \myWebProject\tomcat\bin
cd \myWebProject\tomcat\webapps\craftflow\WEB-INF\classes

create database if not exists craftflow;

use craftflow;

drop table if exists products;
create table products (
   id MEDIUMINT NOT NULL AUTO_INCREMENT,
   name  varchar(50),
   seller varchar(50),
   category varchar(50),
   imageFileName varchar(50),
   description varchar(120), 
   price float,
   availableQty int,
   primary key (id));

insert into products values (NULL, 'Lace Choker', 'Jesse', 'Accessories', 'Lace_Choker.jpg', 'Delicate lace choker featuring pearls and stainless steel, a fusion of elegance and modernity.', 59.90, 2);
insert into products values (NULL, 'Pink Cluster Necklace', 'Jesse', 'Accessories', 'Pink_Cluster_Necklace.jpg', 'Charming pink cluster necklace in stainless steel, adorned with floral and animal charms. A whimsical statement piece.', 120.00, 1);
insert into products values (NULL, 'Jellyfish Earrings', 'Jesse', 'Accessories', 'Jellyfish_Earrings.jpg', 'Blue beaded jellyfish earrings: whimsical, ocean-inspired accessories to add a playful touch to any outfit.', 18.90, 3);
insert into products values (NULL, 'Asymmetrical Pearl Necklace', 'Jesse', 'Accessories', 'Asymmetrical_Pearl_Necklace.jpg', 'Asymmetrical pearl necklace with stainless steel chain and floral charms for an elegant, modern accessory.', 45.00, 1);
insert into products values (NULL, 'Beaded Tulip Earrings', 'Jesse', 'Accessories', 'Beaded_Tulip_Earrings.jpg', 'Beaded pink tulip adorned with sparkling Swarovski crystals, a charming accessory for any occasion.', 35.00, 3);
insert into products values (NULL, 'Real Flower Tray Arrangement','Jesse', 'Floral Arrangement', 'Real_Flower_Tray_Arrangement.jpg', 'Vibrant tray arrangement featuring a captivating blend of red, blue, and yellow flowers.', 65, 1);
insert into products values (NULL, 'Faux Sunflower Bouquet','Jesse', 'Floral Arrangement', 'Faux_Sunflower_Bouquet.jpg', 'Sunflower, daisies, forget-me-nots, and daffodil, a bouquet radiating joy and warmth. Made with pipe cleaners.', 75, 1);
insert into products values (NULL, 'Real Tulip Arrangement','Jesse', 'Floral Arrangement', 'Real_Tulip_Arrangement.jpg', 'Round arrangement bursting with pink tulips and delicate filler flowers, perfect for brightening any space.', 50.90, 1);
insert into products values (NULL, 'Faux Sunflower Arrangement','Jesse', 'Floral Arrangement', 'Faux_Sunflower_Arrangement.jpg', 'Whimsical mix: Sunflower, daisies, forget-me-nots, lavendars and eucalyptus, crafted from vibrant pipe cleaners.', 149.90, 1);

select * from products;
SELECT * FROM products WHERE category IN ('Accessories') OR name IN (NULL) OR description IN (NULL) ORDER BY id ASC;
