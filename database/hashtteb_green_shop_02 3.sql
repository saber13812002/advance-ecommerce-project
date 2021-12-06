/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3307
 Source Schema         : hashtteb_green_shop_02

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 04/12/2021 22:02:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_team_id` bigint UNSIGNED NULL DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` int NULL DEFAULT NULL,
  `category` int NULL DEFAULT NULL,
  `product` int NULL DEFAULT NULL,
  `slider` int NULL DEFAULT NULL,
  `coupons` int NULL DEFAULT NULL,
  `shipping` int NULL DEFAULT NULL,
  `blog` int NULL DEFAULT NULL,
  `setting` int NULL DEFAULT NULL,
  `returnorder` int NULL DEFAULT NULL,
  `review` int NULL DEFAULT NULL,
  `orders` int NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `reports` int NULL DEFAULT NULL,
  `alluser` int NULL DEFAULT NULL,
  `adminuserrole` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (2, 'admin', 'admin@shop.com', '2021-10-10 00:00:00', '$2y$10$ImjoHE8fN3QUrfWbRtCiauvZV1nz0DJj3daDkZJ8cJOxHpAMTGWTG', 'gsLBnic8BeZXQSJt5gsoKAYSBA6LunGMsA0qIEQSXL4YI0bbZsDgD1z1v1Af', 1, 'upload/admin_images/1708281163402686.jpg', '2021-08-16 19:57:50', '2021-08-16 19:57:50', '2', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- ----------------------------
-- Table structure for blog_post_categories
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_categories`;
CREATE TABLE `blog_post_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `blog_category_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_post_categories
-- ----------------------------
INSERT INTO `blog_post_categories` VALUES (1, 'technology', 'تکنولوژی', 'technology', 'تکنولوژی', '2021-08-16 19:24:55', NULL);

-- ----------------------------
-- Table structure for blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE `blog_posts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `post_title_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_details_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_details_hin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_posts
-- ----------------------------
INSERT INTO `blog_posts` VALUES (1, 1, 'Technology', 'تکنولوژی', 'technology', 'تکنولوژی', 'upload/post/1708279139544575.jpg', '<p>Post Details English</p>', '<p>Post Details Hindi</p>', '2021-08-16 19:25:40', NULL);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Apple', 'اپل', 'apple', 'اپل', 'upload/brand/1708360976432745.png', '2020-10-01 17:57:16', '2021-08-17 17:06:26');
INSERT INTO `brands` VALUES (2, 'Gucci', 'گوچی', 'gucci', 'گوچی', 'upload/brand/1708360775479870.jpg', '2020-10-01 17:59:01', '2021-08-17 17:03:14');
INSERT INTO `brands` VALUES (4, 'Nokia', 'نوکیا', 'nokia', 'نوکیا', 'upload/brand/1708360870192305.png', '2020-10-03 15:13:38', '2021-08-17 17:04:45');
INSERT INTO `brands` VALUES (5, 'Nike', 'نایک', 'nike', 'نایک', 'upload/brand/1708360678652363.png', '2020-10-05 18:59:38', '2021-08-17 17:01:42');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Sport', 'ورزشی', 'sport', 'ورزشی', '', NULL, NULL, '2020-09-29 19:01:35', NULL, NULL);
INSERT INTO `categories` VALUES (2, 'Clothes', 'لباس', 'clothes', 'لباس', '', NULL, NULL, '2020-09-29 19:02:45', NULL, NULL);
INSERT INTO `categories` VALUES (3, 'Mobile', 'گوشی موبایل', 'mobile', 'گوشی', '', NULL, NULL, '2020-09-29 19:02:59', NULL, NULL);
INSERT INTO `categories` VALUES (4, 'Shoes', 'کفش', 'shoes', 'کفش', '', NULL, NULL, '2020-09-29 19:05:37', '2020-09-29 19:05:37', NULL);
INSERT INTO `categories` VALUES (6, 'Books', 'کتاب', 'books', 'کتاب', '', NULL, NULL, '2020-09-29 19:14:00', '2020-10-01 16:26:24', '2020-10-01 16:26:24');
INSERT INTO `categories` VALUES (7, 'Toys & Games', 'بازی و اسباب بازی', 'games_toys', 'اسباب_بازی', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `categories` VALUES (8, 'Audio Book', 'کتاب صوتی', 'audiobooks', 'کتاب_صوتی', '', NULL, NULL, '2020-09-29 19:45:35', '2020-10-01 16:26:19', NULL);
INSERT INTO `categories` VALUES (9, 'Cooking', 'آَشپزی', 'coocking', 'آشپزی', '', NULL, NULL, '2020-10-01 16:28:34', NULL, NULL);

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_discount` int NOT NULL,
  `coupon_validity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'TAKHFIF', 10, '2024-10-15', 1, '2021-08-17 17:55:55', NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `media_uuid_unique`(`uuid`) USING BTREE,
  INDEX `media_model_type_model_id_index`(`model_type`, `model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES (1, 'App\\Models\\VideoLesson', 1, '822acce9-5b5c-4804-bcfc-e799330e25d7', 'videoListDeleted', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 1, '2021-10-29 18:32:11', '2021-10-29 18:32:11');
INSERT INTO `media` VALUES (2, 'App\\Models\\VideoLesson', 2, '7f0a0519-4dec-4db4-89a8-c48a8a0fee12', 'videoListDeleted', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 2, '2021-10-29 18:58:47', '2021-10-29 19:04:12');
INSERT INTO `media` VALUES (3, 'App\\Models\\VideoLesson', 3, '70ae00e6-4a1c-4e1b-b19b-25c3976cb2e3', 'videoListDeleted', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 3, '2021-10-29 19:05:04', '2021-10-29 19:05:13');
INSERT INTO `media` VALUES (4, 'App\\Models\\VideoLesson', 4, 'ba42bcdc-9b4b-4e3d-9d20-e0b957ca991e', 'videoListDeleted', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 4, '2021-10-29 19:05:46', '2021-10-29 19:06:03');
INSERT INTO `media` VALUES (5, 'App\\Models\\VideoLesson', 5, 'cb8c93b6-7cd5-4888-9d34-9d05dc9c5360', 'videoListDeleted', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 5, '2021-10-29 19:08:13', '2021-10-29 19:08:23');
INSERT INTO `media` VALUES (6, 'App\\Models\\VideoLesson', 6, '772fd15e-899e-4ae8-ba9e-644cd7b6bd56', 'videoList', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 6, '2021-10-29 19:09:08', '2021-10-29 19:09:08');
INSERT INTO `media` VALUES (7, 'App\\Models\\VideoLesson', 7, '039d0f6d-5c72-40a0-b8a8-ec427ad85e90', 'videoList', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 7, '2021-10-29 19:11:42', '2021-10-29 19:11:42');
INSERT INTO `media` VALUES (8, 'App\\Models\\VideoLesson', 8, 'd66eb282-fff4-4be9-ba80-706bb1181fb1', 'videoList', '70769859a654865f73aa6e2fa479cba38678893-144p', '70769859a654865f73aa6e2fa479cba38678893-144p.mp4', 'video/mp4', 'public', 'public', 527835, '[]', '[]', '[]', '[]', 8, '2021-10-29 19:19:10', '2021-10-29 19:19:10');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (175, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (176, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (177, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (178, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (179, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (180, '2021_02_02_203839_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (181, '2021_02_02_212221_create_admins_table', 1);
INSERT INTO `migrations` VALUES (182, '2021_02_09_054528_create_brands_table', 1);
INSERT INTO `migrations` VALUES (183, '2021_02_09_111701_create_categories_table', 1);
INSERT INTO `migrations` VALUES (184, '2021_02_09_121910_create_sub_categories_table', 1);
INSERT INTO `migrations` VALUES (185, '2021_02_16_183944_create_sub_sub_categories_table', 1);
INSERT INTO `migrations` VALUES (186, '2021_02_16_204006_create_products_table', 1);
INSERT INTO `migrations` VALUES (187, '2021_02_16_205349_create_multi_imgs_table', 1);
INSERT INTO `migrations` VALUES (188, '2021_02_20_204829_create_sliders_table', 1);
INSERT INTO `migrations` VALUES (189, '2021_03_02_194613_create_wishlists_table', 1);
INSERT INTO `migrations` VALUES (190, '2021_03_03_211157_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (191, '2021_03_03_222308_create_ship_divisions_table', 1);
INSERT INTO `migrations` VALUES (192, '2021_03_09_183956_create_ship_districts_table', 1);
INSERT INTO `migrations` VALUES (193, '2021_03_09_194733_create_ship_states_table', 1);
INSERT INTO `migrations` VALUES (194, '2021_03_14_203654_create_orders_table', 1);
INSERT INTO `migrations` VALUES (195, '2021_03_14_203901_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (196, '2021_03_24_183649_create_blog_post_categories_table', 1);
INSERT INTO `migrations` VALUES (197, '2021_03_24_194838_create_blog_posts_table', 1);
INSERT INTO `migrations` VALUES (198, '2021_03_24_223430_create_site_settings_table', 1);
INSERT INTO `migrations` VALUES (199, '2021_03_26_194141_create_seos_table', 1);
INSERT INTO `migrations` VALUES (200, '2021_03_27_192140_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (201, '2021_08_16_191301_add_digital_file_to_products_table', 1);
INSERT INTO `migrations` VALUES (202, '2021_08_16_192951_add_return_order_to_orders_table', 1);
INSERT INTO `migrations` VALUES (203, '2021_08_16_193854_add_fields_to_admins_table', 1);
INSERT INTO `migrations` VALUES (204, '2021_08_18_164207_add_rating_to_reviews_table', 2);
INSERT INTO `migrations` VALUES (205, '2021_08_24_203812_update_type_amount_to_orders_table', 2);
INSERT INTO `migrations` VALUES (206, '2021_08_24_222001_update_type_of_price_field_to_order_items_table', 2);
INSERT INTO `migrations` VALUES (210, '2021_10_16_205349_create_video_lessons_table', 3);
INSERT INTO `migrations` VALUES (211, '2021_10_19_191803_create_media_table', 4);
INSERT INTO `migrations` VALUES (212, '2021_10_22_201604_create_prods_table', 4);
INSERT INTO `migrations` VALUES (213, '2021_08_24_203812_update_description_to_products_table', 5);
INSERT INTO `migrations` VALUES (214, '2021_11_23_284207_add_hashed_key_to_order_items_table', 5);
INSERT INTO `migrations` VALUES (215, '2021_11_25_384308_add_model_to_sliders_table', 5);
INSERT INTO `migrations` VALUES (216, '2021_12_01_444444_add_action_to_sliders_table', 5);
INSERT INTO `migrations` VALUES (217, '2021_12_01_555555_add_image_to_categories_table', 5);

-- ----------------------------
-- Table structure for multi_imgs
-- ----------------------------
DROP TABLE IF EXISTS `multi_imgs`;
CREATE TABLE `multi_imgs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `photo_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of multi_imgs
-- ----------------------------
INSERT INTO `multi_imgs` VALUES (1, 2, 'upload/products/multi-image/1708276126195274.jpg', '2021-08-16 18:37:47', NULL);
INSERT INTO `multi_imgs` VALUES (2, 2, 'upload/products/multi-image/1708276126556012.jpg', '2021-08-16 18:37:47', NULL);
INSERT INTO `multi_imgs` VALUES (3, 1, 'upload/products/multi-image/1708363394993322.png', '2021-08-17 17:44:53', NULL);
INSERT INTO `multi_imgs` VALUES (4, 2, 'upload/products/multi-image/1708363471007922.png', '2021-08-17 17:46:05', NULL);
INSERT INTO `multi_imgs` VALUES (5, 3, 'upload/products/multi-image/1708363648601417.png', '2021-08-17 17:48:54', NULL);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `hashed_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_expired_at` datetime NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_items_hashed_key_unique`(`hashed_key`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 3, 2, 'red', 'Small', '1', 1, '', NULL, '2021-08-17 18:13:03', NULL);
INSERT INTO `order_items` VALUES (2, 6, 4, '', '', '1', 130000, 'c49b6037-f270-4baf-9125-941d8905cd58', '2021-12-05 22:01:34', '2021-12-04 22:01:34', '2021-12-04 22:01:34');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `division_id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `state_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int NULL DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `invoice_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_month` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `processing_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `picked_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `shipped_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `delivered_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cancel_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_date` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `return_reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `return_order` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 5, 1, 1, 1, 'صابر طباطبائییزدی', 'Saber.tabatabaee@gmail.com', '234234234', 234234234, 'sdasdfasdfasdf', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 1, NULL, 'EOS21032154', '17 August 2021', 'August', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-08-17 18:02:07', NULL, NULL);
INSERT INTO `orders` VALUES (2, 5, 1, 1, 1, 'صابر طباطبائییزدی', 'Saber.tabatabaee@gmail.com', '234234234', 234234234, 'sdasdfasdfasdf', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 1, NULL, 'EOS13378453', '17 August 2021', 'August', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-08-17 18:07:23', NULL, NULL);
INSERT INTO `orders` VALUES (3, 5, 1, 1, 1, 'صابر طباطبائییزدی', 'Saber.tabatabaee@gmail.com', '234234234', 234234234, 'sdasdfasdfasdf', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 1, NULL, 'EOS73922108', '17 August 2021', 'August', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-08-17 18:13:01', NULL, NULL);
INSERT INTO `orders` VALUES (4, 5, 1, 1, 1, '5', '5', '5', 5, '5', 'Behandam-Product-Service', 'Behandam-Product-Service', NULL, 'Tomans', 50000, NULL, 'EOS97773321', '04 December 2021', 'December', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Payed', '2021-12-04 21:58:44', NULL, NULL);
INSERT INTO `orders` VALUES (5, 5, 1, 1, 1, '5', '5', '5', 5, '5', 'Behandam-Product-Service', 'Behandam-Product-Service', NULL, 'Tomans', 130000, NULL, 'EOS13444971', '04 December 2021', 'December', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Payed', '2021-12-04 21:59:46', NULL, NULL);
INSERT INTO `orders` VALUES (6, 5, 1, 1, 1, '5', '5', '5', 5, '5', 'Behandam-Product-Service', 'Behandam-Product-Service', NULL, 'Tomans', 130000, NULL, 'EOS97527372', '04 December 2021', 'December', '2021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Payed', '2021-12-04 22:01:34', NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for prods
-- ----------------------------
DROP TABLE IF EXISTS `prods`;
CREATE TABLE `prods`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of prods
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `subsubcategory_id` int NOT NULL,
  `product_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_tags_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_tags_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_size_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_color_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `short_descp_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_descp_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_descp_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_descp_hin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_thambnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot_deals` int NULL DEFAULT NULL,
  `featured` int NULL DEFAULT NULL,
  `special_offer` int NULL DEFAULT NULL,
  `special_deals` int NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `digital_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 5, 1, 1, 1, 'Sport shoes', 'کفش ورزشی نایکی', 'sport-shoes', 'کفش-ورزشی-نایکی', '2343', '3', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'کوچک,معمولی,بزرگ', 'red,Black', 'قرمز,مشکی', '4', '1', 'Tozih kootah', 'توضیح کوتاه', '<p>Long Description English</p>', '<p>Long Description Hindi</p>', 'upload/products/thambnail/1708363394769529.png', 1, 1, 1, 1, 1, '2021-08-17 17:44:52', NULL, '20210817174452.png');
INSERT INTO `products` VALUES (2, 5, 1, 1, 1, 'Sport shoes', 'کفش ورزشی نایکی', 'sport-shoes', 'کفش-ورزشی-نایکی', '2343', '3', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'کوچک,معمولی,بزرگ', 'red,Black', 'قرمز,مشکی', '5', '1', 'Tozih kootah', 'توضیح کوتاه', '<p>Long Description English</p>', '<p>Long Description Hindi</p>', 'upload/products/thambnail/1708363470801462.png', 1, 1, 1, 1, 1, '2021-08-17 17:46:05', NULL, '20210817174605.png');
INSERT INTO `products` VALUES (3, 5, 1, 1, 1, 'Sport shoes', 'کفش ورزشی نایکی', 'sport-shoes', 'کفش-ورزشی-نایکی', '2343', '3', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'کوچک,معمولی,بزرگ', 'red,Black', 'قرمز,مشکی', '5', '1', 'Tozih kootah', 'توضیح کوتاه', '<p>Long Description English</p>', '<p>Long Description Hindi</p>', 'upload/products/thambnail/1708363648386511.png', 1, 1, 1, 1, 1, '2021-08-17 17:48:54', NULL, '20210817174854.png');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rating` tinyint NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reviews_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `reviews_user_id_foreign`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reviews
-- ----------------------------

-- ----------------------------
-- Table structure for seos
-- ----------------------------
DROP TABLE IF EXISTS `seos`;
CREATE TABLE `seos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_author` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_keyword` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `google_analytics` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seos
-- ----------------------------
INSERT INTO `seos` VALUES (1, 'فروشگاه', 'صابر', 'فروشگاه', 'فروشگاه اینترنتی', '2342342', NULL, NULL);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('mWM8CsesN3mD7UzIE41yHIAkZSRZl2EivXfIY3I2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienlzZ2JmWWdSQ1B2bDluMUd3NG5FYVNiZFZpTHV0ZTJNdDFwVzgyZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1636046810);
INSERT INTO `sessions` VALUES ('OnwFyIEB3XXDPZ7uxLgyOXmxLG3BzPUQJWolu4ib', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieGdadGUwSzNybkk2aTk4V0J1ZUlhMkdjNDZDNnVLbEdKcHhQUVlhbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1636046811);
INSERT INTO `sessions` VALUES ('464KVt8zeZGgxPbXWcwrX6esR3pyujXg5TDGJB7x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSkZJMG52dnYza0RpcGdpWWZGSURLQ09uVkZ3Skd4elMyUjdmVWR5cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1636046812);
INSERT INTO `sessions` VALUES ('s3tk7A2dfHtjrMznf99vS5uqicDaiST5whCdjEOB', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSnRubzNrc3lZWGNBdXp6VlYzN0pqa0lmV21MbXAyeG5lSzVGTTJKcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9kdWN0L2VkaXQvMS92aWRlby1sZXNzb25zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjg6Imxhbmd1YWdlIjtzOjU6ImhpbmRpIjt9', 1635511531);
INSERT INTO `sessions` VALUES ('lPgVXRUXfifs8cbxtiJHplFrhzIuXv3egFrojHJY', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRHhnVk9VWUIxV0dYWTdKRTNxU2VhNkRJSUYxYlowaUI3RFl5QnZnaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvcHJvZHVjdC9lZGl0LzMvdmlkZW8tbGVzc29ucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1635523681);
INSERT INTO `sessions` VALUES ('srNwcuUnHNqZxmqwoqwVWAa4rmQRNep2gN9GpS65', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZmFXMUt4WkJYVTNKZnRFY0ZPeW51S1AydXdqT1pxaWxlMFdCZnRnNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1636046809);
INSERT INTO `sessions` VALUES ('XjNUe3FK0vwOliITSA7gqqFitoRAOf39z19mr5tk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNHNTMWdRYllFa0pWcUFwa0dkTjltMXlGU2FvYkRFeTJ2UWpDcHFRUyI7czo4OiJsYW5ndWFnZSI7czo1OiJoaW5kaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638642499);

-- ----------------------------
-- Table structure for ship_districts
-- ----------------------------
DROP TABLE IF EXISTS `ship_districts`;
CREATE TABLE `ship_districts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `division_id` bigint UNSIGNED NOT NULL,
  `district_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ship_districts
-- ----------------------------
INSERT INTO `ship_districts` VALUES (1, 1, 'tehran', NULL, NULL);
INSERT INTO `ship_districts` VALUES (2, 1, 'qom', NULL, NULL);

-- ----------------------------
-- Table structure for ship_divisions
-- ----------------------------
DROP TABLE IF EXISTS `ship_divisions`;
CREATE TABLE `ship_divisions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `division_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ship_divisions
-- ----------------------------
INSERT INTO `ship_divisions` VALUES (1, 'tehran', NULL, NULL);
INSERT INTO `ship_divisions` VALUES (2, 'qom', NULL, NULL);

-- ----------------------------
-- Table structure for ship_states
-- ----------------------------
DROP TABLE IF EXISTS `ship_states`;
CREATE TABLE `ship_states`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `division_id` bigint UNSIGNED NOT NULL,
  `district_id` bigint UNSIGNED NOT NULL,
  `state_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ship_states
-- ----------------------------
INSERT INTO `ship_states` VALUES (1, 1, 1, 'tehran', NULL, NULL);
INSERT INTO `ship_states` VALUES (2, 1, 2, 'qom', NULL, NULL);

-- ----------------------------
-- Table structure for site_settings
-- ----------------------------
DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE `site_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_one` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_two` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `facebook` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `twitter` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `linkedin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of site_settings
-- ----------------------------
INSERT INTO `site_settings` VALUES (1, 'upload/logo/1708364323575939.png', '876786', '869768', 'saber@domain.com', 'domain', 'address', 'face', 'tiwtter', 'linkedin', 'youtube', NULL, '2021-08-17 17:59:38');

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` int NOT NULL DEFAULT 1,
  `model_id` int NULL DEFAULT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `group_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `action` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sliders
-- ----------------------------
INSERT INTO `sliders` VALUES (2, 'upload/slider/1708364029895033.png', 'Slider Image name one', 'Slider Image name one Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem', 1, NULL, NULL, NULL, NULL, NULL, '2020-10-05 20:00:01', '2021-08-17 17:54:58');
INSERT INTO `sliders` VALUES (3, 'upload/slider/1708364009582218.jpg', 'Slider Image name Two', 'Slider Image name Two Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem', 1, NULL, NULL, NULL, NULL, NULL, '2020-10-05 20:05:06', '2021-08-17 17:54:39');
INSERT INTO `sliders` VALUES (4, 'upload/slider/1708363994590952.jpg', 'Slider Image name Three', 'Slider Image name Three lider Image name one Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea volup', 1, NULL, NULL, NULL, NULL, NULL, '2020-10-05 20:13:37', '2021-08-17 17:54:24');

-- ----------------------------
-- Table structure for sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategory_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sub_categories
-- ----------------------------
INSERT INTO `sub_categories` VALUES (1, 1, 'ghezel', 'قزل آلا', 'ghezel', 'شسیب', NULL, NULL);
INSERT INTO `sub_categories` VALUES (2, 1, 'adsfa', 'دوم', 'adsfads', 'شیسب', NULL, NULL);
INSERT INTO `sub_categories` VALUES (3, 2, 'asdfasdf', 'سوم', 'adsf', 'شسیب', NULL, NULL);
INSERT INTO `sub_categories` VALUES (4, 3, 'asdf3', 'چهارم', 'asdf', 'شسیب', NULL, NULL);
INSERT INTO `sub_categories` VALUES (5, 4, 'adsf', 'پنجم', 'adf', 'شسیب', NULL, NULL);
INSERT INTO `sub_categories` VALUES (6, 4, 'adsf7', 'ششم', 'adsf7', 'شسیب', NULL, '2021-08-17 17:36:19');
INSERT INTO `sub_categories` VALUES (7, 9, 'adsf7', 'هفتم', 'adsf7', 'شیب', NULL, '2021-08-17 17:36:29');
INSERT INTO `sub_categories` VALUES (8, 7, 'adsf7', 'هشتم', 'adsf', 'شسی', NULL, NULL);
INSERT INTO `sub_categories` VALUES (9, 8, 'adsf8', 'نهم', 'adsf', 'شیسب', NULL, NULL);

-- ----------------------------
-- Table structure for sub_sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_sub_categories`;
CREATE TABLE `sub_sub_categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_id` int NOT NULL,
  `subsubcategory_name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subsubcategory_name_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subsubcategory_slug_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subsubcategory_slug_hin` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sub_sub_categories
-- ----------------------------
INSERT INTO `sub_sub_categories` VALUES (1, 1, 1, 'fish2', 'ماهی', 'fish', 'ماهی', NULL, NULL);
INSERT INTO `sub_sub_categories` VALUES (2, 2, 2, 'sdfs', 'ماهی2', 'fish2', 'ماهی2', NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_seen` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `current_team_id` bigint UNSIGNED NULL DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Kazi', 'admin@gmail.com', '234234234', '2021-08-06 11:22:17', '2020-10-03 17:15:51', '$2y$10$xyCE4B8/8hP1AErp8HNKI.bUOxAOi0UeatitPS.tCYoeAUYCAp2i2', NULL, NULL, '3oxfjS2YIeprjGPvMMYEZP8bTJIK3fxXQRybeQsdQuS3eRx60FzolCr41Q29', NULL, 'profile-photos/2GBvHch2s86UntQ1RyPrezIJSuH6cqoUnHYY2JtR.jpeg', '2020-09-29 16:36:16', '2020-10-07 19:04:24');
INSERT INTO `users` VALUES (2, 'Ariyan', 'ariyan@gmail.com', '234234234', '2021-08-06 11:22:17', '2020-10-03 17:15:51', '$2y$10$fiRVWisNmENZGAQhX2NPpeVe15dC8IZ4Cj.8Qnykba6axlouxbXtS', NULL, NULL, NULL, NULL, NULL, '2020-09-29 16:50:25', '2020-09-29 16:50:25');
INSERT INTO `users` VALUES (3, 'Test', 'test@gmail.com', '234234234', '2021-08-06 11:22:17', '2020-10-03 17:15:51', '$2y$10$al.9Izs0ZxjxGAiLNjFPu.K9R8K/btvETNS8gJN2cVZowJclbWGw6', NULL, NULL, NULL, NULL, NULL, '2020-09-29 17:23:42', '2020-09-29 17:23:42');
INSERT INTO `users` VALUES (4, 'saber', 'saber@saber.com', '234234234', '2021-08-06 11:22:17', '2020-10-03 17:15:51', '$2y$10$Ry4YCzWhWtCyfO..fdWX.uMWBjbkB58tPBtZZ5NscYmiDvIT8NNNW', NULL, NULL, NULL, NULL, NULL, '2021-08-06 11:02:34', '2021-08-06 11:22:17');
INSERT INTO `users` VALUES (5, 'صابر طباطبائییزدی', 'Saber.tabatabaee@gmail.com', '234234234', '2021-08-18 00:08:18', '2020-10-03 17:15:51', '$2y$10$ImjoHE8fN3QUrfWbRtCiauvZV1nz0DJj3daDkZJ8cJOxHpAMTGWTG', NULL, NULL, NULL, NULL, '202108160926saber_ax_personnely_jikjik.jpg', '2021-08-16 09:25:14', '2021-08-18 00:08:18');
INSERT INTO `users` VALUES (6, 'صابر طباطبائییزدی', 'saber.tabataba@gmail.com', '09196070718', '2021-08-16 19:09:35', NULL, '$2y$10$EdW1CQ4o//mvO5baJsO3x.xrC3HlxiCyuFG1.1Sc1L54U.enWDUF6', NULL, NULL, NULL, NULL, NULL, '2021-08-16 12:20:06', '2021-08-16 19:09:35');

-- ----------------------------
-- Table structure for video_lessons
-- ----------------------------
DROP TABLE IF EXISTS `video_lessons`;
CREATE TABLE `video_lessons`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `lesson_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `order` int NOT NULL DEFAULT 0,
  `weight` int NOT NULL DEFAULT 0,
  `score` int NOT NULL DEFAULT 0,
  `minutes` int NOT NULL DEFAULT 0,
  `views` int NOT NULL DEFAULT 0,
  `downloads` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video_lessons
-- ----------------------------
INSERT INTO `video_lessons` VALUES (1, 1, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 18:32:11', '2021-10-29 18:35:47', '2021-10-29 18:35:47');
INSERT INTO `video_lessons` VALUES (2, 1, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 18:58:47', '2021-10-29 19:04:12', '2021-10-29 19:04:12');
INSERT INTO `video_lessons` VALUES (3, 2, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:05:03', '2021-10-29 19:05:13', '2021-10-29 19:05:13');
INSERT INTO `video_lessons` VALUES (4, 3, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:05:46', '2021-10-29 19:06:03', '2021-10-29 19:06:03');
INSERT INTO `video_lessons` VALUES (5, 4, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:08:13', '2021-10-29 19:08:23', '2021-10-29 19:08:23');
INSERT INTO `video_lessons` VALUES (6, 1, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:09:08', '2021-10-29 19:09:08', NULL);
INSERT INTO `video_lessons` VALUES (7, 1, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:11:42', '2021-10-29 19:11:42', NULL);
INSERT INTO `video_lessons` VALUES (8, 1, 'lesson 2', 1, 0, 0, 0, 0, 0, 0, 0, '2021-10-29 19:19:10', '2021-10-29 19:19:10', NULL);

-- ----------------------------
-- Table structure for wishlists
-- ----------------------------
DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE `wishlists`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of wishlists
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
