SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Create res_category table
CREATE TABLE `res_category` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create admin table
CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create restaurant table
CREATE TABLE `restaurant` (
  `rs_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rs_id`),
  FOREIGN KEY (`c_id`) REFERENCES `res_category`(`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create dishes table
CREATE TABLE `dishes` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `rs_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL,
  PRIMARY KEY (`d_id`),
  FOREIGN KEY (`rs_id`) REFERENCES `restaurant`(`rs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create remark table
CREATE TABLE `remark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create users table
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Create users_orders table
CREATE TABLE `users_orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`o_id`),
  FOREIGN KEY (`u_id`) REFERENCES `users`(`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- AUTO_INCREMENT for tables
ALTER TABLE `res_category` MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `admin` MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `restaurant` MODIFY `rs_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `dishes` MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `remark` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users` MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users_orders` MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT;



INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Indian', '2023-10-24 07:51:25'),
(3, 'Chinese', '2023-04-07 03:15:25'),
(4, 'American', '2023-04-07 03:15:28');

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(2, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin2@gmail.com', '', '2023-10-24 05:33:25');

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(6, 4, 'Domios', 'dominos@gmail.com', '9654125412', 'https://www.zomato.com/kolkata/dominos-pizza-entally', '11am', '12am', '24hr-x7', 'CENTRAL PAKK KALYANI', '65376db108867.jpg', '2023-10-24 07:09:37'),
(7, 4, 'KFC', 'kfc@gmail.com', '7452147854', 'https://www.zomato.com/kolkata/kfc-sealdah-area', '11am', '10pm', '24hr-x7', 'KANCHARAPARA KALYANI', '65376df68976e.jpg', '2023-10-24 07:10:46'),
(10, 3, 'Wow-Momo', 'wowmomo@gmail.com', '9514785424', 'wowmomo.com', '11am', '9pm', '24hr-x7', 'ITI MORE KALYANI', '653773bf5fbdc.jpg', '2023-10-24 07:35:27'),
(11, 1, 'Lets Eat', 'letseat@gmail.com', '9654547854', 'letseat.com', '11am', '11pm', '24hr-x7', 'CENTRAL PARK KALYANI', '65377490ba841.jpg', '2023-10-24 07:38:56'),
(13, 1, 'Bawarchi', 'bawarchi@gmail.com', '9547854524', 'bawarchi.com', '10am', '10pm', '24hr-x7', 'BUDHA PARK KALYANI', '6537751b9fb71.jpg', '2023-10-24 07:41:15'),
(14, 1, 'South Indian Food', 'idlydosa@gmail.com', '9547854125', 'southindianfood.com', '8am', '8pm', 'mon-sat', ' GHOSHPARA KALYANI ', '653777a037fc5.jpg', '2023-10-24 07:52:00');


INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(17, 11, 'Chicken Biryani', 'A flavorful Indian dish made with marinated chicken and aromatic Basmati rice, cooked together with spices, creating a savory and fragrant delight.', 259.00, '6537809778bf0.jpg'),
(18, 11, 'Mutton Biryani', 'A South Asian favorite, mutton biryani combines tender pieces of mutton with fragrant Basmati rice, simmered in a rich blend of spices for a mouthwatering and spicy rice dish.', 299.00, '653780de48d56.jpg'),
(19, 13, 'Tandoori Chicken', 'Tandoori chicken is a classic Indian dish featuring marinated chicken, yogurt, and a blend of spices, roasted in a tandoor (clay oven), resulting in tender, smoky, and flavorful chicken with a vibrant red hue.', 279.00, '65378366323de.png'),
(20, 6, 'Special Chicken Delight Pizza', 'This delectable pizza creation is a gastronomic masterpiece, featuring succulent pieces of marinated chicken, a medley of colorful bell peppers, caramelized onions, and a blend of rich, creamy cheeses, all atop a perfectly', 269.00, '6537834c4cc1d.png'),
(21, 10, 'Mandarin Dynasty Delights Noodles', 'These special Chinese noodles, enriched with a variety of authentic ingredients and savory sauces, offer a delectable journey into the heart of Chinese culinary traditions.', 199.00, '653786ca06845.png'),
(24, 7, 'Signature Feast', ' A delightful pairing of a crispy chicken burger nestled in a soft bun with fresh fixings, and zesty, flavorful chicken wings, crafting a satisfying fast-food feas', 349.00, '65378862778e4.png'),
(25, 14, 'Idly', 'Soft and steamed rice cakes, a South Indian breakfast staple, known for their light and fluffy texture.', 29.00, '653789cd1df44.png'),
(26, 14, 'Onion Dosa', 'Thin, crispy, and savory rice crepes, often served with various chutneys and sambar.', 59.00, '653789fd342e0.png'),
(27, 14, 'Vada', 'Deep-fried lentil fritters with a crispy exterior and a soft interior, perfect for snacking.', 49.00, '65378a170c284.png'),
(28, 14, 'Masala Dosa', 'A delicious twist on dosa, featuring a filling of spiced potato curry, offering a satisfying and flavorful meal.', 89.00, '65378a3215fdb.png'),
(29, 14, 'Upma', 'A semolina-based dish, seasoned with spices and vegetables, creating a comforting and hearty breakfast option.', 39.00, '65378a515d2a1.png'),
(30, 14, 'Sambar', 'A flavorful, tangy lentil soup with an assortment of vegetables, commonly served with rice, idly, and dosa, adding zest to South Indian meals.', 29.00, '65378a6caba8a.png'),
(31, 11, 'Butter / Tandoori Naan', 'Soft and fluffy Indian flatbread, generously brushed with melted butter, offering the perfect accompaniment to savor with various curries and dishes.', 49.00, '65378afb26ba5.png'),
(32, 11, 'Butter Chicken', 'A luscious North Indian curry featuring tender, tandoori-cooked chicken immersed in a creamy tomato-based sauce, renowned for its rich, buttery flavor.', 249.00, '65378b2966692.png'),
(33, 11, 'Royal North Indian Feast (Thali)', 'An opulent and diverse platter of North Indian culinary treasures, showcasing an array of curries, bread, and accompaniments, fit for royalty.', 149.00, '65378cccb7bcf.png'),
(34, 11, 'Golden Crisp Fish Delight', ' A delectable fish fry dish known for its golden, crispy coating and tender, flavorful fish fillets, offering a delightful seafood experience.', 229.00, '65378cec158f8.png'),
(35, 11, 'Golden Crunch Chicken Nuggets', 'rresistibly crispy and tender bite-sized pieces of chicken, featuring a golden exterior and succulent meat inside, perfect for a satisfying snack or meal', 139.00, '65378d1d3e028.png'),
(36, 11, 'Creamy Corn Elixir Soup', 'A silky-smooth and comforting corn soup, brimming with the sweet essence of corn and creamy goodness, providing a warm and soothing experience.', 99.00, '65378d393e965.png'),
(37, 7, 'Hot Wings', 'Spicy and crunchy chicken wings.', 319.00, '65378f042e387.png'),
(38, 7, 'Famous Bowl', 'Mashed potatoes, corn, chicken, cheese, and gravy in a bowl.', 299.00, '65378f35af66e.png'),
(39, 7, 'Zinger Burger', 'A spicy and satisfying burger with a seasoned chicken fillet, lettuce, and spicy mayonnaise, creating a bold and fiery taste sensation.', 189.00, '65378f585df96.png'),
(40, 7, 'Coleslaw', 'A refreshing side salad made with shredded cabbage and carrots, dressed in a tangy and creamy coleslaw dressing, offering a cool and crisp contrast to the meal.', 199.00, '65378f7903679.png'),
(41, 7, 'Krusher', 'A range of refreshing and icy beverage options, blended with various fruity flavors or chocolate, offering a cool and sweet way to quench your thirst.', 119.00, '65378fa75f1e6.png'),
(42, 7, 'French Fries', 'Crispy and golden potato fries, seasoned to perfection, and served as a classic and irresistible side dish.', 139.00, '65379325f0c01.png'),
(43, 10, 'Steamed Momos', 'Dumplings with a delicate, soft exterior, typically filled with a savory mixture of meat or vegetables, delivering a healthier and lighter take on momos.', 89.00, '6537951cca97d.png'),
(44, 10, 'Fried Momos', 'Dumplings filled with flavorful ingredients, deep-fried to a crispy perfection, resulting in a delectable snack or appetizer.', 129.00, '6537953df3081.png'),
(45, 10, 'Fish Soup', 'A comforting and flavorful soup made with tender fish pieces and a blend of seasonings, providing a warm and nourishing seafood experience.', 159.00, '6537956ab51c9.png'),
(46, 10, 'Chicken Soup', 'A soothing and nutritious soup made with tender chicken pieces, vegetables, and aromatic herbs, offering a heartwarming and comforting dish', 159.00, '6537958a95455.png'),
(47, 10, 'Mixed Noodles', 'A medley of different noodles, often combined with assorted vegetables and a choice of protein, creating a diverse and delicious noodle dish.', 199.00, '653795a5268f4.png'),
(48, 10, 'Fried Rice', 'A flavorful stir-fried dish with rice, vegetables, and protein, cooked to perfection with aromatic seasonings, offering a savory and complete meal.', 189.00, '653795c252ced.png'),
(49, 10, 'Momo Burger', 'A fusion delight that combines the flavors of traditional momos with the convenience of a burger, featuring succulent momo fillings nestled within a bun.', 99.00, '653795dfb1910.png'),
(50, 10, 'Sandwich', 'A delightful handheld meal, featuring various fillings between slices of bread, providing a convenient and satisfying option for a quick bite.', 99.00, '653795f6a81dd.png'),
(51, 13, 'Hyderabadi Mandi', ' Fragrant rice dish with spiced meat, garnished for a royal South Indian meal.', 399.00, '653798f005d09.png'),
(52, 13, 'Tandoori Biryani', 'Marinated meat and fragrant rice, combining tandoori and biryani flavors for a delicious meal.', 299.00, '6537990bcd400.png'),
(53, 13, 'Butter Chicken', ' A luscious North Indian curry featuring tender, tandoori-cooked chicken immersed in a creamy tomato-based sauce, renowned for its rich, buttery flavor.', 299.00, '6537993facd67.png'),
(54, 13, 'Tandoori Roti', 'Thin, unleavened Indian bread, cooked in a tandoor (clay oven) for a soft, slightly charred, and smoky flatbread that complements various Indian dishes.', 59.00, '653799736d79c.png'),
(55, 13, 'South Indian Thali', 'A complete meal showcasing an array of South Indian dishes, featuring dosa, idly, sambar, rice, and an assortment of flavorful accompaniments.', 199.00, '653799c7a30c7.png'),
(56, 13, 'Moroccan Lentil Stew', ' A hearty and aromatic stew with red lentils, flavorful spices, and a mix of vegetables, offering a taste of North African cuisine in a warm and comforting bowl.', 159.00, '65379a151cd35.png'),
(57, 13, 'Savory Chicken Bites', 'Small, flavorful chicken nuggets with a crispy exterior and tender interior, making them a delightful and convenient snack or starter.', 119.00, '65379a715c669.png'),
(58, 6, 'Margherita Pizza', ' Classic Italian with tomato, mozzarella, and basil.', 299.00, '65379b9174ff1.png'),
(59, 6, 'Pepperoni Pizza', 'Loaded with zesty pepperoni and cheese.', 299.00, '65379bb9b6f8a.png'),
(60, 6, 'Veggie Supreme Pizza', 'Bursting with colorful veggies and cheese.', 329.00, '65379bdc5320d.png'),
(61, 6, 'Hawaiian Pizza', 'Ham, pineapple, and cheese on tomato sauce.', 319.00, '65379c1ea3e74.png'),
(62, 6, 'BBQ Chicken Pizza', 'Tangy BBQ sauce, chicken, and cheese.', 349.00, '65379c3d8cc09.png'),
(63, 6, 'Meat Lovers Pizza', ' Packed with assorted meats and cheese.', 349.00, '65379c6627d5a.png'),
(64, 6, 'Mushroom Truffle Pizza', 'Gourmet delight with mushrooms and truffle oil.', 339.00, '65379c88697a0.png'),
(65, 6, 'Spinach Garlic Pizza', 'Creamy garlic sauce, spinach, and cheese.', 329.00, '65379ca64222c.png'),
(66, 6, 'Mediterranean Veggie Pizza', ' Mediterranean flavors with olives, feta, and artichokes.', 359.00, '65379cc053244.png'),
(67, 6, 'Chicken Bacon Ranch Sandwich', 'Grilled chicken breast, crispy bacon, creamy ranch dressing, and melted provolone cheese on a ciabatta roll.', 199.00, '65379d32d8d40.png'),
(68, 6, 'Classic Cheeseburger', 'A timeless favorite featuring a juicy beef patty, melted cheese, fresh lettuce, tomato, onion, pickles, and a dollop of ketchup and mayonnaise, all nestled in a soft burger bun.', 159.00, '65379d6d25d90.png'),
(69, 6, 'Classic Cheeseburger', 'A timeless favorite featuring a juicy beef patty, melted cheese, fresh lettuce, tomato, onion, pickles, and a dollop of ketchup and mayonnaise, all nestled in a soft burger bun.', 159.00, '65379d9564e4d.png');


INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(16, 23, 'in process', 'enjoy your meal', '2023-10-24 05:55:09'),
(17, 23, 'closed', 'thank you', '2023-10-24 05:59:55');



INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(9, 'john', 'john', 'wick', 'john@gmail.com', '9632587412', '5f4dcc3b5aa765d61d8327deb882cf99', 'B5-Kalyani', 1, '2023-10-24 05:53:49');
-- Commit the transaction
COMMIT;


