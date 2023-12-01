-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 20:54:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fosdef`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Django', 0, 'Administración de Django', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1),
(2, 'FOS | Tema', 1, 'FOS | Administrador', 1, '', 0, '#0F0E17', '#F9BC60', '#FFFFFF', '#FFFFFF', '#F9BC60', '#123F60', '#FFFFFF', '#FFFFFF', '#F9BC60', 1, '#FFFFFF', '#F9BC60', '#3DA9FC', '#123F60', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#004643', 1, 1, 1, 'code', 1, 0, 1, '#FFFFCC', '#3DA9FC', 100, 400, 1, 'default-select', 1, 0, 1, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Empleados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add session', 7, 'add_session'),
(26, 'Can change session', 7, 'change_session'),
(27, 'Can delete session', 7, 'delete_session'),
(28, 'Can view session', 7, 'view_session'),
(29, 'Can add Ciudad', 8, 'add_city'),
(30, 'Can change Ciudad', 8, 'change_city'),
(31, 'Can delete Ciudad', 8, 'delete_city'),
(32, 'Can view Ciudad', 8, 'view_city'),
(33, 'Can add Estado Domicilio', 9, 'add_domicile_status'),
(34, 'Can change Estado Domicilio', 9, 'change_domicile_status'),
(35, 'Can delete Estado Domicilio', 9, 'delete_domicile_status'),
(36, 'Can view Estado Domicilio', 9, 'view_domicile_status'),
(37, 'Can add Domicilio', 10, 'add_domicile'),
(38, 'Can change Domicilio', 10, 'change_domicile'),
(39, 'Can delete Domicilio', 10, 'delete_domicile'),
(40, 'Can view Domicilio', 10, 'view_domicile'),
(41, 'Can add Empresa Trasportadora', 11, 'add_company_transportation'),
(42, 'Can change Empresa Trasportadora', 11, 'change_company_transportation'),
(43, 'Can delete Empresa Trasportadora', 11, 'delete_company_transportation'),
(44, 'Can view Empresa Trasportadora', 11, 'view_company_transportation'),
(45, 'Can add Empleado', 12, 'add_employee'),
(46, 'Can change Empleado', 12, 'change_employee'),
(47, 'Can delete Empleado', 12, 'delete_employee'),
(48, 'Can view Empleado', 12, 'view_employee'),
(49, 'Can add Tipo Empleado', 13, 'add_employee_type'),
(50, 'Can change Tipo Empleado', 13, 'change_employee_type'),
(51, 'Can delete Tipo Empleado', 13, 'delete_employee_type'),
(52, 'Can view Tipo Empleado', 13, 'view_employee_type'),
(53, 'Can add Entrada', 14, 'add_entry'),
(54, 'Can change Entrada', 14, 'change_entry'),
(55, 'Can delete Entrada', 14, 'delete_entry'),
(56, 'Can view Entrada', 14, 'view_entry'),
(57, 'Can add Solicitud Producto', 15, 'add_product_request'),
(58, 'Can change Solicitud Producto', 15, 'change_product_request'),
(59, 'Can delete Solicitud Producto', 15, 'delete_product_request'),
(60, 'Can view Solicitud Producto', 15, 'view_product_request'),
(61, 'Can add Estado Solicitud', 16, 'add_request_status'),
(62, 'Can change Estado Solicitud', 16, 'change_request_status'),
(63, 'Can delete Estado Solicitud', 16, 'delete_request_status'),
(64, 'Can view Estado Solicitud', 16, 'view_request_status'),
(65, 'Can add Estado Proveedor', 17, 'add_supplier_status'),
(66, 'Can change Estado Proveedor', 17, 'change_supplier_status'),
(67, 'Can delete Estado Proveedor', 17, 'delete_supplier_status'),
(68, 'Can view Estado Proveedor', 17, 'view_supplier_status'),
(69, 'Can add Tiempo Trabajo', 18, 'add_work_time'),
(70, 'Can change Tiempo Trabajo', 18, 'change_work_time'),
(71, 'Can delete Tiempo Trabajo', 18, 'delete_work_time'),
(72, 'Can view Tiempo Trabajo', 18, 'view_work_time'),
(73, 'Can add Proveedor', 19, 'add_suplier'),
(74, 'Can change Proveedor', 19, 'change_suplier'),
(75, 'Can delete Proveedor', 19, 'delete_suplier'),
(76, 'Can view Proveedor', 19, 'view_suplier'),
(77, 'Can add Salida', 20, 'add_output'),
(78, 'Can change Salida', 20, 'change_output'),
(79, 'Can delete Salida', 20, 'delete_output'),
(80, 'Can view Salida', 20, 'view_output'),
(81, 'Can add Inventario', 21, 'add_inventory'),
(82, 'Can change Inventario', 21, 'change_inventory'),
(83, 'Can delete Inventario', 21, 'delete_inventory'),
(84, 'Can view Inventario', 21, 'view_inventory'),
(85, 'Can add Categoria Producto', 22, 'add_product_category'),
(86, 'Can change Categoria Producto', 22, 'change_product_category'),
(87, 'Can delete Categoria Producto', 22, 'delete_product_category'),
(88, 'Can view Categoria Producto', 22, 'view_product_category'),
(89, 'Can add Estado Producto', 23, 'add_product_status'),
(90, 'Can change Estado Producto', 23, 'change_product_status'),
(91, 'Can delete Estado Producto', 23, 'delete_product_status'),
(92, 'Can view Estado Producto', 23, 'view_product_status'),
(93, 'Can add Venta', 24, 'add_sale'),
(94, 'Can change Venta', 24, 'change_sale'),
(95, 'Can delete Venta', 24, 'delete_sale'),
(96, 'Can view Venta', 24, 'view_sale'),
(97, 'Can add Producto', 25, 'add_product'),
(98, 'Can change Producto', 25, 'change_product'),
(99, 'Can delete Producto', 25, 'delete_product'),
(100, 'Can view Producto', 25, 'view_product');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$EJIK1YaXKj3pa48HaqRr7c$oRZKXY130jbf1YdYe8nEZ0ZBiXCeDbBMHMmjBOnEyn4=', '2023-12-01 19:31:33.844721', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-11-29 01:22:42.300828'),
(3, 'pbkdf2_sha256$600000$tJUGT16nsYpspm5j2HdQyY$7Z0infZSn63jK2enh9RcEFp3GJxwnb+Fvg+xxqyxQG8=', '2023-11-29 18:07:05.081780', 0, 'Daniel', 'Daniel', 'Marin', 'dani@gmail.com', 0, 1, '2023-11-29 17:58:16.270047'),
(4, 'pbkdf2_sha256$600000$IqGUvzjuWwr267L5jzAkmq$k3fVszkT9rkN8I8iAfprKdHaQY0S627PmLZ2HlWYjXE=', '2023-12-01 19:21:53.169720', 0, 'dani', '', '', '', 0, 1, '2023-12-01 19:21:51.279238');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `id` bigint(20) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` bigint(20) NOT NULL,
  `cod_city` int(10) UNSIGNED NOT NULL CHECK (`cod_city` >= 0),
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-11-29 01:38:55.469829', '2', 'FOS | Tema', 1, '[{\"added\": {}}]', 1, 1),
(2, '2023-11-29 01:39:34.555465', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 1, 1),
(3, '2023-11-29 01:39:53.144504', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Visible\"]}}]', 1, 1),
(4, '2023-11-29 01:40:41.142803', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Link hover color\", \"Link color\"]}}]', 1, 1),
(5, '2023-11-29 01:41:26.978964', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Link hover color\"]}}]', 1, 1),
(6, '2023-11-29 01:42:49.121986', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Link selected color\", \"Background color\", \"Background hover color\", \"Foldable apps\"]}}]', 1, 1),
(7, '2023-11-29 01:43:48.628805', '2', 'FOS | Tema', 2, '[{\"changed\": {\"fields\": [\"Foldable apps\", \"Sticky submit\", \"Fieldsets as tabs\"]}}]', 1, 1),
(8, '2023-11-29 17:53:48.646396', '2', 'Empleado', 3, '', 5, 1),
(9, '2023-11-29 18:06:51.456307', '1', 'Empleados', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(8, 'domicilios', 'city'),
(11, 'domicilios', 'company_transportation'),
(10, 'domicilios', 'domicile'),
(9, 'domicilios', 'domicile_status'),
(12, 'inventario', 'employee'),
(13, 'inventario', 'employee_type'),
(14, 'inventario', 'entry'),
(21, 'inventario', 'inventory'),
(20, 'inventario', 'output'),
(15, 'inventario', 'product_request'),
(16, 'inventario', 'request_status'),
(19, 'inventario', 'suplier'),
(17, 'inventario', 'supplier_status'),
(18, 'inventario', 'work_time'),
(7, 'sessions', 'session'),
(25, 'venta', 'product'),
(22, 'venta', 'product_category'),
(23, 'venta', 'product_status'),
(24, 'venta', 'sale');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-11-29 01:14:33.467623'),
(2, 'auth', '0001_initial', '2023-11-29 01:14:34.593897'),
(3, 'admin', '0001_initial', '2023-11-29 01:14:34.922897'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-29 01:14:34.947042'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-29 01:14:34.960690'),
(6, 'admin_interface', '0001_initial', '2023-11-29 01:14:34.992198'),
(7, 'admin_interface', '0002_add_related_modal', '2023-11-29 01:14:35.265909'),
(8, 'admin_interface', '0003_add_logo_color', '2023-11-29 01:14:35.312338'),
(9, 'admin_interface', '0004_rename_title_color', '2023-11-29 01:14:35.336906'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2023-11-29 01:14:35.378479'),
(11, 'admin_interface', '0006_bytes_to_str', '2023-11-29 01:14:35.454285'),
(12, 'admin_interface', '0007_add_favicon', '2023-11-29 01:14:35.503399'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2023-11-29 01:14:35.584915'),
(14, 'admin_interface', '0009_add_enviroment', '2023-11-29 01:14:35.668745'),
(15, 'admin_interface', '0010_add_localization', '2023-11-29 01:14:35.690072'),
(16, 'admin_interface', '0011_add_environment_options', '2023-11-29 01:14:35.813471'),
(17, 'admin_interface', '0012_update_verbose_names', '2023-11-29 01:14:35.827689'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2023-11-29 01:14:35.870815'),
(19, 'admin_interface', '0014_name_unique', '2023-11-29 01:14:35.900332'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2023-11-29 01:14:35.942091'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2023-11-29 01:14:35.983075'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2023-11-29 01:14:35.994621'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2023-11-29 01:14:36.036469'),
(24, 'admin_interface', '0019_add_form_sticky', '2023-11-29 01:14:36.122877'),
(25, 'admin_interface', '0020_module_selected_colors', '2023-11-29 01:14:36.219430'),
(26, 'admin_interface', '0021_file_extension_validator', '2023-11-29 01:14:36.240749'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2023-11-29 01:14:36.315890'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2023-11-29 01:14:36.358555'),
(29, 'admin_interface', '0024_remove_theme_css', '2023-11-29 01:14:36.383749'),
(30, 'admin_interface', '0025_theme_language_chooser_control', '2023-11-29 01:14:36.429549'),
(31, 'admin_interface', '0026_theme_list_filter_highlight', '2023-11-29 01:14:36.470048'),
(32, 'admin_interface', '0027_theme_list_filter_removal_links', '2023-11-29 01:14:36.513349'),
(33, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2023-11-29 01:14:36.593489'),
(34, 'admin_interface', '0029_theme_css_generic_link_active_color', '2023-11-29 01:14:36.639996'),
(35, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2023-11-29 01:14:36.803804'),
(36, 'contenttypes', '0002_remove_content_type_name', '2023-11-29 01:14:36.916034'),
(37, 'auth', '0002_alter_permission_name_max_length', '2023-11-29 01:14:37.033213'),
(38, 'auth', '0003_alter_user_email_max_length', '2023-11-29 01:14:37.072972'),
(39, 'auth', '0004_alter_user_username_opts', '2023-11-29 01:14:37.089952'),
(40, 'auth', '0005_alter_user_last_login_null', '2023-11-29 01:14:37.182255'),
(41, 'auth', '0006_require_contenttypes_0002', '2023-11-29 01:14:37.189293'),
(42, 'auth', '0007_alter_validators_add_error_messages', '2023-11-29 01:14:37.202271'),
(43, 'auth', '0008_alter_user_username_max_length', '2023-11-29 01:14:37.236120'),
(44, 'auth', '0009_alter_user_last_name_max_length', '2023-11-29 01:14:37.294532'),
(45, 'auth', '0010_alter_group_name_max_length', '2023-11-29 01:14:37.325794'),
(46, 'auth', '0011_update_proxy_permissions', '2023-11-29 01:14:37.347509'),
(47, 'auth', '0012_alter_user_first_name_max_length', '2023-11-29 01:14:37.378335'),
(48, 'venta', '0001_initial', '2023-11-29 01:14:37.714569'),
(49, 'domicilios', '0001_initial', '2023-11-29 01:14:38.271611'),
(50, 'inventario', '0001_initial', '2023-11-29 01:14:40.148535'),
(51, 'sessions', '0001_initial', '2023-11-29 01:14:40.207089');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('qwc6ck0j0g7bpwfic8yeyb8klvp8cy7n', '.eJxVjEEOwiAQRe_C2hDAAoNL9z0DmWGoVA1NSrsy3l1JutDtf-_9l4i4byXuLa9xZnERWpx-N8L0yLUDvmO9LTItdVtnkl2RB21yXDg_r4f7d1CwlW8NMDF5CwQIakie2U7s2BGRzkmRAe0cuBSCtsTmnFD57g0a2EMw4v0B-2Q35Q:1r99Eb:yYPBAXPLHN0-RyRO2KTUoNP7iFLN_qELQfJap9qAR88', '2023-12-15 19:31:33.854968');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `direction` varchar(50) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `cod_status_domicile_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` bigint(20) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_transportadora`
--

CREATE TABLE `empresa_transportadora` (
  `id` bigint(20) NOT NULL,
  `company_nit` int(10) UNSIGNED NOT NULL CHECK (`company_nit` >= 0),
  `date_domicile` date NOT NULL,
  `id_domicile_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `id` bigint(20) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL CHECK (`amount` >= 0),
  `detail` varchar(50) NOT NULL,
  `entry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_domicilio`
--

CREATE TABLE `estado_domicilio` (
  `id` bigint(20) NOT NULL,
  `status_d` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_producto`
--

CREATE TABLE `estado_producto` (
  `id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proveedor`
--

CREATE TABLE `estado_proveedor` (
  `id` bigint(20) NOT NULL,
  `status_s` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_solicitud`
--

CREATE TABLE `estado_solicitud` (
  `id` bigint(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` bigint(20) NOT NULL,
  `stock` varchar(50) NOT NULL,
  `inventory_amount` int(10) UNSIGNED NOT NULL CHECK (`inventory_amount` >= 0),
  `minimum_amount` int(10) UNSIGNED NOT NULL CHECK (`minimum_amount` >= 0),
  `cod_entry_id` bigint(20) NOT NULL,
  `cod_output_id` bigint(20) NOT NULL,
  `id_employee_id` bigint(20) NOT NULL,
  `id_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_brand` varchar(50) NOT NULL,
  `product_amount` int(10) UNSIGNED NOT NULL CHECK (`product_amount` >= 0),
  `fabrication_date` date NOT NULL,
  `product_color` varchar(50) NOT NULL,
  `promotion` varchar(50) NOT NULL,
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `Status_p_id` bigint(20) NOT NULL,
  `category_p_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` bigint(20) NOT NULL,
  `nit` int(10) UNSIGNED NOT NULL CHECK (`nit` >= 0),
  `legal_representative_name` varchar(50) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL CHECK (`phone` >= 0),
  `cod_city_id` bigint(20) NOT NULL,
  `cod_status_id` bigint(20) NOT NULL,
  `id_solicitud_p_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `id` bigint(20) NOT NULL,
  `output_amount` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `output_date` datetime(6) NOT NULL,
  `id_product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_producto`
--

CREATE TABLE `solicitud_producto` (
  `id` bigint(20) NOT NULL,
  `price_deliver` int(10) UNSIGNED NOT NULL CHECK (`price_deliver` >= 0),
  `deliver_date` datetime(6) NOT NULL,
  `cod_status_s_id` bigint(20) NOT NULL,
  `id_employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo_trabajo`
--

CREATE TABLE `tiempo_trabajo` (
  `id` bigint(20) NOT NULL,
  `timetable` varchar(20) NOT NULL,
  `days` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id` bigint(20) NOT NULL,
  `employee_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` bigint(20) NOT NULL,
  `sale_date` date NOT NULL,
  `sale_amount` int(10) UNSIGNED NOT NULL CHECK (`sale_amount` >= 0),
  `sale_send` varchar(50) NOT NULL,
  `unit_value` int(10) UNSIGNED NOT NULL CHECK (`unit_value` >= 0),
  `discount` int(10) UNSIGNED NOT NULL CHECK (`discount` >= 0),
  `vat` int(10) UNSIGNED NOT NULL CHECK (`vat` >= 0),
  `subtotal` int(10) UNSIGNED NOT NULL CHECK (`subtotal` >= 0),
  `total` int(10) UNSIGNED NOT NULL CHECK (`total` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domicilio_city_id_c1350b31_fk_ciudad_id` (`city_id`),
  ADD KEY `domicilio_cod_status_domicile_id_ca6879b0_fk_estado_domicilio_id` (`cod_status_domicile_id`),
  ADD KEY `domicilio_sale_id_4d00b0f1_fk_venta_id` (`sale_id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indices de la tabla `empresa_transportadora`
--
ALTER TABLE `empresa_transportadora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_transportadora_id_domicile_id_72e0f496_fk_domicilio_id` (`id_domicile_id`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_domicilio`
--
ALTER TABLE `estado_domicilio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_proveedor`
--
ALTER TABLE `estado_proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventario_cod_entry_id_0d7cedad_fk_entrada_id` (`cod_entry_id`),
  ADD KEY `inventario_cod_output_id_8b7be0fb_fk_salida_id` (`cod_output_id`),
  ADD KEY `inventario_id_employee_id_34be3feb_fk_empleado_id` (`id_employee_id`),
  ADD KEY `inventario_id_product_id_f34cb07b_fk_producto_id` (`id_product_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_Status_p_id_675f919b_fk_estado_producto_id` (`Status_p_id`),
  ADD KEY `producto_category_p_id_c0e77f6e_fk_categoria_producto_id` (`category_p_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_cod_city_id_2e2eb747_fk_ciudad_id` (`cod_city_id`),
  ADD KEY `proveedor_cod_status_id_3d1e5742_fk_estado_proveedor_id` (`cod_status_id`),
  ADD KEY `proveedor_id_solicitud_p_id_3c596c99_fk_solicitud_producto_id` (`id_solicitud_p_id`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_id_product_id_b72da704_fk_producto_id` (`id_product_id`);

--
-- Indices de la tabla `solicitud_producto`
--
ALTER TABLE `solicitud_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitud_producto_cod_status_s_id_3a60494b_fk_estado_so` (`cod_status_s_id`),
  ADD KEY `solicitud_producto_id_employee_id_6e9bc718_fk_empleado_id` (`id_employee_id`);

--
-- Indices de la tabla `tiempo_trabajo`
--
ALTER TABLE `tiempo_trabajo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa_transportadora`
--
ALTER TABLE `empresa_transportadora`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_domicilio`
--
ALTER TABLE `estado_domicilio`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_proveedor`
--
ALTER TABLE `estado_proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_producto`
--
ALTER TABLE `solicitud_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiempo_trabajo`
--
ALTER TABLE `tiempo_trabajo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_city_id_c1350b31_fk_ciudad_id` FOREIGN KEY (`city_id`) REFERENCES `ciudad` (`id`),
  ADD CONSTRAINT `domicilio_cod_status_domicile_id_ca6879b0_fk_estado_domicilio_id` FOREIGN KEY (`cod_status_domicile_id`) REFERENCES `estado_domicilio` (`id`),
  ADD CONSTRAINT `domicilio_sale_id_4d00b0f1_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_employee_id_75d20589_fk_auth_user_id` FOREIGN KEY (`employee_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `empresa_transportadora`
--
ALTER TABLE `empresa_transportadora`
  ADD CONSTRAINT `empresa_transportadora_id_domicile_id_72e0f496_fk_domicilio_id` FOREIGN KEY (`id_domicile_id`) REFERENCES `domicilio` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_cod_entry_id_0d7cedad_fk_entrada_id` FOREIGN KEY (`cod_entry_id`) REFERENCES `entrada` (`id`),
  ADD CONSTRAINT `inventario_cod_output_id_8b7be0fb_fk_salida_id` FOREIGN KEY (`cod_output_id`) REFERENCES `salida` (`id`),
  ADD CONSTRAINT `inventario_id_employee_id_34be3feb_fk_empleado_id` FOREIGN KEY (`id_employee_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `inventario_id_product_id_f34cb07b_fk_producto_id` FOREIGN KEY (`id_product_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_Status_p_id_675f919b_fk_estado_producto_id` FOREIGN KEY (`Status_p_id`) REFERENCES `estado_producto` (`id`),
  ADD CONSTRAINT `producto_category_p_id_c0e77f6e_fk_categoria_producto_id` FOREIGN KEY (`category_p_id`) REFERENCES `categoria_producto` (`id`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_cod_city_id_2e2eb747_fk_ciudad_id` FOREIGN KEY (`cod_city_id`) REFERENCES `ciudad` (`id`),
  ADD CONSTRAINT `proveedor_cod_status_id_3d1e5742_fk_estado_proveedor_id` FOREIGN KEY (`cod_status_id`) REFERENCES `estado_proveedor` (`id`),
  ADD CONSTRAINT `proveedor_id_solicitud_p_id_3c596c99_fk_solicitud_producto_id` FOREIGN KEY (`id_solicitud_p_id`) REFERENCES `solicitud_producto` (`id`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_id_product_id_b72da704_fk_producto_id` FOREIGN KEY (`id_product_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `solicitud_producto`
--
ALTER TABLE `solicitud_producto`
  ADD CONSTRAINT `solicitud_producto_cod_status_s_id_3a60494b_fk_estado_so` FOREIGN KEY (`cod_status_s_id`) REFERENCES `estado_solicitud` (`id`),
  ADD CONSTRAINT `solicitud_producto_id_employee_id_6e9bc718_fk_empleado_id` FOREIGN KEY (`id_employee_id`) REFERENCES `empleado` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
